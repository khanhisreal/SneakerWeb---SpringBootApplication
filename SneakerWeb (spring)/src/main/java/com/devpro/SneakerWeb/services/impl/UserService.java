package com.devpro.SneakerWeb.services.impl;

import org.springframework.stereotype.Service;

import com.devpro.SneakerWeb.model.User;
import com.devpro.SneakerWeb.services.BaseService;

@Service
public class UserService extends BaseService<User>{

	@Override
	protected Class<User> clazz() {
		// TODO Auto-generated method stub
		return User.class;
	}
	
	public User loadUserByUsername(String userName) {
		String sql = "select * from users u where u.username = '" + userName + "' and status = 1";
		return this.getEntityByNativeSQL(sql);
	}

}
