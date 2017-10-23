package com.imu.mzgymszy.teaching.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.imu.mzgymszy.teaching.model.TeachingVideoEntity;

public interface TeachingVideoService  extends IService<TeachingVideoEntity> {

	public TeachingVideoEntity findByXmLxdh(String jxJsxm,String jxLxdh);
	public List<TeachingVideoEntity> queryListByPage(Map<String, Object> parameters);
	public boolean insert(TeachingVideoEntity teachingVideoEntity);
	public TeachingVideoEntity findById(Long id);
	public boolean updateById(TeachingVideoEntity teachingVideoEntity);
	public boolean deleteBatchById(List<Long> list);
}
