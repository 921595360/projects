package com.chinasofti.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.chinasofti.pojo.User;

@Repository
public class UserDao {
	
	@Autowired
	private UserMapper userMapper;

	/**
	 * 添加用户
	 * @param user
	 */
	public void insert(User user) {
		userMapper.insert(user);
	}

	
	/**
	 * 根据用户名密码查询
	 * @return
	 */
	public User select(User user) {
		return userMapper.select(user);
	}


	public List<User> findByUserName(String userName) {

		return null;
	}

	public int getCount(){
		return userMapper.getCount();
	}
}
