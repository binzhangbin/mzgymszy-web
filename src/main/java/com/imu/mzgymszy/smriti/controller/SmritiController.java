package com.imu.mzgymszy.smriti.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.data.mongodb.gridfs.GridFsTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.imu.mzgymszy.base.basecontroller.BaseController;
import com.imu.mzgymszy.common.Common;
import com.imu.mzgymszy.dtgrid.model.Pager;
import com.imu.mzgymszy.exception.AjaxException;
import com.imu.mzgymszy.exception.ServiceException;
import com.imu.mzgymszy.exception.SystemException;
import com.imu.mzgymszy.smriti.model.CcrEntity;
import com.imu.mzgymszy.smriti.model.QyGzsEntity;
import com.imu.mzgymszy.smriti.service.CcrService;
import com.imu.mzgymszy.smriti.service.QyGzsService;
import com.imu.mzgymszy.util.PageUtil;
import com.mongodb.gridfs.GridFSFile;

@Controller
@Scope("prototype")
@RequestMapping("/smriti/")
public class SmritiController extends BaseController {
	@Autowired
	private CcrService ccrService;
	@Autowired
	private QyGzsService qyGzsService;
	@Autowired
	private GridFsTemplate gridFsTemplate;
	
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
			return Common.BACKGROUND_PATH + "/smriti/list";
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
		//设置分页，page里面包含了分页信息
		Page<Object> page = PageHelper.startPage(pager.getNowPage(),pager.getPageSize(), "c_id DESC");
		List<CcrEntity> list = ccrService.queryListByPage(parameters);
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
	
	@RequestMapping("addUI.html")
	public String addUI(Model model, HttpServletRequest request) {
		try
		{
			List<CcrEntity> ccrList = ccrService.queryListByPage(null);
			List<QyGzsEntity> qyGzsList = qyGzsService.queryListByPage(null);
			model.addAttribute("ccrList",ccrList);
			model.addAttribute("qyGzsList",qyGzsList);
			return Common.BACKGROUND_PATH + "/smriti/form";
		}catch(Exception e)
		{
			throw new SystemException(e);
		}
	}
	
	@RequestMapping("add.html")
	@ResponseBody
	public Object add(CcrEntity ccrEntity) throws AjaxException
	{
		Map<String, Object> map = new HashMap<String, Object>();
		try
		{
			boolean result = ccrService.insert(ccrEntity);
			if(result)
			{
				map.put("success", Boolean.TRUE);
				map.put("data", null);
				map.put("message", "添加成功");
			}else
			{
				map.put("success", Boolean.FALSE);
				map.put("data", null);
				map.put("message", "添加失败");
			}
		}catch(ServiceException e)
		{
			throw new AjaxException(e);
		}
		return map;
	}
	
	@RequestMapping("pictureuploadUI.html")
	public String pictureuploadUI() {
		return Common.BACKGROUND_PATH + "/smriti/pictureupload";
	}
	
	@RequestMapping("pictureupload.html")
	@ResponseBody
	public Object pictureupload(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		String path = null;
		try{
	        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());  
	        if(multipartResolver.isMultipart(request)){
	            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;  
	            	MultipartFile file = multiRequest.getFile("file");
	            	GridFSFile inputFile = gridFsTemplate.store(file.getInputStream(), file.getOriginalFilename());
	            	path = inputFile.getId().toString();
	        }
	        if(path!=null){
	        	map.put("success", true);
	        	map.put("result", path);
	        }else{
	        	throw new Exception("Upload Failed！！！");
	        }
		}catch(Exception e){
			map.put("success", false);
			map.put("result", e.getLocalizedMessage());
			throw new AjaxException(e);
		}
        return map;
	}
	
	@RequestMapping("editUI.html")
	public String editUI(Model model, HttpServletRequest request, Long id) {
		try
		{
			CcrEntity ccrEntity = ccrService.findById(id);
//			QyGzsEntity qyGzsEntity = qyGzsService.findById(id);
			PageUtil page = new PageUtil();
			page.setPageNum(Integer.valueOf(request.getParameter("page")));
			page.setPageSize(Integer.valueOf(request.getParameter("rows")));
			page.setOrderByColumn(request.getParameter("sidx"));
			page.setOrderByType(request.getParameter("sord"));
			List<CcrEntity> ccrList = ccrService.queryListByPage(null);
			List<QyGzsEntity> qyGzsList = qyGzsService.queryListByPage(null);
			model.addAttribute("ccrList",ccrList);
			model.addAttribute("page", page);
			model.addAttribute("ccrEntity", ccrEntity);
			model.addAttribute("qyGzsList", qyGzsList);
			return Common.BACKGROUND_PATH + "/smriti/form";
		}catch(Exception e)
		{
			throw new AjaxException(e);
		}
	}
	
	@RequestMapping("edit.html")
	@ResponseBody
	public Object update(CcrEntity ccrEntity)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		try
		{
			boolean result = ccrService.updateById(ccrEntity);
			if(result)
			{
				map.put("success", Boolean.TRUE);
				map.put("data", null);
				map.put("message", "编辑成功");
			}else
			{
				map.put("success", Boolean.FALSE);
				map.put("data", null);
				map.put("message", "编辑失败");
			}
		}catch(Exception e)
		{
			throw new AjaxException(e);
		}
		return map;
	}
	
	@RequestMapping("deleteBatch.html")
	@ResponseBody
	public Object deleteBatch(String ids) {
		Map<String, Object> result = new HashMap<String, Object>();
		try
		{
			String[] dataIds = ids.split(",");
			List<Long> list = new ArrayList<Long>();
			for (String string : dataIds) {
				list.add(Long.valueOf(string));
			}
			boolean cnt = ccrService.deleteBatchById(list);
			if(cnt)
			{
				result.put("success", true);
				result.put("data", null);
				result.put("message", "删除成功");
			}else
			{
				result.put("success", false);
				result.put("data", null);
				result.put("message", "删除失败");
			}
		}catch(Exception e)
		{
			throw new AjaxException(e);
		}
		return result;
	}
}
