var dtGridColumns = [{
    id : 'gypBm',
    title : '����',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header'
},{
    id : 'gypMcZm',
    title : '������ ',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header'
},{
    id : 'gypMcYm',
    title : '����',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md'
},{
    id : 'gypScdDw',
    title : '�ղص�����',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md'
},{
    id : 'gypScdScrxm',
    title : '�ղ�������',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md'
},{
    id : 'gypScdLxfs',
    title : '��ϵ��ʽ',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md'
},{
    id : 'gypScdScdz',
    title : '�ղص�ַ',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md'
},{
    /*id : 'gypScdSjnd',
    title : '�ռ����',
    type:'date', 
    format:'yyyy-MM-dd',
    otype:'string', 
    oformat:'yyyy-MM-dd',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md'*/
	id : 'gypScdDq',
    title : '�����˵���',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md'
},{
    id : 'id',
    title : '����',
    type:'string', 
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md',
    resolution:function(value, record, column, grid, dataNo, columnNo){
    	 var content = '';
    	 content += '<button class="btn btn-xs btn-info" onclick="webside.common.loadPage(\'/originaldata/detailUI.html?id=';
    	 content += value + '\')"><i class="fa fa-plus"></i>&nbsp;����</button>';
    	 return content;
    }
}
];

//��̬����jqGrid��rowNum
var pageSize = $("#pageSize").val();
pageSize = pageSize == 0 || pageSize == "" ? sys.pageNum : pageSize;

var dtGridOption = {
    lang : 'zh-cn',
    ajaxLoad : true,
    check : true,
    checkWidth :'37px',
    extraWidth : '37px',
    loadURL : sys.rootPath + '/originaldata/list.html',
    columns : dtGridColumns,
    gridContainer : 'dtGridContainer',
    toolbarContainer : 'dtGridToolBarContainer',
    tools : 'refresh|print|export[excel,csv,pdf,txt]',
    exportFileName : 'ԭʼ����',
    pageSize : pageSize,
    pageSizeLimit : [10, 20, 30]
};

var grid = $.fn.dlshouwen.grid.init(dtGridOption);
$(function() {
    if(null != $("#orderByColumn").val() && '' != $("#orderByColumn").val())
    {
        grid.sortParameter.columnId = $("#orderByColumn").val();
        grid.sortParameter.sortType = $("#orderByType").val();
    }
    grid.parameters = new Object();
    grid.parameters['foldId'] = $("#foldId").val();
    grid.parameters['searchKey'] = $("#searchValue").val();
    grid.load();
    $("#btnSearch").click(customSearch);
    
    //ע��س����¼�
    document.onkeypress = function(e){
    var ev = document.all ? window.event : e;
        if(ev.keyCode==13) {
            customSearch();
        }
    };
    
});

/**
 * �Զ����ѯ
 * ���ﲻ�����ҳ��Ϣ����ֹɾ����¼�����¼����ҳ��ȵ�ǰҳ��С�����¼����쳣
 */
function customSearch() {
    grid.parameters = new Object();
    grid.parameters['searchKey'] = $("#searchKey").val();
    grid.refresh(true);
}
