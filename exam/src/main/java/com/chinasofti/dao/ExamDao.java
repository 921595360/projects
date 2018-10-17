package com.chinasofti.dao;

import java.util.List;

import com.chinasofti.pojo.Result;
import com.chinasofti.pojo.Score;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.chinasofti.pojo.Exam;

//@Repository
public class ExamDao {

	
	@Autowired
	private ExamMapper examMapper;



	
	public void insert(Exam exam) {
		examMapper.insert(exam);
	}
	
	public List<Exam> findAll(){
		return examMapper.findAll();
	}

	public void addQuestion(Integer examId, Integer[] ids) {
		for(Integer id:ids){
			if(id!=null)
				examMapper.addQuestion(examId,id);
		}
	}

	public List<Result> getResult(Integer examId, Integer userId) {
		return examMapper.getResult(examId,userId);
	}


	public List<Score> getTotalScore(Integer examId, Integer userId) {
		return examMapper.getScore(examId,userId);
	}
}


@Repository
class ExamDaoProxy extends ExamDao{
	
	@Override
	public void insert(Exam exam) {
		super.insert(exam);
		//session.commit();
	}
	
}
