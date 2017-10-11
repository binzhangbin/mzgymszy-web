package com.imu.mzgymszy.smriti.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.imu.mzgymszy.smriti.mapper.QyGzsMapper;
import com.imu.mzgymszy.smriti.model.QyGzsEntity;
import com.imu.mzgymszy.smriti.service.QyGzsService;

@Service("qyGzsService")
public class QyGzsServiceImpl extends ServiceImpl<QyGzsMapper, QyGzsEntity> implements QyGzsService {

	@Override
	public QyGzsEntity findByMcBgdh(String qyGzsMc, String qyGzsBgdh) {

		EntityWrapper<QyGzsEntity> wrapper = new EntityWrapper<QyGzsEntity>();
		wrapper.eq("qy_gzs_mc", qyGzsMc).eq("qy_gzs_bgdh", qyGzsBgdh);
 
		return this.selectOne(wrapper);
	}

	@Override
	public List<QyGzsEntity> queryListByPage(Map<String, Object> parameters) {

		EntityWrapper<QyGzsEntity> wrapper = new EntityWrapper<QyGzsEntity>();

		return this.selectList(wrapper);
	}

	@Override
	public QyGzsEntity findById(Long qyGzsId) {

		return this.selectById(qyGzsId);
	}

	@Override
	public boolean updateById(QyGzsEntity qyGzsEntity) {

		EntityWrapper<QyGzsEntity> wrapper = new EntityWrapper<QyGzsEntity>();
		wrapper.eq("qy_gzs_id", qyGzsEntity.getId());

		return this.update(qyGzsEntity, wrapper);
	}

	@Override
	public boolean deleteBatchById(List<Long> list) {

		return this.deleteBatchIds(list);
	}

}
