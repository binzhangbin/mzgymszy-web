<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="zh-cn" xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="${ctx }/resources/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx }/resources/fonts/fontawesome/font-awesome.min.css" media="all"/>
<!--[if !IE]><!-->
<script type="text/javascript"
	src="${ctx}/resources/js/jquery/jquery-2.1.4.min.js"></script>
<!--<![endif]-->
<!--[if IE]>
	<script type="text/javascript" src="${ctx}/resources/js/jquery/jquery-1.11.3.min.js"></script>
<![endif]-->
<script type="text/javascript"
	src="${ctx}/resources/js/nicescroll/jquery.nicescroll.min.js"></script>
<link rel="stylesheet" href="${ctx }/resources/css/customer/webside-icon.min.css" />
<link rel="stylesheet" href="${ctx}/resources/fonts/opensans/ace-fonts.min.css"/>
<link rel="stylesheet" href="${ctx}/resources/css/ace/ace.min.css" class="ace-main-stylesheet" id="main-ace-style"/>
<script type="text/javascript" src="${ctx }/resources/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/ace/ace.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/ace/ace-elements.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/jquery-validation/localization/messages_zh.js"></script>
<script src="${ctx }/resources/js/jquery-form/jquery.form.js"></script>
<script type="text/javascript">
$(function () {
	i = 1;  
    $(document).ready(function(){
    	$("#fileForm").validate({
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
            	commit();
            }
        });
    	$('.file_upload').ace_file_input({
    		no_file:'选择文件 ...',
    		btn_choose:'选择',
    		btn_change:'更改',
    		maxSize:'3000000',//传承人照片不要超过3M=3*1000*1000
    		droppable:false,
    		onchange:null,
    		thumbnail:'large',
    		before_change:function(files, dropped) {
    			var file = files[0];
    			if(typeof file == "string") {
    				if(! (/\.(jpe?g|png|gif|bmp|dwg|dws|dwt|dxf)$/i).test(file) ) {
    					return false;
    				}
    			}
    			else {
    				var type = $.trim(file.type);
    				if(
    				( type.length > 0 && ! (/^image\/(jpe?g|png|gif|bmp|dwg|dws|dwt|dxf)$/i).test(type) )
    				|| 
    				( type.length == 0 && ! (/\.(jpe?g|png|gif|bmp|dwg|dws|dwt|dxf)$/i).test(file.name) )
    				)
    				{
    				return false;
    				}
    			}
				return true;
			}
    	});
	});
});
function getUrlParam(name){  
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r!=null) return unescape(r[2]);
    return null;
}
function commit(){
	var options ={   
            url:'${ctx }/smriti/pictureupload.html',   
            type : "POST", 
            dataType : "json",
            data:null,
            beforeSend: function() { //开始上传 
                $("#btn_submit").html("上传中..."); //上传按钮显示上传中
                $('#btn_submit').attr('disabled',"true"); 
            },
            success : function(data) {
            	if(data.success){
	            	parent.$('#'+getUrlParam('id')).val(data.result);
	            	parent.$('#zp').append("<img src=\"${ctx}/media/showPictureById.html?id="+parent.$("#cZp").val()+"\">");
	     		  	//先得到当前iframe层的索引
	                var index = parent.layer.getFrameIndex(window.name);
	                //再执行关闭
	                parent.layer.close(index);
            	}else{
            		alert(data.result);
            	}
            },
            error : function(data, errorMsg) {
            	alert("上传失败:"+errorMsg);
            }
         };
	$("#fileForm").ajaxSubmit(options);
}
</script> 
</head>
<body class="no-skin"> 
<div class="page-header">
	<h1>
	上传图片文件
	</h1>
</div>
<div class="row" style="margin-top:5px;">
	<div class="col-xs-12">
		<form id="fileForm" name="fileForm" class="form-horizontal" role="form" method="post" enctype="multipart/form-data">  
	        <div class="form-group" id="div_'+i+'">
 				<div class="col-sm-12">
 				<div class="clearfix">
 					<input  name="file" id="file" type="file" class="form-control file_upload" required="true"/>
 				</div>
 				<font color="#FF0000">照片文件大小不要超过3M</font> 
 				</div>
 			</div>
	    </form>
		<div class="hr hr-dotted"></div>
	</div>
</div>
<div class="center"> 
	<button id="btn_submit" type="button" onclick="javascript:$('#fileForm').submit();" class="btn btn-success btn-sm" >
		<i class="fa fa-upload"></i>&nbsp;
			上传
	</button>
</div>
</body>
</html>