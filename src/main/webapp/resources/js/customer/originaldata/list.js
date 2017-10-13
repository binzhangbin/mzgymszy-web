var dtGridColumns = [{
    id : 'gypBm',
    title : '编码',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header'
},{
    id : 'gypMcZm',
    title : '主名称 ',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header'
},{
    id : 'gypMcYm',
    title : '别名',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md'
},{
    id : 'gypScdDw',
    title : '收藏地性质',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md'
},{
    id : 'gypScdScrxm',
    title : '收藏人姓名',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md'
},{
    id : 'gypScdLxfs',
    title : '联系方式',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md'
},{
    id : 'gypScdScdz',
    title : '收藏地址',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md'
},{
    /*id : 'gypScdSjnd',
    title : '收集年代',
    type:'date', 
    format:'yyyy-MM-dd',
    otype:'string', 
    oformat:'yyyy-MM-dd',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md'*/
	id : 'gypScdDq',
    title : '归属人地区',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md'
},{
    id : 'id',
    title : '操作',
    type:'string', 
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md',
    resolution:function(value, record, column, grid, dataNo, columnNo){
    	 var content = '';
    	 content += '<button class="btn btn-xs btn-info" onclick="webside.common.loadPage(\'/originaldata/detailUI.html?id=';
    	 content += value + '\')"><i class="fa fa-plus"></i>&nbsp;详情</button>';
    	 return content;
    }
}
];

//动态设置jqGrid的rowNum
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
    exportFileName : '原始数据',
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
    
    //注册回车键事件
    document.onkeypress = function(e){
    var ev = document.all ? window.event : e;
        if(ev.keyCode==13) {
            customSearch();
        }
    };
    
});

/**
 * 自定义查询
 * 这里不传入分页信息，防止删除记录后重新计算的页码比当前页码小而导致计算异常
 */
function customSearch() {
    grid.parameters = new Object();
    grid.parameters['searchKey'] = $("#searchKey").val();
    grid.refresh(true);
}
