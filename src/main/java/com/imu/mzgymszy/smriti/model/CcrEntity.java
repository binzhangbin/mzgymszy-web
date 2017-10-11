package com.imu.mzgymszy.smriti.model;

import java.io.Serializable;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@Alias("CcrEntity")
@TableName("tb_ccr")
public class CcrEntity implements Serializable {
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 主键id */
	@TableId(type = IdType.AUTO, value = "c_id")
	private Long id;

	// 姓名
	@TableField(value = "c_xm")
	private String cXm;

	// 性别
	@TableField(value = "c_xb")
	private int cXb;

	// 民族
	@TableField(value = "c_mz")
	private String cMz;

	// 出生年月
	@TableField(value = "c_csny")
	private Date cCsny;

	// 文化程度
	@TableField(value = "c_whcd")
	private String cWhcd;

	// 籍贯
	@TableField(value = "c_jg")
	private String cJg;

	// 联系方式
	@TableField(value = "c_lxfs")
	private String cLxfs;

	// 联系地址
	@TableField(value = "c_lxdz")
	private String cLxdz;

	// 特色手艺
	@TableField(value = "c_tssy")
	private String cTssy;

	// 从业起始年
	@TableField(value = "c_cyqsn")
	private String cCyqsn;

	// 师承
	@TableField(value = "c_sc")
	private String cSc;

	// 身份证号
	@TableField(value = "c_sfzh")
	private String cSfzh;

	// 住宿房间号
	@TableField(value = "c_zsfjh")
	private String cZsfjh;

	// 微信
	@TableField(value = "c_wx")
	private String cWx;

	// QQ
	@TableField(value = "c_qq")
	private String cQq;

	// 电子信箱
	@TableField(value = "c_dzxx")
	private String cDzxx;

	// 邮编
	@TableField(value = "c_yb")
	private String cYb;

	// 职业
	@TableField(value = "c_zy")
	private String cZy;

	// 工作地址
	@TableField(value = "c_gzdz")
	private String cGzdz;

	// 学员推荐地
	@TableField(value = "c_xytjd")
	private String cXytjd;

	// 非遗认定
	@TableField(value = "c_fyrd")
	private String cFyrd;

	// 主要代表作品
	@TableField(value = "c_zydbzp")
	private String cZydbzp;

	// 获奖情况
	@TableField(value = "c_hjqk")
	private String cHjqk;

	// 企业简介
	// @TableField(value = "c_qyjj")
	// private String cQyjj;

	// 备注
	@TableField(value = "c_bz")
	private String cBz;

	// 个人简历
	@TableField(value = "c_grjl")
	private String cGrjl;

	// 照片，存储的为图片路径
	@TableField(value = "c_zp")
	private String cZp;

	// 技艺传承人数
	@TableField(value = "c_ccrs")
	private int cCcrs;

	// 企业或者工作室
	@TableField(value = "c_qygzs")
	private int cQygzs;

	// 师承关系
	@TableField(value = "c_scgx")
	private String cScgx;

	// 学徒起始年份
	@TableField(value = "c_xtqsnf")
	private String cXtqsnf;

	// 联系方式-老师
	@TableField(value = "c_lxfs_ls")
	private String cLxfsLs;

	// 联系地址-老师
	@TableField(value = "c_lxdz_ls")
	private String cLxdzLs;

	// 学徒姓名
	@TableField(value = "c_xtxm")
	private String cXtxm;

	// 联系方式-学徒
	@TableField(value = "c_lxfs_xt")
	private String cLxfsXt;

	// 联系地址-学徒
	@TableField(value = "c_lxdz_xt")
	private String cLxdzXt;

	public String getcScgx() {
		return cScgx;
	}

	public void setcScgx(String cScgx) {
		this.cScgx = cScgx;
	}

	public String getcXtqsnf() {
		return cXtqsnf;
	}

	public void setcXtqsnf(String cXtqsnf) {
		this.cXtqsnf = cXtqsnf;
	}

	public String getcLxfsLs() {
		return cLxfsLs;
	}

	public void setcLxfsLs(String cLxfsLs) {
		this.cLxfsLs = cLxfsLs;
	}

	public String getcLxdzLs() {
		return cLxdzLs;
	}

	public void setcLxdzLs(String cLxdzLs) {
		this.cLxdzLs = cLxdzLs;
	}

	public String getcXtxm() {
		return cXtxm;
	}

	public void setcXtxm(String cXtxm) {
		this.cXtxm = cXtxm;
	}

	public String getcLxfsXt() {
		return cLxfsXt;
	}

	public void setcLxfsXt(String cLxfsXt) {
		this.cLxfsXt = cLxfsXt;
	}

	public String getcLxdzXt() {
		return cLxdzXt;
	}

