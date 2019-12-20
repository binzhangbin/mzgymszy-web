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
import com.imu.mzgymszy.smriti.model.QyGzsEntity;
import com.imu.mzgymszy.smriti.service.QyGzsService;
import com.imu.mzgymszy.util.PageUtil;
import com.mongodb.gridfs.GridFSFile;

@Controller
@Scope("prototype")
@RequestMapping("/smriti/")
public class QyGzsController extends BaseController {

	@Autowired
	private QyGzsService qyGzsService;
	@Autowired
	private GridFsTemplate gridFsTemplate;

	@RequestMapping("listQyGzsUI.html")
	public String listQyGzsUI(Model model, HttpServletRequest request) {
		try {
			PageUtil page = new PageUtil();
			if (request.getParameterMap().containsKey("page")) {
				page.setPageNum(Integer.valueOf(request.getParameter("page")));
				page.setPageSize(Integer.valueOf(request.getParameter("rows")));
				page.setOrderByColumn(request.getParameter("sidx"));
				page.setOrderByType(request.getParameter("sord"));
			}
			model.addAttribute("page", page);
			return Common.BACKGROUND_PATH + "/smriti/listQyGzs";
		} catch (Exception e) {
			throw new AjaxException(e);
		}
	}

	/**
	 * ajax分页动态加载模式
	 * 
	 * @param dtGridPager
	 *            Pager对象
	 * @throws Exception
	 */
	@RequestMapping(value = "/listQyGzs.html", method = RequestMethod.POST)
	@ResponseBody
	public Object listQyGzs(String gridPager, HttpServletResponse response) throws Exception {
		Map<String, Object> parameters = null;
		// 1、映射Pager对象
		Pager pager = JSON.parseObject(gridPager, Pager.class);
		// 2、设置查询参数
		parameters = pager.getParameters();
		// 设置分页，page里面包含了分页信息
		Page<Object> page = PageHelper.startPage(pager.getNowPage(), pager.getPageSize(), "qy_gzs_id DESC");
		List<QyGzsEntity> list = qyGzsService.queryListByPage(parameters);
		parameters.clear();
		parameters.put("isSuccess", Boolean.TRUE);
		parameters.put("nowPage", pager.getNowPage());
		parameters.put("pageSize", pager.getPageSize());
		parameters.put("pageCount", page.getPages());
		parameters.put("recordCount", page.getTotal());
		parameters.put("startRecord", page.getStartRow());
		// 列表展示数据
		parameters.put("exhibitDatas", list);
		return parameters;
	}

	@RequestMapping("addQyGzsUI.html")
	public String addQyGzsUI(Model model, HttpServletRequest request) {
		try {
			List<QyGzsEntity> qyGzsList = qyGzsService.queryListByPage(null);
			model.addAttribute("qyGzsList", qyGzsList);
			System.out.println(model.toString()+"===========================");
			return Common.BACKGROUND_PATH + "/smriti/formQyGzs";
		} catch (Exception e) {
			throw new SystemException(e);
		}
	}

	@RequestMapping("addQyGzs.html")
	@ResponseBody
	public Object addQyGzs(QyGzsEntity qyGzsEntity) throws AjaxException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean result = qyGzsService.insert(qyGzsEntity);
			if (result) {
				map.put("success", Boolean.TRUE);
				map.put("data", null);
				map.put("message", "添加成功");
			} else {
				map.put("success", Boolean.FALSE);
				map.put("data", null);
				map.put("message", "添加失败");
			}
		} catch (ServiceException e) {
			throw new AjaxException(e);
		}
		return map;
	}

	@RequestMapping("editQyGzsUI.html")
	public String editQyGzsUI(Model model, HttpServletRequest request, Long id) {
		try {
			QyGzsEntity qyGzsEntity = qyGzsService.findById(id);
			PageUtil page = new PageUtil();
			page.setPageNum(Integer.valueOf(request.getParameter("page")));
			page.setPageSize(Integer.valueOf(request.getParameter("rows")));
			page.setOrderByColumn(request.getParameter("sidx"));
			page.setOrderByType(request.getParameter("sord"));
			List<QyGzsEntity> qyGzsList = qyGzsService.queryListByPage(null);
			model.addAttribute("qyGzsList", qyGzsList);
			model.addAttribute("page", page);
			model.addAttribute("qyGzsEntity", qyGzsEntity);
			return Common.BACKGROUND_PATH + "/smriti/formQyGzs";
		} catch (Exception e) {
			throw new AjaxException(e);
		}
	}

	@RequestMapping("editQyGzs.html")
	@ResponseBody
	public Object update(QyGzsEntity qyGzsEntity) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean result = qyGzsService.updateById(qyGzsEntity);
			if (result) {
				map.put("success", Boolean.TRUE);
				map.put("data", null);
				map.put("message", "编辑成功");
			} else {
				map.put("success", Boolean.FALSE);
				map.put("data", null);
				map.put("message", "编辑失败");
			}
		} catch (Exception e) {
			throw new AjaxException(e);
		}
		return map;
	}

	@RequestMapping("deleteBatchQyGzs.html")
	@ResponseBody
	public Object deleteBatchQyGzs(String ids) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String[] dataIds = ids.split(",");
			List<Long> list = new ArrayList<Long>();
			for (String string : dataIds) {
				list.add(Long.valueOf(string));
			}
			boolean cnt = qyGzsService.deleteBatchById(list);
			if (cnt) {
				result.put("success", true);
				result.put("data", null);
				result.put("message", "删除成功");
			} else {
				result.put("success", false);
				result.put("data", null);
				result.put("message", "删除失败");
			}
		} catch (Exception e) {
			throw new AjaxException(e);
		}
		return result;
	}
}
