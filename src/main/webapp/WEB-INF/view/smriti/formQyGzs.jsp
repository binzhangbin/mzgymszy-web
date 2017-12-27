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
<script type="text/javascript"
	src="${ctx }/resources/js/select2/checkbox.js"></script>
<script type="text/javascript">
	$(".form_datetime").datepicker({
    	show: true,  
        format: 'yyyy-mm-dd',
        language: 'zh-CN',  
        weekStart: 1,
	    autoclose: true
      });
	$('.number_need').ace_spinner({value:0,min:0,max:10000,step:1, on_sides: true, icon_up:'fa fa-plus smaller-75', icon_down:'fa fa-minus smaller-75', btn_up_class:'btn-success' , btn_down_class:'btn-danger'});
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
                url = '/smriti/editQyGzs.html';
            } else {
                url = '/smriti/addQyGzs.html';
            }
            webside.common.commit('smritiForm', url, '/smriti/listQyGzsUI.html');
        }
    });
</script>

<!-- 复选框：产品来源 -->
<script type="text/javascript">
    var boxObj = document.getElementsByName("qyGzsCply");  //获取所有的复选框
    var payment = "${qyGzsEntity.qyGzsCply}"; //用el表达式获取在控制层存放的复选框的值为字符串类型
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

<!-- 复选框：加工手段 -->
<script type="text/javascript">
    var boxObj = document.getElementsByName("qyGzsJgsd");  //获取所有的复选框
    var payment = "${qyGzsEntity.qyGzsJgsd}"; //用el表达式获取在控制层存放的复选框的值为字符串类型
    var pay = payment.split(",");    //去掉它们之间的分割符“，”  
    for(i=0;i<boxObj.length;i++) {
       for(j=0;j<pay.length;j++) {	//如果值与修改前的值相等
           if(boxObj[i].value == pay[j]) {
               boxObj[i].checked= true;
               break;
           }
       }
    }          
</script>qyGzsJjxy

<!-- 复选框：经济效益 -->
<script type="text/javascript">
    var boxObj = document.getElementsByName("qyGzsJjxy");  //获取所有的复选框
    var payment = "${qyGzsEntity.qyGzsJjxy}"; //用el表达式获取在控制层存放的复选框的值为字符串类型
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

<!-- 复选框：市场规模 -->
<script type="text/javascript">
    var boxObj = document.getElementsByName("qyGzsScgm");  //获取所有的复选框
    var payment = "${qyGzsEntity.qyGzsScgm}"; //用el表达式获取在控制层存放的复选框的值为字符串类型
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

<!-- 复选框：产品销售方式 -->
<script type="text/javascript">
    var boxObj = document.getElementsByName("qyGzsCpxsfs");  //获取所有的复选框
    var payment = "${qyGzsEntity.qyGzsCpxsfs}"; //用el表达式获取在控制层存放的复选框的值为字符串类型
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

<!-- 复选框：产品或服务的竞争优势 -->
<script type="text/javascript">
    var boxObj = document.getElementsByName("qyGzsCpfwjzys");  //获取所有的复选框
    var payment = "${qyGzsEntity.qyGzsCpfwjzys}"; //用el表达式获取在控制层存放的复选框的值为字符串类型
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

<!--手机号和固话校验、邮箱校验-->
<script type="text/javascript">
	function checkTel() {
		var value = document.getElementById("qyGzsBgdh").value;
		RegularExp=/^[0-9]{11}$/;
		if (RegularExp.test(value)) {
			return true;
		} else {
			alert("手机号格式不正确！应该为11位长度的数字,或固话前应有区号");
			document.getElementById("qyGzsBgdh").value="";
			return false;
		}
	}
	function isEmail() {
		var value = document.getElementById("qyGzsYx").value;
		RegularExp = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
		if (RegularExp.test(value)) {
			return true;
		} else {
			alert("邮箱格式不正确！");
			document.getElementById("qyGzsYx").value="";
			return false;
		}
	}
</script>

