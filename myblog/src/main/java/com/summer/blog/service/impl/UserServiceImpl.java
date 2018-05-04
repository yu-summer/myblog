package com.summer.blog.service.impl;

import com.summer.blog.dao.UserDao;
import com.summer.blog.entities.User;
import com.summer.blog.entities.UserInfo;
import com.summer.blog.service.UserService;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * @Author: summer
 * @Mail: lijiahaosummer@gmail.com
 * @Date: 2018 18-4-24 下午7:57 Project: myblog Package: com.summer.blog.service.impl Desc:
 */
@Service
public class UserServiceImpl implements UserService {

  @Autowired
  private UserDao userDao;

  @Override
  public void createUser(String username, String password, String email) {
	userDao.createUser(username, password, email);
  }

  @Override
  public void deleteUser(int id) {
	userDao.deleteUser(id);
  }

  @Override
  public void updateUser(String username, String password, String email) {
	userDao.updateUser(username, password, email);
  }

  @Override
  public UserInfo checkUserInfo(String username) {
	return userDao.checkUserInfo(username);
  }

  @Override
  public User getUserByUsername(String username) {
	return userDao.getUserByUsername(username);
  }

  @Override
  public User getUserByEmail(String email) {
	return userDao.getUserByEmail(email);
  }

  @Override
  public Set<String> getRoles(String username) {
	return userDao.getRoles(username);
  }

  @Override
  public Set<String> getPermissions(String username) {
	return userDao.getPermissions(username);
  }
}
