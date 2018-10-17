package com.chinasofti.service;


import com.chinasofti.dao.QuestionDao;
import com.chinasofti.exception.TipException;
import com.chinasofti.pojo.Question;

import java.util.List;

import com.chinasofti.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionService {

    @Autowired
    private QuestionDao questionDao;

    /**
     * 添加题库
     * @param question
     * @throws TipException 信息不全则抛出提示性异常
     */
    public void add(Question question) throws TipException {
        if(question==null||question.getTitle()==null||question.getScore()==null){
            throw new TipException("信息不完整");
        }
        questionDao.add(question);
    }

	public List<Question> list(String title, Integer id, Page page) {
        //获取总记录
        page.setTotalCount(questionDao.getCount(title,id));

		return questionDao.findAll(title,id,page);
	}

    /**
     * 根据id批量删除
     * @param ids
     */
    public void del(Integer[] ids) {

        questionDao.del(ids);
    }

    public List<Question> findByExamId(Integer examId) {
        return questionDao.findByExamId(examId);
    }

    /**
     * 根据考试编号与试题类型查找
     * @param examId
     * @param i
     * @return
     */
    public List<Question> findByExamIdAndType(Integer examId, int type) {
        return questionDao.findByExamIdAndType(examId,type);
    }
}
