package com.imu.mzgymszy.smriti.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.imu.mzgymszy.smriti.mapper.CcrMapper;
import com.imu.mzgymszy.smriti.model.CcrEntity;
import com.imu.mzgymszy.smriti.service.CcrService;

@Service("ccrService")
public class CcrServiceImpl extends ServiceImpl<CcrMapper, CcrEntity> implements CcrService {

	@Override
	public CcrEntity findByXmLxfs(String cXm, String cLxfs) {
		EntityWrapper<CcrEntity> wrapper = new EntityWrapper<CcrEntity>();
		wrapper.eq("c_xm", cXm).eq("c_lxfs", cLxfs);
		return this.selectOne(wrapper);
	}

	@Override
	public List<CcrEntity> queryListByPage(Map<String, Object> parameters) {
        EntityWrapper<CcrEntity> wrapper = new EntityWrapper<CcrEntity>();
        return this.selectList(wrapper);
	}

	@Override
	public CcrEntity findById(Long id) {
		return this.selectById(id);
	}

	@Override
	public boolean updateById(CcrEntity ccrEntity) {
		EntityWrapper<CcrEntity> wrapper = new EntityWrapper<CcrEntity>();
		wrapper.eq("c_id", ccrEntity.getId());
		return this.update(ccrEntity, wrapper);
	}

	@Override
	public boolean deleteBatchById(List<Long> list) {
		return	this.deleteBatchIds(list);
	}

}
