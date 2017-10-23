package com.imu.mzgymszy.teaching.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.imu.mzgymszy.teaching.mapper.TeachingVideoMapper;
import com.imu.mzgymszy.teaching.model.TeachingVideoEntity;
import com.imu.mzgymszy.teaching.service.TeachingVideoService;

@Service("teachingVideoService")
public class TeachingVideoServiceImpl extends ServiceImpl<TeachingVideoMapper, TeachingVideoEntity>
		implements TeachingVideoService {

	@Override
	public TeachingVideoEntity findByXmLxdh(String jxJsxm, String jxLxdh) {
		EntityWrapper<TeachingVideoEntity> wrapper = new EntityWrapper<TeachingVideoEntity>();
		wrapper.eq("jx_jsxm", jxJsxm).eq("jx_lxdh", jxLxdh);
		return this.selectOne(wrapper);
	}

	@Override
	public List<TeachingVideoEntity> queryListByPage(Map<String, Object> parameters) {
		EntityWrapper<TeachingVideoEntity> wrapper = new EntityWrapper<TeachingVideoEntity>();
		return this.selectList(wrapper);
	}

	@Override
	public TeachingVideoEntity findById(Long id) {
		return this.selectById(id);
	}
	
	@Override
	public boolean updateById(TeachingVideoEntity teachingVideoEntity) {
		EntityWrapper<TeachingVideoEntity> wrapper = new EntityWrapper<TeachingVideoEntity>();
		wrapper.eq("jx_id", teachingVideoEntity.getId());
		return this.update(teachingVideoEntity, wrapper);
	}
	
	@Override
	public boolean deleteBatchById(List<Long> list) {
		return	this.deleteBatchIds(list);
	}

	
}
