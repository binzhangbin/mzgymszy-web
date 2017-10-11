package com.imu.mzgymszy.foldertree.service;

import java.util.List;
import com.imu.mzgymszy.base.baseservice.BaseService;
import com.imu.mzgymszy.foldertree.model.FoldEntity;

public interface FoldService extends BaseService<FoldEntity, Long>{

	public List<FoldEntity> findRootFold();

	public List<FoldEntity> findSubFold(long parentId);
}
