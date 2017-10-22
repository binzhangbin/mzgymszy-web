<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
<!-- 复选框：样品采集收藏地：个人、公司、馆藏、其它 -->
<script type="text/javascript">
    var boxObj = document.getElementsByName("gypScdDw");  //获取所有的复选框
    var payment = "${originaldataEntity.gypScdDw}"; //用el表达式获取在控制层存放的复选框的值为字符串类型
    var pay = payment.split(",");    //去掉它们之间的分割符“，”  
    for(i=0;i<boxObj.length;i++) {
       for(j=0;j<pay.length;j++) {	//如果值与修改前的值相等
           if(boxObj[i].value == pay[j]) {
               boxObj[i].checked= true;
               break;
           }
       }
    }          
</script>

<!-- 复选框：样品曾使用者身份：贵族、平民、僧侣、不详 -->
<script type="text/javascript">
    var boxObj = document.getElementsByName("gypCyzSf");  //获取所有的复选框
    var payment = "${originaldataEntity.gypCyzSf}"; //用el表达式获取在控制层存放的复选框的值为字符串类型
    var pay = payment.split(",");    //去掉它们之间的分割符“，”  
    for(i=0;i<boxObj.length;i++) {
       for(j=0;j<pay.length;j++) {	//如果值与修改前的值相等
           if(boxObj[i].value == pay[j]) {
               boxObj[i].checked= true;
               break;
           }
       }
    }          
</script>

<!-- 复选框：装饰情况及其简要描述：刺绣、印染、镶嵌、雕刻、包边、缝制花边、宝石、其它装饰方式 -->
<script type="text/javascript">
    var boxObj = document.getElementsByName("gypZsZsfs");  //获取所有的复选框
    var payment = "${originaldataEntity.gypZsZsfs}"; //用el表达式获取在控制层存放的复选框的值为字符串类型
    var pay = payment.split(",");    //去掉它们之间的分割符“，”  
    for(i=0;i<boxObj.length;i++) {
       for(j=0;j<pay.length;j++) {	//如果值与修改前的值相等
           if(boxObj[i].value == pay[j]) {
               boxObj[i].checked= true;
               break;
           }
       }
    }          
</script>

<!-- 复选框：装饰情况及其简要描述-主要图案：植物花卉、动物、自然、几何、文字、宗教信仰、其它 -->
<script type="text/javascript">
    var boxObj = document.getElementsByName("gypZsZta");  //获取所有的复选框
    var payment = "${originaldataEntity.gypZsZta}"; //用el表达式获取在控制层存放的复选框的值为字符串类型
    var pay = payment.split(",");    //去掉它们之间的分割符“，”  
    for(i=0;i<boxObj.length;i++) {
       for(j=0;j<pay.length;j++) {	//如果值与修改前的值相等
           if(boxObj[i].value == pay[j]) {
               boxObj[i].checked= true;
               break;
           }
       }
    }          
</script>

<!-- 复选框：制作材料-12：金属、石材、宝石、皮、毛、骨、角、木材、其它 -->
<script type="text/javascript">
    var boxObj = document.getElementsByName("gypZzclCz");  //获取所有的复选框
    var payment = "${originaldataEntity.gypZzclCz}"; //用el表达式获取在控制层存放的复选框的值为字符串类型
    var pay = payment.split(",");    //去掉它们之间的分割符“，”  
    for(i=0;i<boxObj.length;i++) {
       for(j=0;j<pay.length;j++) {	//如果值与修改前的值相等
           if(boxObj[i].value == pay[j]) {
               boxObj[i].checked= true;
               break;
           }
       }
    }          
</script>

