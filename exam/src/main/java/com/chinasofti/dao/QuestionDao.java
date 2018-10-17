package com.chinasofti.dao;

import com.chinasofti.pojo.Question;
import java.util.List;

import com.chinasofti.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionDao {

	@Autowired
	private QuestionMapper questionMapper;
	
	public void add(Question question) {
		questionMapper.add(question);
	}

	public List<Question> findAll(String title, Integer id, Page page) {
		return questionMapper.findAll(title, id,page);
	}

	public void del(Integer[] ids) {
		questionMapper.del(ids);
	}

	public List<Question> findByExamId(Integer examId) {
		return questionMapper.findByExamId(examId);
	}


	public Integer getCount(String title, Integer id) {
		return questionMapper.getCount(title,id);
	}

	public List<Question> findByExamIdAndType(Integer examId, int type) {
		return questionMapper.findByExamIdAndType(examId,type);
	}
}
