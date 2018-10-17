package com.chinasofti.util.export;


import com.chinasofti.util.export.ReportEnginer;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

/**
 * 基于jxl导出excel的工具类
 */
public class ExcelUtil {

    /**
     *
     * @param datas 数据
     * @param templateFile 模板文件
     * @param destFile 目标文件
     */
    public static void  export(Map<String,Object> datas, String templateFile, String destFile){
        ReportEnginer enginer = new ReportEnginer();
        try {
            enginer.excute(templateFile, datas, destFile);
        } catch (Exception e) {
        }
    }

    public static void  export(Map<String,Object> datas, InputStream templateFile, OutputStream destFile){
        ReportEnginer enginer = new ReportEnginer();
        try {
            enginer.excute(templateFile,datas,destFile);
        } catch (Exception e) {
        }
    }

}