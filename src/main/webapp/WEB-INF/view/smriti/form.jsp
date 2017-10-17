<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<link rel="stylesheet"
	href="${ctx }/resources/js/select2/select2.min.css" />
<script type="text/javascript"
	src="${ctx }/resources/js/select2/select2.min.js"></script>
<script type="text/javascript"
	src="${ctx }/resources/js/select2/zh-CN.js"></script>
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
<script type="text/javascript">	
		$('.number_need').ace_spinner({value:0,min:0,max:10000,step:1, on_sides: true, icon_up:'fa fa-plus smaller-75', icon_down:'fa fa-minus smaller-75', btn_up_class:'btn-success' , btn_down_class:'btn-danger'});
</script>
<script type="text/javascript">
	$(".form_datetime").datepicker({
    	show: true,  
        format: 'yyyy-mm-dd',
        language: 'zh-CN',  
        weekStart: 1,
	    autoclose: true
      });
	$('.picture-upload').bind('focus', function(event) {
		var isLayerOpen =false;
		if(!isLayerOpen){
			var pictureLayer = layer.open({
	            type : 2,
	            scrollbar : false,
	            content : sys.rootPath + '/smriti/pictureuploadUI.html?id='+$(this).attr("id"),
	            area : ['500px', '500px'],
	            maxmin : true,
	            shift : 4,
	            title : '<i class="fa fa-file-image-o"></i>&nbsp;选择图片',
	            success: function(){
	                isLayerOpen=true;
	            },
	            end:function(){
	            	isLayerOpen=false;
	            }
	        });
		}
    });
	$("#cZp").change(function(){
		$("#zp").empty();
		$("#zp").append("<img src=\"${ctx}/media/showPictureById.html?id="+$(this).val()+"\">");
	});
	$('#smritiForm').validate({
        errorElement : 'div',
        errorClass : 'help-block',
        focusInvalid : false,
        ignore : "",
        highlight : function(e) {
            $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
        },
        success : function(e) {
            $(e).closest('.form-group').removeClass('has-error').addClass('has-success');
            $(e).remove();
        },
        errorPlacement : function(error, element) {
            if (element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
                var controls = element.closest('div[class*="col-"]');
                if (controls.find(':checkbox,:radio').length > 1)
                    controls.append(error);
                else
                    error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
            } else if (element.is('.select2')) {
                error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
            } else if (element.is('.chosen-select')) {
                error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
            } else
                error.insertAfter(element.parent());
        },
        submitHandler : function(form) {
            var id = $("#id").val();
            var url = "";
            if (id != undefined) {
                url = '/smriti/edit.html';
            } else {
                url = '/smriti/add.html';
            }
            webside.common.commit('smritiForm', url, '/smriti/listUI.html');
        }
    });
</script>
<div class="page-header">
	<h1>
		<c:if test="${empty ccrEntity}">
		新增传承人
		</c:if>
		<c:if test="${!empty ccrEntity}">
		编辑传承人
		</c:if>
	</h1>
