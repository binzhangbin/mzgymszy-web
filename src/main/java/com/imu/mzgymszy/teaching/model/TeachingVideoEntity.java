package com.imu.mzgymszy.teaching.model;

import java.io.Serializable;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import jodd.util.StringUtil;

/**
 * 教学视频
 * @author Administrator
 */
@Alias("teachingVideoEntity")
@TableName("tb_jxsp")
public class TeachingVideoEntity implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
	
	/** 主键id */
	@TableId(type = IdType.AUTO, value = "jx_id")
	private Long id;
	// `JX_LX` varchar(80) DEFAULT NULL COMMENT
	// '教学类型(鞍马类、服装及配饰类、毡庐类、餐饮类、游乐类、宗教类、其它)',
	@TableField(value = "jx_lx")
	private String jxLx;
	// `JX_JSXM` varchar(50) DEFAULT NULL COMMENT '教师姓名',
	@TableField(value = "jx_jsxm")
	private String jxJsxm;
	// `JX_JSXB` varchar(4) DEFAULT NULL COMMENT '教师性别',
	@TableField(value = "jx_jsxb")
	private String jxJsxb;
	// `JX_JSMZ` varchar(20) DEFAULT NULL COMMENT '教师民族',
	@TableField(value = "jx_jsmz")
	private String jxJsmz;
	// `JX_CSNY` date DEFAULT NULL COMMENT '出生年月',
	@TableField(value = "jx_csny")
	private Date jxCsny;
	// `JX_WHCD` varchar(20) DEFAULT NULL COMMENT '文化程度',
	@TableField(value = "jx_whcd")
	private String jxWhcd;
	// `JX_JG` varchar(100) DEFAULT NULL COMMENT '籍贯',
	@TableField(value = "jx_jg")
	private String jxJg;
	// `JX_LXDH` varchar(11) DEFAULT NULL COMMENT '联系电话',
	@TableField(value = "jx_lxdh")
	private String jxLxdh;
	// `JX_XSTX` varchar(20) DEFAULT NULL COMMENT '学术头衔',
	@TableField(value = "jx_xstx")
	private String jxXstx;
	// `JX_TXDZ` varchar(100) DEFAULT NULL COMMENT '通讯地址',
	@TableField(value = "jx_txdz")
	private String jxTxdz;
	// `JX_ZP` varchar(100) DEFAULT NULL COMMENT '照片',
	@TableField(value = "jx_zp")
	private String jxZp;
	// `JX_KCMC` varchar(50) DEFAULT NULL COMMENT '课程名称',
	@TableField(value = "jx_kcmc")
	private String jxKcmc;
	// `JX_YZ` varchar(20) DEFAULT NULL COMMENT '授课语种(汉语、蒙语、其它)',
	@TableField(value = "jx_yz")
	private String jxYz;
	// `JX_GRJL` varchar(1000) DEFAULT NULL COMMENT '个人简历',
	@TableField(value = "jx_grjl")
	private String jxGrjl;
	// `JX_CJZP` varchar(100) DEFAULT NULL COMMENT '授课场景照片',
	@TableField(value = "jx_cjzp")
	private String jxCjzp;
	// `JX_ZJSL` varchar(20) DEFAULT NULL COMMENT '章节数量(教学视频)',
	@TableField(value = "jx_zjsl")
	private String jxZjsl;
	// `JX_ZSC` varchar(20) DEFAULT NULL COMMENT '总时长(教学视频)',
	@TableField(value = "jx_zsc")
	private String jxZsc;
	// `JX_SP` varchar(500) DEFAULT NULL COMMENT '视频文件(教学视频)',
	@TableField(value = "jx_sp")
	private String jxSp;
	// `JX_KJ` varchar(100) DEFAULT NULL COMMENT '课件内容(课件图片、PPT、word文档资料)',
	@TableField(value = "jx_kj")
	private String jxKj;
	// `JX_BZ` varchar(100) DEFAULT NULL COMMENT '备注',
	@TableField(value = "jx_bz")
	private String jxBz;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getJxLx() {
		return jxLx;
	}

	public void setJxLx(String jxLx) {
		this.jxLx = jxLx;
	}

	public String getJxJsxm() {
		return jxJsxm;
	}

	public void setJxJsxm(String jxJsxm) {
		this.jxJsxm = jxJsxm;
	}

	public String getJxJsxb() {
		return jxJsxb;
	}

	public void setJxJsxb(String jxJsxb) {
		this.jxJsxb = jxJsxb;
	}

	public String getJxJsmz() {
		return jxJsmz;
	}

	public void setJxJsmz(String jxJsmz) {
		this.jxJsmz = jxJsmz;
	}

	public Date getJxCsny() {
		return jxCsny;
	}

	public void setJxCsny(Date jxCsny) {
		this.jxCsny = jxCsny;
	}

	public String getJxWhcd() {
		return jxWhcd;
	}

	public void setJxWhcd(String jxWhcd) {
		this.jxWhcd = jxWhcd;
	}

	public String getJxJg() {
		return jxJg;
	}

	public void setJxJg(String jxJg) {
		this.jxJg = jxJg;
	}

	public String getJxLxdh() {
		return jxLxdh;
	}

	public void setJxLxdh(String jxLxdh) {
		this.jxLxdh = jxLxdh;
	}

	public String getJxXstx() {
		return jxXstx;
	}

	public void setJxXstx(String jxXstx) {
		this.jxXstx = jxXstx;
	}

	public String getJxTxdz() {
		return jxTxdz;
	}

	public void setJxTxdz(String jxTxdz) {
		this.jxTxdz = jxTxdz;
	}

	public String getJxZp() {
		return jxZp;
	}

	public void setJxZp(String jxZp) {
		this.jxZp = jxZp;
	}

	public String getJxKcmc() {
		return jxKcmc;
	}

	public void setJxKcmc(String jxKcmc) {
		this.jxKcmc = jxKcmc;
	}

	public String getJxYz() {
		return jxYz;
	}

	public void setJxYz(String jxYz) {
		this.jxYz = jxYz;
	}

	public String getJxGrjl() {
		return jxGrjl;
	}

	public void setJxGrjl(String jxGrjl) {
		this.jxGrjl = jxGrjl;
	}

	public String getJxCjzp() {
		return jxCjzp;
	}

	public void setJxCjzp(String jxCjzp) {
		this.jxCjzp = jxCjzp;
	}

	public String getJxZjsl() {
		return jxZjsl;
	}

	public void setJxZjsl(String jxZjsl) {
		this.jxZjsl = jxZjsl;
	}

	public String getJxZsc() {
		return jxZsc;
	}

	public void setJxZsc(String jxZsc) {
		this.jxZsc = jxZsc;
	}

	public String getJxSp() {
		return jxSp;
	}

	public void setJxSp(String jxSp) {
		this.jxSp = jxSp;
	}

	public String getJxKj() {
		return jxKj;
	}

	public void setJxKj(String jxKj) {
		this.jxKj = jxKj;
	}

	public String getJxBz() {
		return jxBz;
	}

	public void setJxBz(String jxBz) {
		this.jxBz = jxBz;
	}
	

	public Document toIndex() {
		Document doc = new Document();
		doc.add(new Field("id", String.valueOf(this.getId()), TextField.TYPE_STORED));
		doc.add(new Field("jxJsxm", this.getJxJsxm(), TextField.TYPE_STORED));
		doc.add(new Field("jxWhcd", this.getJxWhcd(), TextField.TYPE_STORED));
		if (!StringUtil.isBlank(this.getJxXstx())) {
			doc.add(new Field("jxXstx", this.getJxXstx(), TextField.TYPE_STORED));
		}
		if (!StringUtil.isBlank(this.getJxBz())) {
			doc.add(new Field("jxBz", this.getJxBz(), TextField.TYPE_STORED));
		}
		return doc;
	}
}
