package com.imu.mzgymszy.teaching.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
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
import com.imu.mzgymszy.originaldata.model.MediaEntity;
import com.imu.mzgymszy.originaldata.model.PictureEntity;
import com.imu.mzgymszy.originaldata.service.MediaService;
import com.imu.mzgymszy.originaldata.service.PictureService;
import com.imu.mzgymszy.teaching.model.TeachingVideoEntity;
import com.imu.mzgymszy.teaching.service.TeachingVideoService;
import com.imu.mzgymszy.util.PageUtil;
import com.mongodb.gridfs.GridFSFile;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@Scope("prototype")
@RequestMapping("/teachingVideo/")
public class TeachingVideoController extends BaseController {

	@Autowired
	private TeachingVideoService teachingVideoService;
	@Autowired
	private PictureService pictureService;
	@Autowired
	private MediaService mediaService;
	@Autowired
	private GridFsTemplate gridFsTemplate;

	@RequestMapping("listUI.html")
	public String listUI(Model model, HttpServletRequest request) {
		try {
			PageUtil page = new PageUtil();
			if (request.getParameterMap().containsKey("page")) {
				page.setPageNum(Integer.valueOf(request.getParameter("page")));
				page.setPageSize(Integer.valueOf(request.getParameter("rows")));
				page.setOrderByColumn(request.getParameter("sidx"));
				page.setOrderByType(request.getParameter("sord"));
			}
			model.addAttribute("page", page);
			return Common.BACKGROUND_PATH + "/teaching/list";
		} catch (Exception e) {
			throw new AjaxException(e);
		}
	}
	@RequestMapping("dlistUI.html")
	public String dlistUI(Model model, HttpServletRequest request) {
			request.getSession().setAttribute("dlistFlag","dlistFlag");
			return Common.BACKGROUND_PATH + "/teaching/list";
	}
	/**
	 * ajax分页动态加载模式
	 * 
	 * @param dtGridPager
	 *            Pager对象
	 * @throws Exception
	 */
	@RequestMapping(value = "/list.html", method = RequestMethod.POST)
	@ResponseBody
	public Object list(String gridPager,HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> parameters = null;
		// 1、映射Pager对象
		Pager pager = JSON.parseObject(gridPager, Pager.class);
		// 2、设置查询参数
		parameters = pager.getParameters();
		// 设置分页，page里面包含了分页信息
		System.out.println(pager.getNowPage()+"=-==-");
		int pageSize=pager.getPageSize();
		int startSize=1;
		System.out.println(parameters.get("pageCount")+"===");
		parameters.clear();
		System.out.println(parameters.get("pageCount")+"---");
		if(request.getSession().getAttribute("dlistFlag")!=null&&"dlistFlag".equalsIgnoreCase((String) request.getSession().getAttribute("dlistFlag"))){//由更新进入
			Object retPage = request.getSession().getAttribute("retPage");

			if(retPage==null){
				retPage=1;
			}
			startSize= (int) retPage;
			parameters.put("nowPage",retPage);
			System.out.println("返回页："+retPage);
			request.getSession().removeAttribute("dlistFlag");
		} else{//由list分页进入
            parameters.put("nowPage", pager.getNowPage());//下一页
            request.getSession().setAttribute("retPage",pager.getNowPage());//迭代更新
			startSize=pager.getNowPage();
            System.out.println("下一页："+pager.getNowPage());
        }
		Page<Object> page = PageHelper.startPage(startSize,pageSize, "jx_id DESC");
		List<TeachingVideoEntity> list = teachingVideoService.queryListByPage(parameters);
		parameters.put("isSuccess", Boolean.TRUE);
		parameters.put("pageSize", pager.getPageSize());
		parameters.put("pageCount", page.getPages());
		parameters.put("recordCount", page.getTotal());
		parameters.put("startRecord", page.getStartRow());
		// 列表展示数据
        request.getSession().setAttribute("pageNum",pager.getNowPage());
		parameters.put("exhibitDatas", list);
		return parameters;
	}

	@RequestMapping("addUI.html")
	public String addUI(Model model, HttpServletRequest request) {
		try {
			List<TeachingVideoEntity> teachingVideoList = teachingVideoService.queryListByPage(null);
			model.addAttribute("teachingVideoList", teachingVideoList);
			return Common.BACKGROUND_PATH + "/teaching/form";
		} catch (Exception e) {
			throw new SystemException(e);
		}
	}

	@RequestMapping("add.html")
	@ResponseBody
	public Object add(TeachingVideoEntity teachingVideoEntity) throws AjaxException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean result = teachingVideoService.insert(teachingVideoEntity);
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
	
	@RequestMapping("pictureuploadUI.html")
	public String pictureuploadUI() {
		return Common.BACKGROUND_PATH + "/teaching/pictureupload";
	}

