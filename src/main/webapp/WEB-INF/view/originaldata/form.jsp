<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<link rel="stylesheet"
	href="${ctx }/resources/js/datepicker/css/bootstrap-datepicker3.standalone.min.css" />
<script type="text/javascript"
	src="${ctx }/resources/js/datepicker/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript"
	src="${ctx }/resources/js/datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript"
	src="${ctx }/resources/js/ace/spinbox.min.js"></script>
<script type="text/javascript"
	src="${ctx }/resources/js/ace/ace-elements.min.js"></script>
<script type="text/javascript"
	src="${ctx }/resources/js/customer/originaldata/form.js"></script>
<script type="text/javascript"
	src="${ctx }/resources/js/distpicker/distpicker.min.js"></script>

<!-- ��ѡ����Ʒ�ɼ��ղصأ����ˡ���˾���ݲء����� -->
<script type="text/javascript">
	var boxObj = document.getElementsByName("gypScdDw"); //��ȡ���еĸ�ѡ��
	var payment = "${originaldataEntity.gypScdDw}"; //��el���ʽ��ȡ�ڿ��Ʋ��ŵĸ�ѡ���ֵΪ�ַ�������
	var pay = payment.split(","); //ȥ������֮��ķָ��������  
	for (i = 0; i < boxObj.length; i++) {
		for (j = 0; j < pay.length; j++) { //���ֵ���޸�ǰ��ֵ���
			if (boxObj[i].value == pay[j]) {
				boxObj[i].checked = true;
				break;
			}
		}
	}
</script>

<!-- ��ѡ����Ʒ��ʹ������ݣ����塢ƽ��ɮ�¡����� -->
<script type="text/javascript">
	var boxObj = document.getElementsByName("gypCyzSf"); //��ȡ���еĸ�ѡ��
	var payment = "${originaldataEntity.gypCyzSf}"; //��el���ʽ��ȡ�ڿ��Ʋ��ŵĸ�ѡ���ֵΪ�ַ�������
	var pay = payment.split(","); //ȥ������֮��ķָ��������  
	for (i = 0; i < boxObj.length; i++) {
		for (j = 0; j < pay.length; j++) { //���ֵ���޸�ǰ��ֵ���
			if (boxObj[i].value == pay[j]) {
				boxObj[i].checked = true;
				break;
			}
		}
	}
</script>

<!-- ��ѡ��װ����������Ҫ���������塢ӡȾ����Ƕ����̡����ߡ����ƻ��ߡ���ʯ������װ�η�ʽ -->
<script type="text/javascript">
	var boxObj = document.getElementsByName("gypZsZsfs"); //��ȡ���еĸ�ѡ��
	var payment = "${originaldataEntity.gypZsZsfs}"; //��el���ʽ��ȡ�ڿ��Ʋ��ŵĸ�ѡ���ֵΪ�ַ�������
	var pay = payment.split(","); //ȥ������֮��ķָ��������  
	for (i = 0; i < boxObj.length; i++) {
		for (j = 0; j < pay.length; j++) { //���ֵ���޸�ǰ��ֵ���
			if (boxObj[i].value == pay[j]) {
				boxObj[i].checked = true;
				break;
			}
		}
	}
</script>

<!-- ��ѡ��װ����������Ҫ����-��Ҫͼ����ֲ�ﻨ�ܡ������Ȼ�����Ρ����֡��ڽ����������� -->
<script type="text/javascript">
	var boxObj = document.getElementsByName("gypZsZta"); //��ȡ���еĸ�ѡ��
	var payment = "${originaldataEntity.gypZsZta}"; //��el���ʽ��ȡ�ڿ��Ʋ��ŵĸ�ѡ���ֵΪ�ַ�������
	var pay = payment.split(","); //ȥ������֮��ķָ��������  
	for (i = 0; i < boxObj.length; i++) {
		for (j = 0; j < pay.length; j++) { //���ֵ���޸�ǰ��ֵ���
			if (boxObj[i].value == pay[j]) {
				boxObj[i].checked = true;
				break;
			}
		}
	}
</script>

<!-- ��ѡ����������-12��������ʯ�ġ���ʯ��Ƥ��ë���ǡ��ǡ�ľ�ġ����� -->
<script type="text/javascript">
	var boxObj = document.getElementsByName("gypZzclCz"); //��ȡ���еĸ�ѡ��
	var payment = "${originaldataEntity.gypZzclCz}"; //��el���ʽ��ȡ�ڿ��Ʋ��ŵĸ�ѡ���ֵΪ�ַ�������
	var pay = payment.split(","); //ȥ������֮��ķָ��������  
	for (i = 0; i < boxObj.length; i++) {
		for (j = 0; j < pay.length; j++) { //���ֵ���޸�ǰ��ֵ���
			if (boxObj[i].value == pay[j]) {
				boxObj[i].checked = true;
				break;
			}
		}
	}
