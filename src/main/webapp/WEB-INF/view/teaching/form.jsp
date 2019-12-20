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
	src="${ctx }/resources/js/customer/teaching/form.js"></script>
<script type="text/javascript"
	src="${ctx }/resources/js/distpicker/distpicker.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/dlshouwen.grid.v1.2.1/i18n/zh-cn.js"></script>
	
<!-- ��ѡ�򣺽�ѧ���ͣ������ࡢ��װ�������ࡢձ®�ࡢ�����ࡢ�����ࡢ�ڽ��ࡢ���� -->
<script type="text/javascript">
    var boxObj = document.getElementsByName("jxLx");  //��ȡ���еĸ�ѡ��
    var payment = "${teachingVideoEntity.jxLx}"; //��el���ʽ��ȡ�ڿ��Ʋ��ŵĸ�ѡ���ֵΪ�ַ�������
    var pay = payment.split(",");    //ȥ������֮��ķָ��������  
    for(i=0;i<boxObj.length;i++) {
       for(j=0;j<pay.length;j++) {	//���ֵ���޸�ǰ��ֵ���
           if(boxObj[i].value == pay[j]) {
               boxObj[i].checked= true;
               break;
           }
       }
    }          
</script>

<!-- ��ѡ���ڿ����� -->
<script type="text/javascript">
    var boxObj = document.getElementsByName("jxYz");  //��ȡ���еĸ�ѡ��
    var payment = "${teachingVideoEntity.jxYz}"; //��el���ʽ��ȡ�ڿ��Ʋ��ŵĸ�ѡ���ֵΪ�ַ�������
    var pay = payment.split(",");    //ȥ������֮��ķָ��������  
    for(i=0;i<boxObj.length;i++) {
       for(j=0;j<pay.length;j++) {	//���ֵ���޸�ǰ��ֵ���
           if(boxObj[i].value == pay[j]) {
               boxObj[i].checked= true;
               break;
           }
       }
    }
</script>


<script type="text/javascript">
	function checkTel() { //�ֻ������ʽ��֤
		var value = document.getElementById("jxLxdh").value;
		RegularExp=/^[0-9]{11}$/;
		if (RegularExp.test(value)) {
			return true;
		} else {
			alert("�ֻ��Ÿ�ʽ����ȷ��Ӧ��Ϊ11λ���ȵ�����,��̻�ǰӦ������");
			document.getElementById("jxLxdh").value="";
			return false;
		}
	}
</script>

<style>
.iconShow
{
	padding-left: 10px; 
	padding-top: 3px;
}
.source-icon
{
	 width:95%;
	 float:left;
}
@media screen and (max-width: 374px){
	.source-icon
	{
		 width:82%;
	}
}
@media screen and (min-width: 375px) and (max-width: 449px){
	.source-icon
	{
		 width:85%;
	}
}
@media screen and (min-width: 450px) and (max-width: 1279px) {
	.source-icon
	{
		 width:90%;
	}
}
@media screen and (min_width: 1280px) {
	.source-icon
	{
		 width:90%;
	}
}
</style>
<div class="page-header">
	<h1>
		<c:if test="${empty teachingVideoEntity}">
		������ѧ��Ƶ
		</c:if>
		<c:if test="${!empty teachingVideoEntity}">
		�༭��ѧ��Ƶ
		</c:if>
	</h1>
