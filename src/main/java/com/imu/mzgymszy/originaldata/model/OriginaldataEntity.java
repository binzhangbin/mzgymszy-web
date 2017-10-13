package com.imu.mzgymszy.originaldata.model;

import java.util.Date;
import org.apache.ibatis.type.Alias;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;

import com.imu.mzgymszy.base.basemodel.BaseEntity;

import jodd.util.StringUtil;

/**
 * @ClassName: OriginaldataEntity
 * @Description: 原始数据模型
 * @author tianhao
 * @date 2016年10月28日 下午1:38:57
 * 
 */
@Alias("originaldataEntity")
public class OriginaldataEntity extends BaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @Fields gypBm : 编码
	 */
	private String gypBm;

	/**
	 * @Fields gypMcZm : 主名称
	 */
	private String gypMcZm;

	/**
	 * @Fields gypMcYm : 别名
	 */
	private String gypMcYm;

	/**
	 * @Fields gypScdDw : 收藏地性质
	 */
	private String gypScdDw;

	/**
	 * @Fields gypScdScrxm : 收藏人姓名/归属人（地）
	 */
	private String gypScdScrxm;
	
	/**
	 * gypScdDq:归属人地区
	 */
	private String gypScdDq;

	/**
	 * @Fields gypScdLxfs : 联系方式
	 */
	private String gypScdLxfs;

	/**
	 * @Fields gypScdScdz : 收藏地址
	 */
	private String gypScdScdz;

	/**
	 * @Fields gypScdSjnd : 收集年代
	 */
	private Date gypScdSjnd;

	/**
	 * @Fields gypScdSynx : 使用年限
	 */
	private int gypScdSynx;

	/**
	 * @Fields gypCyzSf : 曾用者身份
	 */
	private String gypCyzSf;

	/**
	 * @Fields gypCyzMz : 曾用者民族
	 */
	private String gypCyzMz;
	
	/**
	 * gypCyzXb:曾用者性别
	 */
	private String gypCyzXb;

	/**
	 * @Fields gypLyd : 来源地
	 */
	private String gypLyd;

	/**
	 * @Fields gypZsZsfs : 装饰方式
	 */
	private String gypZsZsfs;

	/**
	 * @Fields gypZsZta : 装饰-主图案
	 */
	private String gypZsZta;

	/**
	 * @Fields gypZsMs : 装饰描述
	 */
	private String gypZsMs;

	/**
	 * @Fields gypZsGjzp : 装饰工具照片(完整)
	 */
	private String gypZsGjzp;
	
	/**
	 * gypZsGjzpjb:装饰工具照片(局部)
	 */
	private String gypZsGjzpjb;

	/**
	 * @Fields gypGgxtZtgg : 总体规格
	 */
	private String gypGgxtZtgg;

	/**
	 * @Fields gypGgxtJbgg : 局部规格
	 */
	private String gypGgxtJbgg;

	/**
	 * @Fields gypDstTp : 多视图-图片
	 */
	private String gypDstTp;

	/**
	 * @Fields gypDstSst : 多视图-三视图(改为：存储视频)
	 */
	private String gypDstSst;

	/**
	 * @Fields gypCcx : 传承系
	 */
	private long gypCcx;

	/**
	 * @Fields gypZzgjCggj :制作工具-常规工具(改为：手工工具)
	 */
	private String gypZzgjCggj;

	/**
	 * @Fields gypZzgjZygj : 制作工具-专用工具(改为：半手工工具)
	 */
	private String gypZzgjZygj;

	/**
	 * @Fields gypZzclCz : 制作材料材质
	 */
	private String gypZzclCz;

	/**
	 * @Fields gypZzclClmc : 制作材料名称(给为：制作材料照片)
	 */
	private String gypZzclClmc;

	/**
	 * @Fields gypSygnSych : 使用场合
	 */
	private String gypSygnSych;

	/**
	 * @Fields gypSygnSysp : 使用视频
	 */
	private String gypSygnSysp;

	/**
	 * @Fields gypSygnSyyp : 使用音频
	 */
	private String gypSygnSyyp;

	/**
	 * @Fields gypZzlcZzsp : 制作流程-制作视频
	 */
	private String gypZzlcZzsp;

	/**
	 * @Fields gypZzlcZzyp : 制作流程-制作音频
	 */
	private String gypZzlcZzyp;

	/**
	 * @Fields gypSycsCssp : 传说视频
	 */
	private String gypSycsCssp;

	/**
	 * @Fields gypSycsCsyp : 传说音频
	 */
	private String gypSycsCsyp;

	/**
	 * @Fields gypBz : 备注
	 */
	private String gypBz;

	/**
	 * @Fields gypFoldId : 目录id
	 */
	private long gypFoldId;

	/**
	 * @Fields gypFoldName : 所属目录名称
	 */
	private String gypFoldName;

	/**
	 * @Fields gypDelFlag : 删除标记
	 */
	private int gypDelFlag;

	/**
	 * @Fields createTime : 创建时间
	 */
	private Date gypCreateTime;

	/**
	 * @Fields updateTime : 更新时间
	 */
	private Date gypUpdateTime;

	/**
	 * @Fields gypDyrXm : 调研人姓名
	 */
	private String gypDyrXm;

	/**
	 * @Fields gypDyrLxfs : 调研人联系方式
	 */
	private String gypDyrLxfs;

	/**
	 * @Fields gypDyrDw : 调研人单位
	 */
	private String gypDyrDw;

	/**
	 * gypDyrWzzlr:文字整理人
	 */
	private String gypDyrWzzlr;

	/**
	 * gypDyrTpclr:图片处理人
	 */
	private String gypDyrTpclr;

	/**
	 * gypDyrSpclr:视频处理人
	 */
	private String gypDyrSpclr;

	/**
	 * @Fields gypDyrTbsj : 填表时间
	 */
	private Date gypDyrTbsj;

	public String getGypBm() {
		return gypBm;
	}

	public void setGypBm(String gypBm) {
		this.gypBm = gypBm;
	}

	public String getGypMcZm() {
		return gypMcZm;
	}

	public void setGypMcZm(String gypMcZm) {
		this.gypMcZm = gypMcZm;
	}

	public String getGypMcYm() {
		return gypMcYm;
	}

	public void setGypMcYm(String gypMcYm) {
		this.gypMcYm = gypMcYm;
	}

	public String getGypScdDw() {
		return gypScdDw;
	}

	public void setGypScdDw(String gypScdDw) {
		this.gypScdDw = gypScdDw;
	}

	public String getGypScdScrxm() {
		return gypScdScrxm;
	}

	public void setGypScdScrxm(String gypScdScrxm) {
		this.gypScdScrxm = gypScdScrxm;
	}

	public String getGypScdDq() {
		return gypScdDq;
	}

	public void setGypScdDq(String gypScdDq) {
		this.gypScdDq = gypScdDq;
	}

	public String getGypScdLxfs() {
		return gypScdLxfs;
	}

	public void setGypScdLxfs(String gypScdLxfs) {
		this.gypScdLxfs = gypScdLxfs;
	}

	public String getGypScdScdz() {
		return gypScdScdz;
	}

	public void setGypScdScdz(String gypScdScdz) {
		this.gypScdScdz = gypScdScdz;
	}

	public Date getGypScdSjnd() {
		return gypScdSjnd;
	}

	public void setGypScdSjnd(Date gypScdSjnd) {
		this.gypScdSjnd = gypScdSjnd;
	}

	public int getGypScdSynx() {
		return gypScdSynx;
	}

	public void setGypScdSynx(int gypScdSynx) {
		this.gypScdSynx = gypScdSynx;
	}

	public String getGypCyzSf() {
		return gypCyzSf;
	}

	public void setGypCyzSf(String gypCyzSf) {
		this.gypCyzSf = gypCyzSf;
	}

	public String getGypCyzMz() {
		return gypCyzMz;
	}

	public void setGypCyzMz(String gypCyzMz) {
		this.gypCyzMz = gypCyzMz;
	}

	public String getGypLyd() {
		return gypLyd;
	}

	public void setGypLyd(String gypLyd) {
		this.gypLyd = gypLyd;
	}

	public String getGypZsZsfs() {
		return gypZsZsfs;
	}

	public void setGypZsZsfs(String gypZsZsfs) {
		this.gypZsZsfs = gypZsZsfs;
	}

	public String getGypZsZta() {
		return gypZsZta;
	}

	public void setGypZsZta(String gypZsZta) {
		this.gypZsZta = gypZsZta;
	}

	public String getGypZsMs() {
		return gypZsMs;
	}

	public void setGypZsMs(String gypZsMs) {
		this.gypZsMs = gypZsMs;
	}

	public String getGypZsGjzp() {
		return gypZsGjzp;
	}

	public void setGypZsGjzp(String gypZsGjzp) {
		this.gypZsGjzp = gypZsGjzp;
	}

	public String getGypZsGjzpjb() {
		return gypZsGjzpjb;
	}

	public void setGypZsGjzpjb(String gypZsGjzpjb) {
		this.gypZsGjzpjb = gypZsGjzpjb;
	}

	public String getGypGgxtZtgg() {
		return gypGgxtZtgg;
	}

	public void setGypGgxtZtgg(String gypGgxtZtgg) {
		this.gypGgxtZtgg = gypGgxtZtgg;
	}

	public String getGypGgxtJbgg() {
		return gypGgxtJbgg;
	}

	public void setGypGgxtJbgg(String gypGgxtJbgg) {
		this.gypGgxtJbgg = gypGgxtJbgg;
	}

	public String getGypDstTp() {
		return gypDstTp;
	}

	public void setGypDstTp(String gypDstTp) {
		this.gypDstTp = gypDstTp;
	}

	public String getGypDstSst() {
		return gypDstSst;
	}

	public void setGypDstSst(String gypDstSst) {
		this.gypDstSst = gypDstSst;
	}

	public long getGypCcx() {
		return gypCcx;
	}

	public void setGypCcx(long gypCcx) {
		this.gypCcx = gypCcx;
	}

	public String getGypZzgjCggj() {
		return gypZzgjCggj;
	}

	public void setGypZzgjCggj(String gypZzgjCggj) {
		this.gypZzgjCggj = gypZzgjCggj;
	}

	public String getGypZzgjZygj() {
		return gypZzgjZygj;
	}

	public void setGypZzgjZygj(String gypZzgjZygj) {
		this.gypZzgjZygj = gypZzgjZygj;
	}

	public String getGypSygnSych() {
		return gypSygnSych;
	}

	public void setGypSygnSych(String gypSygnSych) {
		this.gypSygnSych = gypSygnSych;
	}

	public String getGypSygnSysp() {
		return gypSygnSysp;
	}

	public void setGypSygnSysp(String gypSygnSysp) {
		this.gypSygnSysp = gypSygnSysp;
	}

	public String getGypSygnSyyp() {
		return gypSygnSyyp;
	}

	public void setGypSygnSyyp(String gypSygnSyyp) {
		this.gypSygnSyyp = gypSygnSyyp;
	}

	public String getGypZzlcZzsp() {
		return gypZzlcZzsp;
	}

	public void setGypZzlcZzsp(String gypZzlcZzsp) {
		this.gypZzlcZzsp = gypZzlcZzsp;
	}

	public String getGypZzlcZzyp() {
		return gypZzlcZzyp;
	}

	public void setGypZzlcZzyp(String gypZzlcZzyp) {
		this.gypZzlcZzyp = gypZzlcZzyp;
	}

	public String getGypSycsCssp() {
		return gypSycsCssp;
	}

	public void setGypSycsCssp(String gypSycsCssp) {
		this.gypSycsCssp = gypSycsCssp;
	}

	public String getGypSycsCsyp() {
		return gypSycsCsyp;
	}

	public void setGypSycsCsyp(String gypSycsCsyp) {
		this.gypSycsCsyp = gypSycsCsyp;
	}

	public String getGypBz() {
		return gypBz;
	}

	public void setGypBz(String gypBz) {
		this.gypBz = gypBz;
	}

	public long getGypFoldId() {
		return gypFoldId;
	}

	public void setGypFoldId(long gypFoldId) {
		this.gypFoldId = gypFoldId;
	}

	public int getGypDelFlag() {
		return gypDelFlag;
	}

	public void setGypDelFlag(int gypDelFlag) {
		this.gypDelFlag = gypDelFlag;
	}

	public Date getGypCreateTime() {
		return gypCreateTime;
	}

	public void setGypCreateTime(Date gypCreateTime) {
		this.gypCreateTime = gypCreateTime;
	}

	public Date getGypUpdateTime() {
		return gypUpdateTime;
	}

	public void setGypUpdateTime(Date gypUpdateTime) {
		this.gypUpdateTime = gypUpdateTime;
	}

	public String getGypFoldName() {
		return gypFoldName;
	}

	public void setGypFoldName(String gypFoldName) {
		this.gypFoldName = gypFoldName;
	}

	public String getGypDyrXm() {
		return gypDyrXm;
	}

	public void setGypDyrXm(String gypDyrXm) {
		this.gypDyrXm = gypDyrXm;
	}

	public String getGypDyrLxfs() {
		return gypDyrLxfs;
	}

	public void setGypDyrLxfs(String gypDyrLxfs) {
		this.gypDyrLxfs = gypDyrLxfs;
	}

	public String getGypDyrDw() {
		return gypDyrDw;
	}

	public void setGypDyrDw(String gypDyrDw) {
		this.gypDyrDw = gypDyrDw;
	}

	public Date getGypDyrTbsj() {
		return gypDyrTbsj;
	}

	public void setGypDyrTbsj(Date gypDyrTbsj) {
		this.gypDyrTbsj = gypDyrTbsj;
	}

	public String getGypZzclCz() {
		return gypZzclCz;
	}

	public void setGypZzclCz(String gypZzclCz) {
		this.gypZzclCz = gypZzclCz;
	}

	public String getGypZzclClmc() {
		return gypZzclClmc;
	}

	public void setGypZzclClmc(String gypZzclClmc) {
		this.gypZzclClmc = gypZzclClmc;
	}

	public String getGypDyrWzzlr() {
		return gypDyrWzzlr;
	}

	public void setGypDyrWzzlr(String gypDyrWzzlr) {
		this.gypDyrWzzlr = gypDyrWzzlr;
	}

	public String getGypDyrTpclr() {
		return gypDyrTpclr;
	}

	public void setGypDyrTpclr(String gypDyrTpclr) {
		this.gypDyrTpclr = gypDyrTpclr;
	}

	public String getGypDyrSpclr() {
		return gypDyrSpclr;
	}

	public void setGypDyrSpclr(String gypDyrSpclr) {
		this.gypDyrSpclr = gypDyrSpclr;
	}

	public String getGypCyzXb() {
		return gypCyzXb;
	}

	public void setGypCyzXb(String gypCyzXb) {
		this.gypCyzXb = gypCyzXb;
	}

	public Document toIndex() {
		Document doc = new Document();
		doc.add(new Field("id", String.valueOf(this.getId()), TextField.TYPE_STORED));
		doc.add(new Field("gypbm", this.getGypBm(), TextField.TYPE_STORED));
		doc.add(new Field("gypmczm", this.getGypMcZm(), TextField.TYPE_STORED));
		if (!StringUtil.isBlank(this.getGypMcYm())) {
			doc.add(new Field("gypmcym", this.getGypMcYm(), TextField.TYPE_STORED));
		}
		if (!StringUtil.isBlank(this.getGypBz())) {
			doc.add(new Field("gypbz", this.getGypBz(), TextField.TYPE_STORED));
		}
		return doc;
	}
}