</div>
<div class="row" style="margin-top:5px;">
	<div class="col-xs-12">
		<form id="smritiForm" name="smritiForm" class="form-horizontal" role="form" >
		<c:if test="${!empty ccrEntity}">
			<input type="hidden" id="pageNum" name="pageNum" value="${page.pageNum }">
			<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize }">
			<input type="hidden" id="orderByColumn" name="orderByColumn" value="${page.orderByColumn }">
			<input type="hidden" id="orderByType" name="orderByType" value="${page.orderByType }">
			<input type="hidden" name="id" id="id" value="${ccrEntity.id }">
		</c:if>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cSfzh">身份证号</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cSfzh" id="cSfzh" type="text" 
		           value="${ccrEntity.cSfzh }" placeholder="身份证号..." required/>
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cZsfjh">住宿房间号</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cZsfjh" id="cZsfjh" type="text" 
		           value="${ccrEntity.cZsfjh }" placeholder="住宿房间号..." />
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
				<label class="control-label col-sm-1 no-padding-right" for="cZp">照片</label>
				<div class="col-sm-10">
					<div class="input-group">
						<input class="form-control picture-upload" name="cZp" id="cZp" type="text" 
						value="${ccrEntity.cZp }" placeholder="照片..." required/>
						<span class="input-group-addon">
							<i class="fa fa-file-image-o bigger-110"></i>
						</span>
					</div>
					<div id="zp" class="center">
						<c:if test="${!empty ccrEntity.cZp}">
							<img src="${ctx}/media/showPictureById.html?id=${ccrEntity.cZp }">
						</c:if>
					</div>
				</div>
			</div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cXm">姓名</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cXm" id="cXm" type="text" 
		           value="${ccrEntity.cXm }" placeholder="姓名..." required/>
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cXb">性别</label>
		      <div class="col-sm-10">
					<div class="radio">
					<label>
						<input class="ace" name="cXb" id="cXb" type="radio" value="0" ${ccrEntity.cXb eq "0"?"checked":""} required/>
						<span class="lbl">男</span>
					</label>
					<label>
						<input class="ace" name="cXb" id="cXb" type="radio" value="1" ${ccrEntity.cXb eq "1"?"checked":""} required/>
						<span class="lbl">女</span>
					</label>
					</div>
				</div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cMz">民族</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		      	<input class="form-control" name="cMz" id="cMz" type="text" 
		           value="${ccrEntity.cMz }" placeholder="民族..." required/>
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cCsny">出生年月</label>
		      <div class="col-sm-10">
		      <div class="input-group">
		         <input class="form-control form_datetime" name="cCsny" id="cCsny" type="text" placeholder="出生年月..."
						value="<fmt:formatDate value="${ccrEntity.cCsny}" type="date"/>" required/>
					<span class="input-group-addon">
						<i class="fa fa-calendar bigger-110"></i>
					</span>
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cWhcd">文化程度</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cWhcd" id="cWhcd" type="text" 
		           value="${ccrEntity.cWhcd }" placeholder="文化程度..." required/>
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cJg">籍贯</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cJg" id="cJg" type="text" 
		           value="${ccrEntity.cJg }" placeholder="籍贯..." />
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cLxfs">联系方式</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cLxfs" id="cLxfs" type="text" 
		           value="${ccrEntity.cLxfs }" placeholder="联系方式..." required/>
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cWx">微信</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cWx" id="cWx" type="text" 
		           value="${ccrEntity.cWx }" placeholder="微信..."/>
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cQq">QQ</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cQq" id="cQq" type="text" 
		           value="${ccrEntity.cQq }" placeholder="QQ..."/>
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cDzxx">电子信箱</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cDzxx" id="cDzxx" type="text" 
		           value="${ccrEntity.cDzxx }" placeholder="电子信箱..."/>
		      </div>
		      </div>
		   </div>	
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cYb">邮编</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cYb" id="cYb" type="text" 
		           value="${ccrEntity.cYb }" placeholder="邮编..." />
		      </div>
		      </div>
		   </div>		
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cZy">职业</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cZy" id="cZy" type="text" 
		           value="${ccrEntity.cZy }" placeholder="职业..." required/>
		      </div>
		      </div>
		   </div>	   
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cLxdz">联系地址</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cLxdz" id="cLxdz" type="text" 
		           value="${ccrEntity.cLxdz }" placeholder="联系地址..." required/>
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cGzdz">工作地址</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cGzdz" id="cGzdz" type="text" 
		           value="${ccrEntity.cGzdz }" placeholder="工作地址..." />
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cXytjd">学员推荐地</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <%-- <input class="form-control" name="cXytjd" id="cXytjd" type="text" 
		           value="${ccrEntity.cXytjd }" placeholder="学员推荐地..."/> --%>
		           <select class="form-control" name="cXytjd" id="cXytjd">
		           		<option>---请选择学员推荐地---</option>  
		           		<option value="呼和浩特市" ${ccrEntity.cXytjd eq "呼和浩特市"?"selected":""} >呼和浩特市</option>
		           		<option value="包头市" ${ccrEntity.cXytjd eq "包头市"?"selected":""} >包头市</option>
		           		<option value="乌海市" ${ccrEntity.cXytjd eq "乌海市"?"selected":""} >乌海市</option>
		           		<option value="赤峰市" ${ccrEntity.cXytjd eq "赤峰市"?"selected":""} >赤峰市</option>
		           		<option value="通辽市" ${ccrEntity.cXytjd eq "通辽市"?"selected":""} >通辽市</option>
		           		<option value="鄂尔多斯市" ${ccrEntity.cXytjd eq "鄂尔多斯市"?"selected":""} >鄂尔多斯市</option>
		           		<option value="呼伦贝尔市" ${ccrEntity.cXytjd eq "呼伦贝尔市"?"selected":""} >呼伦贝尔市</option>
		           		<option value="乌兰察布市" ${ccrEntity.cXytjd eq "乌兰察布市"?"selected":""} >乌兰察布市</option>
		           		<option value="巴彦淖尔市" ${ccrEntity.cXytjd eq "巴彦淖尔市"?"selected":""} >巴彦淖尔市</option>
		           		<option value="兴安盟" ${ccrEntity.cXytjd eq "兴安盟"?"selected":""} >兴安盟</option>
		           		<option value="阿拉善盟" ${ccrEntity.cXytjd eq "阿拉善盟"?"selected":""} >阿拉善盟</option>
		           		<option value="锡林郭勒盟" ${ccrEntity.cXytjd eq "锡林郭勒盟"?"selected":""} >锡林郭勒盟</option>
		           </select>
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cTssy">特色手艺</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cTssy" id="cTssy" type="text" 
		           value="${ccrEntity.cTssy }" placeholder="特色手艺..." required/>
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cCyqsn">从业起始年</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cCyqsn" id="cCyqsn" type="text" 
		           value="${ccrEntity.cCyqsn }" placeholder="从业起始年..." required/>
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cFyrd">非遗认定</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cFyrd" id="cFyrd" type="text" 
		           value="${ccrEntity.cFyrd }" placeholder="非遗认定机构、认定时间及证书全称..." required/>
		      </div>
		      </div>
		   </div>
