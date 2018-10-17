package com.chinasofti.controller;

import com.chinasofti.exception.TipException;
import com.chinasofti.pojo.Question;
import com.chinasofti.service.QuestionService;
import com.chinasofti.util.JsonResult;
import com.chinasofti.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "question")
public class QuestionController {

	@Autowired
	private QuestionService questionService;

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public ModelAndView add(Question question, ModelAndView mv) {
		try {
			questionService.add(question);
			mv.setViewName("redirect:list");
		} catch (TipException e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.addObject("question", question);
			mv.setViewName("addQues");
		}
		return mv;
	}


	@RequestMapping(value = "del")
	@ResponseBody
	public JsonResult del(Integer [] ids) {
		JsonResult jsonResult=new JsonResult();
		try {
			questionService.del(ids);
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.setSuccess(false);
			jsonResult.setMsg(e.getMessage());
		}
		return jsonResult;
	}


	
	/**
	 * 
	 * @param mv
	 * @param title 查询条件
	 * @return
	 */
	@RequestMapping(value = "list")
	public ModelAndView list(ModelAndView mv,String title,Integer id,Page page) {
		if(page==null||page.getPageNum()==null){
			page=new Page(10,1);
		}
		mv.addObject("questions", questionService.list(title,id,page));
		mv.addObject("page",page);
		mv.setViewName("listQues");
		return mv;
	}


	/**
	 * 开始考试
	 * @param mv
     * @return
     */
	@RequestMapping(value = "begin")
	public ModelAndView begin(ModelAndView mv,Integer examId) {
		//查询出当前试卷下的所有试题
		//mv.addObject("questions", questionService.findByExamId(examId));
		List<Question> singles = questionService.findByExamIdAndType(examId, 0);
		List<Question> muiltis = questionService.findByExamIdAndType(examId, 1);
		//计算单选总分数
		Integer singleTotal = 0;
		Integer muiltTotal=0;
		for (Question question : singles) {
			singleTotal+=question.getScore();
		}
		for (Question question : muiltis) {
			muiltTotal+=question.getScore();
		}

		mv.addObject("singleTotal",singleTotal );
		mv.addObject("muiltTotal",muiltTotal );

		mv.addObject("singles",singles );
		mv.addObject("muiltis",muiltis);
		mv.setViewName("beginExam");
		return mv;
	}



	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add() {
		return "addQues";
	}
}