<div class="page-header">
	<h1>
		<c:if test="${empty qyGzsEntity}">
		新增企业/工作室
		</c:if>
		<c:if test="${!empty qyGzsEntity}">
		编辑企业/工作室
		</c:if>
	</h1>
</div>
<div class="row" style="margin-top: 5px;">
	<div class="col-xs-12">
		<form id="smritiForm" name="smritiForm" class="form-horizontal"
			role="form">
			<c:if test="${!empty qyGzsEntity}">
				<input type="hidden" id="pageNum" name="pageNum"
					value="${page.pageNum }">
				<input type="hidden" id="pageSize" name="pageSize"
					value="${page.pageSize }">
				<input type="hidden" id="orderByColumn" name="orderByColumn"
					value="${page.orderByColumn }">
				<input type="hidden" id="orderByType" name="orderByType"
					value="${page.orderByType }">
				<input type="hidden" name="id" id="id" value="${qyGzsEntity.id }">
			</c:if>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right" for="qyGzsLx">类型</label>
				<div class="col-sm-10">
					<div class="radio">
						<label> <input class="ace" name="qyGzsLx" id="qyGzsLx"
							type="radio" value="0" ${qyGzsEntity.qyGzsLx eq "0"?"checked":""}
							required /> <span class="lbl">企业</span>
						</label> <label> <input class="ace" name="qyGzsLx" id="qyGzsLx"
							type="radio" value="1" ${qyGzsEntity.qyGzsLx eq "1"?"checked":""}
							required /> <span class="lbl">工作室</span>
						</label> <label> （若二者兼有，则选择其一） </label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right" for="qyGzsMc">名称</label>
				<div class="col-sm-10">
					<div class="clearfix">
						<input class="form-control" name="qyGzsMc" id="qyGzsMc"
							type="text" value="${qyGzsEntity.qyGzsMc }" placeholder="名称..."
							required />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right"
					for="qyGzsBgdh">办公电话</label>
				<div class="col-sm-10">
					<div class="clearfix">
						<input class="form-control" name="qyGzsBgdh" id="qyGzsBgdh"
							type="text" value="${qyGzsEntity.qyGzsBgdh }"
							placeholder="办公电话..." onblur="checkTel()" required />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right" for="qyGzsYx">邮箱</label>
				<div class="col-sm-10">
					<div class="clearfix">
						<input class="form-control" name="qyGzsYx" id="qyGzsYx"
							type="text" value="${qyGzsEntity.qyGzsYx }" placeholder="邮箱..."
							onblur="isEmail()" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right"
					for="qyGzsTxdz">通讯地址</label>
				<div class="col-sm-10">
					<div class="clearfix">
						<input class="form-control" name="qyGzsTxdz" id="qyGzsTxdz"
							type="text" value="${qyGzsEntity.qyGzsTxdz }"
							placeholder="通讯地址..." required />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right"
					for="qyGzsJlnf">建立年份</label>
				<div class="col-sm-10">
					<div class="input-group">
						<input class="form-control form_datetime" name="qyGzsJlnf"
							id="qyGzsJlnf" type="text" placeholder="建立年份..."
							value="<fmt:formatDate value="${qyGzsEntity.qyGzsJlnf}" type="date"/>" />
						<span class="input-group-addon"> <i
							class="fa fa-calendar bigger-110"></i>
						</span>
					</div>
				</div>
			</div>



			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right"
					for="qyGzsZgrs">职工人数</label>
				<div class="col-sm-10">
					<div class="clearfix">
						<input class="form-control number_need" name="qyGzsZgrs"
							id="qyGzsZgrs" type="text" value="${qyGzsEntity.qyGzsZgrs }"
							placeholder="职工人数..." required />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right"
					for="qyGzsZyjsryrs">技术人员人数</label>
				<div class="col-sm-10">
					<div class="clearfix">
						<input class="form-control number_need" name="qyGzsZyjsryrs"
							id="qyGzsZyjsryrs" type="text"
							value="${qyGzsEntity.qyGzsZyjsryrs }" placeholder="专业技术人员人数..."
							required />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right"
					for="qyGzsWyZy">网页/主页</label>
				<div class="col-sm-10">
					<div class="clearfix">
						<input class="form-control" name="qyGzsWyZy" id="qyGzsWyZy"
							type="text" value="${qyGzsEntity.qyGzsWyZy }"
							placeholder="网页/主页..." />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right"
					for="qyGzsZycp">主要产品</label>
				<div class="col-sm-10">
					<div class="clearfix">
						<input class="form-control" name="qyGzsZycp" id="qyGzsZycp"
							type="text" value="${qyGzsEntity.qyGzsZycp }"
							placeholder="主要产品..." required />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right"
					for="qyGzsCpzycl">产品主要材料</label>
				<div class="col-sm-10">
					<div class="clearfix">
						<input class="form-control" name="qyGzsCpzycl" id="qyGzsCpzycl"
							type="text" value="${qyGzsEntity.qyGzsCpzycl }"
							placeholder="产品主要材料..." required />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right"
					for="qyGzsCply">产品来源</label>
				<div class="col-sm-10">
					<div class="radio">
						<label><input class="ace" name="qyGzsCply" id="qyGzsCply"  type="checkbox" value="自制" /> <span class="lbl">自制</span></label> 
						<label><input class="ace" name="qyGzsCply" id="qyGzsCply"  type="checkbox" value="代工" /> <span class="lbl">代工</span></label>
						<label><input class="ace" name="qyGzsCply" id="qyGzsCply"  type="checkbox" value="收购" /> <span class="lbl">收购</span></label> 
						<label><input class="ace" name="qyGzsCply" id="qyGzsCply"  type="checkbox" value="其它" /> <span class="lbl">其它</span></label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right"
					for="qyGzsSzdqthsl">同行数量</label>
				<div class="col-sm-10">
					<div class="clearfix">
						<input class="form-control number_need" name="qyGzsSzdqthsl"
							id="qyGzsSzdqthsl" type="text"
							value="${qyGzsEntity.qyGzsSzdqthsl }" placeholder="所在地区同行数量..." />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right" for="qyGzsJgsd">加工手段</label>
				<div class="col-sm-10">
					<div class="radio">
						<label><input class="ace" name="qyGzsJgsd" id="qyGzsJgsd" type="checkbox" value="纯手工" /> <span class="lbl">纯手工</span></label>
						<label><input class="ace" name="qyGzsJgsd" id="qyGzsJgsd" type="checkbox" value="机械制作" /> <span class="lbl">机械制作</span></label>
						<label><input class="ace" name="qyGzsJgsd" id="qyGzsJgsd" type="checkbox" value="手工为主" /> <span class="lbl">手工为主</span></label> 
						<label><input class="ace" name="qyGzsJgsd" id="qyGzsJgsd" type="checkbox" value="机械为主" /> <span class="lbl">机械为主</span></label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right" for="qyGzsJjxy">经济效益</label>
				<div class="col-sm-10">
					<div class="radio">
						<label><input class="ace" name="qyGzsJjxy" id="qyGzsJjxy" type="checkbox" value="盈利" /> <span class="lbl">盈利</span></label>
						<label><input class="ace" name="qyGzsJjxy"	id="qyGzsJjxy" type="checkbox" value="持平" /> <span class="lbl">持平</span></label>
						<label><input class="ace" name="qyGzsJjxy"	id="qyGzsJjxy" type="checkbox" value="亏损" /> <span class="lbl">亏损</span></label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right" for="qyGzsScgm">市场规模</label>
				<div class="col-sm-10">
					<div class="radio">
						<label> <input class="ace" name="qyGzsScgm" id="qyGzsScgm" type="checkbox" value="大型" /> <span class="lbl">大型</span></label>
						<label> <input class="ace" name="qyGzsScgm"	id="qyGzsScgm" type="checkbox" value="中型" /> <span class="lbl">中型</span></label>
						<label> <input class="ace" name="qyGzsScgm" id="qyGzsScgm" type="checkbox" value="小型" /> <span class="lbl">小型</span></label>
						<label> <input class="ace" name="qyGzsScgm" id="qyGzsScgm" type="checkbox" value="微型" /> <span class="lbl">微型</span></label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right" for="qyGzsCpxsfs">产品销售方式</label>
				<div class="col-sm-10">
					<div class="radio">
						<label><input class="ace" name="qyGzsCpxsfs" id="qyGzsCpxsfs" type="checkbox" value="店铺专卖" /><span class="lbl">店铺专卖</span></label>
						<label><input class="ace" name="qyGzsCpxsfs" id="qyGzsCpxsfs" type="checkbox" value="旅游点专售" /><span class="lbl">旅游点专售</span></label>
						<label><input class="ace" name="qyGzsCpxsfs" id="qyGzsCpxsfs" type="checkbox" value="前店后厂" /><span class="lbl">前店后厂</span></label>
						<label><input class="ace" name="qyGzsCpxsfs" id="qyGzsCpxsfs" type="checkbox" value="网络" /><span class="lbl">网络</span></label>
						<label><input class="ace" name="qyGzsCpxsfs" id="qyGzsCpxsfs" type="checkbox" value="代理" /><span class="lbl">代理</span></label>
						<label><input class="ace" name="qyGzsCpxsfs" id="qyGzsCpxsfs" type="checkbox" value="其它" /><span class="lbl">其它</span></label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right" for="qyGzsCpfwjzys">竞争优势</label>
				<div class="col-sm-10">
					<div class="radio">
						<label><input class="ace" name="qyGzsCpfwjzys" id="qyGzsCpfwjzys" type="checkbox" value="设计" /><span class="lbl">设计</span></label>
						<label><input class="ace" name="qyGzsCpfwjzys" id="qyGzsCpfwjzys" type="checkbox" value="工艺" /><span class="lbl">工艺</span></label>
						<label><input class="ace" name="qyGzsCpfwjzys" id="qyGzsCpfwjzys" type="checkbox" value="技术" /><span class="lbl">技术</span></label>
						<label><input class="ace" name="qyGzsCpfwjzys" id="qyGzsCpfwjzys" type="checkbox" value="价格" /><span class="lbl">价格</span></label>
						<label><input class="ace" name="qyGzsCpfwjzys" id="qyGzsCpfwjzys" type="checkbox" value="品牌" /><span class="lbl">品牌</span></label>
						<label><input class="ace" name="qyGzsCpfwjzys" id="qyGzsCpfwjzys" type="checkbox" value="其它" /><span class="lbl">其它</span></label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right"
					for="qyGzsQyjj">企业简介</label>
				<div class="col-sm-10">
					<div class="clearfix">
						<input class="form-control" name="qyGzsQyjj" id="qyGzsQyjj"
							type="text" value="${qyGzsEntity.qyGzsQyjj }"
							placeholder="企业简介..." />
					</div>
				</div>
			</div>
		</form>
		<div class="hr hr-dotted"></div>
	</div>
</div>
<div class="center">
	<button id="btnAdd" type="button"
		onclick="javascript:$('#smritiForm').submit();"
		class="btn btn-success btn-sm">
		<i class="fa fa-user-plus"></i>&nbsp;
		<c:if test="${empty qyGzsEntity}">
		添加
		</c:if>
		<c:if test="${!empty qyGzsEntity}">
		保存
		</c:if>
	</button>
	<button id="btn" type="button"
		onclick="webside.common.loadPage('/smriti/listQyGzsUI.html<c:if test="${!empty qyGzsEntity}">?page=${page.pageNum }&rows=${page.pageSize }&sidx=${page.orderByColumn }&sord=${page.orderByType }</c:if>')"
		class="btn btn-info btn-sm">
		<i class="fa fa-undo"></i>&nbsp;返回
	</button>
</div>