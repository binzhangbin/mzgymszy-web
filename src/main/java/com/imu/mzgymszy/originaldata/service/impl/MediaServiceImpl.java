package com.imu.mzgymszy.originaldata.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.imu.mzgymszy.base.baseservice.impl.AbstractService;
import com.imu.mzgymszy.originaldata.mapper.MediaMapper;
import com.imu.mzgymszy.originaldata.model.MediaEntity;
import com.imu.mzgymszy.originaldata.service.MediaService;

@Service("mediaService")
public class MediaServiceImpl extends AbstractService<MediaEntity, Long>
		implements MediaService {

	@Autowired
	private MediaMapper mediaMapper;

	// 这句必须要加上。不然会报空指针异常，因为在实际调用的时候不是BaseMapper调用，而是具体的mapper，这里为userMapper
	@Autowired
	public void setBaseMapper() {
		super.setBaseMapper(mediaMapper);
	}

	@Override
	public MediaEntity findByYspm(String mYspm) {
		return mediaMapper.findByYspm(mYspm);
	}

}