	public void setcLxdzXt(String cLxdzXt) {
		this.cLxdzXt = cLxdzXt;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getcXm() {
		return cXm;
	}

	public void setcXm(String cXm) {
		this.cXm = cXm;
	}

	public int getcXb() {
		return cXb;
	}

	public void setcXb(int cXb) {
		this.cXb = cXb;
	}

	public String getcMz() {
		return cMz;
	}

	public void setcMz(String cMz) {
		this.cMz = cMz;
	}

	public Date getcCsny() {
		return cCsny;
	}

	public void setcCsny(Date cCsny) {
		this.cCsny = cCsny;
	}

	public String getcWhcd() {
		return cWhcd;
	}

	public void setcWhcd(String cWhcd) {
		this.cWhcd = cWhcd;
	}

	public String getcJg() {
		return cJg;
	}

	public void setcJg(String cJg) {
		this.cJg = cJg;
	}

	public String getcLxfs() {
		return cLxfs;
	}

	public void setcLxfs(String cLxfs) {
		this.cLxfs = cLxfs;
	}

	public String getcLxdz() {
		return cLxdz;
	}

	public void setcLxdz(String cLxdz) {
		this.cLxdz = cLxdz;
	}

	public String getcTssy() {
		return cTssy;
	}

	public void setcTssy(String cTssy) {
		this.cTssy = cTssy;
	}

	public String getcCyqsn() {
		return cCyqsn;
	}

	public void setcCyqsn(String cCyqsn) {
		this.cCyqsn = cCyqsn;
	}

	public String getcSc() {
		return cSc;
	}

	public void setcSc(String cSc) {
		// if(StringUtils.isNotBlank(cSc)&&StringUtils.isNumeric(cSc)){
		// this.cSc=Integer.parseInt(cSc);
		// }else{
		// this.cSc=-1;
		// }
		this.cSc = cSc;
	}

	public String getcSfzh() {
		return cSfzh;
	}

	public void setcSfzh(String cSfzh) {
		this.cSfzh = cSfzh;
	}

	public String getcZsfjh() {
		return cZsfjh;
	}

	public void setcZsfjh(String cZsfjh) {
		this.cZsfjh = cZsfjh;
	}

	public String getcWx() {
		return cWx;
	}

	public void setcWx(String cWx) {
		this.cWx = cWx;
	}

	public String getcQq() {
		return cQq;
	}

	public void setcQq(String cQq) {
		this.cQq = cQq;
	}

	public String getcDzxx() {
		return cDzxx;
	}

	public void setcDzxx(String cDzxx) {
		this.cDzxx = cDzxx;
	}

	public String getcYb() {
		return cYb;
	}

	public void setcYb(String cYb) {
		this.cYb = cYb;
	}

	public String getcZy() {
		return cZy;
	}

	public void setcZy(String cZy) {
		this.cZy = cZy;
	}

	public String getcGzdz() {
		return cGzdz;
	}

	public void setcGzdz(String cGzdz) {
		this.cGzdz = cGzdz;
	}

	public String getcXytjd() {
		return cXytjd;
	}

	public void setcXytjd(String cXytjd) {
		this.cXytjd = cXytjd;
	}

	public String getcFyrd() {
		return cFyrd;
	}

	public void setcFyrd(String cFyrd) {
		this.cFyrd = cFyrd;
	}

	public String getcZydbzp() {
		return cZydbzp;
	}

	public void setcZydbzp(String cZydbzp) {
		this.cZydbzp = cZydbzp;
	}

	public String getcHjqk() {
		return cHjqk;
	}

	public void setcHjqk(String cHjqk) {
		this.cHjqk = cHjqk;
	}

	public String getcBz() {
		return cBz;
	}

	public void setcBz(String cBz) {
		this.cBz = cBz;
	}

	public String getcGrjl() {
		return cGrjl;
	}

	public void setcGrjl(String cGrjl) {
		this.cGrjl = cGrjl;
	}

	public String getcZp() {
		return cZp;
	}

	public void setcZp(String cZp) {
		this.cZp = cZp;
	}

	public int getcCcrs() {
		return cCcrs;
	}

	public void setcCcrs(int cCcrs) {
//		if (StringUtils.isNotBlank(cCcrs) && StringUtils.isNumeric(cCcrs)) {
//			this.cCcrs = Integer.parseInt(cCcrs);
//		} else {
//			this.cCcrs = -1;
//		}

		// this.cCcrs = cCcrs;
		this.cCcrs = cCcrs;
	}

	public int getcQygzs() {
		return cQygzs;
	}

//	public void setcQygzs(String cQygzs) {
//		if (StringUtils.isNotBlank(cQygzs) && StringUtils.isNumeric(cQygzs)) {
//			this.cQygzs = Integer.parseInt(cQygzs);
//		} else {
//			this.cQygzs = -1;
//		}
//	}
	public void setcQygzs(int cQygzs) {
		this.cQygzs = cQygzs;
	}

}