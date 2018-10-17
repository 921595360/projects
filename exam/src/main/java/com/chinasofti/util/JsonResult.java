package com.chinasofti.util;

public class JsonResult {
	//标识当前请求是否正常处理
	private boolean success=true;
	//存储提示信息
	private String msg;
	//存储携带数据
	private Object result;
	
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getResult() {
		return result;
	}
	public void setResult(Object result) {
		this.result = result;
	}
	
	
	
}
