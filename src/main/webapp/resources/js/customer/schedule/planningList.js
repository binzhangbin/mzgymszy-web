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
    hideType : 'xs'
}, {
    id : 'jobClassName',
    title : 'ִ����',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md|lg'
}, {
    id : 'jobDesc',
    title : '��������',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs'
}, {
    id : 'action',
    title : '����',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    resolution : function(value, record, column, grid, dataNo, columnNo) {
        return '<a onclick="webside.form.schedule.getTrigger(\''+record.jobName+'\',\''+record.jobGroup+'\');" href="javascript:void(0);">�鿴trigger</a>';
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
    loadURL : sys.rootPath + '/scheduleJob/planningJobList.html',
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