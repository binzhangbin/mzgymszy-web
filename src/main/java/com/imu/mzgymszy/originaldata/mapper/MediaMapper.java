package com.imu.mzgymszy.originaldata.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.imu.mzgymszy.base.basemapper.BaseMapper;
import com.imu.mzgymszy.originaldata.model.MediaEntity;

@Repository
public interface MediaMapper extends BaseMapper<MediaEntity, Long>{
	public MediaEntity findByYspm(@Param(value="mYspm") String mYspm);
}
