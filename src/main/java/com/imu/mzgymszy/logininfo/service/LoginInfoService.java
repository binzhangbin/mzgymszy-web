package com.imu.mzgymszy.logininfo.service;

import java.util.List;
import java.util.Map;

import com.imu.mzgymszy.logininfo.model.LoginInfoEntity;

public interface LoginInfoService {

	public int log(LoginInfoEntity loginInfo);
	
	public List<LoginInfoEntity> queryListByPage(Map<String, Object> parameter);
}
