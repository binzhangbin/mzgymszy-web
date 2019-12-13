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
	<shiro:hasPermission name="teachingVideo:edit">
	<button id="btnEdit" type="button" onclick="webside.common.loadPage('/teachingVideo/editUI.html?id='+${teachingVideoEntity.id })" class="btn btn-success btn-sm">
		 <i class="fa fa-pencil-square-o"></i>&nbsp;编辑
	</button>
	</shiro:hasPermission>
	
	<button id="btnCancel" type="button"
		onclick="webside.common.loadPage('/teachingVideo/dlistUI.html')"
		class="btn btn-info btn-sm">
		<i class="fa fa-undo"></i>&nbsp;返回
	</button>
</div>
<div class="row">
	<div class="col-xs-12">
		<div class="widget-box">
			<div class="widget-header widget-header-flat">
			<c:if test="${!empty teachingVideoEntity}">
				<h4 class="smaller">${teachingVideoEntity.jxKcmc }</h4>
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
						<!-- 教学类型：鞍马类、服装及配饰类、毡庐类、餐饮类、游乐类、宗教类、其它===Start=== -->
						<dt>教学类型:</dt>
						<dd>${teachingVideoEntity.jxLx}</dd>
						<!-- 教学类型：鞍马类、服装及配饰类、毡庐类、餐饮类、游乐类、宗教类、其它===End=== -->
						
						<!-- 教师姓名===Start=== -->
						<dt>教师姓名:</dt>
						<dd>${teachingVideoEntity.jxJsxm}</dd>
						<!-- 教师姓名===End=== -->
						
						<!-- 教师性别===Start=== -->
						<dt>教师性别:</dt>
						<dd>${teachingVideoEntity.jxJsxb}</dd>
						<!-- 教师性别===End=== -->
						
						<!-- 教师民族===Start=== -->
						<dt>教师民族:</dt>
						<dd>${teachingVideoEntity.jxJsmz}</dd>
						<!-- 教师民族===End=== -->
						
						<!-- 出生年月===Start=== -->
						<dt>出生年月:</dt>
						<dd><fmt:formatDate value="${teachingVideoEntity.jxCsny}" type="date" /></dd>
						<!-- 出生年月===End=== -->
						
						<!-- 文化程度===Start=== -->
						<dt>文化程度:</dt>
						<dd>${teachingVideoEntity.jxWhcd}</dd>
						<!-- 文化程度===End=== -->
						
						<!-- 籍贯===Start=== -->
						<dt>籍贯:</dt>
						<dd>${teachingVideoEntity.jxJg}</dd>
						<!-- 籍贯===End=== -->
						
						<!-- 联系电话===Start=== -->
						<dt>联系电话:</dt>
						<dd>${teachingVideoEntity.jxLxdh}</dd>
						<!-- 联系电话===End=== -->
						
						<!-- 学术头衔===Start=== -->
						<dt>学术头衔:</dt>
						<dd>${teachingVideoEntity.jxXstx}</dd>
						<!-- 学术头衔===End=== -->
						
						<!-- 通讯地址===Start=== -->
						<dt>通讯地址:</dt>
						<dd>${teachingVideoEntity.jxTxdz}</dd>
						<!-- 通讯地址===End=== -->
						
						<!-- 照片===Start=== -->
						<dt>教师照片:</dt>
						<c:forEach var="jxZp" items="${ fn:split(teachingVideoEntity.jxZp, ',') }">
							<dd>
								<img src="${ctx}/media/showThumbnail.html?pTp=${jxZp}">
								<button class="btn btn-info btn-grey" onclick="javascript:showPicture('${jxZp}')">
									<i class="fa fa-arrows-alt align-top bigger-250"></i>
								</button>
								<button class="btn btn-info btn-grey" onclick="location ='${ctx}/media/download.html?pTp=${jxZp}'">
									<i class="fa fa-save align-top bigger-250"></i>
								</button>
							</dd>
						</c:forEach>
						<!-- 照片===End=== -->
						
						<!-- 课程名称===Start=== -->
						<dt>课程名称:</dt>
						<dd>${teachingVideoEntity.jxKcmc}</dd>
						<!-- 课程名称===End=== -->
						
						<!-- 授课语种(汉语、蒙语、其它)===Start=== -->
						<dt>授课语种:</dt>
						<dd>${teachingVideoEntity.jxYz}</dd>
						<!-- 授课语种(汉语、蒙语、其它)===End=== -->
						
						<!-- 个人简历===Start=== -->
						<dt>个人简历:</dt>
						<dd>${teachingVideoEntity.jxGrjl}</dd>
						<!-- 个人简历===End=== -->
						
						<!-- 授课场景照片===Start=== -->
						<dt>授课场景照片:</dt>
						<c:forEach var="jxCjzp" items="${ fn:split(teachingVideoEntity.jxCjzp, ',') }">
							<dd>
								<img src="${ctx}/media/showThumbnail.html?pTp=${jxCjzp}">
								<button class="btn btn-info btn-grey" onclick="javascript:showPicture('${jxCjzp}')">
									<i class="fa fa-arrows-alt align-top bigger-250"></i>
								</button>
								<button class="btn btn-info btn-grey" onclick="location ='${ctx}/media/download.html?pTp=${jxCjzp}'">
									<i class="fa fa-save align-top bigger-250"></i>
								</button>
							</dd>
						</c:forEach>
						<!-- 授课场景照片===End=== -->
						
						<!-- 章节数量===Start=== -->
						<dt>章节数量:</dt>
						<dd>${teachingVideoEntity.jxZjsl}</dd>
						<!-- 章节数量===End=== -->
						
						<!-- 总时长===Start=== -->
						<dt>总时长:</dt>
						<dd>${teachingVideoEntity.jxZsc}</dd>
						<!-- 总时长===End=== -->
						
						<!-- 教学视频===Start=== -->
						<dt>教学视频:</dt>
						<c:forEach var="jxSp" items="${ fn:split(teachingVideoEntity.jxSp, ',') }">
							<dd>
								<li>
									<i class="fa fa-film bigger-110 green"></i>	${jxSp}
								</li>
								<button class="btn btn-info btn-grey" onclick="javascript:showVideo('${jxSp}')">
									<i class="fa fa-play align-top bigger-250"></i>
								</button>
							</dd>
						</c:forEach>
						<!-- 教学视频===End=== -->
						
						<!-- 课件内容===Start=== -->
						<dt>课件内容:</dt>
						<c:forEach var="jxKj" items="${ fn:split(teachingVideoEntity.jxKj, ',') }">
							<dd>
								<%-- <img src="${ctx}/media/showThumbnail.html?pTp=${jxKj}">
								<button class="btn btn-info btn-grey" onclick="javascript:showPicture('${jxKj}')">
									<i class="fa fa-arrows-alt align-top bigger-250"></i>
								</button>
								<button class="btn btn-info btn-grey" onclick="location ='${ctx}/media/download.html?pTp=${jxKj}'">
									<i class="fa fa-save align-top bigger-250"></i>
								</button> --%>
								<li>
									<i class="fa fa-file bigger-110 green"></i>	${jxKj}
								</li>
							</dd>
						</c:forEach>
						<!-- 课件内容===End=== -->
						
						<!-- 备注===Start=== -->
						<dt>备注:</dt>
						<dd>${teachingVideoEntity.jxBz}</dd>
						<!-- 备注===End=== -->						
					</dl>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="center">
	<button id="btn" type="button"
		onclick="webside.common.loadPage('/teachingVideo/dlistUI.html')"
		class="btn btn-info btn-sm">
		<i class="fa fa-undo"></i>&nbsp;返回
	</button>
</div>