	@RequestMapping("pictureupload.html")
	@ResponseBody
	public Object pictureupload(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		StringBuilder result = new StringBuilder();
		try {
			CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
					request.getSession().getServletContext());
			if (multipartResolver.isMultipart(request)) {
				MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
				int count = Integer.parseInt(request.getParameter("count"));
				if (count <= 0)
					throw new Exception("无上传文件");
				for (int i = 1; i <= count; i++) {
					MultipartFile file = multiRequest.getFile("file_" + i);
					GridFSFile inputFile = gridFsTemplate.store(file.getInputStream(), file.getOriginalFilename());
					String reg = ".+(.JPEG|.jpeg|.JPG|.jpg|.GIF|.gif|.BMP|.bmp|.PNG|.png)$";
					Pattern pattern = Pattern.compile(reg);
					Matcher matcher = pattern.matcher(file.getOriginalFilename());
					if (matcher.matches()) {
						File pic = new File(System.getProperty("java.io.tmpdir") + "/" + file.getOriginalFilename());
						file.transferTo(pic);
						Thumbnails.of(pic).forceSize(100, 100).toFile(pic);
						gridFsTemplate.store(new FileInputStream(pic), "thumbnail-" + inputFile.getId());
					}
					String path = inputFile.getId().toString();
					String pTp = multiRequest.getParameter("pTp_" + i);
					PictureEntity picture = pictureService.findByTp(pTp);
					if (picture == null) {
						picture = new PictureEntity();
						picture.setpTp(multiRequest.getParameter("pTp_" + i));
						picture.setpPath(path);
						picture.setpCc(multiRequest.getParameter("pCc_" + i));
						picture.setpTt(multiRequest.getParameter("pTt_" + i));
						pictureService.insert(picture);
					} else {
						picture.setpPath(path);
						picture.setpCc(multiRequest.getParameter("pCc_" + i));
						picture.setpTt(multiRequest.getParameter("pTt_" + i));
						pictureService.update(picture);
					}
					result.append(",").append(pTp);
				}
			}
			map.put("success", true);
			map.put("result", result.deleteCharAt(0).toString());
		} catch (Exception e) {
			map.put("success", false);
			map.put("result", e.getLocalizedMessage());
			throw new AjaxException(e);
		}
		return map;
	}

	@RequestMapping("documentuploadUI.html")
	public String documentloadUI() {
		return Common.BACKGROUND_PATH + "/teaching/documentupload";
	}

	@RequestMapping("documentupload.html")
	@ResponseBody
	public Object documentupload(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		StringBuilder result = new StringBuilder();
		try {
			CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
					request.getSession().getServletContext());
			if (multipartResolver.isMultipart(request)) {
				MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
				int count = Integer.parseInt(request.getParameter("count"));
				if (count <= 0)
					throw new Exception("无上传文件");
				for (int i = 1; i <= count; i++) {
					MultipartFile file = multiRequest.getFile("file_" + i);
					GridFSFile inputFile = gridFsTemplate.store(file.getInputStream(), file.getOriginalFilename());
					String path = inputFile.getId().toString();
					String mYspm = multiRequest.getParameter("mYspm_" + i);
					MediaEntity media = mediaService.findByYspm(mYspm);
					if (media == null) {
						media = new MediaEntity();
						media.setmLx(Integer.parseInt(multiRequest.getParameter("mLx_" + i)));
						media.setmYspm(multiRequest.getParameter("mYspm_" + i));
						String mJlsj = multiRequest.getParameter("mJlsj_" + i);
						media.setmJlsj(LocalDate.parse(mJlsj, DateTimeFormat.forPattern("yyyy-MM-dd")).toDate());
						media.setmJlr(multiRequest.getParameter("mJlr_" + i));
						media.setmScfr(multiRequest.getParameter("mScfr_" + i));
						media.setmCfdd(multiRequest.getParameter("mCfdd_" + i));
						media.setmSc(Long.parseLong(multiRequest.getParameter("mSc_" + i)));
						media.setmZtjl(multiRequest.getParameter("mZtjl_" + i));
						media.setmPath(path);
						mediaService.insert(media);
					} else {
						media.setmLx(Integer.parseInt(multiRequest.getParameter("mLx_" + i)));
						String mJlsj = multiRequest.getParameter("mJlsj_" + i);
						media.setmJlsj(LocalDate.parse(mJlsj, DateTimeFormat.forPattern("yyyy-MM-dd")).toDate());
						media.setmJlr(multiRequest.getParameter("mJlr_" + i));
						media.setmScfr(multiRequest.getParameter("mScfr_" + i));
						media.setmCfdd(multiRequest.getParameter("mCfdd_" + i));
						media.setmSc(Long.parseLong(multiRequest.getParameter("mSc_" + i)));
						media.setmZtjl(multiRequest.getParameter("mZtjl_" + i));
						media.setmPath(path);
						mediaService.update(media);
					}
					result.append(",").append(mYspm);
				}
			}
			map.put("success", true);
			map.put("result", result.deleteCharAt(0).toString());
		} catch (Exception e) {
			map.put("success", false);
			map.put("result", e.getLocalizedMessage());
			throw new AjaxException(e);
		}
		return map;
	}
	
	@RequestMapping("mediauploadUI.html")
	public String mediauploadUI() {
		return Common.BACKGROUND_PATH + "/teaching/mediaupload";
	}

	@RequestMapping("mediaupload.html")
	@ResponseBody
	public Object mediaupload(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		StringBuilder result = new StringBuilder();
		try {
			CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
					request.getSession().getServletContext());
			if (multipartResolver.isMultipart(request)) {
				MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
				int count = Integer.parseInt(request.getParameter("count"));
				if (count <= 0)
					throw new Exception("无上传文件");
				for (int i = 1; i <= count; i++) {
					MultipartFile file = multiRequest.getFile("file_" + i);
					GridFSFile inputFile = gridFsTemplate.store(file.getInputStream(), file.getOriginalFilename());
					String path = inputFile.getId().toString();
					String mYspm = multiRequest.getParameter("mYspm_" + i);
					MediaEntity media = mediaService.findByYspm(mYspm);
					if (media == null) {
						media = new MediaEntity();
						media.setmLx(Integer.parseInt(multiRequest.getParameter("mLx_" + i)));
						media.setmYspm(multiRequest.getParameter("mYspm_" + i));
						String mJlsj = multiRequest.getParameter("mJlsj_" + i);
						media.setmJlsj(LocalDate.parse(mJlsj, DateTimeFormat.forPattern("yyyy-MM-dd")).toDate());
						media.setmJlr(multiRequest.getParameter("mJlr_" + i));
						media.setmScfr(multiRequest.getParameter("mScfr_" + i));
						media.setmCfdd(multiRequest.getParameter("mCfdd_" + i));
						media.setmSc(Long.parseLong(multiRequest.getParameter("mSc_" + i)));
						media.setmZtjl(multiRequest.getParameter("mZtjl_" + i));
						media.setmPath(path);
						mediaService.insert(media);
					} else {
						media.setmLx(Integer.parseInt(multiRequest.getParameter("mLx_" + i)));
						String mJlsj = multiRequest.getParameter("mJlsj_" + i);
						media.setmJlsj(LocalDate.parse(mJlsj, DateTimeFormat.forPattern("yyyy-MM-dd")).toDate());
						media.setmJlr(multiRequest.getParameter("mJlr_" + i));
						media.setmScfr(multiRequest.getParameter("mScfr_" + i));
						media.setmCfdd(multiRequest.getParameter("mCfdd_" + i));
						media.setmSc(Long.parseLong(multiRequest.getParameter("mSc_" + i)));
						media.setmZtjl(multiRequest.getParameter("mZtjl_" + i));
						media.setmPath(path);
						mediaService.update(media);
					}
					result.append(",").append(mYspm);
				}
			}
			map.put("success", true);
			map.put("result", result.deleteCharAt(0).toString());
		} catch (Exception e) {
			map.put("success", false);
			map.put("result", e.getLocalizedMessage());
			throw new AjaxException(e);
		}
		return map;
	}

	@RequestMapping("editUI.html")
	public String editUI(Model model, HttpServletRequest request, Long id) {
		try {
			TeachingVideoEntity teachingVideoEntity = teachingVideoService.findById(id);
			PageUtil page = new PageUtil();
			if (request.getParameter("page") != null && request.getParameter("page").trim().equals("")) {
				page.setPageNum(Integer.valueOf(request.getParameter("page")));
				page.setPageSize(Integer.valueOf(request.getParameter("rows")));
				page.setOrderByColumn(request.getParameter("sidx"));
				page.setOrderByType(request.getParameter("sord"));
			}
			List<TeachingVideoEntity> teachingVideoList = teachingVideoService.queryListByPage(null);
			model.addAttribute("teachingVideoList", teachingVideoList);
			model.addAttribute("page", page);
			model.addAttribute("teachingVideoEntity", teachingVideoEntity);
			return Common.BACKGROUND_PATH + "/teaching/form";
		} catch (Exception e) {
			throw new AjaxException(e);
		}
	}

	@RequestMapping("edit.html")
	@ResponseBody
	public Object update(TeachingVideoEntity teachingVideoEntity) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean result = teachingVideoService.updateById(teachingVideoEntity);
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

	@RequestMapping("deleteBatch.html")
	@ResponseBody
	public Object deleteBatch(String ids) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String[] dataIds = ids.split(",");
			List<Long> list = new ArrayList<Long>();
			for (String string : dataIds) {
				list.add(Long.valueOf(string));
			}
			boolean cnt = teachingVideoService.deleteBatchById(list);
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

	@RequestMapping("detailUI.html")
	public String detailUI(Model model, HttpServletRequest request) {
		try {
			if (request.getParameter("id") != null && !request.getParameter("id").trim().equals("")) {
				long id = Long.parseLong(request.getParameter("id"));
				TeachingVideoEntity teachingVideoEntity = teachingVideoService.findById(id);
				model.addAttribute("teachingVideoEntity", teachingVideoEntity);
				request.getSession().setAttribute("detailsId",id);
			}
			return Common.BACKGROUND_PATH + "/teaching/detail";
		} catch (Exception e) {
			throw new SystemException(e);
		}
	}
}
