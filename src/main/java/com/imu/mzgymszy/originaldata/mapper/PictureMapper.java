package com.imu.mzgymszy.originaldata.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.imu.mzgymszy.base.basemapper.BaseMapper;
import com.imu.mzgymszy.originaldata.model.PictureEntity;

@Repository
public interface PictureMapper extends BaseMapper<PictureEntity, Long>{
	public PictureEntity findByTp(@Param(value="pTp") String pTp);
}
