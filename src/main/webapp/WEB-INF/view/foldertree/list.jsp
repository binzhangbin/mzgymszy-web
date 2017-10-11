<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				'check_callback' : function(o, n, p, i, m) {
					if(m && m.dnd && m.pos !== 'i') { return false; }
					if(o === "move_node" || o === "copy_node") {
						if(this.get_node(n).parent === this.get_node(p).id) { return false; }
					}
					return true;
				},
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
			'contextmenu':{  
				 "items":{  
				     "create":{  
				         "label":"新建", 
				         "action": function (data) { 
				        	 add();
			              }
				     },  
				     "rename":{  
				         "label":"重命名",  
				         "action":function(data){
				        	 rename();
				         }  
				     },  
				     "remove":{  
				         "label":"删除", 
				         "action":function(data){  
				        	 del();
					     }
				     } 
				 }
			},
			"checkbox" : {
                "keep_selected_style" : false,
                "three_state" : false,
                "tie_selection" : false
            },
			'plugins' : ['types','contextmenu','unique','checkbox']
		})
		.on('loaded.jstree', function(e, data){  
		    var inst = data.instance;  
		    var obj = inst.get_node(e.target.firstChild.firstChild.lastChild);  
		    inst.open_node(obj);  
		})
		.on('check_node.jstree', function(event, obj) {//实现单选
                var ref = $('#tree').jstree(true);
                var nodes = ref.get_checked();
                $.each(nodes, function(i, nd) {
                    if (nd != obj.node.id)
                        ref.uncheck_node(nd);
                });
        });
});
function add(){
	var inst = $.jstree.reference($('#tree'));
	obj = inst.get_node(inst.get_checked());
	inst.create_node(obj, {}, "last", function (new_node) {
		inst.edit(new_node,"", function (node,status,cancelled) {
			$.get('${ctx }/foldertree/create.html?parentId='+node.parent+'&text='+node.text)
			.done(function (result) {
				var object = $.parseJSON(result);
				if(object.success){
					inst.set_id(node, object.id);
				}else{
					alert(object.message);
    			}
				inst.refresh (true,false);
			})
		}); 
	});
}
function rename(){
	var inst = $.jstree.reference($('#tree'));
	obj = inst.get_node(inst.get_checked());
	inst.edit(obj,obj.text,function (node,status,cancelled) {
		$.get('${ctx }/foldertree/rename.html?id='+node.id+'&text='+node.text)
		.done(function () {
			inst.refresh (true,false);
		})
	});
}
function del(){
	var inst = $.jstree.reference($('#tree'));
	obj = inst.get_node(inst.get_checked());
	$.get('${ctx }/foldertree/delete.html?id='+obj.id+'&parentId='+obj.parent)
	.done(function (result) {
		var object = $.parseJSON(result);
		if(object.success){
			inst.delete_node(obj);
			inst.refresh (true,false);
		}else{
			alert(object.message);
		}
	});
}
</script>
<div class="page-header">
	<shiro:hasPermission name="foldtree:add">
	<button id="btnAdd" type="button" onclick="javascript:add();" class="btn btn-red btn-sm">
	  	<i class="fa fa-user-plus"></i>&nbsp;添加
	</button>
	</shiro:hasPermission>
	<shiro:hasPermission name="foldtree:edit">
	<button id="btnEdit" type="button" onclick="javascript:rename()" class="btn btn-success btn-sm">
		 <i class="fa fa-pencil-square-o"></i>&nbsp;编辑
	</button>
	</shiro:hasPermission>
	<shiro:hasPermission name="foldtree:deleteBatch ">
	<button id="btnDel" type="button" onclick="javascript:del()" class="btn btn-danger btn-sm">
		<i class="fa fa-trash-o"></i>&nbsp;删除
	</button>
	</shiro:hasPermission>
</div>
<div class="row" style="margin-top:5px;">
	<div class="col-xs-12">
		<form id="permissionForm" name="permissionForm" class="form-horizontal" role="form" method="post">
		<input type="hidden" id="pageNum" name="pageNum" value="${page.pageNum }">
		<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize }">
		<input type="hidden" id="orderByColumn" name="orderByColumn" value="${page.orderByColumn }">
		<input type="hidden" id="orderByType" name="orderByType" value="${page.orderByType }">
		   <!-- 树形目录 -->
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="description">目录</label>
		      <div class="col-sm-10">
		         <div id="tree"></div>
		      </div>
		   </div>
		</form>
		<div class="hr hr-dotted"></div>
	</div>
</div>