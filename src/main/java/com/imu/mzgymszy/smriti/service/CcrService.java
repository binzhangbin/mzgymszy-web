package com.imu.mzgymszy.smriti.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.imu.mzgymszy.smriti.model.CcrEntity;

public interface CcrService extends IService<CcrEntity>{
	public CcrEntity findByXmLxfs(String cXm,String cLxfs);
	public List<CcrEntity> queryListByPage(Map<String, Object> parameters);
	public boolean insert(CcrEntity ccrEntity);
	public CcrEntity findById(Long id);
	public boolean updateById(CcrEntity ccrEntity);
	public boolean deleteBatchById(List<Long> list);
}
