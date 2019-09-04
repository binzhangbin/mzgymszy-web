package com.imu.mzgymszy.originaldata.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.gridfs.GridFsTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.imu.mzgymszy.originaldata.model.MediaEntity;
import com.imu.mzgymszy.originaldata.model.PictureEntity;
import com.imu.mzgymszy.originaldata.service.MediaService;
import com.imu.mzgymszy.originaldata.service.PictureService;
import com.mongodb.gridfs.GridFSDBFile;

/** 
* @ClassName: MediaController 
* @Description: 处理位于gridFs的多媒体文件请求 
* @author tianhao 
* @date 2016年12月2日 下午3:41:40 
*  
*/
@Controller  
@RequestMapping(value = "/media")  
public class MediaController {  
	@Autowired
	private PictureService pictureService;
	@Autowired
	private MediaService mediaService;
	@Autowired
	private GridFsTemplate gridFsTemplate;
	
    @RequestMapping(value = "/showPicture.html")  
    public void showPicture(HttpServletRequest request, HttpServletResponse response){  
        try {
        	if(request.getParameter("pTp")==null||request.getParameter("pTp").trim().equals(""))
        		return;
            String pTp = request.getParameter("pTp");
            PictureEntity picture = pictureService.findByTp(pTp);
            if(picture==null)
            	return;
            GridFSDBFile gridFsdbFile = gridFsTemplate.findOne(new Query(Criteria.where("_id").is(picture.getpPath())));  
            if(gridFsdbFile==null)
            	return;
            String reg = ".+(.JPEG|.jpeg|.JPG|.jpg|.GIF|.gif|.BMP|.bmp|.PNG|.png)$";
            Pattern pattern = Pattern.compile(reg);
            Matcher matcher = pattern.matcher(gridFsdbFile.getFilename());
            if(!matcher.matches())
            	return;
            OutputStream out = response.getOutputStream();
            gridFsdbFile.writeTo(out);  
            out.flush();  
            out.close();  
        } catch (Exception e) {  
        	try {
				response.getOutputStream().close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
        }  
    }
    
    @RequestMapping(value = "/showPictureById.html")  
    public void showPictureById(HttpServletRequest request, HttpServletResponse response){  
        try {
        	if(request.getParameter("id")==null||request.getParameter("id").trim().equals(""))
        		return;
            String id = request.getParameter("id");
            GridFSDBFile gridFsdbFile = gridFsTemplate.findOne(new Query(Criteria.where("_id").is(id)));  
            if(gridFsdbFile==null)
            	return;
            String reg = ".+(.JPEG|.jpeg|.JPG|.jpg|.GIF|.gif|.BMP|.bmp|.PNG|.png)$";
            Pattern pattern = Pattern.compile(reg);
            Matcher matcher = pattern.matcher(gridFsdbFile.getFilename());
            if(!matcher.matches())
            	return;
            OutputStream out = response.getOutputStream();
            gridFsdbFile.writeTo(out);  
            out.flush();  
            out.close();  
        } catch (Exception e) {  
        	try {
				response.getOutputStream().close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
        }  
    }
    
    @RequestMapping(value = "/showThumbnail.html")  
    public void showThumbnail(HttpServletRequest request, HttpServletResponse response){  
        try {
        	if(request.getParameter("pTp")==null||request.getParameter("pTp").trim().equals(""))
        		return;
            String pTp = request.getParameter("pTp");
            PictureEntity picture = pictureService.findByTp(pTp);
            if(picture==null)
            	return;
            GridFSDBFile gridFsdbFile = gridFsTemplate.findOne(new Query(Criteria.where("filename").is("thumbnail-"+picture.getpPath())));  
            if(gridFsdbFile==null)
            	return;
            OutputStream out = response.getOutputStream();
            gridFsdbFile.writeTo(out);
            out.flush();  
            out.close();  
        } catch (Exception e) {  
        	try {
				response.getOutputStream().close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
        }  
    }
    
    @RequestMapping(value = "/showMedia.html")  
    public void showMedia(HttpServletRequest request, HttpServletResponse response){  
        try {
        	if(request.getParameter("mYspm")==null||request.getParameter("mYspm").trim().equals(""))
        		return;
            String mYspm = request.getParameter("mYspm");
            MediaEntity media = mediaService.findByYspm(mYspm);
            if(media==null)
            	return;
            GridFSDBFile gridFsdbFile = gridFsTemplate.findOne(new Query(Criteria.where("_id").is(media.getmPath())));  
            if(gridFsdbFile==null)
            	return;
            response.setContentLength((int)gridFsdbFile.getLength());
            response.setContentType("application/octet-stream");
            OutputStream out = response.getOutputStream();
            gridFsdbFile.writeTo(out);
            out.flush();  
            out.close();
        } catch (Exception e) {  
        	try {
				response.getOutputStream().close();
			} catch (IOException e1) {
				e1.printStackTrace();
			} 
        }
    }
    
    @RequestMapping(value = "/download.html")    
    public void download(HttpServletRequest request, HttpServletResponse response) throws IOException {    
    	if(request.getParameter("pTp")==null||request.getParameter("pTp").trim().equals(""))
    		return;
    	String pTp = request.getParameter("pTp");
        PictureEntity picture = pictureService.findByTp(pTp);
        if(picture==null)
        	return;
    	GridFSDBFile gridFsdbFile = gridFsTemplate.findOne(new Query(Criteria.where("_id").is(picture.getpPath())));
    	if(gridFsdbFile==null)
        	return;
    	File file=new File(System.getProperty("java.io.tmpdir")+"/"+gridFsdbFile.getFilename());
    	FileOutputStream fos = new FileOutputStream(file);
        gridFsdbFile.writeTo(fos);
        fos.close();
        try(OutputStream os = response.getOutputStream()) {
            if (file.exists()) {   
            	String dfileName = file.getName();   
               	InputStream fis = new BufferedInputStream(new FileInputStream(file));   
                response.reset();
                response.setContentType("application/x-download");
                response.addHeader("Content-Disposition","attachment;filename="+ new String(dfileName.getBytes(),"iso-8859-1"));
                response.addHeader("Content-Length", "" + file.length());   
                OutputStream toClient = new BufferedOutputStream(os);   
               	response.setContentType("application/octet-stream");   
                byte[] buffer = new byte[1024 * 1024 * 4];   
                int i = -1;   
                while ((i = fis.read(buffer)) != -1) {   
                    toClient.write(buffer, 0, i);  
                    
                }   
                fis.close();   
                toClient.flush();   
                toClient.close();   
            } else {   
               PrintWriter out = response.getWriter();   
               out.print("<script>");   
               out.print("alert(\"not find the file\")");   
               out.print("</script>");   
            }   
        } catch (IOException ex) {   
        	   PrintWriter out = response.getWriter();   
               out.print("<script>");   
               out.print("alert(\"not find the file\")");   
               out.print("</script>");   
        } 
    }
}  
