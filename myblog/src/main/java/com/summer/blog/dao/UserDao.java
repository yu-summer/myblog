package com.summer.blog.dao;

import com.summer.blog.entities.User;
import com.summer.blog.entities.UserInfo;
import java.util.Set;
import org.apache.ibatis.annotations.Param;

/**
 * @Author: summer
 * @Date: 2018 18-4-24 下午7:46
 * @Project: myblog
 */
public interface UserDao {

  void createUser(@Param("username") String username,
	  @Param("password") String password,
	  @Param("email") String email);

  void deleteUser(int id);

  void updateUser(@Param("username") String username,
      @Param("password") String password, @Param("email") String email);

  UserInfo checkUserInfo(String username);

  User getUserByUsername(String username);

  User getUserByEmail(String email);

  //role and permission
  Set<String> getRoles(String usernamme);

  Set<String> getPermissions(String username);
}
