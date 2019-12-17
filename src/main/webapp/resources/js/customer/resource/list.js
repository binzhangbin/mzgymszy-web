var dtGridColumns = [{
    id : 'id',
    title : '���',
    type : 'number',
    columnClass : 'text-center',
    hideType : 'xs',
headerClass : 'dlshouwen-grid-header'
}, {
    id : 'name',
    title : '��Դ����',
    type : 'string',
    columnClass : 'text-center',
headerClass : 'dlshouwen-grid-header'
}, {
    id : 'parentName',
    title : '�ϼ�����',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header'
}, {
    id : 'sourceKey',
    title : '��Դ��ʶ',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'xs'
}, {
    id : 'type',
    title : '��Դ����',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'xs',
    resolution : function(value, record, column, grid, dataNo, columnNo) {
        if(value==0)
        {
            return '<span class="label label-sm label-success arrowed arrowed-in">�˵�</span>';
        }else
        {
            return '<span class="label label-sm label-info arrowed arrowed-right">��ť</span>';
        }
    }
}, {
    id : 'icon',
    title : 'ͼ��',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs',
    resolution : function(value, record, column, grid, dataNo, columnNo) {
        if(value != null && value != "")
        {
            return '<i style="font-size:18px;" class="'+ value +' blue" ></i>';
        }
        else
        {
            return '';
        }
    }
}, {
    id : 'sourceUrl',
    title : '��Դurl',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'xs|sm'
}, {
    id : 'createTime',
    title : '����ʱ��',
    type : 'date',
    format : 'yyyy-MM-dd hh:mm:ss',
    otype : 'string',
    oformat : 'yyyy-MM-dd hh:mm:ss',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'xs|sm|md'
}, {
    id : 'updateTime',
    title : '����ʱ��',
    type : 'date',
    format : 'yyyy-MM-dd hh:mm:ss',
    otype : 'string',
    oformat : 'yyyy-MM-dd hh:mm:ss',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md|lg',
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
    loadURL : sys.rootPath + '/resource/list.html',
    columns : dtGridColumns,
    gridContainer : 'dtGridContainer',
    toolbarContainer : 'dtGridToolBarContainer',
    tools : 'refresh|print',
    exportFileName :'��Դ��Ϣ',
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