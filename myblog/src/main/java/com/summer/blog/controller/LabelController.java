package com.summer.blog.controller;

import com.summer.blog.service.LabelService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author: summer
 * @Mail: lijiahaosummer@gmail.com
 * @Date: 2018 18-5-2 下午7:36 Project: myblog Package: com.summer.blog.controller Desc:
 */
@Controller
public class LabelController {
  @Autowired
  private LabelService labelService;

  @RequestMapping("getAllLabels.do")
  @ResponseBody
  public void getAllLabels(HttpServletRequest request) {
    request.getSession().setAttribute("recommends", labelService.getAllRecommends());
    request.getSession().setAttribute("labels", labelService.getAllLabel());
  }
}
