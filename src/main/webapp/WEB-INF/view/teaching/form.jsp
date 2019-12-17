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
	src="${ctx }/resources/js/customer/teaching/form.js"></script>
<script type="text/javascript"
	src="${ctx }/resources/js/distpicker/distpicker.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/dlshouwen.grid.v1.2.1/i18n/zh-cn.js"></script>
	
<!-- 复选框：教学类型：鞍马类、服装及配饰类、毡庐类、餐饮类、游乐类、宗教类、其它 -->
<script type="text/javascript">
    var boxObj = document.getElementsByName("jxLx");  //获取所有的复选框
    var payment = "${teachingVideoEntity.jxLx}"; //用el表达式获取在控制层存放的复选框的值为字符串类型
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

<!-- 复选框：授课语种 -->
<script type="text/javascript">
    var boxObj = document.getElementsByName("jxYz");  //获取所有的复选框
    var payment = "${teachingVideoEntity.jxYz}"; //用el表达式获取在控制层存放的复选框的值为字符串类型
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


<script type="text/javascript">
	function checkTel() { //手机号码格式验证
		var value = document.getElementById("jxLxdh").value;
		RegularExp=/^[0-9]{11}$/;
		if (RegularExp.test(value)) {
			return true;
		} else {
			alert("手机号格式不正确！应该为11位长度的数字,或固话前应有区号");
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
		新增教学视频
		</c:if>
		<c:if test="${!empty teachingVideoEntity}">
		编辑教学视频
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
			
			<!-- 教学类型：鞍马类、服装及配饰类、毡庐类、餐饮类、游乐类、宗教类、其它===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxLx">教学类型</label>
				<div class="col-sm-9">
					<div class="checkbox">
						<label> <input class="ace" name="jxLx" id="jxLx"
							type="checkbox" value="鞍马类"
							${teachingVideoEntity.jxLx eq "鞍马类"?"checked":""} required /> <span
							class="lbl">鞍马类</span>
						</label> <label> <input class="ace" name="jxLx" id="jxLx"
							type="checkbox" value="服装及配饰类"
							${teachingVideoEntity.jxLx eq "服装及配饰类"?"checked":""} required />
							<span class="lbl">服装及配饰类</span>
						</label> <label> <input class="ace" name="jxLx" id="jxLx"
							type="checkbox" value="毡庐类"
							${teachingVideoEntity.jxLx eq "毡庐类"?"checked":""} required /> <span
							class="lbl">毡庐类</span>
						</label> <label> <input class="ace" name="jxLx" id="jxLx"
							type="checkbox" value="餐饮类"
							${teachingVideoEntity.jxLx eq "餐饮类"?"checked":""} required /> <span
							class="lbl">餐饮类</span>
						</label> <label> <input class="ace" name="jxLx" id="jxLx"
							type="checkbox" value="游乐类"
							${teachingVideoEntity.jxLx eq "游乐类"?"checked":""} required /> <span
							class="lbl">游乐类</span>
						</label> <label> <input class="ace" name="jxLx" id="jxLx"
							type="checkbox" value="宗教类"
							${teachingVideoEntity.jxLx eq "宗教类"?"checked":""} required /> <span
							class="lbl">宗教类</span>
						</label> <label> <input class="ace" name="jxLx" id="jxLx"
							type="checkbox" value="其它"
							${teachingVideoEntity.jxLx eq "其它"?"checked":""} required /> <span
							class="lbl">其它</span>
						</label>
					</div>
				</div>
			</div>
			<!-- 教学类型：鞍马类、服装及配饰类、毡庐类、餐饮类、游乐类、宗教类、其它===End=== -->
			
			<!-- 教师姓名===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxJsxm">教师姓名</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxJsxm" id="jxJsxm" type="text"
							value="${teachingVideoEntity.jxJsxm }" placeholder="教师姓名..."
							maxlength="50" required />
					</div>
				</div>
			</div>
			<!-- 教师姓名===End=== -->
			
			<!-- 教师性别===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxJsxb">教师性别</label>
				<div class="col-sm-9">
					<div class="radio">
						<label> <input class="ace" name="jxJsxb" id="jxJsxb"
							type="radio" value="男"
							${teachingVideoEntity.jxJsxb eq "男"?"checked":""} required/> <span
							class="lbl">男</span>
						</label> <label> <input class="ace" name="jxJsxb" id="jxJsxb"
							type="radio" value="女"
							${teachingVideoEntity.jxJsxb eq "女"?"checked":""} required/> <span
							class="lbl">女</span>
						</label>
					</div>
				</div>
			</div>
			<!-- 教师性别===End=== -->
			
			<!-- 教师民族===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxJsmz">教师民族</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxJsmz" id="jxJsmz" type="text"
							value="${teachingVideoEntity.jxJsmz }" placeholder="教师民族..."
							maxlength="4" required/>
					</div>
				</div>
			</div>
			<!-- 教师民族===End=== -->
			
			<!-- 教师出生年月===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxCsny">教师出生日期</label>
				<div class="col-sm-9">
					<div class="input-group">
						<input class="form-control form_datetime" name="jxCsny"
							id="jxCsny" type="text" placeholder="教师出生年月..."
							value="<fmt:formatDate value="${teachingVideoEntity.jxCsny}" type="date"/>" required/>
						<span class="input-group-addon"> <i
							class="fa fa-calendar bigger-110"></i>
						</span>
					</div>
				</div>
			</div>
			<!-- 教师出生年月===End=== -->
			
			<!-- 文化程度===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxWhcd">文化程度</label>
				<div class="col-sm-9">
				<div class="clearfix">
					<input class="form-control" name="jxWhcd" id="jxWhcd" type="text"
						value="${teachingVideoEntity.jxWhcd }" placeholder="文化程度..." maxlength="10" required/>
				</div>
				</div>
			</div>
			<!-- 文化程度===End=== -->
			
			<!-- 籍贯===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxJg">教师籍贯</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxJg" id="jxJg" type="text"
							value="${teachingVideoEntity.jxJg }" placeholder="教师籍贯..."
							maxlength="50" required />
					</div>
				</div>
			</div>
			<!-- 籍贯===End=== -->
			
			<!-- 联系电话===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxLxdh">联系电话</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxLxdh" id="jxLxdh" type="text"
							value="${teachingVideoEntity.jxLxdh }" placeholder="联系电话..."
							 onblur="checkTel()" required/>
					</div>
				</div>
			</div>
			<!-- 联系电话===End=== -->
			
			<!-- 学术头衔===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxXstx">学术头衔</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxXstx" id="jxXstx" type="text"
							value="${teachingVideoEntity.jxXstx }" placeholder="学术头衔..." maxlength="10" />
					</div>
				</div>
			</div>
			<!-- 学术头衔===End=== -->
			
			<!-- 通讯地址===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxTxdz">通讯地址</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxTxdz" id="jxTxdz" type="text"
							value="${teachingVideoEntity.jxTxdz }" placeholder="通讯地址..." maxlength="50" required />
					</div>
				</div>
			</div>
			<!-- 通讯地址===End=== -->
			
			<!-- 照片===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxZp">教师照片</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control picture-upload" name="jxZp" id="jxZp" type="text" 
					value="${teachingVideoEntity.jxZp }" placeholder="教师照片..." />
					<span class="input-group-addon">
						<i class="fa fa-file-image-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<!-- 照片===End=== -->
			
			<!-- 课程名称===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxKcmc">课程名称</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxKcmc" id="jxKcmc" type="text"
							value="${teachingVideoEntity.jxKcmc }" placeholder="课程名称..." maxlength="25" required/>
					</div>
				</div>
			</div>
			<!-- 课程名称===End=== -->
			
			<!-- 授课语种===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxYz">授课语种</label>
				<div class="col-sm-9">
					<div class="checkbox">
						<label> <input class="ace" name="jxYz" id="jxYz" type="checkbox" value="汉语"
							${teachingVideoEntity.jxYz eq "汉语"?"checked":""} required /> <span class="lbl">汉语</span>
						</label> 
						<label> <input class="ace" name="jxYz" id="jxYz" type="checkbox" value="蒙语"
							${teachingVideoEntity.jxYz eq "蒙语"?"checked":""} required /> <span class="lbl">蒙语</span>
						</label> 
						<label> <input class="ace" name="jxYz" id="jxYz" type="checkbox" value="其它"
							${teachingVideoEntity.jxYz eq "其它"?"checked":""} required /> <span class="lbl">其它</span>
						</label> 
					</div>
				</div>
			</div>
			<!-- 授课语种===End=== -->
			
			<!-- 个人简历===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxGrjl">个人简历</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxGrjl" id="jxGrjl" type="text"
							value="${teachingVideoEntity.jxGrjl }" placeholder="个人简历..."
							maxlength="500"  />
					</div>
				</div>
			</div>
			<!-- 个人简历===End=== -->
			
			<!-- 授课场景照片===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxCjzp">授课场景照</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control picture-upload" name="jxCjzp" id="jxCjzp" type="text" 
					value="${teachingVideoEntity.jxCjzp }" placeholder="授课场景照..." />
					<span class="input-group-addon">
						<i class="fa fa-file-image-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<!-- 授课场景照片===End=== -->
			
			<!-- 章节数量(教学视频)===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxZjsl">章节数量</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxZjsl" id="jxZjsl" type="text"
							value="${teachingVideoEntity.jxZjsl }" placeholder="章节数量..."
							maxlength="10" />
					</div>
				</div>
			</div>
			<!-- 章节数量(教学视频)===End=== -->
			
			<!-- 总时长(教学视频)===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxZsc">总时长</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxZsc" id="jxZsc" type="text"
							value="${teachingVideoEntity.jxZsc }" placeholder="总时长..."
							maxlength="10" />
					</div>
				</div>
			</div>
			<!-- 总时长(教学视频)===End=== -->
			
			<!-- 教学视频===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxSp">教学视频</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control media-upload" name="jxSp" id="jxSp" type="text" 
					value="${teachingVideoEntity.jxSp }" placeholder="教学视频 ..." />
					<span class="input-group-addon">
						<i class="fa fa-file-video-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<!-- 教学视频===End=== -->
			
			<!-- 课件内容===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxKj">课件内容</label>
				<div class="col-sm-9">
				<div class="input-group">
					<input class="form-control files-upload" name="jxKj" id="jxKj" type="text" 
					value="${teachingVideoEntity.jxKj }" placeholder="文档测试 ..." />
					<span class="input-group-addon">
						<i class="fa fa-file-o bigger-110"></i>
					</span>
				</div>
				</div>
			</div>
			<!-- 课件内容===End=== -->
			
			<!-- 备注===Start=== -->
			<div class="form-group">
				<label class="control-label col-sm-2 no-padding-right" for="jxBz">备注</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input class="form-control" name="jxBz" id="jxBz" type="text"
							value="${teachingVideoEntity.jxBz }" placeholder="备注..."
							maxlength="50" />
					</div>
				</div>
			</div>
			<!-- 备注===End=== -->
			
		</form>
		<div class="hr hr-dotted"></div>
	</div>
</div>
<div class="center">
	<button id="btnAdd" type="button" onclick="javascript:$('#teachingVideoForm').submit();" class="btn btn-success btn-sm">
		<i class="fa fa-user-plus"></i>&nbsp;
		<c:if test="${empty teachingVideoEntity}">
		添加
		</c:if>
		<c:if test="${!empty teachingVideoEntity}">
		保存
		</c:if>
	</button>

	<button id="btn" type="button"
		onclick="webside.common.loadPage('/teachingVideo/listUI.html<c:if test="${!empty teachingVideoEntity}">?page=${page.pageNum }&rows=${page.pageSize }&sidx=${page.orderByColumn }&sord=${page.orderByType }</c:if>')"
		class="btn btn-info btn-sm">
		<i class="fa fa-undo"></i>&nbsp;返回
	</button>

</div>