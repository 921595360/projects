package com.chinasofti.service;

import com.chinasofti.dao.AnswerMapper;
import com.chinasofti.dao.ExamMapper;
import com.chinasofti.pojo.Answer;
import com.chinasofti.pojo.Result;
import com.chinasofti.pojo.Score;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chinasofti.dao.ExamDao;
import com.chinasofti.exception.TipException;
import com.chinasofti.pojo.Exam;

import java.util.List;

@Service
public class ExamService {

	@Autowired
	private ExamDao examDao;

	@Autowired
	private AnswerMapper answerMapper;

	@CacheEvict(cacheNames = "exams",allEntries = true)//清空缓存
	@Transactional//当前方法受事务管理
	public void add(Exam exam) throws TipException {
		if(exam==null){
			throw new TipException("数据不完整");
		}
		examDao.insert(exam);
	}

	@Cacheable("exams")
	public List<Exam> list() {
		System.out.println("查找新数据");
		return examDao.findAll();
	}

	public void addQuestion(Integer examId, Integer[] ids) {

		examDao.addQuestion(examId,ids);

	}

	/**
	 * 考试结束
	 * @param examId
	 * @param quesIds
	 * @param answers
     */
	@Transactional
	public void end(Integer userId,Integer examId, Integer[] quesIds, String[] answers) {

		for(int i=0;i<quesIds.length;i++){

			if(i>answers.length-1){
				answerMapper.insert(new Answer(userId,examId,quesIds[i],null));
			}else{
				answerMapper.insert(new Answer(userId,examId,quesIds[i],answers[i]));
			}


		}
	}

	public int getScore(Integer userId, Integer examId) {
		return answerMapper.getScore(userId,examId);
	}

	public List<Result> getResult(Integer examId, Integer userId) {
		return examDao.getResult(examId,userId);
	}


	/**
	 * 获取考试总成绩
	 * @param examId
	 * @param userId
     * @return
     */
	public List<Score> getTotalScore(Integer examId, Integer userId) {
		return examDao.getTotalScore(examId,userId);
	}
}
