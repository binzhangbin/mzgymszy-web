package com.imu.mzgymszy.visitor.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.lucene.document.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.imu.mzgymszy.base.basecontroller.BaseController;
import com.imu.mzgymszy.common.Common;
import com.imu.mzgymszy.dtgrid.model.Pager;
import com.imu.mzgymszy.exception.AjaxException;
import com.imu.mzgymszy.exception.SystemException;
import com.imu.mzgymszy.originaldata.model.OriginaldataEntity;
import com.imu.mzgymszy.originaldata.service.OriginaldataService;
import com.imu.mzgymszy.util.PageUtil;
import com.imu.mzgymszy.util.SearchUtil;

import jodd.util.StringUtil;


@Controller
@Scope("prototype")
@RequestMapping("/visitor/")
public class VisitorController extends BaseController {
	
	@Autowired
	private OriginaldataService originaldataService;
	
	@RequestMapping("treelistUI.html")
	public String treelistUI(Model model, HttpServletRequest request) {
		try
		{
			PageUtil page = new PageUtil();
			if(request.getParameterMap().containsKey("page")){
				page.setPageNum(Integer.valueOf(request.getParameter("page")));
				page.setPageSize(Integer.valueOf(request.getParameter("rows")));
				page.setOrderByColumn(request.getParameter("sidx"));
				page.setOrderByType(request.getParameter("sord"));
			}
			model.addAttribute("page", page);
			return Common.BACKGROUND_PATH + "/visitor/treelist";
		}catch(Exception e)
		{
			throw new AjaxException(e);
		}
	}
	
	@RequestMapping("listUI.html")
	public String listUI(Model model, HttpServletRequest request) {
		try
		{
			PageUtil page = new PageUtil();
			if(request.getParameterMap().containsKey("page")){
				page.setPageNum(Integer.valueOf(request.getParameter("page")));
				page.setPageSize(Integer.valueOf(request.getParameter("rows")));
				page.setOrderByColumn(request.getParameter("sidx"));
				page.setOrderByType(request.getParameter("sord"));
			}
			model.addAttribute("page", page);
			if(!StringUtil.isBlank(request.getParameter("foldId"))){
				model.addAttribute("foldId",request.getParameter("foldId"));
			}
			if(!StringUtil.isBlank(request.getParameter("searchKey"))){
				model.addAttribute("searchKey",request.getParameter("searchKey"));
			}
			return Common.BACKGROUND_PATH + "/visitor/list";
		}catch(Exception e)
		{
			throw new AjaxException(e);
		}
	}
	
	
	/**
	 * ajax分页动态加载模式
	 * @param dtGridPager Pager对象
	 * @throws Exception
	 */
	@RequestMapping(value = "/list.html", method = RequestMethod.POST)
	@ResponseBody
	public Object list(String gridPager, HttpServletResponse response) throws Exception{
		Map<String, Object> parameters = null;
		//1、映射Pager对象
		Pager pager = JSON.parseObject(gridPager, Pager.class);
		//2、设置查询参数
		parameters = pager.getParameters();
		String searchkey = (String) parameters.get("searchKey");
		if(!StringUtil.isBlank(searchkey)){
			String[] key = {"gypbm","gypmczm","gypmcym","gypbz"};
	    	String value = searchkey;
	    	List<Document> doclist = SearchUtil.search(key,value,pager.getPageSize());
	    	StringBuilder gypId = new StringBuilder();
	    	for(Document doc:doclist){
	    		gypId.append(doc.get("id")+",");
	    	}
	    	if(gypId.length()>2){
	    		gypId.deleteCharAt(gypId.length()-1);
	    		parameters.put("gypId",gypId.toString());
	    	}else{
	    		parameters.put("gypId","-1");
	    	}
		}
		//设置分页，page里面包含了分页信息
		Page<Object> page = PageHelper.startPage(pager.getNowPage(),pager.getPageSize(), "gyp_id DESC");
		List<OriginaldataEntity> list = originaldataService.queryListByPage(parameters);
		parameters.clear();
		parameters.put("isSuccess", Boolean.TRUE);
		parameters.put("nowPage", pager.getNowPage());
		parameters.put("pageSize", pager.getPageSize());
		parameters.put("pageCount", page.getPages());
		parameters.put("recordCount", page.getTotal());
		parameters.put("startRecord", page.getStartRow());
		//列表展示数据
		parameters.put("exhibitDatas", list);
		return parameters;
	}
	
	@RequestMapping("detailUI.html")
	public String detailUI(Model model, HttpServletRequest request) {
		try
		{
			if(request.getParameter("id")!=null&&!request.getParameter("id").trim().equals("")){
				long id = Long.parseLong(request.getParameter("id"));
				OriginaldataEntity originaldataEntity = originaldataService.findById(id);
				model.addAttribute("originaldataEntity", originaldataEntity);
			}
			return Common.BACKGROUND_PATH + "/visitor/detail";
		}catch(Exception e)
		{
			throw new SystemException(e);
		}
	}
}
