package com.imu.mzgymszy.foldertree.model;

import java.util.Date;
import org.apache.ibatis.type.Alias;
import com.imu.mzgymszy.base.basemodel.BaseEntity;

/** 
* @ClassName: FoldEntity 
* @Description: 对应数据库中的TB_FOLD	的实体类 
* @author tianhao 
* @date 2016年10月25日 下午3:55:26 
*  
*/
@Alias("foldEntity")
public class FoldEntity extends BaseEntity{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** 
	* @Fields parentId : 父目录的id 
	*/ 
	private long parentId;
	/** 
	* @Fields name : 目录名 
	*/ 
	private String name;
	/** 
	* @Fields fullPath : 目录的完整路径 
	*/ 
	private String fullPath;
	/** 
	* @Fields depth : 当前目录深度 
	*/ 
	private int depth;
	/** 
	* @Fields delFlag : 删除标记，1表示已删除 
	*/ 
	private int delFlag;
	/** 
	* @Fields createTime : 目录创建时间 
	*/ 
	private Date createTime;
	/** 
	* @Fields updateTime : 目录更新时间
	*/ 
	private Date updateTime;
	/** 
	* @Fields isLeaf : 是否为叶子节点 
	*/ 
	private boolean isLeaf;
	public long getParentId() {
		return parentId;
	}
	public void setParentId(long parentId) {
		this.parentId = parentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFullPath() {
		return fullPath;
	}
	public void setFullPath(String fullPath) {
		this.fullPath = fullPath;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(int delFlag) {
		this.delFlag = delFlag;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public boolean isLeaf() {
		return isLeaf;
	}
	public void setLeaf(int isLeaf) {
		this.isLeaf = (isLeaf==1);
	}
}
