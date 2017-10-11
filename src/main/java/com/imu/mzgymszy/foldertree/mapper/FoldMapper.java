package com.imu.mzgymszy.foldertree.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.imu.mzgymszy.base.basemapper.BaseMapper;
import com.imu.mzgymszy.foldertree.model.FoldEntity;

@Repository
public interface FoldMapper extends BaseMapper<FoldEntity, Long>{
	
	public List<FoldEntity> findRootFold();
	
	public List<FoldEntity> findSubFold(@Param(value="parentId") long parentId);
}
