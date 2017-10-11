package com.imu.mzgymszy.originaldata.service;

import com.imu.mzgymszy.base.baseservice.BaseService;
import com.imu.mzgymszy.originaldata.model.PictureEntity;

public interface PictureService extends BaseService<PictureEntity, Long>{
	public PictureEntity findByTp(String pTp);
}