</script>

<!-- ��ѡ��ʹ�ó��ϼ���������-13���ճ�ʹ�á��ڽ���������������ǡ��ش���ա����� -->
<script type="text/javascript">
	var boxObj = document.getElementsByName("gypSygnSych"); //��ȡ���еĸ�ѡ��
	var payment = "${originaldataEntity.gypSygnSych}"; //��el���ʽ��ȡ�ڿ��Ʋ��ŵĸ�ѡ���ֵΪ�ַ�������
	var pay = payment.split(","); //ȥ������֮��ķָ��������  
	for (i = 0; i < boxObj.length; i++) {
		for (j = 0; j < pay.length; j++) { //���ֵ���޸�ǰ��ֵ���
			if (boxObj[i].value == pay[j]) {
				boxObj[i].checked = true;
				break;
			}
		}
	}
</script>

<!--��ϵ��ʽ�͹̻�У��-->
<script type="text/javascript">
	//��ϵ��ʽУ��
	function checkTel(tel) {
		var value = document.getElementById(tel).value;
		RegularExp = /^[0-9]{11}$/;
		if (RegularExp.test(value)) {
			return true;
		} else {
			alert("�ֻ��Ÿ�ʽ����ȷ��Ӧ��Ϊ11λ���ȵ�����,��̻�ǰӦ������");
			document.getElementById(tel).value = "";
			return false;
		}
	}
</script>

<style>
.iconShow {
	padding-left: 10px;
	padding-top: 3px;
}

.source-icon {
	width: 95%;
	float: left;
}

@media screen and (max-width: 374px) {
	.source-icon {
		width: 82%;
	}
}

@media screen and (min-width: 375px) and (max-width: 449px) {
	.source-icon {
		width: 85%;
	}
}

@media screen and (min-width: 450px) and (max-width: 1279px) {
	.source-icon {
		width: 90%;
	}
}

@media screen and (min_width: 1280px) {
	.source-icon {
		width: 90%;
	}
}
</style>
<div class="page-header">
	<h1>
		<c:if test="${empty originaldataEntity}">
		����ԭʼ����
		</c:if>
		<c:if test="${!empty originaldataEntity}">
		�༭ԭʼ����
		</c:if>
	</h1>
