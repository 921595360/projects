package com.chinasofti.dao;


import com.chinasofti.pojo.Answer;
import org.apache.ibatis.annotations.Param;

public interface AnswerMapper {

    public void insert(Answer answer);

    public int getScore(@Param("userId") Integer userId,@Param("examId") Integer examId);
}


abstract  class Test{
    public abstract void test();
}