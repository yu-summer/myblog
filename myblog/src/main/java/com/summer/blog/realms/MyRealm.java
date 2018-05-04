package com.summer.blog.realms;

import com.summer.blog.entities.User;
import com.summer.blog.service.UserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Author: summer
 * @Mail: lijiahaosummer@gmail.com
 * @Date: 2018 4/24/18 4:54 PM Project: myblog Package: com.summer.blog.realms Desc:
 */
public class MyRealm extends AuthorizingRealm {

  @Autowired
  private UserService userService;

  @Override
  protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
    String username = (String) principalCollection.getPrimaryPrincipal(); //get username
	SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
	authorizationInfo.setRoles(userService.getRoles(username));
	authorizationInfo.setStringPermissions(userService.getPermissions(username));
	return authorizationInfo;
  }

  @Override
  protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token)
	  throws AuthenticationException {
	String username = (String) token.getPrincipal();
	User user = userService.getUserByUsername(username);

	if (user != null) {
	  AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user.getUsername(),
		  user.getPassword(), "myRealm");
	  return authenticationInfo;
	} else {
	  return null;
	}
  }
}
