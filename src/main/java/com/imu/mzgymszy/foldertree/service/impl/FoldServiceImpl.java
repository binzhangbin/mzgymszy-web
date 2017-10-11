package com.imu.mzgymszy.foldertree.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.imu.mzgymszy.base.baseservice.impl.AbstractService;
import com.imu.mzgymszy.foldertree.mapper.FoldMapper;
import com.imu.mzgymszy.foldertree.model.FoldEntity;
import com.imu.mzgymszy.foldertree.service.FoldService;

@Service("foldService")
public class FoldServiceImpl extends AbstractService<FoldEntity, Long>
		implements FoldService {

	@Autowired
	private FoldMapper foldMapper;

	// 这句必须要加上。不然会报空指针异常，因为在实际调用的时候不是BaseMapper调用，而是具体的mapper，这里为userMapper
	@Autowired
	public void setBaseMapper() {
		super.setBaseMapper(foldMapper);
	}

	@Override
	public List<FoldEntity> findRootFold() {
		return foldMapper.findRootFold();
	}

	@Override
	public List<FoldEntity> findSubFold(long parentId) {
		return foldMapper.findSubFold(parentId);
	}

}
