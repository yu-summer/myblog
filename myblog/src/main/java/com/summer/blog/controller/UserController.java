package com.summer.blog.controller;

import com.alibaba.fastjson.JSON;
import com.summer.blog.entities.UserInfo;
import com.summer.blog.service.UserService;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author: summer
 * @Mail: lijiahaosummer@gmail.com
 * @Date: 2018 4/24/18 8:21 PM Project: myblog Package: com.summer.blog.controller Desc:
 */
@RequestMapping("user")
@Controller
public class UserController {

  private final static Logger LOGGER = Logger.getLogger(UserController.class);

  @Autowired
  private UserService userService;

  @RequestMapping("login.do")
  public String login() {
	return "user/login";
  }


  @RequestMapping("register.do")
  public String register() {
	return "user/register";
  }

  @RequestMapping("toUpdateUser.do")
  public String toUpdateUser() {
	return "user/updateUser";
  }

  @RequestMapping("toCheckUser.do")
  public String toUserInfo() {
    return "user/userInfo";
  }

  @RequestMapping(value = "doLogin.do", method = RequestMethod.POST)
  @ResponseBody
  public Map<String, Object> doLogin(@RequestParam("userNameOrEmail") String username,
	  String password, HttpServletRequest request) {
	System.out.println(username);
	String result = "fail";
	Subject subject = SecurityUtils.getSubject();
	UsernamePasswordToken token = new UsernamePasswordToken(username, password);
	try {
	  subject.login(token);
	  request.getSession().setAttribute("user", username);
	  LOGGER.info(username + ": login");
	  result = "success";
	} catch (UnknownAccountException e) {
	  request.getSession().setAttribute("user", username);
	  LOGGER.info("Account does not exist");
	  result = "unexist";
	} catch (IncorrectCredentialsException e) {
	  request.getSession().setAttribute("user", username);
	  LOGGER.info("wrong user name or password");
	  result = "wrong";
	}
	Map<String, Object> resultMap = new HashMap<>();
	resultMap.put("result", result);
	return resultMap;
  }

  @RequestMapping(value = "doRegister.do", method = RequestMethod.POST)
  @ResponseBody
  public Map<String, Object> doRegister(@RequestParam("userName") String username, String email,
	  String password) {
	String result = "fail";
	if (userService.getUserByUsername(username) != null) {
	  result = "nameExist";
	} else if (userService.getUserByEmail(email) != null) {
	  result = "emailExist";
	} else {
	  userService.createUser(username, email, password);
	  result = "success";
	}
	Map<String, Object> resultMap = new HashMap<>();
	resultMap.put("result", result);
	return resultMap;
  }

  @RequestMapping(value = "updateUser.do", method = RequestMethod.POST)
  @ResponseBody
  public Map<String, Object> doUpdateUser(String email, String password) {
	String username = (String) SecurityUtils.getSubject().getPrincipal();
	String result = "fail";
	if (userService.getUserByEmail(email) != null) {
	  result = "emailExist";
	} else {
	  userService.updateUser(username, password, email);
	  result = "success";
	}
	Map<String, Object> resultMap = new HashMap<>();
	resultMap.put("result", result);
	return resultMap;
  }

  @RequestMapping("checkUserInfo.do")
  @ResponseBody
  public Map<String, Object> checkUserInfo() {
	String username = (String) SecurityUtils.getSubject().getPrincipal();
	UserInfo userInfo = userService.checkUserInfo(username);
	String result = JSON.toJSONString(userInfo);
	Map<String, Object> resultMap = new HashMap<>();
	resultMap.put("result", result);
	return resultMap;
  }
}
