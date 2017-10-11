package com.imu.mzgymszy.loginfo.service;

import java.util.List;
import java.util.Map;

import com.imu.mzgymszy.loginfo.model.LogInfoEntity;

public interface LogInfoService {

	public int log(LogInfoEntity logInfo);
	
	public List<LogInfoEntity> queryListByPage(Map<String, Object> parameter);
}
