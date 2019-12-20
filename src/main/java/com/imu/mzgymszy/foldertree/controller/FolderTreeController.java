package com.imu.mzgymszy.foldertree.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.imu.mzgymszy.base.basecontroller.BaseController;
import com.imu.mzgymszy.common.Common;
import com.imu.mzgymszy.exception.AjaxException;
import com.imu.mzgymszy.foldertree.model.FoldEntity;
import com.imu.mzgymszy.foldertree.service.FoldService;
import com.imu.mzgymszy.util.PageUtil;

@Controller
@Scope("prototype")
@RequestMapping("/foldertree/")
public class FolderTreeController extends BaseController {

	@Autowired
	private FoldService foldService;
	
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
			return Common.BACKGROUND_PATH + "/foldertree/list";
		}catch(Exception e)
		{
			throw new AjaxException(e);
		}
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("list.html")
	@ResponseBody
	public Object list(HttpServletRequest request,HttpServletResponse response){
		if (request.getParameter("id")==null||request.getParameter("id").trim().equals(""))
			return null;
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		try {
			if("#".equals(request.getParameter("id"))){
				List<FoldEntity> list = foldService.findRootFold();
				for(FoldEntity fold:list){
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", fold.getId());
					map.put("text", fold.getName());
					map.put("children", !fold.isLeaf());
					result.add(map);
				}
			}else{
				int parentId = Integer.parseInt(request.getParameter("id"));
				List<FoldEntity> list = foldService.findSubFold(parentId);
				for(FoldEntity fold:list){
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", fold.getId());
					map.put("text", fold.getName());
					map.put("children", !fold.isLeaf());
					result.add(map);
				}
		    }
		} catch (Exception e) {
			throw new AjaxException(e);
		}
		return result;
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("create.html")
	@ResponseBody
	public Object create(HttpServletRequest request,HttpServletResponse response){
		if (request.getParameter("parentId")==null||request.getParameter("parentId").trim().equals(""))
			return null;
		if (request.getParameter("text")==null||request.getParameter("text").trim().equals(""))
			return null;
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			FoldEntity parent = foldService.findById(request.getParameter("parentId"));
			FoldEntity node = new FoldEntity();
			long parentId = Long.parseLong(request.getParameter("parentId"));
			node.setParentId(parentId);
			node.setName(request.getParameter("text"));
			node.setFullPath(parent.getFullPath()+"/"+node.getName());
			node.setDepth(parent.getDepth()+1);
			if(node.getDepth()>3){
				result.put("success", Boolean.FALSE);
				result.put("data", null);
				result.put("message", "添加失败:不能创建深度大于三的目录");
				return result;
			}
			node.setDelFlag(0);
			node.setLeaf(1);
			foldService.insert(node);
			parent = new FoldEntity();
			parent .setId(parentId);
			parent.setLeaf(0);
			foldService.update(parent);
			result.put("success", Boolean.TRUE);
			result.put("id", String.valueOf(node.getId()));
			result.put("data", null);
			result.put("message", "添加成功");
		} catch (Exception e) {
			result.put("success", Boolean.FALSE);
			result.put("data", e.getLocalizedMessage());
			result.put("message", "添加失败");
			throw new AjaxException(e);
		}
		return result;
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("rename.html")
	@ResponseBody
	public Object rename(HttpServletRequest request,HttpServletResponse response){
		if (request.getParameter("id")==null||request.getParameter("id").trim().equals(""))
			return null;
		if (request.getParameter("text")==null||request.getParameter("text").trim().equals(""))
			return null;
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			long id = Long.parseLong(request.getParameter("id"));
			FoldEntity node = foldService.findById(id);
			node.setName(request.getParameter("text"));
			node.setFullPath(node.getFullPath().substring(0,node.getFullPath().lastIndexOf("/"))+"/"+request.getParameter("text"));
			node.setUpdateTime(new Date());
			foldService.update(node);
			List<FoldEntity> subfolds = foldService.findSubFold(id);
			for(FoldEntity fold:subfolds){
				fold.setFullPath(node.getFullPath()+"/"+fold.getName());
				foldService.update(fold);
			}
			result.put("success", Boolean.TRUE);
			result.put("data", null);
			result.put("message", "修改成功");
		} catch (Exception e) {
			result.put("success", Boolean.FALSE);
			result.put("data", e.getLocalizedMessage());
			result.put("message", "修改失败");
			throw new AjaxException(e);
		}
		return result;
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("delete.html")
	@ResponseBody
	public Object delete(HttpServletRequest request,HttpServletResponse response){
		if (request.getParameter("id")==null||request.getParameter("id").trim().equals(""))
			return null;
		if (request.getParameter("parentId")==null||request.getParameter("parentId").trim().equals(""))
			return null;
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			long id = Long.parseLong(request.getParameter("id"));
			List<FoldEntity> subfolds = foldService.findSubFold(id);
			if(subfolds.size()>0){
				result.put("success", Boolean.FALSE);
				result.put("data", "不能删除含有子目录的目录");
				result.put("message", "删除失败,不能删除含有子目录的目录");
				return result;
			}
			foldService.deleteById(id);
			id = Long.parseLong(request.getParameter("parentId"));
			subfolds = foldService.findSubFold(id);
			if(subfolds.size()==0){
				FoldEntity node = new FoldEntity();
				node.setId(id);
				node.setLeaf(1);
				foldService.update(node);
			}
			result.put("success", Boolean.TRUE);
			result.put("data", null);
			result.put("message", "删除成功");
		} catch (Exception e) {
			result.put("success", Boolean.FALSE);
			result.put("data", e.getLocalizedMessage());
			result.put("message", "删除失败");
			throw new AjaxException(e);
		}
		return result;
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("getNodePath.html")
	@ResponseBody
	public Object getNodePath(HttpServletRequest request,HttpServletResponse response){
		if (request.getParameter("id")==null||request.getParameter("id").trim().equals(""))
			return null;
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			long id = Long.parseLong(request.getParameter("id"));
			FoldEntity node = foldService.findById(id);
			result.put("success", Boolean.TRUE);
			result.put("data", node.getFullPath());
			result.put("message", "获取成功");
		} catch (Exception e) {
			result.put("success", Boolean.FALSE);
			result.put("data", e.getLocalizedMessage());
			result.put("message", "获取失败");
			throw new AjaxException(e);
		}
		return result;
	}
}