<!-- 复选框：使用场合及功能描述-13：日常使用、宗教信仰活动、民俗礼仪、重大节日、其它 -->
<script type="text/javascript">
    var boxObj = document.getElementsByName("gypSygnSych");  //获取所有的复选框
    var payment = "${originaldataEntity.gypSygnSych}"; //用el表达式获取在控制层存放的复选框的值为字符串类型
    var pay = payment.split(",");    //去掉它们之间的分割符“，”  
    for(i=0;i<boxObj.length;i++) {
       for(j=0;j<pay.length;j++) {	//如果值与修改前的值相等
           if(boxObj[i].value == pay[j]) {
               boxObj[i].checked= true;
               break;
           }
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
		<c:if test="${empty originaldataEntity}">
		新增原始数据
		</c:if>
		<c:if test="${!empty originaldataEntity}">
		编辑原始数据
		</c:if>
	</h1>
</div>
<div class="row" style="margin-top: 5px;">
	<div class="col-xs-12">
		<form id="originaldataForm" name="originaldataForm" class="form-horizontal" role="form" method="post" enctype="multipart/form-data">
			<c:if test="${!empty originaldataEntity}">
				<input type="hidden" id="pageNum" name="pageNum" value="${page.pageNum }"> 
				<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize }"> 
				<input type="hidden" id="orderByColumn" name="orderByColumn" value="${page.orderByColumn }"> 
				<input type="hidden" id="orderByType" name="orderByType" value="${page.orderByType }">
				<input type="hidden" name="id" id="originaldataId" value="${originaldataEntity.id }">
			</c:if>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypFoldId">所属目录</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="gypFoldName" id="gypFoldName" type="text"
						 value="${gypFoldName }" placeholder="请选择所属目录..." required/>
					<input type="hidden" id="gypFoldId" name="gypFoldId" value="${gypFoldId }">
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypBm">编码</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="gypBm" id="gypBm" type="text"
						value="${originaldataEntity.gypBm }" placeholder="编码..." maxlength="20" required/>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypMcZm">主名称</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="gypMcZm" id="gypMcZm" type="text"
						value="${originaldataEntity.gypMcZm }" placeholder="主名称..." maxlength="10" required/>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypMcYm">别名</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="gypMcYm" id="gypMcYm" type="text"
						value="${originaldataEntity.gypMcYm }" placeholder="别名..." maxlength="10"/>
				</div>
				</div>
			</div>
			
			<!-- 4-样品采集收藏地===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypScdDw">收藏地性质</label>
				<div class="col-sm-9">
					<div class="checkbox">
					<%-- <label>
						<input class="ace" name="gypScdDw" id="gypScdDw" type="radio" value="个人" ${originaldataEntity.gypScdDw eq "个人"?"checked":""} required/>
						<span class="lbl">个人</span>
					</label> --%>
					<label>
						<input class="ace" name="gypScdDw" id="gypScdDw" type="checkbox" value="个人" ${originaldataEntity.gypScdDw eq "个人"?"checked":""} required/>
						<span class="lbl">个人</span>
					</label>
					<label>
						<input class="ace" name="gypScdDw" id="gypScdDw" type="checkbox" value="公司" ${originaldataEntity.gypScdDw eq "公司"?"checked":""} required/>
						<span class="lbl">公司</span>
					</label>
					<label>
						<input class="ace" name="gypScdDw" id="gypScdDw" type="checkbox" value="馆藏" ${originaldataEntity.gypScdDw eq "馆藏"?"checked":""} required/>
						<span class="lbl">馆藏</span>
					</label>
					<label>
						<input class="ace" name="gypScdDw" id="gypScdDw" type="checkbox" value="其它" ${originaldataEntity.gypScdDw eq "其它"?"checked":""} required/>
						<span class="lbl">其它</span>
					</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypScdScrxm">样品归属人（地）</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="gypScdScrxm" id="gypScdScrxm" type="text"
						value="${originaldataEntity.gypScdScrxm }" placeholder="归属人（地）..." maxlength="10" required/>
				</div>
				</div>
			</div>
			
			<div class="form-group">
		      <label class="control-label col-sm-2 no-padding-right" for="gypScdDq">样品归属人地区</label>
		      <div class="col-sm-9">
		      <div class="clearfix">
		           <select class="form-control" name="gypScdDq" id="gypScdDq">
		           		<option>---请选择地区---</option>  
		           		<option value="呼和浩特市" ${originaldataEntity.gypScdDq eq "呼和浩特市"?"selected":""} >呼和浩特市</option>
		           		<option value="包头市" ${originaldataEntity.gypScdDq eq "包头市"?"selected":""} >包头市</option>
		           		<option value="乌海市" ${originaldataEntity.gypScdDq eq "乌海市"?"selected":""} >乌海市</option>
		           		<option value="赤峰市" ${originaldataEntity.gypScdDq eq "赤峰市"?"selected":""} >赤峰市</option>
		           		<option value="通辽市" ${originaldataEntity.gypScdDq eq "通辽市"?"selected":""} >通辽市</option>
		           		<option value="鄂尔多斯市" ${originaldataEntity.gypScdDq eq "鄂尔多斯市"?"selected":""} >鄂尔多斯市</option>
		           		<option value="呼伦贝尔市" ${originaldataEntity.gypScdDq eq "呼伦贝尔市"?"selected":""} >呼伦贝尔市</option>
		           		<option value="乌兰察布市" ${originaldataEntity.gypScdDq eq "乌兰察布市"?"selected":""} >乌兰察布市</option>
		           		<option value="巴彦淖尔市" ${originaldataEntity.gypScdDq eq "巴彦淖尔市"?"selected":""} >巴彦淖尔市</option>
		           		<option value="兴安盟" ${originaldataEntity.gypScdDq eq "兴安盟"?"selected":""} >兴安盟</option>
		           		<option value="阿拉善盟" ${originaldataEntity.gypScdDq eq "阿拉善盟"?"selected":""} >阿拉善盟</option>
		           		<option value="锡林郭勒盟" ${originaldataEntity.gypScdDq eq "锡林郭勒盟"?"selected":""} >锡林郭勒盟</option>
		           </select>
		      </div>
		      </div>
		   </div>
			
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypScdLxfs">联系方式</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="gypScdLxfs" id="gypScdLxfs" type="text"
						value="${originaldataEntity.gypScdLxfs }" placeholder="联系方式..." maxlength="20" />
				</div>
				</div>
			</div>
			<%-- <div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypScdScdz">收藏地址</label>
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
				<label class="control-label col-sm-2 no-padding-right" for="gypScdScdz">收藏地址</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="gypScdScdz" id="gypScdScdz" type="text"
						value="${originaldataEntity.gypScdScdz }" placeholder="收藏地址..." maxlength="20" />
				</div>
				</div>
			</div>			
			<%-- <div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypScdSjnd">收集年代</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control form_datetime" name="gypScdSjnd" id="gypScdSjnd" type="text" placeholder="收集年代..."
						value="<fmt:formatDate value="${originaldataEntity.gypScdSjnd}" type="date"/>" required/>
					<span class="input-group-addon">
						<i class="fa fa-calendar bigger-110"></i>
					</span>
				</div>
				</div>
			</div> --%>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypScdSynx">使用年限</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="input-mini" name="gypScdSynx" id="gypScdSynx" type="text"
						value="${originaldataEntity.gypScdSynx }" required/>
				</div>
				</div>
			</div>
			<!-- 4-样品采集收藏地===End=== -->
			
			<!-- 5-样品曾使用者===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypCyzSf">曾用者身份</label>
				<div class="col-sm-9">
				<div class="checkbox">
					<label>
						<input class="ace" name="gypCyzSf" id="gypCyzSf" type="checkbox" value="贵族" ${originaldataEntity.gypCyzSf eq "贵族"?"checked":""} required/>
						<span class="lbl">贵族</span>
					</label>
					<label>
						<input class="ace" name="gypCyzSf" id="gypCyzSf" type="checkbox" value="平民" ${originaldataEntity.gypCyzSf eq "平民"?"checked":""} required/>
						<span class="lbl">平民</span>
					</label>
					<label>
						<input class="ace" name="gypCyzSf" id="gypCyzSf" type="checkbox" value="僧侣" ${originaldataEntity.gypCyzSf eq "僧侣"?"checked":""} required/>
						<span class="lbl">僧侣</span>
					</label>
					<label>
						<input class="ace" name="gypCyzSf" id="gypCyzSf" type="checkbox" value="不祥" ${originaldataEntity.gypCyzSf eq "不祥"?"checked":""} required/>
						<span class="lbl">不祥</span>
					</label>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypCyzMz">曾用者民族</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="gypCyzMz" id="gypCyzMz" type="text"
						value="${originaldataEntity.gypCyzMz }" placeholder="曾用者民族..."  maxlength="4" />
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypCyzXb">曾用者性别</label>
				<div class="col-sm-9">
					<div class="radio">
					<label>
						<input class="ace" name="gypCyzXb" id="gypCyzXb" type="radio" value="男" ${originaldataEntity.gypCyzXb eq "男"?"checked":""} />
						<span class="lbl">男</span>
					</label>					
					<label>
						<input class="ace" name="gypCyzXb" id="gypCyzXb" type="radio" value="女" ${originaldataEntity.gypCyzXb eq "女"?"checked":""} />
						<span class="lbl">女</span>
					</label>
					</div>
				</div>
			</div>
			<!-- 5-样品曾使用者===End=== -->
			
			<!-- 6-样品来源与收藏地===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypLyd">来源地</label>
				<div class="col-sm-9">
				<div data-toggle="distpicker" class="clearfix" required>
				  <c:set var="gypLyd" value="${fn:split(originaldataEntity.gypLyd, '-')}" />
				  <select id="gypLyd-province" <c:if test="${!empty gypScdScdz[0]}">data-province=${gypLyd[0] }</c:if>></select>
				  <select id="gypLyd-city" <c:if test="${!empty gypScdScdz[1]}">data-city=${gypLyd[1] }</c:if>></select>
				  <select id="gypLyd-district" <c:if test="${!empty gypScdScdz[2]}">data-district=${gypLyd[2] }</c:if>></select>
				  <input name="gypLyd" id="gypLyd" type="hidden" value="${originaldataEntity.gypLyd }"/>
				</div>
				</div>
			</div>
			<!-- 6-样品来源与收藏地===End=== -->
			
			<!-- 7-装饰情况及其简要描述===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypZsZsfs">装饰方式</label>
				<div class="col-sm-9">
				<div class="checkbox">				
					<label>
						<input class="ace" name="gypZsZsfs" id="gypZsZsfs" type="checkbox" value="刺绣" ${originaldataEntity.gypZsZsfs eq "刺绣"?"checked":""} required/>
						<span class="lbl">刺绣</span>
					</label>
					<label>
						<input class="ace" name="gypZsZsfs" id="gypZsZsfs" type="checkbox" value="印染" ${originaldataEntity.gypZsZsfs eq "印染"?"checked":""} required/>
						<span class="lbl">印染</span>
					</label>
					<label>
						<input class="ace" name="gypZsZsfs" id="gypZsZsfs" type="checkbox" value="镶嵌" ${originaldataEntity.gypZsZsfs eq "镶嵌"?"checked":""} required/>
						<span class="lbl">镶嵌</span>
					</label>				
					<label>
						<input class="ace" name="gypZsZsfs" id="gypZsZsfs" type="checkbox" value="雕刻" ${originaldataEntity.gypZsZsfs eq "雕刻"?"checked":""} required/>
						<span class="lbl">雕刻</span>
					</label>					
					<label>
						<input class="ace" name="gypZsZsfs" id="gypZsZsfs" type="checkbox" value="包边" ${originaldataEntity.gypZsZsfs eq "包边"?"checked":""} required/>
						<span class="lbl">包边</span>
					</label>
					<label>
						<input class="ace" name="gypZsZsfs" id="gypZsZsfs" type="checkbox" value="缝制花边" ${originaldataEntity.gypZsZsfs eq "缝制花边"?"checked":""} required/>
						<span class="lbl">缝制花边</span>
					</label>					
					<label>
						<input class="ace" name="gypZsZsfs" id="gypZsZsfs" type="checkbox" value="宝石" ${originaldataEntity.gypZsZsfs eq "宝石"?"checked":""} required/>
						<span class="lbl">宝石</span>
					</label>					
					<label>
						<input class="ace" name="gypZsZsfs" id="gypZsZsfs" type="checkbox" value="其它装饰方式" ${originaldataEntity.gypZsZsfs eq "其它装饰方式"?"checked":""} required/>
						<span class="lbl">其它装饰方式</span>
					</label>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypZsZta">装饰-主图案</label>
				<div class="col-sm-9">
				<div class="checkbox">
					<label>
						<input class="ace" name="gypZsZta" id="gypZsZta" type="checkbox" value="植物花卉" ${originaldataEntity.gypZsZta eq "植物花卉"?"checked":""} required/>
						<span class="lbl">植物花卉</span>
					</label>
					<label>
						<input class="ace" name="gypZsZta" id="gypZsZta" type="checkbox" value="动物" ${originaldataEntity.gypZsZta eq "动物"?"checked":""} required/>
						<span class="lbl">动物</span>
					</label>
					<label>
						<input class="ace" name="gypZsZta" id="gypZsZta" type="checkbox" value="自然" ${originaldataEntity.gypZsZta eq "自然"?"checked":""} required/>
						<span class="lbl">自然</span>
					</label>
					<label>
						<input class="ace" name="gypZsZta" id="gypZsZta" type="checkbox" value="几何" ${originaldataEntity.gypZsZta eq "几何"?"checked":""} required/>
						<span class="lbl">几何</span>
					</label>
					<label>
						<input class="ace" name="gypZsZta" id="gypZsZta" type="checkbox" value="文字" ${originaldataEntity.gypZsZta eq "文字"?"checked":""} required/>
						<span class="lbl">文字</span>
					</label>
					<label>
						<input class="ace" name="gypZsZta" id="gypZsZta" type="checkbox" value="宗教信仰" ${originaldataEntity.gypZsZta eq "宗教信仰"?"checked":""} required/>
						<span class="lbl">宗教信仰</span>
					</label>
					<label>
						<input class="ace" name="gypZsZta" id="gypZsZta" type="checkbox" value="其它" ${originaldataEntity.gypZsZta eq "其它"?"checked":""} required/>
						<span class="lbl">其它</span>
					</label>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypZsMs">装饰描述</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="gypZsMs" id="gypZsMs" type="text"
						value="${originaldataEntity.gypZsMs }" placeholder="装饰描述..." maxlength="50" required/>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypZsGjzp">装饰工具照(完整)</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control picture-upload" name="gypZsGjzp" id="gypZsGjzp" type="text" 
					value="${originaldataEntity.gypZsGjzp }" placeholder="装饰工具照片(完整)..." />
					<span class="input-group-addon">
						<i class="fa fa-file-image-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypZsGjzpjb">装饰工具照(局部)</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control picture-upload" name="gypZsGjzpjb" id="gypZsGjzpjb" type="text" 
					value="${originaldataEntity.gypZsGjzpjb }" placeholder="装饰工具照片(局部)..." />
					<span class="input-group-addon">
						<i class="fa fa-file-image-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<!-- 7-装饰情况及其简要描述===End=== -->
			
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypGgxtZtgg">总体规格</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control picture-upload" name="gypGgxtZtgg" id="gypGgxtZtgg" type="text" 
					value="${originaldataEntity.gypGgxtZtgg }" placeholder="总体规格..." />
					<span class="input-group-addon">
						<i class="fa fa-file-image-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypGgxtJbgg">局部规格</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control picture-upload" name="gypGgxtJbgg" id="gypGgxtJbgg" type="text" 
					value="${originaldataEntity.gypGgxtJbgg }" placeholder="局部规格..." />
					<span class="input-group-addon">
						<i class="fa fa-file-image-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			
			<!-- 9-多视角图形图像===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypDstTp">多视图-图片 </label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control picture-upload" name="gypDstTp" id="gypDstTp" type="text" 
					value="${originaldataEntity.gypDstTp }" placeholder="多视图-图片 ..." />
					<span class="input-group-addon">
						<i class="fa fa-file-image-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypDstSst">多视图-三视图(视频)</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control media-upload" name="gypDstSst" id="gypDstSst" type="text" 
					value="${originaldataEntity.gypDstSst }" placeholder="多视图-三视图(视频) ..." />
					<span class="input-group-addon">
						<i class="fa fa-file-video-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<!-- 9-多视角图形图像===End=== -->
			
			<!-- 10-技艺传承人===Start=== -->
			<%-- <div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypCcx">传承人</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<select class="form-control" id="gypCcx" name="gypCcx"
						style="width: 100%" required>
						<c:if test="${empty originaldataEntity}">
						<option value="" selected="selected">选择传承人</option>
						</c:if>
						<c:forEach var="item" items="${ccrList }">
							<option value="${item.id }"
								<c:if test="${originaldataEntity.gypCcx eq item.id}">selected="selected"</c:if>>${item.cXm }</option>
						</c:forEach>
					</select>
				</div>
				</div>
			</div> --%>
			<!-- 10-技艺传承人===End=== -->
			
			<!-- 11-制作工具===Start=== -->
			<%-- <div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypZzgjCggj">制作工具-手工工具</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="gypZzgjCggj" id="gypZzgjCggj" type="text"
						value="${originaldataEntity.gypZzgjCggj }" placeholder="制作工具-常规工具 ..." required/>
				</div>
				</div>
			</div> --%>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypZzgjCggj">制作工具-手工工具</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control picture-upload" name="gypZzgjCggj" id="gypZzgjCggj" type="text" 
					value="${originaldataEntity.gypZzgjCggj }" placeholder="制作工具-手工工具..." />
					<span class="input-group-addon">
						<i class="fa fa-file-image-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypZzgjZygj">制作工具-半手工工具</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control picture-upload" name="gypZzgjZygj" id="gypZzgjZygj" type="text" 
					value="${originaldataEntity.gypZzgjZygj }" placeholder="制作工具-半手工工具..." />
					<span class="input-group-addon">
						<i class="fa fa-file-image-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<!-- 11-制作工具===End=== -->
			
			<!-- 12-制作材料===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypZzclCz">制作材料材质</label>
				<div class="col-sm-9">
				<div class="checkbox">
					<label>
						<input class="ace" name="gypZzclCz" id="gypZzclCz" type="checkbox" value="金属" ${originaldataEntity.gypZzclCz eq "金属"?"checked":""} required/>
						<span class="lbl">金属</span>
					</label>
					<label>
						<input class="ace" name="gypZzclCz" id="gypZzclCz" type="checkbox" value="石材、宝石" ${originaldataEntity.gypZzclCz eq "石材、宝石"?"checked":""} required/>
						<span class="lbl">石材、宝石</span>
					</label>
					<label>
						<input class="ace" name="gypZzclCz" id="gypZzclCz" type="checkbox" value="皮、毛" ${originaldataEntity.gypZzclCz eq "皮、毛"?"checked":""} required/>
						<span class="lbl">皮、毛</span>
					</label>
					<label>
						<input class="ace" name="gypZzclCz" id="gypZzclCz" type="checkbox" value="骨、角" ${originaldataEntity.gypZzclCz eq "骨、角"?"checked":""} required/>
						<span class="lbl">骨、角</span>
					</label>
					<%-- <label>
						<input class="ace" name="gypZzclCz" id="gypZzclCz" type="checkbox" value="布料" ${originaldataEntity.gypZzclCz eq "布料"?"checked":""} required/>
						<span class="lbl">布料</span>
					</label> --%>
					<%-- <label>
						<input class="ace" name="gypZzclCz" id="gypZzclCz" type="checkbox" value="麻、绳" ${originaldataEntity.gypZzclCz eq "麻、绳"?"checked":""} required/>
						<span class="lbl">麻、绳</span>
					</label> --%>
					<label>
						<input class="ace" name="gypZzclCz" id="gypZzclCz" type="checkbox" value="木材" ${originaldataEntity.gypZzclCz eq "木材"?"checked":""} required/>
						<span class="lbl">木材</span>
					</label>
					<label>
						<input class="ace" name="gypZzclCz" id="gypZzclCz" type="checkbox" value="其它" ${originaldataEntity.gypZzclCz eq "其它"?"checked":""} required/>
						<span class="lbl">其它</span>
					</label>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypZzclClmc">制作材料照片</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control picture-upload" name="gypZzclClmc" id="gypZzclClmc" type="text" 
					value="${originaldataEntity.gypZzclClmc }" placeholder="制作材料名称 ..." />
					<span class="input-group-addon">
						<i class="fa fa-file-image-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<!-- 12-制作材料===End=== -->
			
			<!-- 13-使用场合及功能描述===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypSygnSych">使用场合</label>
				<div class="col-sm-9">
				<div class="checkbox">
					<label>
						<input class="ace" name="gypSygnSych" id="gypSygnSych" type="checkbox" value="日常使用" ${originaldataEntity.gypSygnSych eq "日常使用"?"checked":""} required/>
						<span class="lbl">日常使用</span>
					</label>
					<label>
						<input class="ace" name="gypSygnSych" id="gypSygnSych" type="checkbox" value="宗教信仰活动" ${originaldataEntity.gypSygnSych eq "宗教信仰活动"?"checked":""} required/>
						<span class="lbl">宗教信仰活动</span>
					</label>
					<label>
						<input class="ace" name="gypSygnSych" id="gypSygnSych" type="checkbox" value="民俗礼仪" ${originaldataEntity.gypSygnSych eq "民俗礼仪"?"checked":""} required/>
						<span class="lbl">民俗礼仪</span>
					</label>
					<label>
						<input class="ace" name="gypSygnSych" id="gypSygnSych" type="checkbox" value="重大节日" ${originaldataEntity.gypSygnSych eq "重大节日"?"checked":""} required/>
						<span class="lbl">重大节日</span>
					</label>
					<label>
						<input class="ace" name="gypSygnSych" id="gypSygnSych" type="checkbox" value="其它" ${originaldataEntity.gypSygnSych eq "其它"?"checked":""} required/>
						<span class="lbl">其它</span>
					</label>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypSygnSysp">使用视频</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control media-upload" name="gypSygnSysp" id="gypSygnSysp" type="text" 
					value="${originaldataEntity.gypSygnSysp }" placeholder="使用视频 ..." />
					<span class="input-group-addon">
						<i class="fa fa-file-video-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypSygnSyyp">使用音频</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control media-upload" name="gypSygnSyyp" id="gypSygnSyyp" type="text" 
					value="${originaldataEntity.gypSygnSyyp }" placeholder="使用音频 ..." />
					<span class="input-group-addon">
						<i class="fa fa-file-video-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<!-- 13-使用场合及功能描述===End=== -->
			
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypZzlcZzsp">制作流程-制作视频</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control media-upload" name="gypZzlcZzsp" id="gypZzlcZzsp" type="text"
					 value="${originaldataEntity.gypZzlcZzsp }" placeholder="制作流程-制作视频 ..." />
					 <span class="input-group-addon">
						<i class="fa fa-file-video-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypZzlcZzyp">制作流程-制作音频</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control media-upload" name="gypZzlcZzyp" id="gypZzlcZzyp" type="text"
					 value="${originaldataEntity.gypZzlcZzyp }" placeholder="制作流程-制作音频 ..." />
					 <span class="input-group-addon">
						<i class="fa fa-file-video-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypSycsCssp">传说视频</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control media-upload" name="gypSycsCssp" id="gypSycsCssp" type="text" 
					value="${originaldataEntity.gypSycsCssp }" placeholder="传说视频..." />
					<span class="input-group-addon">
						<i class="fa fa-file-video-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypSycsCsyp">传说音频</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control media-upload" name="gypSycsCsyp" id="gypSycsCsyp" type="text"
					 value="${originaldataEntity.gypSycsCsyp }" placeholder="传说音频..." />
					 <span class="input-group-addon">
						<i class="fa fa-file-video-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypDyrXm">调研人姓名</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="gypDyrXm" id="gypDyrXm" type="text"
						value="${originaldataEntity.gypDyrXm }" placeholder="调研人姓名..." maxlength="10" required/>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypDyrLxfs">调研人联系方式</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="gypDyrLxfs" id="gypDyrLxfs" type="text"
						value="${originaldataEntity.gypDyrLxfs }" placeholder="调研人联系方式..." maxlength="10" />
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypDyrDw">调研人单位</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="gypDyrDw" id="gypDyrDw" type="text"
						value="${originaldataEntity.gypDyrDw }" placeholder="调研人单位..." maxlength="20" />
				</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypDyrWzzlr">文字整理人姓名</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="gypDyrWzzlr" id="gypDyrWzzlr" type="text"
						value="${originaldataEntity.gypDyrWzzlr}" placeholder="文字整理人姓名..." maxlength="10" />
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypDyrTpclr">图片处理人姓名</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="gypDyrTpclr" id="gypDyrTpclr" type="text"
						value="${originaldataEntity.gypDyrTpclr}" placeholder="图片处理人姓名..." maxlength="10" />
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypDyrSpclr">视频处理人姓名</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="gypDyrSpclr" id="gypDyrSpclr" type="text"
						value="${originaldataEntity.gypDyrSpclr}" placeholder="视频处理人姓名..." maxlength="10" />
				</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypDyrTbsj">填表时间</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control form_datetime" name="gypDyrTbsj" id="gypDyrTbsj" type="text" placeholder="填表时间..."
						value="<fmt:formatDate value="${originaldataEntity.gypDyrTbsj}" type="date"/>" required/>
					<span class="input-group-addon">
						<i class="fa fa-calendar bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="gypBz">备注</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="gypBz" id="gypBz" type="text"
						value="${originaldataEntity.gypBz }" placeholder="备注..." maxlength="50"/>
				</div>
				</div>
			</div>
		</form>
		<div class="hr hr-dotted"></div>
	</div>
</div>
<div class="center">
	<button id="btnAdd" type="button" onclick="javascript:$('#originaldataForm').submit();" class="btn btn-success btn-sm">
		<i class="fa fa-user-plus"></i>&nbsp;
		<c:if test="${empty originaldataEntity}">
		添加
		</c:if>
		<c:if test="${!empty originaldataEntity}">
		保存
		</c:if>
	</button>
	<button id="btn" type="button"
		onclick="webside.common.loadPage('/originaldata/treelistUI.html<c:if test="${!empty originaldataEntity}">?page=${page.pageNum }&rows=${page.pageSize }&sidx=${page.orderByColumn }&sord=${page.orderByType }</c:if>')"
		class="btn btn-info btn-sm">
		<i class="fa fa-undo"></i>&nbsp;返回
	</button>
</div>