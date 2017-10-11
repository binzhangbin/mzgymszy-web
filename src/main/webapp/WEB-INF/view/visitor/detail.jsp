<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<script type="text/javascript" src="${ctx }/resources/js/ace/ace-elements.min.js"></script>
<script type="text/javascript">
var isLayerOpen =false;
jQuery(function($) {
	window.prettyPrint && prettyPrint();
	$('#id-check-horizontal').removeAttr('checked').on('click', function(){
		$('#dt-list-1').toggleClass('dl-horizontal');
	});
})
function showPicture(pTp){
	if(!isLayerOpen){
		var pictureLayer = layer.open({
			  type: 2,
			  title: false,
			  closeBtn: 1,
			  area: ['800px', '600px'],
			  skin: 'layui-layer-nobg',
			  shadeClose: true,
			  content: sys.rootPath + '/media/showPicture.html?pTp=' +pTp,
			  success: function(){
	              isLayerOpen=true;
	          },
	          end:function(){
	          	isLayerOpen=false;
	          }
			});
	}
}
function showVideo(mYspm){
	if(!isLayerOpen){
		var mediaLayer = layer.open({
			  type: 1,
			  title: false,
			  closeBtn: 1,
			  skin: 'layui-layer-nobg',
			  shadeClose: true,
			  content: '<video src="'+sys.rootPath+'/media/showMedia.html?mYspm='+mYspm+'" autoplay="autoplay">您的浏览器不支持该视频播放。</video>',
			  success: function(){
	              isLayerOpen=true;
	          },
	          end:function(){
	          	isLayerOpen=false;
	          }
			});
	}
}
function showAudio(mYspm){
	if(!isLayerOpen){
		var mediaLayer = layer.open({
			  type: 1,
			  title: false,
			  closeBtn: 1,
			  skin: 'layui-layer-nobg',
			  shadeClose: true,
			  content: '<audio src="'+sys.rootPath+'/media/showMedia.html?mYspm='+mYspm+'" autoplay="autoplay" controls="controls">您的浏览器不支持该音频播放。</audio>',
			  success: function(){
	              isLayerOpen=true;
	          },
	          end:function(){
	          	isLayerOpen=false;
	          }
			});
	}
}
</script>
<div class="page-header">
	<button id="btnCancel" type="button"
		onclick="webside.common.loadPage('/visitor/treelistUI.html')"
		class="btn btn-info btn-sm">
		<i class="fa fa-undo"></i>&nbsp;返回
	</button>
