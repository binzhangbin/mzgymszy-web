package com.imu.mzgymszy.shiro.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;



/**
 * 
 * 开发公司：itboy.net<br/>
 * 版权：itboy.net<br/>
 * <p>
 * 
 * Shiro Filter 工具类
 * 
 * <p>
 * 
 * 区分　责任人　日期　　　　说明<br/>
 * 创建　周柏成　2016年5月27日 　<br/>
 * <p>
 * *******
 * <p>
 * 
 * @author zhou-baicheng
 * @email i@itboy.net
 * @version 1.0,2016年5月27日 <br/>
 * 
 */
public class ShiroFilterUtils {
	
	private static Logger logger = Logger.getLogger(ShiroFilterUtils.class);
	
	//登录页面
	static final String LOGIN_URL = "/u/login.shtml";
	//踢出登录提示
	final static String KICKED_OUT = "/open/kickedOut.shtml";
	//没有权限提醒
	final static String UNAUTHORIZED = "/open/unauthorized.shtml";
	/**
	 * 是否是Ajax请求
	 * @param request
	 * @return
	 */
	public static boolean isAjax(ServletRequest request){
		return "XMLHttpRequest".equalsIgnoreCase(((HttpServletRequest) request).getHeader("X-Requested-With"));
	}
	
	/**
	 * response 输出JSON
	 * @param hresponse
	 * @param resultMap
	 * @throws IOException
	 */
	public static void out(ServletResponse response, Map<String, String> resultMap){
		
		PrintWriter out = null;
		try {
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			out.println(JSON.toJSONString(resultMap));
		} catch (Exception e) {
			logger.error("输出JSON报错。", e);
		}finally{
			if(null != out){
				out.flush();
				out.close();
			}
		}
	}
}