</div>
<div class="row" style="margin-top: 5px;">
	<div class="col-xs-12">
		<form id="originaldataForm" name="originaldataForm"
			class="form-horizontal" role="form" method="post"
			enctype="multipart/form-data">
			<c:if test="${!empty originaldataEntity}">
				<input type="hidden" id="pageNum" name="pageNum"
					value="${page.pageNum }">
				<input type="hidden" id="pageSize" name="pageSize"
					value="${page.pageSize }">
				<input type="hidden" id="orderByColumn" name="orderByColumn"
					value="${page.orderByColumn }">
				<input type="hidden" id="orderByType" name="orderByType"
					value="${page.orderByType }">
				<input type="hidden" name="id" id="originaldataId"
					value="${originaldataEntity.id }">
			</c:if>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypFoldId">����Ŀ¼</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="gypFoldName" id="gypFoldName"
							type="text" value="${gypFoldName }" placeholder="��ѡ������Ŀ¼..."
							required /> <input type="hidden" id="gypFoldId" name="gypFoldId"
							value="${gypFoldId }">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypBm">����</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="gypBm" id="gypBm" type="text"
							value="${originaldataEntity.gypBm }" placeholder="����..."
							maxlength="20" required />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypMcZm">������</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="gypMcZm" id="gypMcZm"
							type="text" value="${originaldataEntity.gypMcZm }"
							placeholder="������..." maxlength="10" required />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypMcYm">����</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="gypMcYm" id="gypMcYm"
							type="text" value="${originaldataEntity.gypMcYm }"
							placeholder="����..." maxlength="10" />
					</div>
				</div>
			</div>

			<!-- 4-��Ʒ�ɼ��ղص�===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypScdDw">�ղص�����</label>
				<div class="col-sm-9">
					<div class="checkbox">
						<%-- <label>
						<input class="ace" name="gypScdDw" id="gypScdDw" type="radio" value="����" ${originaldataEntity.gypScdDw eq "����"?"checked":""} required/>
						<span class="lbl">����</span>
					</label> --%>
						<label> <input class="ace" name="gypScdDw" id="gypScdDw"
							type="checkbox" value="����"
							${originaldataEntity.gypScdDw eq "����"?"checked":""} required /> <span
							class="lbl">����</span>
						</label> <label> <input class="ace" name="gypScdDw" id="gypScdDw"
							type="checkbox" value="��˾"
							${originaldataEntity.gypScdDw eq "��˾"?"checked":""} required /> <span
							class="lbl">��˾</span>
						</label> <label> <input class="ace" name="gypScdDw" id="gypScdDw"
							type="checkbox" value="�ݲ�"
							${originaldataEntity.gypScdDw eq "�ݲ�"?"checked":""} required /> <span
							class="lbl">�ݲ�</span>
						</label> <label> <input class="ace" name="gypScdDw" id="gypScdDw"
							type="checkbox" value="����"
							${originaldataEntity.gypScdDw eq "����"?"checked":""} required /> <span
							class="lbl">����</span>
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypScdScrxm">��Ʒ�����ˣ��أ�</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="gypScdScrxm" id="gypScdScrxm"
							type="text" value="${originaldataEntity.gypScdScrxm }"
							placeholder="�����ˣ��أ�..." maxlength="10" required />
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypScdDq">��Ʒ�����˵���</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<select class="form-control" name="gypScdDq" id="gypScdDq">
							<option>---��ѡ�����---</option>
							<option value="���ͺ�����"
								${originaldataEntity.gypScdDq eq "���ͺ�����"?"selected":""}>���ͺ�����</option>
							<option value="��ͷ��"
								${originaldataEntity.gypScdDq eq "��ͷ��"?"selected":""}>��ͷ��</option>
							<option value="�ں���"
								${originaldataEntity.gypScdDq eq "�ں���"?"selected":""}>�ں���</option>
							<option value="�����"
								${originaldataEntity.gypScdDq eq "�����"?"selected":""}>�����</option>
							<option value="ͨ����"
								${originaldataEntity.gypScdDq eq "ͨ����"?"selected":""}>ͨ����</option>
							<option value="������˹��"
								${originaldataEntity.gypScdDq eq "������˹��"?"selected":""}>������˹��</option>
							<option value="���ױ�����"
								${originaldataEntity.gypScdDq eq "���ױ�����"?"selected":""}>���ױ�����</option>
							<option value="�����첼��"
								${originaldataEntity.gypScdDq eq "�����첼��"?"selected":""}>�����첼��</option>
							<option value="�����׶���"
								${originaldataEntity.gypScdDq eq "�����׶���"?"selected":""}>�����׶���</option>
							<option value="�˰���"
								${originaldataEntity.gypScdDq eq "�˰���"?"selected":""}>�˰���</option>
							<option value="��������"
								${originaldataEntity.gypScdDq eq "��������"?"selected":""}>��������</option>
							<option value="���ֹ�����"
								${originaldataEntity.gypScdDq eq "���ֹ�����"?"selected":""}>���ֹ�����</option>
						</select>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypScdLxfs">��ϵ��ʽ</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="gypScdLxfs" id="gypScdLxfs"
							type="text" value="${originaldataEntity.gypScdLxfs }"
							placeholder="��ϵ��ʽ..." onblur="checkTel('gypScdLxfs')" maxlength="20" />
					</div>
				</div>
			</div>
			<%-- <div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypScdScdz">�ղص�ַ</label>
				<div class="col-sm-9">
				<div data-toggle="distpicker" class="clearfix" required>
				  <c:set var="gypScdScdz" value="${fn:split(originaldataEntity.gypScdScdz, '-')}" />
				  <select id="gypScdScdz-province" <c:if test="${!empty gypScdScdz[0]}">data-province=${gypScdScdz[0] }</c:if>></select>
				  <select id="gypScdScdz-city" <c:if test="${!empty gypScdScdz[1]}">data-city=${gypScdScdz[1] }</c:if>></select>
				  <select id="gypScdScdz-district" <c:if test="${!empty gypScdScdz[2]}">data-district=${gypScdScdz[2] }</c:if>></select>
				  <input name="gypScdScdz" id="gypScdScdz" type="hidden" value="${originaldataEntity.gypScdScdz }"/>
				</div>
				</div>
			</div> --%>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypScdScdz">�ղص�ַ</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="gypScdScdz" id="gypScdScdz"
							type="text" value="${originaldataEntity.gypScdScdz }"
							placeholder="�ղص�ַ..." maxlength="20" />
					</div>
				</div>
			</div>
			<%-- <div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypScdSjnd">�ռ����</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control form_datetime" name="gypScdSjnd" id="gypScdSjnd" type="text" placeholder="�ռ����..."
						value="<fmt:formatDate value="${originaldataEntity.gypScdSjnd}" type="date"/>" required/>
					<span class="input-group-addon">
						<i class="fa fa-calendar bigger-110"></i>
					</span>
				</div>
				</div>
			</div> --%>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypScdSynx">ʹ������</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="input-mini" name="gypScdSynx" id="gypScdSynx"
							type="text" value="${originaldataEntity.gypScdSynx }" required />
					</div>
				</div>
			</div>
			<!-- 4-��Ʒ�ɼ��ղص�===End=== -->

			<!-- 5-��Ʒ��ʹ����===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypCyzSf">���������</label>
				<div class="col-sm-9">
					<div class="checkbox">
						<label> <input class="ace" name="gypCyzSf" id="gypCyzSf"
							type="checkbox" value="����"
							${originaldataEntity.gypCyzSf eq "����"?"checked":""} required /> <span
							class="lbl">����</span>
						</label> <label> <input class="ace" name="gypCyzSf" id="gypCyzSf"
							type="checkbox" value="ƽ��"
							${originaldataEntity.gypCyzSf eq "ƽ��"?"checked":""} required /> <span
							class="lbl">ƽ��</span>
						</label> <label> <input class="ace" name="gypCyzSf" id="gypCyzSf"
							type="checkbox" value="ɮ��"
							${originaldataEntity.gypCyzSf eq "ɮ��"?"checked":""} required /> <span
							class="lbl">ɮ��</span>
						</label> <label> <input class="ace" name="gypCyzSf" id="gypCyzSf"
							type="checkbox" value="����"
							${originaldataEntity.gypCyzSf eq "����"?"checked":""} required /> <span
							class="lbl">����</span>
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypCyzMz">����������</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="gypCyzMz" id="gypCyzMz"
							type="text" value="${originaldataEntity.gypCyzMz }"
							placeholder="����������..." maxlength="4" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypCyzXb">�������Ա�</label>
				<div class="col-sm-9">
					<div class="radio">
						<label> <input class="ace" name="gypCyzXb" id="gypCyzXb"
							type="radio" value="��"
							${originaldataEntity.gypCyzXb eq "��"?"checked":""} /> <span
							class="lbl">��</span>
						</label> <label> <input class="ace" name="gypCyzXb" id="gypCyzXb"
							type="radio" value="Ů"
							${originaldataEntity.gypCyzXb eq "Ů"?"checked":""} /> <span
							class="lbl">Ů</span>
						</label>
					</div>
				</div>
			</div>
			<!-- 5-��Ʒ��ʹ����===End=== -->

			<!-- 6-��Ʒ��Դ���ղص�===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypLyd">��Դ��</label>
				<div class="col-sm-9">
					<div data-toggle="distpicker" class="clearfix" required>
						<c:set var="gypLyd"
							value="${fn:split(originaldataEntity.gypLyd, '-')}" />
						<select id="gypLyd-province"
							<c:if test="${!empty gypScdScdz[0]}">data-province=${gypLyd[0] }</c:if>></select>
						<select id="gypLyd-city"
							<c:if test="${!empty gypScdScdz[1]}">data-city=${gypLyd[1] }</c:if>></select>
						<select id="gypLyd-district"
							<c:if test="${!empty gypScdScdz[2]}">data-district=${gypLyd[2] }</c:if>></select>
						<input name="gypLyd" id="gypLyd" type="hidden"
							value="${originaldataEntity.gypLyd }" />
					</div>
				</div>
			</div>
			<!-- 6-��Ʒ��Դ���ղص�===End=== -->

			<!-- 7-װ����������Ҫ����===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypZsZsfs">װ�η�ʽ</label>
				<div class="col-sm-9">
					<div class="checkbox">
						<label> <input class="ace" name="gypZsZsfs" id="gypZsZsfs"
							type="checkbox" value="����"
							${originaldataEntity.gypZsZsfs eq "����"?"checked":""} required />
							<span class="lbl">����</span>
						</label> <label> <input class="ace" name="gypZsZsfs"
							id="gypZsZsfs" type="checkbox" value="ӡȾ"
							${originaldataEntity.gypZsZsfs eq "ӡȾ"?"checked":""} required />
							<span class="lbl">ӡȾ</span>
						</label> <label> <input class="ace" name="gypZsZsfs"
							id="gypZsZsfs" type="checkbox" value="��Ƕ"
							${originaldataEntity.gypZsZsfs eq "��Ƕ"?"checked":""} required />
							<span class="lbl">��Ƕ</span>
						</label> <label> <input class="ace" name="gypZsZsfs"
							id="gypZsZsfs" type="checkbox" value="���"
							${originaldataEntity.gypZsZsfs eq "���"?"checked":""} required />
							<span class="lbl">���</span>
						</label> <label> <input class="ace" name="gypZsZsfs"
							id="gypZsZsfs" type="checkbox" value="����"
							${originaldataEntity.gypZsZsfs eq "����"?"checked":""} required />
							<span class="lbl">����</span>
						</label> <label> <input class="ace" name="gypZsZsfs"
							id="gypZsZsfs" type="checkbox" value="���ƻ���"
							${originaldataEntity.gypZsZsfs eq "���ƻ���"?"checked":""} required />
							<span class="lbl">���ƻ���</span>
						</label> <label> <input class="ace" name="gypZsZsfs"
							id="gypZsZsfs" type="checkbox" value="��ʯ"
							${originaldataEntity.gypZsZsfs eq "��ʯ"?"checked":""} required />
							<span class="lbl">��ʯ</span>
						</label> <label> <input class="ace" name="gypZsZsfs"
							id="gypZsZsfs" type="checkbox" value="����װ�η�ʽ"
							${originaldataEntity.gypZsZsfs eq "����װ�η�ʽ"?"checked":""} required />
							<span class="lbl">����װ�η�ʽ</span>
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypZsZta">װ��-��ͼ��</label>
				<div class="col-sm-9">
					<div class="checkbox">
						<label> <input class="ace" name="gypZsZta" id="gypZsZta"
							type="checkbox" value="ֲ�ﻨ��"
							${originaldataEntity.gypZsZta eq "ֲ�ﻨ��"?"checked":""} required />
							<span class="lbl">ֲ�ﻨ��</span>
						</label> <label> <input class="ace" name="gypZsZta" id="gypZsZta"
							type="checkbox" value="����"
							${originaldataEntity.gypZsZta eq "����"?"checked":""} required /> <span
							class="lbl">����</span>
						</label> <label> <input class="ace" name="gypZsZta" id="gypZsZta"
							type="checkbox" value="��Ȼ"
							${originaldataEntity.gypZsZta eq "��Ȼ"?"checked":""} required /> <span
							class="lbl">��Ȼ</span>
						</label> <label> <input class="ace" name="gypZsZta" id="gypZsZta"
							type="checkbox" value="����"
							${originaldataEntity.gypZsZta eq "����"?"checked":""} required /> <span
							class="lbl">����</span>
						</label> <label> <input class="ace" name="gypZsZta" id="gypZsZta"
							type="checkbox" value="����"
							${originaldataEntity.gypZsZta eq "����"?"checked":""} required /> <span
							class="lbl">����</span>
						</label> <label> <input class="ace" name="gypZsZta" id="gypZsZta"
							type="checkbox" value="�ڽ�����"
							${originaldataEntity.gypZsZta eq "�ڽ�����"?"checked":""} required />
							<span class="lbl">�ڽ�����</span>
						</label> <label> <input class="ace" name="gypZsZta" id="gypZsZta"
							type="checkbox" value="����"
							${originaldataEntity.gypZsZta eq "����"?"checked":""} required /> <span
							class="lbl">����</span>
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypZsMs">װ������</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="gypZsMs" id="gypZsMs"
							type="text" value="${originaldataEntity.gypZsMs }"
							placeholder="װ������..." maxlength="50" required />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypZsGjzp">װ�ι�����(����)</label>
				<div class="col-sm-9">
					<div class="input-group">
						<input class="form-control picture-upload" name="gypZsGjzp"
							id="gypZsGjzp" type="text"
							value="${originaldataEntity.gypZsGjzp }"
							placeholder="װ�ι�����Ƭ(����)..." /> <span class="input-group-addon">
							<i class="fa fa-file-image-o bigger-110"></i>
						</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypZsGjzpjb">װ�ι�����(�ֲ�)</label>
				<div class="col-sm-9">
					<div class="input-group">
						<input class="form-control picture-upload" name="gypZsGjzpjb"
							id="gypZsGjzpjb" type="text"
							value="${originaldataEntity.gypZsGjzpjb }"
							placeholder="װ�ι�����Ƭ(�ֲ�)..." /> <span class="input-group-addon">
							<i class="fa fa-file-image-o bigger-110"></i>
						</span>
					</div>
				</div>
			</div>
			<!-- 7-װ����������Ҫ����===End=== -->

			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypGgxtZtgg">������</label>
				<div class="col-sm-9">
					<div class="input-group">
						<input class="form-control picture-upload" name="gypGgxtZtgg"
							id="gypGgxtZtgg" type="text"
							value="${originaldataEntity.gypGgxtZtgg }" placeholder="������..." />
						<span class="input-group-addon"> <i
							class="fa fa-file-image-o bigger-110"></i>
						</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypGgxtJbgg">�ֲ����</label>
				<div class="col-sm-9">
					<div class="input-group">
						<input class="form-control picture-upload" name="gypGgxtJbgg"
							id="gypGgxtJbgg" type="text"
							value="${originaldataEntity.gypGgxtJbgg }" placeholder="�ֲ����..." />
						<span class="input-group-addon"> <i
							class="fa fa-file-image-o bigger-110"></i>
						</span>
					</div>
				</div>
			</div>

			<!-- 9-���ӽ�ͼ��ͼ��===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypDstTp">����ͼ-ͼƬ </label>
				<div class="col-sm-9">
					<div class="input-group">
						<input class="form-control picture-upload" name="gypDstTp"
							id="gypDstTp" type="text" value="${originaldataEntity.gypDstTp }"
							placeholder="����ͼ-ͼƬ ..." /> <span class="input-group-addon">
							<i class="fa fa-file-image-o bigger-110"></i>
						</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypDstSst">����ͼ-����ͼ(��Ƶ)</label>
				<div class="col-sm-9">
					<div class="input-group">
						<input class="form-control media-upload" name="gypDstSst"
							id="gypDstSst" type="text"
							value="${originaldataEntity.gypDstSst }"
							placeholder="����ͼ-����ͼ(��Ƶ) ..." /> <span class="input-group-addon">
							<i class="fa fa-file-video-o bigger-110"></i>
						</span>
					</div>
				</div>
			</div>
			<!-- 9-���ӽ�ͼ��ͼ��===End=== -->

			<!-- 10-���մ�����===Start=== -->
			<%-- <div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypCcx">������</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<select class="form-control" id="gypCcx" name="gypCcx"
						style="width: 100%" required>
						<c:if test="${empty originaldataEntity}">
						<option value="" selected="selected">ѡ�񴫳���</option>
						</c:if>
						<c:forEach var="item" items="${ccrList }">
							<option value="${item.id }"
								<c:if test="${originaldataEntity.gypCcx eq item.id}">selected="selected"</c:if>>${item.cXm }</option>
						</c:forEach>
					</select>
				</div>
				</div>
			</div> --%>
			<!-- 10-���մ�����===End=== -->

			<!-- 11-��������===Start=== -->
			<%-- <div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypZzgjCggj">��������-�ֹ�����</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="gypZzgjCggj" id="gypZzgjCggj" type="text"
						value="${originaldataEntity.gypZzgjCggj }" placeholder="��������-���湤�� ..." required/>
				</div>
				</div>
			</div> --%>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypZzgjCggj">��������-�ֹ�����</label>
				<div class="col-sm-9">
					<div class="input-group">
						<input class="form-control picture-upload" name="gypZzgjCggj"
							id="gypZzgjCggj" type="text"
							value="${originaldataEntity.gypZzgjCggj }"
							placeholder="��������-�ֹ�����..." /> <span class="input-group-addon">
							<i class="fa fa-file-image-o bigger-110"></i>
						</span>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypZzgjZygj">��������-���ֹ�����</label>
				<div class="col-sm-9">
					<div class="input-group">
						<input class="form-control picture-upload" name="gypZzgjZygj"
							id="gypZzgjZygj" type="text"
							value="${originaldataEntity.gypZzgjZygj }"
							placeholder="��������-���ֹ�����..." /> <span class="input-group-addon">
							<i class="fa fa-file-image-o bigger-110"></i>
						</span>
					</div>
				</div>
			</div>
			<!-- 11-��������===End=== -->

			<!-- 12-��������===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypZzclCz">�������ϲ���</label>
				<div class="col-sm-9">
					<div class="checkbox">
						<label> <input class="ace" name="gypZzclCz" id="gypZzclCz"
							type="checkbox" value="����"
							${originaldataEntity.gypZzclCz eq "����"?"checked":""} required />
							<span class="lbl">����</span>
						</label> <label> <input class="ace" name="gypZzclCz"
							id="gypZzclCz" type="checkbox" value="ʯ�ġ���ʯ"
							${originaldataEntity.gypZzclCz eq "ʯ�ġ���ʯ"?"checked":""} required />
							<span class="lbl">ʯ�ġ���ʯ</span>
						</label> <label> <input class="ace" name="gypZzclCz"
							id="gypZzclCz" type="checkbox" value="Ƥ��ë"
							${originaldataEntity.gypZzclCz eq "Ƥ��ë"?"checked":""} required />
							<span class="lbl">Ƥ��ë</span>
						</label> <label> <input class="ace" name="gypZzclCz"
							id="gypZzclCz" type="checkbox" value="�ǡ���"
							${originaldataEntity.gypZzclCz eq "�ǡ���"?"checked":""} required />
							<span class="lbl">�ǡ���</span>
						</label>
						<%-- <label>
						<input class="ace" name="gypZzclCz" id="gypZzclCz" type="checkbox" value="����" ${originaldataEntity.gypZzclCz eq "����"?"checked":""} required/>
						<span class="lbl">����</span>
					</label> --%>
						<%-- <label>
						<input class="ace" name="gypZzclCz" id="gypZzclCz" type="checkbox" value="�顢��" ${originaldataEntity.gypZzclCz eq "�顢��"?"checked":""} required/>
						<span class="lbl">�顢��</span>
					</label> --%>
						<label> <input class="ace" name="gypZzclCz" id="gypZzclCz"
							type="checkbox" value="ľ��"
							${originaldataEntity.gypZzclCz eq "ľ��"?"checked":""} required />
							<span class="lbl">ľ��</span>
						</label> <label> <input class="ace" name="gypZzclCz"
							id="gypZzclCz" type="checkbox" value="����"
							${originaldataEntity.gypZzclCz eq "����"?"checked":""} required />
							<span class="lbl">����</span>
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypZzclClmc">����������Ƭ</label>
				<div class="col-sm-9">
					<div class="input-group">
						<input class="form-control picture-upload" name="gypZzclClmc"
							id="gypZzclClmc" type="text"
							value="${originaldataEntity.gypZzclClmc }"
							placeholder="������������ ..." /> <span class="input-group-addon">
							<i class="fa fa-file-image-o bigger-110"></i>
						</span>
					</div>
				</div>
			</div>
			<!-- 12-��������===End=== -->

			<!-- 13-ʹ�ó��ϼ���������===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypSygnSych">ʹ�ó���</label>
				<div class="col-sm-9">
					<div class="checkbox">
						<label> <input class="ace" name="gypSygnSych"
							id="gypSygnSych" type="checkbox" value="�ճ�ʹ��"
							${originaldataEntity.gypSygnSych eq "�ճ�ʹ��"?"checked":""} required />
							<span class="lbl">�ճ�ʹ��</span>
						</label> <label> <input class="ace" name="gypSygnSych"
							id="gypSygnSych" type="checkbox" value="�ڽ������"
							${originaldataEntity.gypSygnSych eq "�ڽ������"?"checked":""}
							required /> <span class="lbl">�ڽ������</span>
						</label> <label> <input class="ace" name="gypSygnSych"
							id="gypSygnSych" type="checkbox" value="��������"
							${originaldataEntity.gypSygnSych eq "��������"?"checked":""} required />
							<span class="lbl">��������</span>
						</label> <label> <input class="ace" name="gypSygnSych"
							id="gypSygnSych" type="checkbox" value="�ش����"
							${originaldataEntity.gypSygnSych eq "�ش����"?"checked":""} required />
							<span class="lbl">�ش����</span>
						</label> <label> <input class="ace" name="gypSygnSych"
							id="gypSygnSych" type="checkbox" value="����"
							${originaldataEntity.gypSygnSych eq "����"?"checked":""} required />
							<span class="lbl">����</span>
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypSygnSysp">ʹ����Ƶ</label>
				<div class="col-sm-9">
					<div class="input-group">
						<input class="form-control media-upload" name="gypSygnSysp"
							id="gypSygnSysp" type="text"
							value="${originaldataEntity.gypSygnSysp }" placeholder="ʹ����Ƶ ..." />
						<span class="input-group-addon"> <i
							class="fa fa-file-video-o bigger-110"></i>
						</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypSygnSyyp">ʹ����Ƶ</label>
				<div class="col-sm-9">
					<div class="input-group">
						<input class="form-control media-upload" name="gypSygnSyyp"
							id="gypSygnSyyp" type="text"
							value="${originaldataEntity.gypSygnSyyp }" placeholder="ʹ����Ƶ ..." />
						<span class="input-group-addon"> <i
							class="fa fa-file-video-o bigger-110"></i>
						</span>
					</div>
				</div>
			</div>
			<!-- 13-ʹ�ó��ϼ���������===End=== -->

			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypZzlcZzsp">��������-������Ƶ</label>
				<div class="col-sm-9">
					<div class="input-group">
						<input class="form-control media-upload" name="gypZzlcZzsp"
							id="gypZzlcZzsp" type="text"
							value="${originaldataEntity.gypZzlcZzsp }"
							placeholder="��������-������Ƶ ..." /> <span class="input-group-addon">
							<i class="fa fa-file-video-o bigger-110"></i>
						</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypZzlcZzyp">��������-������Ƶ</label>
				<div class="col-sm-9">
					<div class="input-group">
						<input class="form-control media-upload" name="gypZzlcZzyp"
							id="gypZzlcZzyp" type="text"
							value="${originaldataEntity.gypZzlcZzyp }"
							placeholder="��������-������Ƶ ..." /> <span class="input-group-addon">
							<i class="fa fa-file-video-o bigger-110"></i>
						</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypSycsCssp">��˵��Ƶ</label>
				<div class="col-sm-9">
					<div class="input-group">
						<input class="form-control media-upload" name="gypSycsCssp"
							id="gypSycsCssp" type="text"
							value="${originaldataEntity.gypSycsCssp }" placeholder="��˵��Ƶ..." />
						<span class="input-group-addon"> <i
							class="fa fa-file-video-o bigger-110"></i>
						</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypSycsCsyp">��˵��Ƶ</label>
				<div class="col-sm-9">
					<div class="input-group">
						<input class="form-control media-upload" name="gypSycsCsyp"
							id="gypSycsCsyp" type="text"
							value="${originaldataEntity.gypSycsCsyp }" placeholder="��˵��Ƶ..." />
						<span class="input-group-addon"> <i
							class="fa fa-file-video-o bigger-110"></i>
						</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypDyrXm">����������</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="gypDyrXm" id="gypDyrXm"
							type="text" value="${originaldataEntity.gypDyrXm }"
							placeholder="����������..." required />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypDyrLxfs">��������ϵ��ʽ</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="gypDyrLxfs" id="gypDyrLxfs"
							type="text" value="${originaldataEntity.gypDyrLxfs }"
							placeholder="��������ϵ��ʽ..." onblur="checkTel('gypDyrLxfs')" maxlength="20"/>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypDyrDw">�����˵�λ</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="gypDyrDw" id="gypDyrDw"
							type="text" value="${originaldataEntity.gypDyrDw }"
							placeholder="�����˵�λ..." maxlength="20" />
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypDyrWzzlr">��������������</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="gypDyrWzzlr" id="gypDyrWzzlr"
							type="text" value="${originaldataEntity.gypDyrWzzlr}"
							placeholder="��������������..." maxlength="10" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypDyrTpclr">ͼƬ����������</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="gypDyrTpclr" id="gypDyrTpclr"
							type="text" value="${originaldataEntity.gypDyrTpclr}"
							placeholder="ͼƬ����������..." maxlength="10" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypDyrSpclr">��Ƶ����������</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="gypDyrSpclr" id="gypDyrSpclr"
							type="text" value="${originaldataEntity.gypDyrSpclr}"
							placeholder="��Ƶ����������..." maxlength="10" />
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right"
					for="gypDyrTbsj">���ʱ��</label>
				<div class="col-sm-9">
					<div class="input-group">
						<input class="form-control form_datetime" name="gypDyrTbsj"
							id="gypDyrTbsj" type="text" placeholder="���ʱ��..."
							value="<fmt:formatDate value="${originaldataEntity.gypDyrTbsj}" type="date"/>"
							required /> <span class="input-group-addon"> <i
							class="fa fa-calendar bigger-110"></i>
						</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypBz">��ע</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="gypBz" id="gypBz" type="text"
							value="${originaldataEntity.gypBz }" placeholder="��ע..."
							maxlength="50" />
					</div>
				</div>
			</div>
		</form>
		<div class="hr hr-dotted"></div>
	</div>
</div>
<div class="center">
	<button id="btnAdd" type="button"
		onclick="javascript:$('#originaldataForm').submit();"
		class="btn btn-success btn-sm">
		<i class="fa fa-user-plus"></i>&nbsp;
		<c:if test="${empty originaldataEntity}">
		���
		</c:if>
		<c:if test="${!empty originaldataEntity}">
		����
		</c:if>
	</button>
	<button id="btn" type="button"
<%--		onclick="webside.common.loadPage('/originaldata/treelistUI.html<c:if test="${!empty originaldataEntity}">?page=${page.pageNum }&rows=${page.pageSize }&sidx=${page.orderByColumn }&sord=${page.orderByType }</c:if>')"--%>
			onclick="webside.common.loadPage('/originaldata/dtreelistUI.html')"
		class="btn btn-info btn-sm">
		<i class="fa fa-undo"></i>&nbsp;����
	</button>
</div>