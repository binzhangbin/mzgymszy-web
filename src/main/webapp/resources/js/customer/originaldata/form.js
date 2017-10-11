$(function() {
	var isLayerOpen =false;
	$("#gypFoldName").bind('focus', function(event) {
		if(!isLayerOpen){
			var iconLayer = layer.open({
	            type : 2,
	            scrollbar : false,
	            content : sys.rootPath + '/originaldata/foldtree.html',
	            area : ['600px', '600px'],
	            maxmin : true,
	            shift : 4,
	            title : '<i class="fa fa-folder"></i>&nbsp;选择目录',
	            success: function(){
	                isLayerOpen=true;
	            },
	            end:function(){
	            	isLayerOpen=false;
	            }
	        });
		}
    });
	$(".form_datetime").datepicker({
    	show: true,  
        format: 'yyyy-mm-dd',
        language: 'zh-CN',  
        weekStart: 1,
	    autoclose: true
      });
	$('#gypScdSynx').ace_spinner({value:0,min:0,max:1000,step:1, on_sides: true, icon_up:'fa fa-plus smaller-75', icon_down:'fa fa-minus smaller-75', btn_up_class:'btn-success' , btn_down_class:'btn-danger'});
	$('.picture-upload').bind('focus', function(event) {
		if(!isLayerOpen){
			var pictureLayer = layer.open({
	            type : 2,
	            scrollbar : false,
	            content : sys.rootPath + '/originaldata/pictureuploadUI.html?id='+$(this).attr("id"),
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
	$('.media-upload').bind('focus', function(event) {
		if(!isLayerOpen){
			var mediaLayer = layer.open({
	            type : 2,
	            scrollbar : true,
	            content : sys.rootPath + '/originaldata/mediauploadUI.html?id='+$(this).attr("id"),
	            area : ['500px', '500px'],
	            maxmin : true,
	            shift : 4,
	            title : '<i class="fa fa-file-video-o"></i>&nbsp;选择文件',
	            success: function(){
	                isLayerOpen=true;
	            },
	            end:function(){
	            	isLayerOpen=false;
	            }
	        });
			//layer.full(mediaLayer);
		}
    });
	$('#originaldataForm').validate({
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
        	/*$("#gypScdScdz").val($("#gypScdScdz-province").val()+"-"+$("#gypScdScdz-city").val()+"-"+$("#gypScdScdz-district").val());*/
        	$("#gypLyd").val($("#gypLyd-province").val()+"-"+$("#gypLyd-city").val()+"-"+$("#gypLyd-district").val());
            var originaldataId = $("#originaldataId").val();
            var url = "";
            if (originaldataId != undefined) {
                url = '/originaldata/edit.html';
            } else {
                url = '/originaldata/add.html';
            }
            webside.common.commit('originaldataForm', url, '/originaldata/treelistUI.html');
        }
    });
});
