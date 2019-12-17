var dtGridColumns = [{
    id : 'jobName',
    title : '��������',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header'
}, {
    id : 'jobGroup',
    title : '������',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs'
}, {
    id : 'triggerName',
    title : 'trigger����',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs'
}, {
    id : 'triggerGroup',
    title : 'trigger��',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs'
}, {
    id : 'jobStatus',
    title : '����״̬',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md',
    resolution : function(value, record, column, grid, dataNo, columnNo) {
        if(value == 'NONE')
        {
            return '<span class="label label-sm label-pink arrowed arrowed-right">δ֪</span>';
        }else if (value=='NORMAL') 
        {
            return '<span class="label label-sm label-info arrowed arrowed-right">����</span>';
        } else if(value == 'PAUSED')
        {
            return '<span class="label label-sm label-warning arrowed arrowed-right">����ͣ</span>';
        }else if(value == 'COMPLETE')
        {
            return '<span class="label label-sm label-success arrowed arrowed-right">�����</span>';
        }else if(value == 'ERROR')
        {
            return '<span class="label label-sm label-danger arrowed arrowed-right">�쳣</span>';
        }else if(value == 'BLOCKED')
        {
            return '<span class="label label-sm label-light arrowed arrowed-right">�ȴ�����</span>';
        }else
        {
            return '<span class="label label-sm label-pink arrowed arrowed-right">δ֪</span>';
        }
    }
}, {
    id : 'cronExpression',
    title : '���ʽ',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs'
}, {
    id : 'jobClassName',
    title : 'ִ����',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md|lg'
}, {
    id : 'startDate',
    title : 'ִ�п�ʼʱ��',
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
}, {
    id : 'endDate',
    title : 'ִ�н���ʱ��',
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
}, {
    id : 'jobDesc',
    title : '��������',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md|lg'
}, {
    id : 'createTime',
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
    loadAll : true,
    postParams : true,//�Ƿ񴫵ݲ���,ֻ��loadAll=trueʱ��Ч
    isreload : true,//ˢ��ʱ�Ƿ����´ӷ�������ȡ����,ֻ��loadAll=trueʱ��Ч
    check : true,
    checkWidth :'37px',
    extraWidth : '37px',
    loadURL : sys.rootPath + '/scheduleJob/runningJobList.html',
    columns : dtGridColumns,
    gridContainer : 'dtGridContainer',
    toolbarContainer : 'dtGridToolBarContainer',
    tools : 'refresh',
    pageSize : pageSize,
    pageSizeLimit : [10, 20, 30]
};

var grid = $.fn.dlshouwen.grid.init(dtGridOption);
$(function() {
    grid.parameters = new Object();
    grid.parameters['timestamp'] = new Date().getTime();
    grid.load();
});

/**
 * ���¼��ر��
 */
function customSearch() {
    grid.parameters = new Object();
    grid.parameters['timestamp'] = new Date().getTime();
    grid.reload(true);
}