package com.chinasofti.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

    /**
     * 调用控制器方法前调用，
     * @param o
     * @return
     *         返回true将请求交给下一处理类
     *         返回false拦截本次请求，处理结束
     *
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {

        //验证用户是否登陆
       if(request.getSession().getAttribute("user")==null){

            //重定向登录界面
            response.sendRedirect(request.getContextPath()+"/login");
            return false;
        }
        System.out.println("LoginInterceptor.preHandle");
        return true;
    }


    /**
     * 调用控制器方法正常之后
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

        System.out.println("LoginInterceptor.postHandle");
    }


    /**
     * 最后执行
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @param e
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    System.out.println("LoginInterceptor.afterCompletion");
}
}