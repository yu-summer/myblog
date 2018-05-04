package com.summer.blog.components;

import com.jagregory.shiro.freemarker.ShiroTags;
import freemarker.template.Configuration;
import freemarker.template.TemplateException;
import java.io.IOException;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

/**
 * @Author: summer
 * @Mail: lijiahaosummer@gmail.com
 * @Date: 2018 4/27/18 6:10 PM Project: myblog Package: com.summer.blog.components Desc:
 */
public class FreeMarkerConfigExtend extends FreeMarkerConfigurer {
  @Override
  public void afterPropertiesSet() throws IOException, TemplateException {
	super.afterPropertiesSet();
	Configuration configuration = this.getConfiguration();
	configuration.setSharedVariable("shiro", new ShiroTags());
	configuration.setNumberFormat("#");
  }
}
