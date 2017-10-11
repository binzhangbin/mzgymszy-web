package com.imu.mzgymszy.originaldata.service;

import com.imu.mzgymszy.base.baseservice.BaseService;
import com.imu.mzgymszy.originaldata.model.MediaEntity;

public interface MediaService extends BaseService<MediaEntity, Long>{
	public MediaEntity findByYspm(String mYspm);
}
