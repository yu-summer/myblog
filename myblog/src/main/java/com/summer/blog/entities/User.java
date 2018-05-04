package com.summer.blog.entities;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

/**
 * @Author: summer
 * @Mail: lijiahaosummer@gmail.com
 * @Date: 2018 18-4-24 下午7:46 Project: myblog Package: com.summer.blog.entities Desc:
 */
@Data
@RequiredArgsConstructor
@NoArgsConstructor
public class User {
	private int id;
	@NonNull
	private String username;
	@NonNull
	private String password;
	@NonNull
	private String email;
}
