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
 * @Description: ԭʼ����ģ��
 * @author tianhao
 * @date 2016��10��28�� ����1:38:57
 * 
 */
@Alias("originaldataEntity")
public class OriginaldataEntity extends BaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @Fields gypBm : ����
	 */
	private String gypBm;

	/**
	 * @Fields gypMcZm : ������
	 */
	private String gypMcZm;

	/**
	 * @Fields gypMcYm : ����
	 */
	private String gypMcYm;

	/**
	 * @Fields gypScdDw : �ղص�����
	 */
	private String gypScdDw;

	/**
	 * @Fields gypScdScrxm : �ղ�������/�����ˣ��أ�
	 */
	private String gypScdScrxm;
	
	/**
	 * gypScdDq:�����˵���
	 */
	private String gypScdDq;

	/**
	 * @Fields gypScdLxfs : ��ϵ��ʽ
	 */
	private String gypScdLxfs;

	/**
	 * @Fields gypScdScdz : �ղص�ַ
	 */
	private String gypScdScdz;

	/**
	 * @Fields gypScdSjnd : �ռ����
	 */
	private Date gypScdSjnd;

	/**
	 * @Fields gypScdSynx : ʹ������
	 */
	private int gypScdSynx;

	/**
	 * @Fields gypCyzSf : ���������
	 */
	private String gypCyzSf;

	/**
	 * @Fields gypCyzMz : ����������
	 */
	private String gypCyzMz;
	
	/**
	 * gypCyzXb:�������Ա�
	 */
	private String gypCyzXb;

	/**
	 * @Fields gypLyd : ��Դ��
	 */
	private String gypLyd;

	/**
	 * @Fields gypZsZsfs : װ�η�ʽ
	 */
	private String gypZsZsfs;

	/**
	 * @Fields gypZsZta : װ��-��ͼ��
	 */
	private String gypZsZta;

	/**
	 * @Fields gypZsMs : װ������
	 */
	private String gypZsMs;

	/**
	 * @Fields gypZsGjzp : װ�ι�����Ƭ(����)
	 */
	private String gypZsGjzp;
	
	/**
	 * gypZsGjzpjb:װ�ι�����Ƭ(�ֲ�)
	 */
	private String gypZsGjzpjb;

	/**
	 * @Fields gypGgxtZtgg : ������
	 */
	private String gypGgxtZtgg;

	/**
	 * @Fields gypGgxtJbgg : �ֲ����
	 */
	private String gypGgxtJbgg;

	/**
	 * @Fields gypDstTp : ����ͼ-ͼƬ
	 */
	private String gypDstTp;

	/**
	 * @Fields gypDstSst : ����ͼ-����ͼ(��Ϊ���洢��Ƶ)
	 */
	private String gypDstSst;

	/**
	 * @Fields gypCcx : ����ϵ
	 */
	private long gypCcx;

	/**
	 * @Fields gypZzgjCggj :��������-���湤��(��Ϊ���ֹ�����)
	 */
	private String gypZzgjCggj;

	/**
	 * @Fields gypZzgjZygj : ��������-ר�ù���(��Ϊ�����ֹ�����)
	 */
	private String gypZzgjZygj;

	/**
	 * @Fields gypZzclCz : �������ϲ���
	 */
	private String gypZzclCz;

	/**
	 * @Fields gypZzclClmc : ������������(��Ϊ������������Ƭ)
	 */
	private String gypZzclClmc;

	/**
	 * @Fields gypSygnSych : ʹ�ó���
	 */
	private String gypSygnSych;

	/**
	 * @Fields gypSygnSysp : ʹ����Ƶ
	 */
	private String gypSygnSysp;

	/**
	 * @Fields gypSygnSyyp : ʹ����Ƶ
	 */
	private String gypSygnSyyp;

	/**
	 * @Fields gypZzlcZzsp : ��������-������Ƶ
	 */
	private String gypZzlcZzsp;

	/**
	 * @Fields gypZzlcZzyp : ��������-������Ƶ
	 */
	private String gypZzlcZzyp;

	/**
	 * @Fields gypSycsCssp : ��˵��Ƶ
	 */
	private String gypSycsCssp;

	/**
	 * @Fields gypSycsCsyp : ��˵��Ƶ
	 */
	private String gypSycsCsyp;

	/**
	 * @Fields gypBz : ��ע
	 */
	private String gypBz;

	/**
	 * @Fields gypFoldId : Ŀ¼id
	 */
	private long gypFoldId;

	/**
	 * @Fields gypFoldName : ����Ŀ¼����
	 */
	private String gypFoldName;

	/**
	 * @Fields gypDelFlag : ɾ�����
	 */
	private int gypDelFlag;

	/**
	 * @Fields createTime : ����ʱ��
	 */
	private Date gypCreateTime;

	/**
	 * @Fields updateTime : ����ʱ��
	 */
	private Date gypUpdateTime;

	/**
	 * @Fields gypDyrXm : ����������
	 */
	private String gypDyrXm;

	/**
	 * @Fields gypDyrLxfs : ��������ϵ��ʽ
	 */
	private String gypDyrLxfs;

	/**
	 * @Fields gypDyrDw : �����˵�λ
	 */
	private String gypDyrDw;

	/**
	 * gypDyrWzzlr:����������
	 */
	private String gypDyrWzzlr;

	/**
	 * gypDyrTpclr:ͼƬ������
	 */
	private String gypDyrTpclr;

	/**
	 * gypDyrSpclr:��Ƶ������
	 */
	private String gypDyrSpclr;

	/**
	 * @Fields gypDyrTbsj : ���ʱ��
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
