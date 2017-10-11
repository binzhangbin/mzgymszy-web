package com.imu.mzgymszy.roleresource.service;

import com.imu.mzgymszy.resource.model.ResourceEntity;

public interface RoleResourceService {

	/**
	 * 
	 * @Title: insertRoleAndResource
	 * @Description: 添加资源(权限)时同步给超级管理员赋予该权限
	 * @param resourceEntity	
	 * @return	boolean
	 * @throws
	 */
	public boolean insertRoleAndResource(ResourceEntity resourceEntity);
}
