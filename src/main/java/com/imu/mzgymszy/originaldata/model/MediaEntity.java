package com.imu.mzgymszy.originaldata.model;

import java.util.Date;

import com.imu.mzgymszy.base.basemodel.BaseEntity;

/** 
* @ClassName: MediaEntity 
* @Description: 音频/视频等多媒体记录模型
* @author tianhao 
* @date 2016年11月9日 下午3:02:41 
*  
*/
public class MediaEntity extends BaseEntity{

	private static final long serialVersionUID = 1L;

	/** 
	* @Fields mLx : 多媒体类型
	*/ 
	private int mLx;

    /** 
    * @Fields mYspm : 编码
    */ 
    private String mYspm;

    /** 
    * @Fields mJlsj : 记录时间
    */ 
    private Date mJlsj;

    /** 
    * @Fields mJlr : 记录人
    */ 
    private String mJlr;

    /** 
    * @Fields mScfr : 采访人
    */ 
    private String mScfr;

    /** 
    * @Fields mCfdd : 采访地址
    */ 
    private String mCfdd;

    /** 
    * @Fields mSc : 时长（暂定单位为秒）
    */ 
    private Long mSc;

    /** 
    * @Fields mZtjl : 主题记录
    */ 
    private String mZtjl;
    
    /** 
    * @Fields mPath : 存储路径
    */ 
    private String mPath;
    
    /** 
    * @Fields mColumn : 目的字段
    */ 
    private String mColumn;

    public int getmLx() {
        return mLx;
    }

    public void setmLx(int mLx) {
        this.mLx = mLx;
    }

    public String getmYspm() {
        return mYspm;
    }

    public void setmYspm(String mYspm) {
        this.mYspm = mYspm == null ? null : mYspm.trim();
    }

    public Date getmJlsj() {
        return mJlsj;
    }

    public void setmJlsj(Date mJlsj) {
        this.mJlsj = mJlsj;
    }

    public String getmJlr() {
        return mJlr;
    }

    public void setmJlr(String mJlr) {
        this.mJlr = mJlr == null ? null : mJlr.trim();
    }

    public String getmScfr() {
        return mScfr;
    }

    public void setmScfr(String mScfr) {
        this.mScfr = mScfr == null ? null : mScfr.trim();
    }

    public String getmCfdd() {
        return mCfdd;
    }

    public void setmCfdd(String mCfdd) {
        this.mCfdd = mCfdd == null ? null : mCfdd.trim();
    }

    public Long getmSc() {
        return mSc;
    }

    public void setmSc(Long mSc) {
        this.mSc = mSc;
    }

    public String getmZtjl() {
        return mZtjl;
    }

    public void setmZtjl(String mZtjl) {
        this.mZtjl = mZtjl == null ? null : mZtjl.trim();
    }

	public String getmPath() {
		return mPath;
	}

	public void setmPath(String mPath) {
		this.mPath = mPath;
	}

	public String getmColumn() {
		return mColumn;
	}

	public void setmColumn(String mColumn) {
		this.mColumn = mColumn;
	}
    
}