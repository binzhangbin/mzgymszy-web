package com.imu.mzgymszy.Batch;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.Arrays;
import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.imu.mzgymszy.role.model.RoleEntity;
import com.imu.mzgymszy.user.model.UserEntity;
import com.imu.mzgymszy.user.model.UserInfoEntity;
import com.imu.mzgymszy.user.service.UserService;
import com.imu.mzgymszy.util.EndecryptUtils;

/**
 * @author jxj
 * @date 2018年5月27日上午10:30:31
 */
public class AddUser {

	public static void main(String[] args) throws IOException {
		batchAddUser();
		// addUser();
		// findUserById();
	}

	/**
	 * 批量添加用户——非遗传承人
	 * 
	 * @throws IOException
	 */
	private static void batchAddUser() throws IOException {

		@SuppressWarnings("resource")
		ApplicationContext ctx = new FileSystemXmlApplicationContext(
				"/src/main/resources/spring/spring-applicationContext.xml");

		UserService userService = (UserService) ctx.getBean("userService");

		// 对应批量上传的名单文件
//		File filesDetial = new File("E:\\民族工艺美术资源\\201806013\\非遗传承人名单.txt");
//		File filesDetial = new File("E:\\民族工艺美术资源\\201806013\\设计师名单.txt");
		File filesDetial = new File("E:\\民族工艺美术资源\\201806013\\设计师名单2.txt");

		// 读取文件
		InputStreamReader reader = new InputStreamReader(new FileInputStream(filesDetial));
		BufferedReader br = new BufferedReader(reader);
		// 用于读取txt文本中的行
		String line = br.readLine();
		while (line != null) {
			line = br.readLine();
			if (line.equals(null))
				break;
			String[] s = line.split(",");
			// 将数组s输出
			System.out.println(Arrays.toString(s));

			// 加密用户输入的密码，得到密码和加密盐，保存到数据库
			// EndecryptUtils.md5Password方法中有setPassword、setCredentialsSalt、setUserName
			UserEntity user = EndecryptUtils.md5Password(s[5], s[6], 2);

			UserEntity userEntity = new UserEntity();

			userEntity.setUserName(s[1]);
			userEntity.setAccountName(s[5]);
			// 设置添加用户的密码和加密盐
			userEntity.setPassword(user.getPassword());
			userEntity.setDeleteStatus(0);
			// 设置锁定状态：未锁定；删除状态：未删除
			userEntity.setLocked(0);
			// 用户描述
//			userEntity.setDescription("非遗传承人");
			userEntity.setDescription("设计师2");
			// 加密盐
			userEntity.setCredentialsSalt(user.getCredentialsSalt());
			// 设置创建者姓名
			userEntity.setCreatorName("superadmin@imu.com");
			userEntity.setCreateTime(new Date(System.currentTimeMillis()));

			RoleEntity role = new RoleEntity();
			// 此处的 ID 由数据库获取，对应相应的“非遗传承人名单”,由表“tb_role”查
//			role.setId(5l);
			role.setId(6l);
//			role.setName("非遗传承人");
			role.setName("设计师2");
//			role.setKey("非遗传承人");
			role.setKey("设计师2");
			role.setStatus(0);
//			role.setDescription("非遗传承人");
			role.setDescription("设计师2");
			role.setCreateTime(new Date(System.currentTimeMillis()));
			userEntity.setRole(role);

			UserInfoEntity userInfo = new UserInfoEntity();
			userInfo.setTelephone(s[2]);
			userInfo.setEmail(s[5]);
			userInfo.setAddress(s[3]);
			userInfo.setCreateTime(new Date(System.currentTimeMillis()));
			userEntity.setUserInfo(userInfo);

			userService.insert(userEntity, user.getPassword());
			 System.out.println(userEntity.toString());
		}

		System.err.println("上传完成");

	}

	/**
	 * 测试单独添加一个用户
	 */
	private static void addUser() {

		String[] s = { "2", "阿友西", "15849852167", "152825197311154224", "ayx", "ayx@163.com", "154224" };

		@SuppressWarnings("resource")
		ApplicationContext ctx = new FileSystemXmlApplicationContext(
				"/src/main/resources/spring/spring-applicationContext.xml");

		UserService userService = (UserService) ctx.getBean("userService");

		// 加密用户输入的密码，得到密码和加密盐，保存到数据库
		// EndecryptUtils.md5Password方法中有setPassword、setCredentialsSalt、setUserName
		UserEntity user = EndecryptUtils.md5Password(s[5], s[6], 2);

		UserEntity userEntity = new UserEntity();

		userEntity.setUserName(s[1]);
		userEntity.setAccountName(s[5]);
		// 设置添加用户的密码和加密盐
		userEntity.setPassword(user.getPassword());
		userEntity.setDeleteStatus(0);
		// 设置锁定状态：未锁定；删除状态：未删除
		userEntity.setLocked(0);
		// 用户描述
		userEntity.setDescription("非遗传承人名单");
		// 加密盐
		userEntity.setCredentialsSalt(user.getCredentialsSalt());
		// 设置创建者姓名
		userEntity.setCreatorName("superadmin@imu.com");
		userEntity.setCreateTime(new Date(System.currentTimeMillis()));

		RoleEntity role = new RoleEntity();
		role.setId(7l);
		role.setName("非遗传承人");
		role.setKey("非遗传承人");
		role.setStatus(0);
		role.setDescription("非遗传承人");
		role.setCreateTime(new Date(System.currentTimeMillis()));
		userEntity.setRole(role);

		UserInfoEntity userInfo = new UserInfoEntity();
		userInfo.setTelephone(s[2]);
		userInfo.setEmail(s[5]);
		userInfo.setAddress(s[3]);
		userInfo.setCreateTime(new Date(System.currentTimeMillis()));
		userEntity.setUserInfo(userInfo);

		userService.insert(userEntity, user.getPassword());

		System.out.println(userEntity.toString());
	}

	/**
	 * 测试从数据库获得一个用户
	 */
	private static void findUserById() {
		@SuppressWarnings("resource")
		ApplicationContext ctx = new FileSystemXmlApplicationContext(
				"/src/main/resources/spring/spring-applicationContext.xml");

		UserService userService = (UserService) ctx.getBean("userService");

		UserEntity user = userService.findById(34l);
		System.out.println(user.toString());
	}
}
