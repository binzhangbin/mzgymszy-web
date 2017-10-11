<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link type="text/css" rel="stylesheet" href="${ctx }/resources/js/jstree/themes/default/style.css"/>
<style>
#tree .folder { background:url('${ctx }/resources/js/jstree/themes/default/file_sprite.png') right bottom no-repeat; }
</style>
<script type="text/javascript" src="${ctx }/resources/js/jstree/jstree.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/jstree/jstree.checkbox.js"></script>
<script>
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
				} ,
				'force_text' : true,
				'themes' : {
					'responsive' : false,
					'variant' : 'small',
					'stripes' : true
				}
			},
			'types' : {
				'default' : { 'icon' : 'folder' },
			},
			'unique' : {
				'duplicate' : function (name, counter) {
					return name + ' ' + counter;
				}
			},
			'plugins' : ['types','unique']
		})
		.on('select_node.jstree', function (e, data) {
			webside.common.loadPage('/visitor/listUI.html?foldId='+data.selected);
		}).on('loaded.jstree', function(e, data){  
		    var inst = data.instance;  
		    var obj = inst.get_node(e.target.firstChild.firstChild.lastChild);  
		    inst.open_node(obj);  
		});
	$("#btnSearch").click(customSearch);
    
    //注册回车键事件
    document.onkeypress = function(e){
    var ev = document.all ? window.event : e;
        if(ev.keyCode==13) {
            customSearch();
        }
    };
});
function customSearch() {
    webside.common.loadPage('/visitor/listUI.html?searchKey='+$("#searchKey").val());
}
</script>
<div class="input-group">
     <input id="searchKey" type="text" class="input form-control" placeholder="关键字...">
     <span class="input-group-btn">
         <button id="btnSearch" class="btn btn-red btn-sm" type="button"> <i class="fa fa-search"></i> 搜索</button>
     </span>
</div>
<div class="page-header">
	<h1>
		选择目录
	</h1>
</div>
<div class="row" style="margin-top:5px;">
	<div class="col-xs-12">
		   <!-- 树形目录 -->
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="description">目录</label>
		      <div class="col-sm-10">
		         <div id="tree"></div>
		      </div>
		   </div>
		<div class="hr hr-dotted"></div>
	</div>
</div>