package com.chinasofti.ser;

import org.apache.commons.io.FileUtils;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.tools.JavaCompiler;
import javax.tools.JavaFileObject;
import javax.tools.StandardJavaFileManager;
import javax.tools.ToolProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Arrays;

public class TestClassloader extends ClassLoader {

    private String path="D:\\tmp\\";

    public TestClassloader(ClassLoader parent){
        super(parent);
    }

    @Override
    protected Class<?> findClass(String name) throws ClassNotFoundException {
        try {
            byte[] data = FileUtils.readFileToByteArray(new File(path+name+".class"));
            return defineClass(name,data,0,data.length);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {

        try {
            TestClassloader t1=new TestClassloader(Thread.currentThread().getContextClassLoader());
            Class<?> clazz = t1.loadClass("Silence");

            System.out.println(clazz.hashCode());
            clazz = new TestClassloader(null).loadClass("Silence");
            System.out.println(clazz.hashCode());





        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