<%-- 		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cSc">师承于</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <select class="form-control" id="cSc" name="cSc"
						style="width: 100%">
						<c:if test="${empty ccrEntity}">
						<option value="" selected="selected">选择师承</option>
						</c:if>
						<c:forEach var="item" items="${ccrList }">
							<option value="${item.id }"
								<c:if test="${ccrEntity.cSc eq item.id}">selected="selected"</c:if>>${item.cXm }</option>
						</c:forEach>
					</select>
		      </div>
		      </div>
		   </div> --%>
		   
<%-- 		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cCc">技艺传承人</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <select class="form-control" id="cCc" name="cCc"
						style="width: 100%">
						<c:if test="${empty ccrEntity}">
						<option value="" selected="selected">选择传承人</option>
						</c:if>
						<c:forEach var="item" items="${ccrList }">
							<option value="${item.id }"
								<c:if test="${ccrEntity.cCc eq item.id}">selected="selected"</c:if>>${item.cXm }</option>
						</c:forEach>
					</select>
		      </div>
		      </div>
		   </div> --%>
		   
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cSc">师承于</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cSc" id="cSc" type="text" 
		           value="${ccrEntity.cSc }" placeholder="师承于..." />
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cScgx">师承关系</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cScgx" id="cScgx" type="text" 
		           value="${ccrEntity.cScgx }" placeholder="师承关系..." />
		      </div>
		      </div>
		   </div>
           <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cXtqsnf">学徒起始年份</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cXtqsnf" id="cXtqsnf" type="text" 
		           value="${ccrEntity.cXtqsnf }" placeholder="学徒起始年份..." />
		      </div>
		      </div>
		   </div>
           <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cLxfsLs">师父联系方式</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cLxfsLs" id="cLxfsLs" type="text" 
		           value="${ccrEntity.cLxfsLs }" placeholder="联系方式..." />
		      </div>
		      </div>
		   </div>
           <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cLxdzLs">师父联系地址</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cLxdzLs" id="cLxdzLs" type="text" 
		           value="${ccrEntity.cLxdzLs }" placeholder="联系地址..." />
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cCcrs">传承人数量</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		      	<input class="form-control number_need" name="cCcrs" id="cCcrs" type="text" 
		           value="${ccrEntity.cCcrs }" placeholder="传承人数量..." />
		      </div>
		      </div>
		   </div>
           <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cXtxm">学徒姓名</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cXtxm" id="cXtxm" type="text" 
		           value="${ccrEntity.cXtxm }" placeholder="学徒姓名..." />
		      </div>
		      </div>
		   </div>
           <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cLxfsXt">学徒联系方式</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cLxfsXt" id="cLxfsXt" type="text" 
		           value="${ccrEntity.cLxfsXt }" placeholder="学徒联系方式..." />
		      </div>
		      </div>
		   </div>
           <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cLxdzXt">学徒联系地址</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cLxdzXt" id="cLxdzXt" type="text" 
		           value="${ccrEntity.cLxdzXt }" placeholder="学徒联系地址..." />
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cZydbzp">主要代表作品</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cZydbzp" id="cZydbzp" type="text" 
		           value="${ccrEntity.cZydbzp }" placeholder="主要代表作品..." required/>
		      </div>
		      </div>
		   </div>
		   
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cHjqk">获奖情况</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cHjqk" id="cHjqk" type="text" 
		           value="${ccrEntity.cHjqk }" placeholder="获奖情况（奖项名称、颁奖机构及时间）..." />
		      </div>
		      </div>
		   </div>
		   
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cQygzs">企业/工作室</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <select class="form-control" id="cQygzs" name="cQygzs"
						style="width: 100%">
						<c:if test="${empty ccrEntity}">
							<option value="" selected="selected">企业/工作室</option>
						</c:if> 
						<c:forEach var="item" items="${qyGzsList }">
							<option value="${item.id }"
								<c:if test="${ccrEntity.cQygzs eq item.id}">selected="selected"</c:if>>${item.qyGzsMc }</option>
						</c:forEach>
						<c:if test="${ccrEntity.cQygzs eq 0}">
							<option value="" selected="selected">企业/工作室</option>
						</c:if>
					</select>
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cBz">备注</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cBz" id="cBz" type="text" 
		           value="${ccrEntity.cBz }" placeholder="备注..."/>
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cGrjl">个人简历</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cGrjl" id="cGrjl" type="text" 
		           value="${ccrEntity.cGrjl }" placeholder="个人简历..." required/>
		      </div>
		      </div>
		   </div>
	   
		</form>
		<div class="hr hr-dotted"></div>
	</div>
</div>
<div class="center">
	<button id="btnAdd" type="button" onclick="javascript:$('#smritiForm').submit();" class="btn btn-success btn-sm">
	  	<i class="fa fa-user-plus"></i>&nbsp;
	  	<c:if test="${empty ccrEntity}">
		添加
		</c:if>
	  	<c:if test="${!empty ccrEntity}">
		保存
		</c:if>
	</button>
		<button id="btn" type="button" onclick="webside.common.loadPage('/smriti/listUI.html<c:if test="${!empty ccrEntity}">?page=${page.pageNum }&rows=${page.pageSize }&sidx=${page.orderByColumn }&sord=${page.orderByType }</c:if>')" class="btn btn-info btn-sm">
		<i class="fa fa-undo"></i>&nbsp;返回
	</button>
</div>