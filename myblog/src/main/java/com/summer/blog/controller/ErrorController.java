package com.summer.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Author: summer
 * @Mail: lijiahaosummer@gmail.com
 * @Date: 2018 4/30/18 9:44 PM
 * Project: myblog
 * Package: com.summer.blog.controller
 * Desc:
 */
@Controller
public class ErrorController {
  @RequestMapping("404.do")
  public String page404() {
    return "404";
  }


}
