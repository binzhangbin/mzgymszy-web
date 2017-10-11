package com.imu.mzgymszy.originaldata.model;

import com.imu.mzgymszy.base.basemodel.BaseEntity;

/** 
* @ClassName: PictureEntity 
* @Description: 图片模型
* @author tianhao 
* @date 2016年11月9日 下午3:05:24 
*  
*/
public class PictureEntity extends BaseEntity{

	private static final long serialVersionUID = 1L;

	/** 
	* @Fields pTp : 图片编码
	*/ 
	private String pTp;

    /** 
    * @Fields pPath : 图片路径
    */ 
    private String pPath;

    /** 
    * @Fields pCc : 图片描述物体尺寸
    */ 
    private String pCc;

    /** 
    * @Fields pTt : 图题
    */ 
    private String pTt;
    
    /** 
    * @Fields pColumn : 目的字段 
    */ 
    private String pColumn;

    public String getpTp() {
		return pTp;
	}

	public void setpTp(String pTp) {
		this.pTp = pTp;
	}

	public String getpPath() {
        return pPath;
    }

    public void setpPath(String pPath) {
        this.pPath = pPath == null ? null : pPath.trim();
    }

    public String getpCc() {
        return pCc;
    }

    public void setpCc(String pCc) {
        this.pCc = pCc == null ? null : pCc.trim();
    }

    public String getpTt() {
        return pTt;
    }

    public void setpTt(String pTt) {
        this.pTt = pTt == null ? null : pTt.trim();
    }

	public String getpColumn() {
		return pColumn;
	}

	public void setpColumn(String pColumn) {
		this.pColumn = pColumn;
	}
    
}