package com.chinasofti.controller;

import com.chinasofti.pojo.Result;
import com.chinasofti.pojo.Score;
import com.chinasofti.pojo.User;
import com.chinasofti.util.JsonResult;
import com.chinasofti.util.export.ExcelUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.chinasofti.exception.TipException;
import com.chinasofti.pojo.Exam;
import com.chinasofti.service.ExamService;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("exam")//命名空间
public class ExamController {

	@Autowired
	private ExamService examService;
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public ModelAndView add(Exam exam, ModelAndView mv) {
		try {
			examService.add(exam);
			mv.setViewName("redirect:/exam/list");
		} catch (TipException e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			//数据回显
			mv.addObject("exam", exam);
			mv.setViewName("addExam");
		}
		return mv;
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add() {
		return "addExam";
	}




	@RequestMapping(value = "list")
	public ModelAndView list(ModelAndView mv) {
		mv.addObject("exams", examService.list());
		mv.setViewName("listExam");
		return mv;
	}


	/**
	 * 为试卷添加题库
	 * @param ids
	 * @param examId
     * @return
     */
	@RequestMapping(value = "addQuestion")
	@ResponseBody
	public JsonResult addQuestion(Integer [] ids,Integer examId) {
		JsonResult jsonResult=new JsonResult();
		try {
			examService.addQuestion(examId,ids);
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.setSuccess(false);
			jsonResult.setMsg(e.getMessage());
		}
		return jsonResult;
	}


	/**
	 * 考试结束
	 * @return
     */
	@RequestMapping(value = "end",method = RequestMethod.POST)
	public Object end(Model model, Integer examId, Integer [] quesIds, String [] answers, HttpSession session) {
		JsonResult jsonResult=new JsonResult();

		User user = (User) session.getAttribute("user");
		if(user==null) return "redirect:/user/login";
		examService.end(user.getUserId(),examId,quesIds,answers);
		return "redirect:/exam/result";
	}

	@RequestMapping(value = "endAjx",method = RequestMethod.POST)
	@ResponseBody
	public void endAjx(Model model, Integer examId, Integer [] quesIds, String answers, HttpSession session) {
	
		User user = (User) session.getAttribute("user");

		String[] answers1 = answers.split("#");
		if(user==null) return;
		examService.end(user.getUserId(),examId,quesIds,answers1);
	}

	@RequestMapping(value = "result")
	public String getResult(Integer examId,HttpSession session,Model model){
		User user = (User) session.getAttribute("user");
		//显示本次考试成绩
		int score=examService.getScore(user.getUserId(),examId);
		model.addAttribute("score",score);
		//查询出本次考试题目,及个人答案
		model.addAttribute("result",examService.getResult(examId,user.getUserId()));
		return "result";
	}


	/**
	 * 导出成绩
	 * @return
     */
	@RequestMapping("/exportScore/**")
	public StreamingResponseBody exportScore(Integer examId,String title,HttpServletRequest request) {

		List<Score> result=examService.getTotalScore(examId,null);
		final Map<String,Object> datas=new HashMap<>();
		datas.put("title",title.substring(0,9));
		result.forEach((tmp)->{
			datas.put(tmp.getUserName(),tmp.getScore());
		});

		return new StreamingResponseBody() {
			@Override
			public void writeTo(OutputStream outputStream) throws IOException {
				String templateFile=request.getServletContext().getRealPath("/WEB-INF/export/score.xls");
				//将数据导出到临时文件
				FileInputStream is = new FileInputStream(templateFile);
				ExcelUtil.export(datas,is,outputStream);
				is.close();
			}
		};
	}


}




