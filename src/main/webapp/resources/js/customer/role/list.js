var dtGridColumns = [{
    id : 'id',
    title : '���',
    type : 'number',
    columnClass : 'text-center',
    hideType : 'xs',
    headerClass : 'dlshouwen-grid-header'
}, {
    id : 'name',
    title : '��ɫ����',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header'
}, {
    id : 'key',
    title : '��ɫ��ʶ',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header'
}, {
    id : 'status',
    title : '��ɫ״̬',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'xs',
    resolution : function(value, record, column, grid, dataNo, columnNo) {
        if(value == 0)
        {
            return '<span class="label label-sm label-success arrowed arrowed-righ">����</span>';
        }else
        {
            return '<span class="label label-sm label-warning arrowed arrowed-righ">��ɾ��</span>';
        }
    }
}, {
    id : 'description',
    title : '��ɫ����',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'xs'
}, {
    id : 'createTime',
    title : '����ʱ��',
    type : 'date',
    format : 'yyyy-MM-dd hh:mm:ss',
    otype : 'string',
    oformat : 'yyyy-MM-dd hh:mm:ss',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs'
}, {
    id : 'updateTime',
    title : '����ʱ��',
    type : 'date',
    format : 'yyyy-MM-dd hh:mm:ss',
    otype : 'string',
    oformat : 'yyyy-MM-dd hh:mm:ss',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md',
    resolution : function(value, record, column, grid, dataNo, columnNo) {
        if (value == null) {
            return '';
        } else {
            return value;
        }
    }
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
    loadURL : sys.rootPath + '/role/list.html',
    columns : dtGridColumns,
    gridContainer : 'dtGridContainer',
    toolbarContainer : 'dtGridToolBarContainer',
    tools : 'refresh|print|export[excel,csv,pdf,txt]',
    exportFileName : '��ɫ��Ϣ',
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
    grid.parameters['name'] = $("#searchKey").val();
    grid.refresh(true);
}


