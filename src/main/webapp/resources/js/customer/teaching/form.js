$(function() {
	var isLayerOpen =false;
	$(".form_datetime").datepicker({
    	show: true,  
        format: 'yyyy-mm-dd',
        language: 'zh-CN',  
        weekStart: 1,
	    autoclose: true
      });
	$('.picture-upload').bind('focus', function(event) {
		if(!isLayerOpen){
			var pictureLayer = layer.open({
	            type : 2,
	            scrollbar : false,
	            content : sys.rootPath + '/teachingVideo/pictureuploadUI.html?id='+$(this).attr("id"),
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
	/*文档测试===Start===*/
	$('.files-upload').bind('focus', function(event) {
		if(!isLayerOpen){
			var pictureLayer = layer.open({
				type : 2,
				scrollbar : false,
				content : sys.rootPath + '/teachingVideo/documentuploadUI.html?id='+$(this).attr("id"),
				area : ['500px', '500px'],
				maxmin : true,
				shift : 4,
				title : '<i class="fa fa-file-o"></i>&nbsp;选择文档',
				success: function(){
					isLayerOpen=true;
				},
				end:function(){
					isLayerOpen=false;
				}
			});
		}
	});
	/*文档测试===End===*/
	$('.media-upload').bind('focus', function(event) {
		if(!isLayerOpen){
			var mediaLayer = layer.open({
	            type : 2,
	            scrollbar : true,
	            content : sys.rootPath + '/teachingVideo/mediauploadUI.html?id='+$(this).attr("id"),
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
	$('#teachingVideoForm').validate({
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
            var originaldataId = $("#teachingVideoId").val();
            var url = "";
            if (originaldataId != undefined) {
                url = '/teachingVideo/edit.html';
            } else {
                url = '/teachingVideo/add.html';
            }
            webside.common.commit('teachingVideoForm', url, '/teachingVideo/detailUI.html?id=${detailsId}');
        }
    });
});
