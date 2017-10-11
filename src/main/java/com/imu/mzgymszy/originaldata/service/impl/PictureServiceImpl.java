package com.imu.mzgymszy.originaldata.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.imu.mzgymszy.base.baseservice.impl.AbstractService;
import com.imu.mzgymszy.originaldata.mapper.PictureMapper;
import com.imu.mzgymszy.originaldata.model.PictureEntity;
import com.imu.mzgymszy.originaldata.service.PictureService;

@Service("pictureService")
public class PictureServiceImpl extends AbstractService<PictureEntity, Long>
		implements PictureService {

	@Autowired
	private PictureMapper pictureMapper;

	// 这句必须要加上。不然会报空指针异常，因为在实际调用的时候不是BaseMapper调用，而是具体的mapper，这里为userMapper
	@Autowired
	public void setBaseMapper() {
		super.setBaseMapper(pictureMapper);
	}

	@Override
	public PictureEntity findByTp(String pTp) {
		return pictureMapper.findByTp(pTp);
	}

}