</div>
<div class="row" style="margin-top: 5px;">
	<div class="col-xs-12">
		<form id="teachingVideoForm" name="teachingVideoForm" class="form-horizontal" role="form" method="post" enctype="multipart/form-data">
			<c:if test="${!empty teachingVideoEntity}">
				<input type="hidden" id="pageNum" name="pageNum" value="${page.pageNum }"> 
				<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize }"> 
				<input type="hidden" id="orderByColumn" name="orderByColumn" value="${page.orderByColumn }"> 
				<input type="hidden" id="orderByType" name="orderByType" value="${page.orderByType }">
				<input type="hidden" name="id" id="teachingVideoId" value="${teachingVideoEntity.id }">
			</c:if>
			
			<!-- ��ѧ���ͣ������ࡢ��װ�������ࡢձ®�ࡢ�����ࡢ�����ࡢ�ڽ��ࡢ����===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxLx">��ѧ����</label>
				<div class="col-sm-9">
					<div class="checkbox">
						<label> <input class="ace" name="jxLx" id="jxLx"
							type="checkbox" value="������"
							${teachingVideoEntity.jxLx eq "������"?"checked":""} required /> <span
							class="lbl">������</span>
						</label> <label> <input class="ace" name="jxLx" id="jxLx"
							type="checkbox" value="��װ��������"
							${teachingVideoEntity.jxLx eq "��װ��������"?"checked":""} required />
							<span class="lbl">��װ��������</span>
						</label> <label> <input class="ace" name="jxLx" id="jxLx"
							type="checkbox" value="ձ®��"
							${teachingVideoEntity.jxLx eq "ձ®��"?"checked":""} required /> <span
							class="lbl">ձ®��</span>
						</label> <label> <input class="ace" name="jxLx" id="jxLx"
							type="checkbox" value="������"
							${teachingVideoEntity.jxLx eq "������"?"checked":""} required /> <span
							class="lbl">������</span>
						</label> <label> <input class="ace" name="jxLx" id="jxLx"
							type="checkbox" value="������"
							${teachingVideoEntity.jxLx eq "������"?"checked":""} required /> <span
							class="lbl">������</span>
						</label> <label> <input class="ace" name="jxLx" id="jxLx"
							type="checkbox" value="�ڽ���"
							${teachingVideoEntity.jxLx eq "�ڽ���"?"checked":""} required /> <span
							class="lbl">�ڽ���</span>
						</label> <label> <input class="ace" name="jxLx" id="jxLx"
							type="checkbox" value="����"
							${teachingVideoEntity.jxLx eq "����"?"checked":""} required /> <span
							class="lbl">����</span>
						</label>
					</div>
				</div>
			</div>
			<!-- ��ѧ���ͣ������ࡢ��װ�������ࡢձ®�ࡢ�����ࡢ�����ࡢ�ڽ��ࡢ����===End=== -->
			
			<!-- ��ʦ����===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxJsxm">��ʦ����</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxJsxm" id="jxJsxm" type="text"
							value="${teachingVideoEntity.jxJsxm }" placeholder="��ʦ����..."
							maxlength="50" required />
					</div>
				</div>
			</div>
			<!-- ��ʦ����===End=== -->
			
			<!-- ��ʦ�Ա�===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxJsxb">��ʦ�Ա�</label>
				<div class="col-sm-9">
					<div class="radio">
						<label> <input class="ace" name="jxJsxb" id="jxJsxb"
							type="radio" value="��"
							${teachingVideoEntity.jxJsxb eq "��"?"checked":""} required/> <span
							class="lbl">��</span>
						</label> <label> <input class="ace" name="jxJsxb" id="jxJsxb"
							type="radio" value="Ů"
							${teachingVideoEntity.jxJsxb eq "Ů"?"checked":""} required/> <span
							class="lbl">Ů</span>
						</label>
					</div>
				</div>
			</div>
			<!-- ��ʦ�Ա�===End=== -->
			
			<!-- ��ʦ����===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxJsmz">��ʦ����</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxJsmz" id="jxJsmz" type="text"
							value="${teachingVideoEntity.jxJsmz }" placeholder="��ʦ����..."
							maxlength="4" required/>
					</div>
				</div>
			</div>
			<!-- ��ʦ����===End=== -->
			
			<!-- ��ʦ��������===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxCsny">��ʦ��������</label>
				<div class="col-sm-9">
					<div class="input-group">
						<input class="form-control form_datetime" name="jxCsny"
							id="jxCsny" type="text" placeholder="��ʦ��������..."
							value="<fmt:formatDate value="${teachingVideoEntity.jxCsny}" type="date"/>" required/>
						<span class="input-group-addon"> <i
							class="fa fa-calendar bigger-110"></i>
						</span>
					</div>
				</div>
			</div>
			<!-- ��ʦ��������===End=== -->
			
			<!-- �Ļ��̶�===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxWhcd">�Ļ��̶�</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="jxWhcd" id="jxWhcd" type="text"
						value="${teachingVideoEntity.jxWhcd }" placeholder="�Ļ��̶�..." maxlength="10" required/>
				</div>
				</div>
			</div>
			<!-- �Ļ��̶�===End=== -->
			
			<!-- ����===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxJg">��ʦ����</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxJg" id="jxJg" type="text"
							value="${teachingVideoEntity.jxJg }" placeholder="��ʦ����..."
							maxlength="50" required />
					</div>
				</div>
			</div>
			<!-- ����===End=== -->
			
			<!-- ��ϵ�绰===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxLxdh">��ϵ�绰</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxLxdh" id="jxLxdh" type="text"
							value="${teachingVideoEntity.jxLxdh }" placeholder="��ϵ�绰..."
							 onblur="checkTel()" required/>
					</div>
				</div>
			</div>
			<!-- ��ϵ�绰===End=== -->
			
			<!-- ѧ��ͷ��===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxXstx">ѧ��ͷ��</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxXstx" id="jxXstx" type="text"
							value="${teachingVideoEntity.jxXstx }" placeholder="ѧ��ͷ��..." maxlength="10" />
					</div>
				</div>
			</div>
			<!-- ѧ��ͷ��===End=== -->
			
			<!-- ͨѶ��ַ===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxTxdz">ͨѶ��ַ</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxTxdz" id="jxTxdz" type="text"
							value="${teachingVideoEntity.jxTxdz }" placeholder="ͨѶ��ַ..." maxlength="50" required />
					</div>
				</div>
			</div>
			<!-- ͨѶ��ַ===End=== -->
			
			<!-- ��Ƭ===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxZp">��ʦ��Ƭ</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control picture-upload" name="jxZp" id="jxZp" type="text" 
					value="${teachingVideoEntity.jxZp }" placeholder="��ʦ��Ƭ..." />
					<span class="input-group-addon">
						<i class="fa fa-file-image-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<!-- ��Ƭ===End=== -->
			
			<!-- �γ�����===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxKcmc">�γ�����</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxKcmc" id="jxKcmc" type="text"
							value="${teachingVideoEntity.jxKcmc }" placeholder="�γ�����..." maxlength="25" required/>
					</div>
				</div>
			</div>
			<!-- �γ�����===End=== -->
			
			<!-- �ڿ�����===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxYz">�ڿ�����</label>
				<div class="col-sm-9">
					<div class="checkbox">
						<label> <input class="ace" name="jxYz" id="jxYz" type="checkbox" value="����"
							${teachingVideoEntity.jxYz eq "����"?"checked":""} required /> <span class="lbl">����</span>
						</label> 
						<label> <input class="ace" name="jxYz" id="jxYz" type="checkbox" value="����"
							${teachingVideoEntity.jxYz eq "����"?"checked":""} required /> <span class="lbl">����</span>
						</label> 
						<label> <input class="ace" name="jxYz" id="jxYz" type="checkbox" value="����"
							${teachingVideoEntity.jxYz eq "����"?"checked":""} required /> <span class="lbl">����</span>
						</label> 
					</div>
				</div>
			</div>
			<!-- �ڿ�����===End=== -->
			
			<!-- ���˼���===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxGrjl">���˼���</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxGrjl" id="jxGrjl" type="text"
							value="${teachingVideoEntity.jxGrjl }" placeholder="���˼���..."
							maxlength="500"  />
					</div>
				</div>
			</div>
			<!-- ���˼���===End=== -->
			
			<!-- �ڿγ�����Ƭ===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxCjzp">�ڿγ�����</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control picture-upload" name="jxCjzp" id="jxCjzp" type="text" 
					value="${teachingVideoEntity.jxCjzp }" placeholder="�ڿγ�����..." />
					<span class="input-group-addon">
						<i class="fa fa-file-image-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<!-- �ڿγ�����Ƭ===End=== -->
			
			<!-- �½�����(��ѧ��Ƶ)===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxZjsl">�½�����</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxZjsl" id="jxZjsl" type="text"
							value="${teachingVideoEntity.jxZjsl }" placeholder="�½�����..."
							maxlength="10" />
					</div>
				</div>
			</div>
			<!-- �½�����(��ѧ��Ƶ)===End=== -->
			
			<!-- ��ʱ��(��ѧ��Ƶ)===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxZsc">��ʱ��</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxZsc" id="jxZsc" type="text"
							value="${teachingVideoEntity.jxZsc }" placeholder="��ʱ��..."
							maxlength="10" />
					</div>
				</div>
			</div>
			<!-- ��ʱ��(��ѧ��Ƶ)===End=== -->
			
			<!-- ��ѧ��Ƶ===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxSp">��ѧ��Ƶ</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control media-upload" name="jxSp" id="jxSp" type="text" 
					value="${teachingVideoEntity.jxSp }" placeholder="��ѧ��Ƶ ..." />
					<span class="input-group-addon">
						<i class="fa fa-file-video-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<!-- ��ѧ��Ƶ===End=== -->
			
			<!-- �μ�����===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxKj">�μ�����</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control files-upload" name="jxKj" id="jxKj" type="text" 
					value="${teachingVideoEntity.jxKj }" placeholder="�ĵ����� ..." />
					<span class="input-group-addon">
						<i class="fa fa-file-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<!-- �μ�����===End=== -->
			
			<!-- ��ע===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxBz">��ע</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxBz" id="jxBz" type="text"
							value="${teachingVideoEntity.jxBz }" placeholder="��ע..."
							maxlength="50" />
					</div>
				</div>
			</div>
			<!-- ��ע===End=== -->
			
		</form>
		<div class="hr hr-dotted"></div>
	</div>
</div>
<div class="center">
	<button id="btnAdd" type="button" onclick="javascript:$('#teachingVideoForm').submit();" class="btn btn-success btn-sm">
		<i class="fa fa-user-plus"></i>&nbsp;
		<c:if test="${empty teachingVideoEntity}">
		���
		</c:if>
		<c:if test="${!empty teachingVideoEntity}">
		����
		</c:if>
	</button>

	<button id="btn" type="button"
<%--		onclick="webside.common.loadPage('/teachingVideo/listUI.html<c:if test="${!empty teachingVideoEntity}">?page=${retPage }&rows=${page.pageSize }&sidx=${page.orderByColumn }&sord=${page.orderByType }</c:if>')"--%>
            onclick="webside.common.loadPage('/teachingVideo/detailUI.html?id=${detailsId}')"
            class="btn btn-info btn-sm">

		<i class="fa fa-undo"></i>&nbsp;����
	</button>

</div>