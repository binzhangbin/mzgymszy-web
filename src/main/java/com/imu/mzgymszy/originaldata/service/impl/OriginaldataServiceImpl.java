package com.imu.mzgymszy.originaldata.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.imu.mzgymszy.base.baseservice.impl.AbstractService;
import com.imu.mzgymszy.originaldata.mapper.OriginaldataMapper;
import com.imu.mzgymszy.originaldata.model.OriginaldataEntity;
import com.imu.mzgymszy.originaldata.service.OriginaldataService;

@Service("originaldataService")
public class OriginaldataServiceImpl extends AbstractService<OriginaldataEntity, Long>
		implements OriginaldataService {

	@Autowired
	private OriginaldataMapper originaldataMapper;

	// 这句必须要加上。不然会报空指针异常，因为在实际调用的时候不是BaseMapper调用，而是具体的mapper，这里为userMapper
	@Autowired
	public void setBaseMapper() {
		super.setBaseMapper(originaldataMapper);
	}
	
}