</div>
<div class="row">
	<div class="col-xs-12">
		<div class="widget-box">
			<div class="widget-header widget-header-flat">
			<c:if test="${!empty originaldataEntity}">
				<h4 class="smaller">${originaldataEntity.gypBm }</h4>
			</c:if>
				<div class="widget-toolbar">
					<label>
						<small class="green">
							<b>水平排列</b>
						</small>
						<input id="id-check-horizontal" type="checkbox" class="ace ace-switch ace-switch-6" />
						<span class="lbl"></span>
					</label>
				</div>
			</div>
			<div class="widget-body">
				<div class="widget-main">
					<dl id="dt-list-1">
						<dt>主名称:</dt>
						<dd>${originaldataEntity.gypMcZm}</dd>
						<dt>别名:</dt>
						<dd>${originaldataEntity.gypMcYm}</dd>
						<dt>收藏地性质:</dt>
						<dd>${originaldataEntity.gypScdDw}</dd>
						<dt>收藏人姓名:</dt>
						<dd>${originaldataEntity.gypScdScrxm}</dd>
						<dt>联系方式:</dt>
						<dd>${originaldataEntity.gypScdLxfs}</dd>
						<dt>收藏地址:</dt>
						<dd>${originaldataEntity.gypScdScdz}</dd>
						<dt>收集年代:</dt>
						<dd><fmt:formatDate value="${originaldataEntity.gypScdSjnd}" type="date"/></dd>
						<dt>使用年限:</dt>
						<dd>${originaldataEntity.gypScdSynx}</dd>
						<dt>曾用者身份:</dt>
						<dd>${originaldataEntity.gypCyzSf}</dd>
						<dt>曾用者民族:</dt>
						<dd>${originaldataEntity.gypCyzMz}</dd>
						<dt>来源地:</dt>
						<dd>${originaldataEntity.gypLyd}</dd>
						<dt>装饰方式:</dt>
						<dd>${originaldataEntity.gypZsZsfs}</dd>
						<dt>装饰-主图案:</dt>
						<dd>${originaldataEntity.gypZsZta}</dd>
						<dt>装饰描述: </dt>
						<dd>${originaldataEntity.gypZsMs}</dd>
						<dt>装饰工具照片:</dt>
						<c:forEach var="gypZsGjzp" items="${ fn:split(originaldataEntity.gypZsGjzp, ',') }">
							<dd>
								<img src="${ctx}/media/showThumbnail.html?pTp=${gypZsGjzp}">
							</dd>
							
						</c:forEach>
						<dt>总体规格:</dt>
						<c:forEach var="gypGgxtZtgg" items="${ fn:split(originaldataEntity.gypGgxtZtgg, ',') }">
							<dd>
								<img src="${ctx}/media/showThumbnail.html?pTp=${gypGgxtZtgg}">
							</dd>
						</c:forEach>
						<dt>局部规格:</dt>
						<c:forEach var="gypGgxtJbgg" items="${ fn:split(originaldataEntity.gypGgxtJbgg, ',') }">
							<dd>
								<img src="${ctx}/media/showThumbnail.html?pTp=${gypGgxtJbgg}">
							</dd>
						</c:forEach>
						<dt>多视图-图片:</dt>
						<c:forEach var="gypDstTp" items="${ fn:split(originaldataEntity.gypDstTp, ',') }">
							<dd>
								<img src="${ctx}/media/showThumbnail.html?pTp=${gypDstTp}">
							</dd>
						</c:forEach>
						<dt>多视图-三视图:</dt>
						<c:forEach var="gypDstSst" items="${ fn:split(originaldataEntity.gypDstSst, ',') }">
							<dd>
								<img src="${ctx}/media/showThumbnail.html?pTp=${gypDstSst}">
							</dd>
						</c:forEach>
						<dt>制作工具-常规工具:</dt>
						<dd>${originaldataEntity.gypZzgjCggj}</dd>
						<dt>制作工具-专用工具:</dt>
						<c:forEach var="gypZzgjZygj" items="${ fn:split(originaldataEntity.gypZzgjZygj, ',') }">
							<dd>
								<img src="${ctx}/media/showThumbnail.html?pTp=${gypZzgjZygj}">
							</dd>
						</c:forEach>
						<dt>制作材料材质:</dt>
						<dd>${originaldataEntity.gypZzclCz}</dd>
						<dt>制作材料名称:</dt>
						<dd>${originaldataEntity.gypZzclClmc}</dd>
						<dt>使用场合:</dt>
						<dd>${originaldataEntity.gypSygnSych}</dd>
						<dt>使用视频:</dt>
						<c:forEach var="gypSygnSysp" items="${ fn:split(originaldataEntity.gypSygnSysp, ',') }">
							<dd>
								<li>
									<i class="fa fa-film bigger-110 green"></i>
									${gypSygnSysp}
								</li>
								<button class="btn btn-info btn-grey" onclick="javascript:showVideo('${gypSygnSysp}')">
									<i class="fa fa-play align-top bigger-250"></i>
								</button>
							</dd>
						</c:forEach>
						<dt>使用音频:</dt>
						<c:forEach var="gypSygnSyyp" items="${ fn:split(originaldataEntity.gypSygnSyyp, ',') }">
							<dd>
								<li>
									<i class="fa fa-music bigger-110 green"></i>
									${gypSygnSyyp}
								</li>
								<button class="btn btn-info btn-grey" onclick="javascript:showAudio('${gypSygnSyyp}')">
									<i class="fa fa-play align-top bigger-250"></i>
								</button>
							</dd>
						</c:forEach>
						<dt>制作流程-制作视频:</dt>
						<c:forEach var="gypZzlcZzsp" items="${ fn:split(originaldataEntity.gypZzlcZzsp, ',') }">
							<dd>
								<li>
									<i class="fa fa-film bigger-110 green"></i>
									${gypZzlcZzsp}
								</li>
								<button class="btn btn-info btn-grey" onclick="javascript:showVideo('${gypZzlcZzsp}')">
									<i class="fa fa-play align-top bigger-250"></i>
								</button>
							</dd>
						</c:forEach>
						<dt>制作流程-制作音频:</dt>
						<c:forEach var="gypZzlcZzyp" items="${ fn:split(originaldataEntity.gypZzlcZzyp, ',') }">
							<dd>
								<li>
									<i class="fa fa-music bigger-110 green"></i>
									${gypZzlcZzyp}
								</li>
								<button class="btn btn-info btn-grey" onclick="javascript:showAudio('${gypZzlcZzyp}')">
									<i class="fa fa-play align-top bigger-250"></i>
								</button>
							</dd>
						</c:forEach>
						<dt>传说视频:</dt>
						<c:forEach var="gypSycsCssp" items="${ fn:split(originaldataEntity.gypSycsCssp, ',') }">
							<dd>
								<li>
									<i class="fa fa-film bigger-110 green"></i>
									${gypSycsCssp}
								</li>
								<button class="btn btn-info btn-grey" onclick="javascript:showVideo('${gypSycsCssp}')">
									<i class="fa fa-play align-top bigger-250"></i>
								</button>
							</dd>
						</c:forEach>
						<dt>传说音频:</dt>
						<c:forEach var="gypSycsCsyp" items="${ fn:split(originaldataEntity.gypSycsCsyp, ',') }">
							<dd>
								<li>
									<i class="fa fa-music bigger-110 green"></i>
									${gypSycsCsyp}
								</li>
								<button class="btn btn-info btn-grey" onclick="javascript:showAudio('${gypSycsCsyp}')">
									<i class="fa fa-play align-top bigger-250"></i>
								</button>
							</dd>
						</c:forEach>
						<dt>调研人姓名:</dt>
						<dd>${originaldataEntity.gypDyrXm}</dd>
						<dt>调研人联系方式:</dt>
						<dd>${originaldataEntity.gypDyrLxfs}</dd>
						<dt>调研人单位:</dt>
						<dd>${originaldataEntity.gypDyrDw}</dd>
						<dt>填表时间:</dt>
						<dd><fmt:formatDate value="${originaldataEntity.gypDyrTbsj}" type="date"/></dd>
						<dt>备注:</dt>
						<dd>${originaldataEntity.gypBz}</dd>
					</dl>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="center">
	<button id="btn" type="button"
		onclick="webside.common.loadPage('/visitor/treelistUI.html')"
		class="btn btn-info btn-sm">
		<i class="fa fa-undo"></i>&nbsp;返回
	</button>
</div>