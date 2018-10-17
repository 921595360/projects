package com.chinasofti.dao;

import java.util.List;

import com.chinasofti.pojo.Exam;
import com.chinasofti.pojo.Result;
import com.chinasofti.pojo.Score;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface ExamMapper {

	public void insert(Exam exam);

	public List<Exam> findAll();

	public void addQuestion(@Param("examId") Integer examId,@Param("id") Integer id);

	List<Result> getResult(@Param("examId") Integer examId,@Param("userId") Integer userId);

	List<Score> getScore(@Param("examId") Integer examId, @Param("userId") Integer userId);

}
