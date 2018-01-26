package com.imu.mzgymszy.Batch;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.data.mongodb.gridfs.GridFsTemplate;

import com.imu.mzgymszy.originaldata.model.MediaEntity;
import com.imu.mzgymszy.originaldata.model.PictureEntity;
import com.imu.mzgymszy.originaldata.service.MediaService;
import com.imu.mzgymszy.originaldata.service.PictureService;
import com.mongodb.gridfs.GridFSFile;

import net.coobird.thumbnailator.Thumbnails;

public class App {

	public static void main(String[] args) {
		batchUploadMedia();
	}

	/**
	 * 视频批量上传
	 */
	private static void batchUploadMedia() {

		@SuppressWarnings("resource")
		ApplicationContext ctx = new FileSystemXmlApplicationContext(
				"/src/main/resources/spring/spring-applicationContext.xml");
		GridFsTemplate gridFsTemplate = (GridFsTemplate) ctx.getBean("gridFsTemplate");
		MediaService mediaService = (MediaService) ctx.getBean("mediaService");
		File files = new File("F:\\temp\\batchUploadMedia\\");// 定义要批量上传的路径
		// 对应批量上传图片的格式说明，txt文件中每行对应一个图片，每行中有：图片编码、图片尺寸、图题等内容
		File filesDetial = new File("F:\\temp\\batchUploadMedia.txt");
//		File outputFile = new File(files.getPath() + "\\output.txt");
		File outputFile = new File(files.getPath() + "\\..\\output.txt");

		try (OutputStreamWriter isw = new OutputStreamWriter(new FileOutputStream(outputFile), "UTF-8");
				InputStreamReader reader = new InputStreamReader(new FileInputStream(filesDetial));
				BufferedReader br = new BufferedReader(reader);
				BufferedWriter writer = new BufferedWriter(isw);) {
			// 用于读取txt文本中的行
			String line = br.readLine();
			for (File temp : files.listFiles()) {
				if (temp.isFile()) {
					GridFSFile inputFile = gridFsTemplate.store(new FileInputStream(temp), temp.getName());
					// 对应tb_picture表中的P_PATH
					String id = inputFile.getId().toString();

					MediaEntity media = new MediaEntity();
					line = br.readLine();
					String[] s = line.split(",");
					media.setmLx(Integer.parseInt(s[0]));// 类型：1-视频,2-音频
					media.setmYspm(s[1]);// 音视频编码
					media.setmJlsj(LocalDate.parse(s[2], DateTimeFormat.forPattern("yyyy-MM-dd")).toDate());// 记录时间
					media.setmJlr(s[3]);// 记录人
					media.setmScfr(s[4]);// 采访人 or 主讲人
					media.setmCfdd(s[5]);// 采访地点 or 教学地点
					media.setmSc(Long.parseLong(s[6]));// 时长：秒，整数
					media.setmZtjl(s[7]);
					media.setmPath(id);
					mediaService.insert(media);
					
					StringBuilder result = new StringBuilder();
					result.append(temp.getName()).append(",").append(id).append(",")
							.append("thumbnail-" + inputFile.getId());
					System.out.println(result.toString());
					writer.write(result.toString());
					writer.flush();
					writer.newLine();
				}
			}
			System.err.println("上传完成");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 图片批量上传
	 */
	private static void batchUploadPicture() {
		@SuppressWarnings("resource")
		ApplicationContext ctx = new FileSystemXmlApplicationContext(
				"/src/main/resources/spring/spring-applicationContext.xml");
		GridFsTemplate gridFsTemplate = (GridFsTemplate) ctx.getBean("gridFsTemplate");
		PictureService pictureService = (PictureService) ctx.getBean("pictureService");
		File files = new File("F:\\pic\\");// 定义要批量上传的路径
		// 对应批量上传图片的格式说明，txt文件中每行对应一个图片，每行中有：图片编码、图片尺寸、图题等内容
		File filesDetial = new File("F:\\temp\\name.txt");
		File outputFile = new File(files.getPath() + "\\..\\output.txt");
		try (OutputStreamWriter isw = new OutputStreamWriter(new FileOutputStream(outputFile), "UTF-8");
				InputStreamReader reader = new InputStreamReader(new FileInputStream(filesDetial));
				BufferedReader br = new BufferedReader(reader);
				BufferedWriter writer = new BufferedWriter(isw);) {
			// 用于读取txt文本中的行
			String line = "";
			line = br.readLine();
			for (File temp : files.listFiles()) {
				if (temp.isFile()) {
					GridFSFile inputFile = gridFsTemplate.store(new FileInputStream(temp), temp.getName());
					String reg = ".+(.JPEG|.jpeg|.JPG|.jpg|.GIF|.gif|.BMP|.bmp|.PNG|.png)$";
					Pattern pattern = Pattern.compile(reg);
					Matcher matcher = pattern.matcher(temp.getName());
					if (matcher.matches()) {// 如果是图片文件则进行缩略图处理
						Thumbnails.of(temp).forceSize(100, 100).toFile(temp);
						gridFsTemplate.store(new FileInputStream(temp), "thumbnail-" + inputFile.getId());
					}
					// 对应tb_picture表中的P_PATH
					String id = inputFile.getId().toString();
					PictureEntity picture = new PictureEntity();
					line = br.readLine();
					String[] s = line.split(",");
					picture.setpTp(s[0]);
					picture.setpPath(id);
					picture.setpCc(s[1]);
					picture.setpTt(s[2]);

					pictureService.insert(picture);
					System.out.println(picture.getpTt());

					StringBuilder result = new StringBuilder();
					result.append(picture.getpTp()).append(",").append(temp.getName()).append(",").append(id)
							.append(",").append("thumbnail-" + inputFile.getId());
					System.out.println(result.toString());
					writer.write(result.toString());
					writer.flush();
					writer.newLine();
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}

	}
}
