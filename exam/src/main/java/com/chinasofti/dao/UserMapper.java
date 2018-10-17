package com.chinasofti.dao;

import com.chinasofti.pojo.User;
import org.apache.ibatis.annotations.Param;

/**
 * 定义sql操作
 */
public interface UserMapper {

                                        //指定参数名称
    public User findByUserNameAndUserPass(@Param("userName") String userName,@Param("userPass") String userPass);

    /**
     * 获取用户数量
     * @return
     */
    public int getCount();

	public void insert(User user);

	public User select(User user);

}
