package com.chinasofti.pojo;

import javax.annotation.Generated;

public class Exam {
	private Integer id;
	private String title;//标题
	private String beginTime;//考试开始时间
	private Integer needTime;//考试所需时间（分钟）
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	public Integer getNeedTime() {
		return needTime;
	}
	public void setNeedTime(Integer needTime) {
		this.needTime = needTime;
	}
	
	@Override
	public String toString() {
		return "Exam [id=" + id + ", title=" + title + ", beginTime=" + beginTime + ", needTime=" + needTime + "]";
	}

}
