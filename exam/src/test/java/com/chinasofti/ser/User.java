package com.chinasofti.ser;

import java.io.Serializable;

/**
 *
 * 对象序列化必须实现Serializable 接口
 */
public class User implements Serializable{
    private String userName;

    private Car car;

    public User(String userName) {
        this.userName = userName;
        car =new Car();
    }

    @Override
    public String toString() {
        System.out.println(car);
        return "User{" +
                "userName='" + userName + '\'' +
                '}';
    }
}


class Car{


}