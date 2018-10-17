package com.chinasofti.util;

/**
 * 通用工具类
 * @author Administrator
 *
 */
public class CommonUtil {
	
	public static boolean isNullOrEmpty(Object o){
		if(o==null) return true;
		if(o.toString().equals("")) return true;
		return false;
	}
}
