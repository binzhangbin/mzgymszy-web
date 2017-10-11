package com.imu.mzgymszy.smriti.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.imu.mzgymszy.smriti.model.QyGzsEntity;

public interface QyGzsService extends IService<QyGzsEntity> {

	// 通过企业或工作室的名称和办公电话查找
	public QyGzsEntity findByMcBgdh(String qyGzsMc, String qyGzsBgdh);

	public List<QyGzsEntity> queryListByPage(Map<String, Object> parameters);

	public boolean insert(QyGzsEntity qyGzsEntity);

	public QyGzsEntity findById(Long qyGzsId);

	public boolean updateById(QyGzsEntity qyGzsEntity);

	public boolean deleteBatchById(List<Long> list);

}
