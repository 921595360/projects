package com.chinasofti.dao;


import java.util.List;

import com.chinasofti.util.Page;
import org.apache.ibatis.annotations.Param;

import com.chinasofti.pojo.Question;

public interface QuestionMapper {

    /**
     * 添加
     * @param question
     */
    public void add(Question question);

	public List<Question> findAll(@Param("title") String title, @Param("id") Integer id, @Param("page") Page page);

    public void del(@Param("ids") Integer[] ids);

    List<Question> findByExamId(Integer examId);

    public Integer getCount(@Param("title") String title,@Param("id") Integer id);

    List<Question> findByExamIdAndType(@Param("examId") Integer examId,@Param("type") int type);
}
