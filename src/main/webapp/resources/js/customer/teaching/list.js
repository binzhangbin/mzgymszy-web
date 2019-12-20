var dtGridColumns = [
		{
			id : 'jxKcmc',
			title : '课程名称',
			type : 'string',
			columnClass : 'text-center',
			headerClass : 'dlshouwen-grid-header'
		},
		{
			id : 'jxJsxm',
			title : '教师姓名',
			type : 'string',
			columnClass : 'text-center',
			headerClass : 'dlshouwen-grid-header'
		},
		{
			id : 'jxJsxb',
			title : '性别',
			type : 'string',
			columnClass : 'text-center',
			headerClass : 'dlshouwen-grid-header'
		},
		{
			id : 'jxJsmz',
			title : '民族',
			type : 'string',
			columnClass : 'text-center',
			headerClass : 'dlshouwen-grid-header'
		},
		{
			id : 'jxWhcd',
			title : '文化',
			type : 'string',
			columnClass : 'text-center',
			headerClass : 'dlshouwen-grid-header'
		},
		{
			id : 'jxXstx',
			title : '学术头衔',
			type : 'string',
			columnClass : 'text-center',
			headerClass : 'dlshouwen-grid-header'
		},
		{
			id : 'jxLxdh',
			title : '联系电话',
			type : 'string',
			columnClass : 'text-center',
			headerClass : 'dlshouwen-grid-header'
		},
		{
			id : 'id',
			title : '操作',
			type : 'string',
			columnClass : 'text-center',
			headerClass : 'dlshouwen-grid-header',
			hideType : 'sm|xs|md',
			resolution : function(value, record, column, grid, dataNo, columnNo) {
				var content = '';
				content += '<button class="btn btn-xs btn-info" onclick="webside.common.loadPage(\'/teachingVideo/detailUI.html?id=';
				content =content+ value
						+ '\')"><i class="fa fa-plus"></i>&nbsp;详情</button>';
				return content;
			}
		} ];

// 动态设置jqGrid的rowNum
var pageSize = $("#pageSize").val();
pageSize = pageSize == 0 || pageSize == "" ? sys.pageNum : pageSize;

var dtGridOption = {
	lang : 'zh-cn',
	ajaxLoad : true,
	check : true,
	checkWidth : '37px',
	extraWidth : '37px',
	loadURL : sys.rootPath + '/teachingVideo/list.html',
	columns : dtGridColumns,
	gridContainer : 'dtGridContainer',
	toolbarContainer : 'dtGridToolBarContainer',
	tools : 'refresh|print|export[excel,csv,pdf,txt]',
	exportFileName : 'user info',
	// nowPage:2
};

var grid = $.fn.dlshouwen.grid.init(dtGridOption);

$(function() {
	if (null != $("#orderByColumn").val() && '' != $("#orderByColumn").val()) {
		grid.sortParameter.columnId = $("#orderByColumn").val();
		grid.sortParameter.sortType = $("#orderByType").val();
	}
	grid.load();
	$("#btnSearch").click(customSearch);

	// 注册回车键事件
	document.onkeypress = function(e) {
		var ev = document.all ? window.event : e;
		if (ev.keyCode == 13) {
			customSearch();
		}
	};

});

/**
 * 自定义查询 这里不传入分页信息，防止删除记录后重新计算的页码比当前页码小而导致计算异常
 */
function customSearch() {
	grid.parameters = new Object();
	grid.parameters['jxJsxm'] = $("#searchKey").val();
	grid.refresh(true);
}
