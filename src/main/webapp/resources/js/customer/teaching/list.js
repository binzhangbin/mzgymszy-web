var dtGridColumns = [
		{
			id : 'jxKcmc',
			title : '�γ�����',
			type : 'string',
			columnClass : 'text-center',
			headerClass : 'dlshouwen-grid-header'
		},
		{
			id : 'jxJsxm',
			title : '��ʦ����',
			type : 'string',
			columnClass : 'text-center',
			headerClass : 'dlshouwen-grid-header'
		},
		{
			id : 'jxJsxb',
			title : '�Ա�',
			type : 'string',
			columnClass : 'text-center',
			headerClass : 'dlshouwen-grid-header'
		},
		{
			id : 'jxJsmz',
			title : '����',
			type : 'string',
			columnClass : 'text-center',
			headerClass : 'dlshouwen-grid-header'
		},
		{
			id : 'jxWhcd',
			title : '�Ļ�',
			type : 'string',
			columnClass : 'text-center',
			headerClass : 'dlshouwen-grid-header'
		},
		{
			id : 'jxXstx',
			title : 'ѧ��ͷ��',
			type : 'string',
			columnClass : 'text-center',
			headerClass : 'dlshouwen-grid-header'
		},
		{
			id : 'jxLxdh',
			title : '��ϵ�绰',
			type : 'string',
			columnClass : 'text-center',
			headerClass : 'dlshouwen-grid-header'
		},
		{
			id : 'id',
			title : '����',
			type : 'string',
			columnClass : 'text-center',
			headerClass : 'dlshouwen-grid-header',
			hideType : 'sm|xs|md',
			resolution : function(value, record, column, grid, dataNo, columnNo) {
				var content = '';
				content += '<button class="btn btn-xs btn-info" onclick="webside.common.loadPage(\'/teachingVideo/detailUI.html?id=';
				content =content+ value
						+ '\')"><i class="fa fa-plus"></i>&nbsp;����</button>';
				return content;
			}
		} ];

// ��̬����jqGrid��rowNum
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

	// ע��س����¼�
	document.onkeypress = function(e) {
		var ev = document.all ? window.event : e;
		if (ev.keyCode == 13) {
			customSearch();
		}
	};

});

/**
 * �Զ����ѯ ���ﲻ�����ҳ��Ϣ����ֹɾ����¼�����¼����ҳ��ȵ�ǰҳ��С�����¼����쳣
 */
function customSearch() {
	grid.parameters = new Object();
	grid.parameters['jxJsxm'] = $("#searchKey").val();
	grid.refresh(true);
}
