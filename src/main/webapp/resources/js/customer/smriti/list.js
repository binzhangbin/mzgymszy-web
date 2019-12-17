var dtGridColumns = [{
    id : 'id',
    title : '���',
    type : 'number',
    columnClass : 'text-center',
    hideType : 'xs',
    headerClass : 'dlshouwen-grid-header'
}, {
    id : 'cXm',
    title : '����������',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header'
}, {
    id : 'cXb',
    title : '�Ա�',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    resolution : function(value, record, column, grid, dataNo, columnNo) {
        if (value == 0) {
            return '<span class="label label-sm label-success arrowed arrowed-righ">��</span>';
        } else {
            return '<span class="label label-sm label-warning arrowed arrowed-righ">Ů</span>';
        }
    }
}, {
    id : 'cMz',
    title : '����',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header'
}, {
    id : 'cLxfs',
    title : '��ϵ��ʽ',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header'
}, {
    id : 'cLxdz',
    title : '��ϵ��ַ',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header'
}, {
    id : 'cTssy',
    title : '��ɫ����',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header'
}];

//��̬����jqGrid��rowNum
var pageSize = $("#pageSize").val();
pageSize = pageSize == 0 || pageSize == "" ? sys.pageNum : pageSize;

var dtGridOption = {
    lang : 'zh-cn',
    ajaxLoad : true,
    check : true,
    checkWidth :'37px',
    extraWidth : '37px',
    loadURL : sys.rootPath + '/smriti/list.html',
    columns : dtGridColumns,
    gridContainer : 'dtGridContainer',
    toolbarContainer : 'dtGridToolBarContainer',
    tools : 'refresh|print|export[excel,csv,pdf,txt]',
    exportFileName : '�û���Ϣ',
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
    grid.parameters['userName'] = $("#searchKey").val();
    grid.refresh(true);
}
