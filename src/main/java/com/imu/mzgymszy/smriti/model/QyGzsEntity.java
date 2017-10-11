package com.imu.mzgymszy.smriti.model;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.type.Alias;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@Alias("QyGzsEntity")
@TableName("tb_qy_gzs")
public class QyGzsEntity implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	// 企业或工作室的ID
	/** 主键id */
	@TableId(type = IdType.AUTO, value = "qy_gzs_id")
	private Long id;

	// 类型：企业-0、工作室-1
	@TableField(value = "qy_gzs_lx")
	private int qyGzsLx;

	// 名称
	@TableField(value = "qy_gzs_mc")
	private String qyGzsMc;

	// 办公电话
	@TableField(value = "qy_gzs_bgdh")
	private String qyGzsBgdh;

	// 邮箱
	@TableField(value = "qy_gzs_yx")
	private String qyGzsYx;

	// 通讯地址
	@TableField(value = "qy_gzs_txdz")
	private String qyGzsTxdz;

	// 建立年份
	@TableField(value = "qy_gzs_jlnf")
	private Date qyGzsJlnf;

	// 职工人数
	@TableField(value = "qy_gzs_zgrs")
	private int qyGzsZgrs;

	// 专业技术人员人数
	@TableField(value = "qy_gzs_zyjsryrs")
	private int qyGzsZyjsryrs;

	// 网页/主页
	@TableField(value = "qy_gzs_wy_zy")
	private String qyGzsWyZy;

	// 主要产品
	@TableField(value = "qy_gzs_zycp")
	private String qyGzsZycp;

	// 产品主要材料
	@TableField(value = "qy_gzs_cpzycl")
	private String qyGzsCpzycl;

	// 产品来源
	@TableField(value = "qy_gzs_cply")
	private String qyGzsCply;

	// 所在地区同行数量
	@TableField(value = "qy_gzs_szdqthsl")
	private int qyGzsSzdqthsl;

	// 加工手段
	@TableField(value = "qy_gzs_jgsd")
	private String qyGzsJgsd;

	// 经济效益
	@TableField(value = "qy_gzs_jjxy")
	private String qyGzsJjxy;

	// 市场规模
	@TableField(value = "qy_gzs_scgm")
	private String qyGzsScgm;

	// 产品销售方式
	@TableField(value = "qy_gzs_cpxsfs")
	private String qyGzsCpxsfs;

	// 产品或服务的竞争优势
	@TableField(value = "qy_gzs_cpfwjzys")
	private String qyGzsCpfwjzys;

	// 企业简介
	@TableField(value = "qy_gzs_qyjj")
	private String qyGzsQyjj;

	public String getQyGzsQyjj() {
		return qyGzsQyjj;
	}

	public void setQyGzsQyjj(String qyGzsQyjj) {
		this.qyGzsQyjj = qyGzsQyjj;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getQyGzsLx() {
		return qyGzsLx;
	}

	public void setQyGzsLx(int qyGzsLx) {
		this.qyGzsLx = qyGzsLx;
	}

	public String getQyGzsMc() {
		return qyGzsMc;
	}

	public void setQyGzsMc(String qyGzsMc) {
		this.qyGzsMc = qyGzsMc;
	}

	public String getQyGzsBgdh() {
		return qyGzsBgdh;
	}

	public void setQyGzsBgdh(String qyGzsBgdh) {
		this.qyGzsBgdh = qyGzsBgdh;
	}

	public String getQyGzsYx() {
		return qyGzsYx;
	}

	public void setQyGzsYx(String qyGzsYx) {
		this.qyGzsYx = qyGzsYx;
	}

	public String getQyGzsTxdz() {
		return qyGzsTxdz;
	}

	public void setQyGzsTxdz(String qyGzsTxdz) {
		this.qyGzsTxdz = qyGzsTxdz;
	}

	public Date getQyGzsJlnf() {
		return qyGzsJlnf;
	}

	public void setQyGzsJlnf(Date qyGzsJlnf) {
		this.qyGzsJlnf = qyGzsJlnf;
	}

	public int getQyGzsZgrs() {
		return qyGzsZgrs;
	}

	public void setQyGzsZgrs(String qyGzsZgrs) {
		if (StringUtils.isNotBlank(qyGzsZgrs) && StringUtils.isNumeric(qyGzsZgrs)) {
			this.qyGzsZgrs = Integer.parseInt(qyGzsZgrs);
		} else {
			this.qyGzsZgrs = -1;
		}
	}

	public int getQyGzsZyjsryrs() {
		return qyGzsZyjsryrs;
	}

	public void setQyGzsZyjsryrs(String qyGzsZyjsryrs) {
		if (StringUtils.isNotBlank(qyGzsZyjsryrs) && StringUtils.isNumeric(qyGzsZyjsryrs)) {
			this.qyGzsZyjsryrs = Integer.parseInt(qyGzsZyjsryrs);
		} else {
			this.qyGzsZyjsryrs = -1;
		}
	}

	public String getQyGzsWyZy() {
		return qyGzsWyZy;
	}

	public void setQyGzsWyZy(String qyGzsWyZy) {
		this.qyGzsWyZy = qyGzsWyZy;
	}

	public String getQyGzsZycp() {
		return qyGzsZycp;
	}

	public void setQyGzsZycp(String qyGzsZycp) {
		this.qyGzsZycp = qyGzsZycp;
	}

	public String getQyGzsCpzycl() {
		return qyGzsCpzycl;
	}

	public void setQyGzsCpzycl(String qyGzsCpzycl) {
		this.qyGzsCpzycl = qyGzsCpzycl;
	}

	public String getQyGzsCply() {
		return qyGzsCply;
	}

	public void setQyGzsCply(String qyGzsCply) {
		this.qyGzsCply = qyGzsCply;
	}

	public int getQyGzsSzdqthsl() {
		return qyGzsSzdqthsl;
	}

	public void setQyGzsSzdqthsl(String qyGzsSzdqthsl) {
		if (StringUtils.isNotBlank(qyGzsSzdqthsl) && StringUtils.isNumeric(qyGzsSzdqthsl)) {
			this.qyGzsSzdqthsl = Integer.parseInt(qyGzsSzdqthsl);
		} else {
			this.qyGzsSzdqthsl = -1;
		}
	}

	public String getQyGzsJgsd() {
		return qyGzsJgsd;
	}

	public void setQyGzsJgsd(String qyGzsJgsd) {
		this.qyGzsJgsd = qyGzsJgsd;
	}

	public String getQyGzsJjxy() {
		return qyGzsJjxy;
	}

	public void setQyGzsJjxy(String qyGzsJjxy) {
		this.qyGzsJjxy = qyGzsJjxy;
	}

	public String getQyGzsScgm() {
		return qyGzsScgm;
	}

	public void setQyGzsScgm(String qyGzsScgm) {
		this.qyGzsScgm = qyGzsScgm;
	}

	public String getQyGzsCpxsfs() {
		return qyGzsCpxsfs;
	}

	public void setQyGzsCpxsfs(String qyGzsCpxsfs) {
		this.qyGzsCpxsfs = qyGzsCpxsfs;
	}

	public String getQyGzsCpfwjzys() {
		return qyGzsCpfwjzys;
	}

	public void setQyGzsCpfwjzys(String qyGzsCpfwjzys) {
		this.qyGzsCpfwjzys = qyGzsCpfwjzys;
	}

}
