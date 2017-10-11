package com.imu.mzgymszy.roleresource.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imu.mzgymszy.exception.ServiceException;
import com.imu.mzgymszy.resource.model.ResourceEntity;
import com.imu.mzgymszy.resource.service.ResourceService;
import com.imu.mzgymszy.role.model.RoleEntity;
import com.imu.mzgymszy.role.service.RoleService;
import com.imu.mzgymszy.roleresource.service.RoleResourceService;

@Service("roleResourceService")
public class RoleResourceServiceImpl implements RoleResourceService{

	@Autowired
	private RoleService roleService;
	
	@Autowired
	private ResourceService resourceService;
	
	@Override
	public boolean insertRoleAndResource(ResourceEntity resourceEntity) {
		try
		{
			//1、添加资源
			resourceService.insert(resourceEntity);
			//2、超级管理员直接赋予该权限
			RoleEntity role = roleService.findByName("高级管理员");
			roleService.addRolePerm(role.getId(), resourceEntity.getId());
			return true;
		}catch(Exception e)
		{
			throw new ServiceException(e);
		}
	}

}
