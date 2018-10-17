package com.chinasofti.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasofti.dao.UserDao;
import com.chinasofti.pojo.User;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	/**
	 * 注册用户
	 * @param user
	 */
	public void register(User user) {
		userDao.insert(user);
	}

	/**
	 * 登录
	 * @return 登录成功返回true,失败返回false
	 */
	public boolean login(User userTmp) {
		
		
		User user=userDao.select(userTmp);
		if(user==null||user.getUserName()==null){
			return false;
		}
		userTmp.setUserId(user.getUserId());
		return true;
	}

	/**
	 * 检查用户名是否存在
	 * @param userName
	 * @return 存在返回true,反之false
	 */
	public boolean checkUserName(String userName) {
		List<User> users = userDao.findByUserName(userName);
		if(users!=null&&users.size()>0){
			return true;
		}
		return false;
	}

}
