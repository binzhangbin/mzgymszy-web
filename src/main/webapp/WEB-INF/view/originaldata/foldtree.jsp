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
<link type="text/css" rel="stylesheet" href="${ctx }/resources/js/jstree/themes/default/style.css"/>
<script type="text/javascript" src="${ctx }/resources/js/jstree/jstree.min.js"></script>   
<script type="text/javascript" src="${ctx }/resources/js/jstree/jstree.checkbox.js"></script> 
<script type="text/javascript" src="${ctx }/resources/js/underscore/underscore-min.js"></script> 
<script type="text/javascript">
$(function () {
	$('#tree')
		.jstree({
			'core' : {
				'data' : {
					"url" : '${ctx }/foldertree/list.html',
					'dataType': 'json',
					"data" : function (node) {
						return { "id" : node.id };
					}
				},
				"themes" : {
                    "responsive" : true
                },
                "multiple" : true,
                "animation" : 200,
                "dblclick_toggle" : true,
                "expand_selected_onload" : true
            },
            "checkbox" : {
                "keep_selected_style" : true,
                "three_state" : false,
                "tie_selection" : false
            },
            "plugins" : ["checkbox"]
        })
        .on("check_node.jstree", function (e, data) {
        	$.get('${ctx }/foldertree/getNodePath.html?id='+data.selected)
    		.done(function (result) {
    			var object = $.parseJSON(result);
    			if(object.success){
    				parent.$("#gypFoldName").val(object.data);
    				parent.$("#gypFoldId").val(data.selected);
    				//先得到当前iframe层的索引
    	            var index = parent.layer.getFrameIndex(window.name);
    	            //再执行关闭
    	            parent.layer.close(index);
    			}else{
    				alert(object.message);
    			}
    		});
		})
		.on('loaded.jstree', function(e, data){  
		    var inst = data.instance;  
		    var obj = inst.get_node(e.target.firstChild.firstChild.lastChild);  
		    inst.open_node(obj);  
		});
});
</script> 
</head>
<body class="no-skin"> 
<div class="page-header">
	<h1>
		选择目录
	</h1>
</div>
<div class="row" style="margin-top:5px;">
	<div class="col-xs-12">
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="description">目录</label>
		      <div class="col-sm-10">
		         <div id="tree"></div>
		      </div>
		   </div>
		<div class="hr hr-dotted"></div>
	</div>
</div>
</body>
</html>