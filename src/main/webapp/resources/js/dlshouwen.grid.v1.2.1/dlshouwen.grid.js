/*!
 * DLShouWen Grid v1.2.1
 *
 * includes: jquery, bootstrap, fontawesome, My97 DatePicker
 * Copyright 2016, http://os.dlshouwen.com/grid, http://www.dlshouwen.com
 */
(function($) {
	if(!$.fn.dlshouwen){
		$.fn.dlshouwen = {};
	}
	$.fn.dlshouwen.grid = {
		//��ʼ������
		init : function(options, name) {
			/**
			 * 1. ��ʼ������
			 */
			for(var i=0; i<options.columns.length; i++){
				//��ʼ���в���
				options.columns[i] = $.extend({}, $.fn.dlshouwen.grid.defaultOptions.column, options.columns[i]);  
			}
			//��ʼ��������
			options = $.extend({}, $.fn.dlshouwen.grid.defaultOptions.grid, options);
			//���û�ж�����������Ĭ��GUID���
			if(!options.id){
				options.id = $.fn.dlshouwen.grid.tools.guid();
			}
			//������Դ�����Ĭ��ΪӢ��
			if(!$.fn.dlshouwen.grid.lang[options.lang]){
				options.lang = 'zh-cn';
			}
			/**
			 * 2. �������
			 */
			var gridObject = {
				/**
				 * �������
				 */
				//��ʼ������
				init : {
					//�������Ƿ��ʼ������
					toolsIsInit : false,
					//��ӡ�����Ƿ��ʼ��
					printWindowIsInit : false,
					//���������Ƿ��ʼ��
					exportWindowIsInit : {},
					//���ٲ�ѯ�����Ƿ��ʼ��
					fastQueryWindowIsInit : false,
					//�߼���ѯ�����Ƿ��ʼ��
					advanceQueryWindowIsInit : false
				},
				//ҳ���������
				pager : {
					//ÿҳ��ʾ����
					pageSize : 0,
					//��ʼ��¼��
					startRecord : 0,
					//��ǰҳ��
					nowPage : 0,
					//�ܼ�¼��
					recordCount : 0,
					//��ҳ��
					pageCount : 0
				},
				//����������
				option : options,
				//ԭʼ���ݼ�
				originalDatas : null,
				//�������ݼ�
				baseDatas : null,
				//չ�����ݼ�
				exhibitDatas : null,
				//�������
				sortParameter : {
					//�����б��
					columnId : '',
					//�������ͣ�0-������1-����2-����
					sortType : 0
				},
				//���򻺴��ԭ������
				sortOriginalDatas : null,
				//�����б�
				parameters : null,
				//���ٲ�ѯ�Ĳ����б�
				fastQueryParameters : null,
				//���ٲ�ѯ�����ԭ������
				fastQueryOriginalDatas : null,
				//�߼���ѯ�Ĳ����б�
				advanceQueryParameter : {
					//�߼���ѯ������Ϣ
					advanceQueryConditions : null,
					//�߼���ѯ������Ϣ
					advanceQuerySorts : null
				},
				//��ӡ��
				printColumns : null,
				//������
				exportColumns : null,
				//��������
				exportDatas : null,
				/**
				 * ����������
				 */
				//������񷽷�
				load : function(){
					//���������ӳ��
					var gridReflectionObj = this;
					//��ʾ������
					gridReflectionObj.showProcessBar();
					//�״μ���
					if(gridReflectionObj.init.toolsIsInit==false){
						//���ó�ʼ�����
						gridReflectionObj.init.toolsIsInit = true;
						//���ع��߰�ť
						gridReflectionObj.constructGridToolBar();
						//���ó�ʼ��ҳ���ԣ�ÿҳ��ʾ��������ʼ��¼����ǰҳ��
						gridReflectionObj.pager.pageSize = gridReflectionObj.option.pageSize;
						gridReflectionObj.pager.startRecord = 0;
						gridReflectionObj.pager.nowPage = 1;
						//�������ajax���أ�������������
						if(!gridReflectionObj.option.ajaxLoad){
							gridReflectionObj.hideProcessBar(function(){
								//����ԭʼ���ݼ�
								gridReflectionObj.originalDatas = gridReflectionObj.option.datas;
								gridReflectionObj.originalDatas = gridReflectionObj.originalDatas?gridReflectionObj.originalDatas:new Array();
								//����������ݼ�
								gridReflectionObj.baseDatas = gridReflectionObj.originalDatas.slice(0, gridReflectionObj.originalDatas.length);
								//�����ҳ����
								gridReflectionObj.pager.recordCount = gridReflectionObj.baseDatas.length;
								gridReflectionObj.pager.pageCount = Math.floor((gridReflectionObj.pager.recordCount-1)/gridReflectionObj.pager.pageSize)+1;
								//��ȡչ�����ݼ�
								gridReflectionObj.exhibitDatas = gridReflectionObj.baseDatas.slice(gridReflectionObj.pager.startRecord, gridReflectionObj.pager.startRecord+gridReflectionObj.pager.pageSize);
								//��ȡ�������ݼ�����
								gridReflectionObj.sortOriginalDatas = gridReflectionObj.exhibitDatas.slice(0, gridReflectionObj.exhibitDatas.length);
								//������񡢹�����
								gridReflectionObj.constructGrid();
								gridReflectionObj.constructGridPageBar();
							});
							return;
						}else{
							//�����һ�μ��أ�������������ݵ�ԭʼ����
							if(gridReflectionObj.option.loadAll){
								var url = gridReflectionObj.option.loadURL;
								var param = null;
								//�Ƿ���Ҫ���Ͳ�����������
								if(gridReflectionObj.option.postParams)
								{
								    param = gridReflectionObj.parameters?gridReflectionObj.parameters:new Object();
								}
								$.ajax({
									type:'post',
									url:url,
									data:param,
									contentType: "application/x-www-form-urlencoded; charset=utf-8",
									beforeSend: function(xhr) {xhr.setRequestHeader("__REQUEST_TYPE", "AJAX_REQUEST");},
									success:function(datas){
										gridReflectionObj.hideProcessBar(function(){
											//����ԭʼ���ݼ�
											gridReflectionObj.originalDatas = $.parseJSON(datas);
											gridReflectionObj.originalDatas = gridReflectionObj.originalDatas?gridReflectionObj.originalDatas:new Array();
											//����������ݼ�
											gridReflectionObj.baseDatas = gridReflectionObj.originalDatas.slice(0, gridReflectionObj.originalDatas.length);
											//�����ҳ����
											gridReflectionObj.pager.recordCount = gridReflectionObj.baseDatas.length;
											gridReflectionObj.pager.pageCount = Math.floor((gridReflectionObj.pager.recordCount-1)/gridReflectionObj.pager.pageSize)+1;
											//��ȡչ�����ݼ�
											gridReflectionObj.exhibitDatas = gridReflectionObj.baseDatas.slice(gridReflectionObj.pager.startRecord, gridReflectionObj.pager.startRecord+gridReflectionObj.pager.pageSize);
											//��ȡ�������ݼ�����
											gridReflectionObj.sortOriginalDatas = gridReflectionObj.exhibitDatas.slice(0, gridReflectionObj.exhibitDatas.length);
											//������񡢹�����
											gridReflectionObj.constructGrid();
											gridReflectionObj.constructGridPageBar();
										});
									},
									error:function(XMLHttpRequest, textStatus, errorThrown){
										gridReflectionObj.hideProcessBar(function(){
											$.fn.dlshouwen.grid.tools.toast($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].errors.ajaxLoadError, 'error', 5000);
											//������񡢹�����
											gridReflectionObj.constructGrid();
											gridReflectionObj.constructGridPageBar();
										});
									}
								});
								return;
							}
						}
					}
					//�ǳ�ʼ������
					if(!gridReflectionObj.option.ajaxLoad){
						gridReflectionObj.hideProcessBar(function(){
							//������ٲ�ѯ���߼���ѯ
							if(gridReflectionObj.fastQueryParameters||gridReflectionObj.advanceQueryParameter){
								//������������
								gridReflectionObj.baseDatas = gridReflectionObj.originalDatas;
								//������ٲ�ѯ
								if(gridReflectionObj.fastQueryParameters){
									gridReflectionObj.baseDatas = gridReflectionObj.doFastQueryDatasFilter(gridReflectionObj.baseDatas, gridReflectionObj.fastQueryParameters);
								}
								//����߼���ѯ
								if(gridReflectionObj.advanceQueryParameter){
									gridReflectionObj.baseDatas = gridReflectionObj.doAdvanceQueryDatasFilter(gridReflectionObj.baseDatas, gridReflectionObj.advanceQueryParameter);
								}
							}
							//��¼����ҳ������
							gridReflectionObj.pager.recordCount = gridReflectionObj.baseDatas.length;
							gridReflectionObj.pager.pageCount = gridReflectionObj.pager.recordCount==0?0:(Math.floor((gridReflectionObj.pager.recordCount-1)/gridReflectionObj.pager.pageSize)+1);
							//�����ǰҳ���������ڵ���ҳ��������ʾ���һҳ
							if(gridReflectionObj.pager.nowPage>gridReflectionObj.pager.pageCount){
								gridReflectionObj.pager.nowPage = gridReflectionObj.pager.pageCount;
								gridReflectionObj.pager.startRecord = gridReflectionObj.pager.pageSize*(gridReflectionObj.pager.nowPage-1);
							}
							//���¼��㿪ʼ��¼
							gridReflectionObj.pager.startRecord = gridReflectionObj.pager.pageSize*(gridReflectionObj.pager.nowPage-1);
							//���û�����ݣ������迪ʼ��¼����ǰҳ
							if(gridReflectionObj.baseDatas.length==0){
								gridReflectionObj.pager.nowPage = 1;
								gridReflectionObj.pager.startRecord = 0;
							}
							//��ȡչ�����ݼ�
							gridReflectionObj.exhibitDatas = gridReflectionObj.baseDatas.slice(gridReflectionObj.pager.startRecord, gridReflectionObj.pager.startRecord+gridReflectionObj.pager.pageSize);
							//��ȡ�������ݼ�����
							gridReflectionObj.sortOriginalDatas = gridReflectionObj.exhibitDatas.slice(0, gridReflectionObj.exhibitDatas.length);
							//������񡢹�����
							gridReflectionObj.constructGrid();
							gridReflectionObj.constructGridPageBar();
						});
					}else{
					    if(gridReflectionObj.option.loadAll)
					    {
					        if(gridReflectionObj.option.isreload)
					        {
					            var url = gridReflectionObj.option.loadURL;
                                var param = null;
                                //�Ƿ���Ҫ���Ͳ�����������
                                if(gridReflectionObj.option.postParams)
                                {
                                    param = gridReflectionObj.parameters?gridReflectionObj.parameters:new Object();
                                }
                                $.ajax({
                                    type:'post',
                                    url:url,
                                    data:param,
                                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                                    beforeSend: function(xhr) {xhr.setRequestHeader("__REQUEST_TYPE", "AJAX_REQUEST");},
                                    success:function(datas){
                                        gridReflectionObj.hideProcessBar(function(){
                                            //����ԭʼ���ݼ�
                                            gridReflectionObj.originalDatas = $.parseJSON(datas);
                                            gridReflectionObj.originalDatas = gridReflectionObj.originalDatas?gridReflectionObj.originalDatas:new Array();
                                            //����������ݼ�
                                            gridReflectionObj.baseDatas = gridReflectionObj.originalDatas.slice(0, gridReflectionObj.originalDatas.length);
                                            //�����ҳ����
                                            gridReflectionObj.pager.recordCount = gridReflectionObj.baseDatas.length;
                                            gridReflectionObj.pager.pageCount = Math.floor((gridReflectionObj.pager.recordCount-1)/gridReflectionObj.pager.pageSize)+1;
                                            //��ȡչ�����ݼ�
                                            gridReflectionObj.exhibitDatas = gridReflectionObj.baseDatas.slice(gridReflectionObj.pager.startRecord, gridReflectionObj.pager.startRecord+gridReflectionObj.pager.pageSize);
                                            //��ȡ�������ݼ�����
                                            gridReflectionObj.sortOriginalDatas = gridReflectionObj.exhibitDatas.slice(0, gridReflectionObj.exhibitDatas.length);
                                            //������񡢹�����
                                            gridReflectionObj.constructGrid();
                                            gridReflectionObj.constructGridPageBar();
                                        });
                                    },
                                    error:function(XMLHttpRequest, textStatus, errorThrown){
                                        gridReflectionObj.hideProcessBar(function(){
                                            $.fn.dlshouwen.grid.tools.toast($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].errors.ajaxLoadError, 'error', 5000);
                                            //������񡢹�����
                                            gridReflectionObj.constructGrid();
                                            gridReflectionObj.constructGridPageBar();
                                        });
                                    }
                                });
					        }else
					        {
					            gridReflectionObj.hideProcessBar(function(){
                                //������ٲ�ѯ���߼���ѯ
                                if(gridReflectionObj.fastQueryParameters||gridReflectionObj.advanceQueryParameter){
                                    //������������
                                    gridReflectionObj.baseDatas = gridReflectionObj.originalDatas;
                                    //������ٲ�ѯ
                                    if(gridReflectionObj.fastQueryParameters){
                                        gridReflectionObj.baseDatas = gridReflectionObj.doFastQueryDatasFilter(gridReflectionObj.baseDatas, gridReflectionObj.fastQueryParameters);
                                    }
                                    //����߼���ѯ
                                    if(gridReflectionObj.advanceQueryParameter){
                                        gridReflectionObj.baseDatas = gridReflectionObj.doAdvanceQueryDatasFilter(gridReflectionObj.baseDatas, gridReflectionObj.advanceQueryParameter);
                                    }
                                }
                                //��¼����ҳ������
                                gridReflectionObj.pager.recordCount = gridReflectionObj.baseDatas.length;
                                gridReflectionObj.pager.pageCount = gridReflectionObj.pager.recordCount==0?0:(Math.floor((gridReflectionObj.pager.recordCount-1)/gridReflectionObj.pager.pageSize)+1);
                                //�����ǰҳ���������ڵ���ҳ��������ʾ���һҳ
                                if(gridReflectionObj.pager.nowPage>gridReflectionObj.pager.pageCount){
                                    gridReflectionObj.pager.nowPage = gridReflectionObj.pager.pageCount;
                                    gridReflectionObj.pager.startRecord = gridReflectionObj.pager.pageSize*(gridReflectionObj.pager.nowPage-1);
                                }
                                //���¼��㿪ʼ��¼
                                gridReflectionObj.pager.startRecord = gridReflectionObj.pager.pageSize*(gridReflectionObj.pager.nowPage-1);
                                //���û�����ݣ������迪ʼ��¼����ǰҳ
                                if(gridReflectionObj.baseDatas.length==0){
                                    gridReflectionObj.pager.nowPage = 1;
                                    gridReflectionObj.pager.startRecord = 0;
                                }
                                //��ȡչ�����ݼ�
                                gridReflectionObj.exhibitDatas = gridReflectionObj.baseDatas.slice(gridReflectionObj.pager.startRecord, gridReflectionObj.pager.startRecord+gridReflectionObj.pager.pageSize);
                                //��ȡ�������ݼ�����
                                gridReflectionObj.sortOriginalDatas = gridReflectionObj.exhibitDatas.slice(0, gridReflectionObj.exhibitDatas.length);
                                //������񡢹�����
                                gridReflectionObj.constructGrid();
                                gridReflectionObj.constructGridPageBar();
                            });
				        }
				    }else{
    					    //���������ݺ�̨AJAX��ȡ����
                            var url = gridReflectionObj.option.loadURL;
                            var pager = new Object();
                            pager.isExport = false;
                            pager.pageSize = gridReflectionObj.pager.pageSize;
                            pager.startRecord = gridReflectionObj.pager.startRecord;
                            pager.nowPage = gridReflectionObj.pager.nowPage;
                            pager.recordCount = gridReflectionObj.pager.recordCount?gridReflectionObj.pager.recordCount:-1;
                            pager.pageCount = gridReflectionObj.pager.pageCount?gridReflectionObj.pager.pageCount:-1;
                            pager.parameters = gridReflectionObj.parameters?gridReflectionObj.parameters:new Object();
                            pager.fastQueryParameters = gridReflectionObj.fastQueryParameters?gridReflectionObj.fastQueryParameters:new Object();
                            pager.advanceQueryConditions = (gridReflectionObj.advanceQueryParameter&&gridReflectionObj.advanceQueryParameter.advanceQueryConditions)?gridReflectionObj.advanceQueryParameter.advanceQueryConditions:new Array();
                            pager.advanceQuerySorts = (gridReflectionObj.advanceQueryParameter&&gridReflectionObj.advanceQueryParameter.advanceQuerySorts)?gridReflectionObj.advanceQueryParameter.advanceQuerySorts:new Array();
                            var params = new Object();
                            params.gridPager = JSON.stringify(pager);
                            $.ajax({
                                type:'post',
                                url:url,
                                data:params,
                                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                                beforeSend: function(xhr) {xhr.setRequestHeader("__REQUEST_TYPE", "AJAX_REQUEST");},
                                success:function(pager){
                                    pager = $.parseJSON(pager);
                                    //��������ʾ�п����ǳ��������߼���ѯ������������
                                    if(!pager.isSuccess){
                                        $.fn.dlshouwen.grid.tools.toast($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].errors.ajaxLoadError, 'error', 5000);
                                        gridReflectionObj.hideProcessBar();
                                        return;
                                    }
                                    gridReflectionObj.hideProcessBar(function(){
                                        //����չʾ���ݺͷ�ҳ�����Ϣ
                                        gridReflectionObj.exhibitDatas = pager.exhibitDatas;
                                        //��ȡ�������ݼ�����
                                        gridReflectionObj.sortOriginalDatas = gridReflectionObj.exhibitDatas.slice(0, gridReflectionObj.exhibitDatas.length);
                                        //�����ҳ��Ϣ
                                        gridReflectionObj.pager.pageSize = pager.pageSize;
                                        gridReflectionObj.pager.startRecord = pager.startRecord;
                                        gridReflectionObj.pager.nowPage = pager.nowPage;
                                        gridReflectionObj.pager.recordCount = pager.recordCount;
                                        gridReflectionObj.pager.pageCount = pager.pageCount;
                                        //������񡢹�����
                                        gridReflectionObj.constructGrid();
                                        gridReflectionObj.constructGridPageBar();
                                    });
                                },
                                error:function(XMLHttpRequest, textStatus, errorThrown){
                                    gridReflectionObj.hideProcessBar(function(){
                                        $.fn.dlshouwen.grid.tools.toast($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].errors.ajaxLoadError, 'error', 5000);
                                        //������񡢹�����
                                        gridReflectionObj.constructGrid();
                                        gridReflectionObj.constructGridPageBar();
                                    });
                                }
                            });
					    }
					}
				},
				//������������
				constructGrid : function(){
					//���������ӳ��
					var gridReflectionObj = this;
					//��ȡ��չ����ͷ
					var extraColumnClass = gridReflectionObj.getExtraColumnClass();
					//������ͷ
					var gridContent = '';
					gridContent += '<table class="dlshouwen-grid '+gridReflectionObj.option.tableClass+'" id="dlshouwen_grid_'+gridReflectionObj.option.id+'" style="'+gridReflectionObj.option.tableStyle+'">';
					if(gridReflectionObj.option.showHeader!=false){
						var columns = gridReflectionObj.option.columns;
						gridContent += '<thead>';
						gridContent += '	<tr class="dlshouwen-grid-headers">';
						if(gridReflectionObj.option.extraWidth!=null){
							gridContent += '	<th class="extra-column '+extraColumnClass+'" width="'+gridReflectionObj.option.extraWidth+'"></th>';
						}else{
							gridContent += '	<th class="extra-column '+extraColumnClass+'"></th>';
						}
						if(gridReflectionObj.option.check){
							if(gridReflectionObj.option.checkWidth!=null){
								gridContent += '	<th class="check-column" width="'+gridReflectionObj.option.checkWidth+'"><input type="checkbox" id="dlshouwen_grid_'+gridReflectionObj.option.id+'_check" value="check"></th>';
							}else{
								gridContent += '	<th class="check-column"><input type="checkbox" id="dlshouwen_grid_'+gridReflectionObj.option.id+'_check" value="check"></th>';
							}
						}
						for(var i=0; i<columns.length; i++){
							if(columns[i].width!=null){
								gridContent += '	<th width="'+columns[i].width+'" columnNo="'+i+'" columnId="'+columns[i].id+'" class="dlshouwen-grid-header '+gridReflectionObj.getColumnClassForHide(columns[i])+' '+columns[i].headerClass+' can-sort" style="'+columns[i].headerStyle+'">';
							}else{
								gridContent += '	<th columnNo="'+i+'" columnId="'+columns[i].id+'" class="dlshouwen-grid-header '+gridReflectionObj.getColumnClassForHide(columns[i])+' '+columns[i].headerClass+' can-sort" style="'+columns[i].headerStyle+'">';
							}
							if(gridReflectionObj.sortParameter&&gridReflectionObj.sortParameter.columnId&&gridReflectionObj.sortParameter.columnId==columns[i].id){
								if(gridReflectionObj.sortParameter.sortType=='1'){
									gridContent += '<span class="dlshouwen-grid-sort">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].sortColumn.asc+'</span>';
								}
								if(gridReflectionObj.sortParameter.sortType=='2'){
									gridContent += '<span class="dlshouwen-grid-sort dlshouwen-grid-sort-desc">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].sortColumn.desc+'</span>';
								}
							}
							gridContent += '		'+columns[i].title;
							gridContent += '	</th>';
						}
						gridContent += '	</tr>';
						gridContent += '</thead>';
					}
					//�������
					gridContent += '	<tbody>';
					if(gridReflectionObj.exhibitDatas!=null){
						if(gridReflectionObj.sortParameter&&gridReflectionObj.sortParameter.columnId){
							if(gridReflectionObj.sortParameter.sortType!=0){
								gridReflectionObj.exhibitDatas = gridReflectionObj.exhibitDatas.sort(function(record1, record2){
									var value1 = record1[gridReflectionObj.sortParameter.columnId];
									var value2 = record2[gridReflectionObj.sortParameter.columnId];
									//��ֵ�Ƚ�
									if(!isNaN(value1)&&!isNaN(value2)){
										if(gridReflectionObj.sortParameter.sortType==1){
											return value1-value2;
										}
										if(gridReflectionObj.sortParameter.sortType==2){
											return value2-value1;
										}
									}
									//���ڱȽ�
									if(value1 instanceof Date&&value2 instanceof Date){
										if(gridReflectionObj.sortParameter.sortType==1){
											return value1.getTime()-value2.getTime();
										}
										if(gridReflectionObj.sortParameter.sortType==2){
											return value2.getTime()-value1.getTime();
										}
									}
									//��ͨ�Ƚ�
									if(value1!=null&&gridReflectionObj.sortParameter.sortType==1){
										return value1.localeCompare(value2);
									}
									if(value2!=null&&gridReflectionObj.sortParameter.sortType==2){
										return value2.localeCompare(value1);
									}
									return 0;
								});
							}else{
								gridReflectionObj.exhibitDatas = gridReflectionObj.sortOriginalDatas.slice(0, gridReflectionObj.sortOriginalDatas.length);
							}
						}
						for(var i=0; i<gridReflectionObj.exhibitDatas.length; i++){
							gridContent += '	<tr class="dlshouwen-grid-row" dataNo="'+i+'">';
							if(gridReflectionObj.option.extraWidth!=null){
								gridContent += '	<td class="extra-column extra-column-event '+extraColumnClass+'" width="'+gridReflectionObj.option.extraWidth+'" dataNo="'+i+'">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].extraColumn.open+'</td>';
							}else{
								gridContent += '	<td class="extra-column extra-column-event '+extraColumnClass+'" dataNo="'+i+'">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].extraColumn.open+'</td>';
							}
							if(gridReflectionObj.option.check){
								if(gridReflectionObj.option.checkWidth!=null){
									gridContent += '	<td class="check-column text-center" width="'+gridReflectionObj.option.checkWidth+'"><input type="checkbox" dataNo="'+i+'" id="dlshouwen_grid_'+gridReflectionObj.option.id+'_check_'+i+'" class="dlshouwen-grid-check" value="'+i+'"></td>';
								}else{
									gridContent += '	<td class="check-column text-center"><input type="checkbox" dataNo="'+i+'" id="dlshouwen_grid_'+gridReflectionObj.option.id+'_check_'+i+'" class="dlshouwen-grid-check" value="'+i+'"></td>';
								}
							}
							var columns = gridReflectionObj.option.columns;
							for(var j=0; j<columns.length; j++){
								if(columns[j].width!=null){
									gridContent += '	<td width="'+columns[j].width+'" dataNo="'+i+'" columnNo="'+j+'" class="dlshouwen-grid-cell '+gridReflectionObj.getColumnClassForHide(columns[j])+' '+columns[j].columnClass+'" style="'+columns[j].columnStyle+'">';
								}else{
									gridContent += '	<td dataNo="'+i+'" columnNo="'+j+'" class="dlshouwen-grid-cell '+gridReflectionObj.getColumnClassForHide(columns[j])+' '+columns[j].columnClass+'" style="'+columns[j].columnStyle+'">';
								}
								var value = gridReflectionObj.exhibitDatas[i][columns[j].id];
								value = value==null?'':value;
								if(columns[j].resolution){
									gridContent += columns[j].resolution(value, gridReflectionObj.exhibitDatas[i], columns[j], gridReflectionObj, i, j);
								}else{
									gridContent += gridReflectionObj.formatContent(columns[j], value);
								}
								gridContent += '	</td>';
							}
							gridContent += '	</tr>';
							gridContent += '	<tr id="dlshouwen_grid_'+gridReflectionObj.option.id+'_extra_columns_'+i+'" class="dlshouwen-grid-extra-columns hidden">';
							gridContent += '		<td dataNo="'+i+'" colspan="'+(columns.length+1+(gridReflectionObj.option.check?1:0))+'">';
							for(var j=0; j<columns.length; j++){
								if(columns[j].extra==false){
									continue;
								}
								gridContent += '		<p dataNo="'+i+'" columnNo="'+j+'" class="dlshouwen-grid-cell '+gridReflectionObj.getExtraColumnClassForHide(columns[j])+'">';
								gridContent += '			'+columns[j].title+' : ';
								var value = gridReflectionObj.exhibitDatas[i][columns[j].id];
								value = value==null?'':value;
								if(columns[j].resolution){
									gridContent += columns[j].resolution(value, gridReflectionObj.exhibitDatas[i], columns[j], gridReflectionObj, i, j);
								}else{
									gridContent += gridReflectionObj.formatContent(columns[j], value);
								}
								gridContent += '		</p>';
							}
							gridContent += '		</td>';
							gridContent += '	</tr>';
						}
					}
					gridContent += '	</tbody>';
					gridContent += '</table>';
					$('#dlshouwen_grid_'+gridReflectionObj.option.id).remove();
					$('#'+gridReflectionObj.option.gridContainer).append(gridContent);
					//����gridId
					var gridId = gridReflectionObj.option.id;
					//�󶨵�Ԫ�񵥻�����
					if(gridReflectionObj.option.onCellClick){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-cell').click(function(e){
							gridReflectionObj.bindCellEvent(gridReflectionObj.option.onCellClick, this, e);
						});
					}
					//�󶨵�Ԫ��˫������
					if(gridReflectionObj.option.onCellDblClick){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-cell').dblclick(function(e){
							gridReflectionObj.bindCellEvent(gridReflectionObj.option.onCellDblClick, this, e);
						});
					}
					//�󶨵�Ԫ����껬������
					if(gridReflectionObj.option.onCellMouseOver){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-cell').mouseover(function(e){
							gridReflectionObj.bindCellEvent(gridReflectionObj.option.onCellMouseOver, this, e);
						});
					}
					//�󶨵�Ԫ������ƶ�����
					if(gridReflectionObj.option.onCellMouseMove){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-cell').mousemove(function(e){
							gridReflectionObj.bindCellEvent(gridReflectionObj.option.onCellMouseMove, this, e);
						});
					}
					//�󶨵�Ԫ����껬������
					if(gridReflectionObj.option.onCellMouseOut){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-cell').mouseout(function(e){
							gridReflectionObj.bindCellEvent(gridReflectionObj.option.onCellMouseOut, this, e);
						});
					}
					//�󶨵�Ԫ����갴�·���
					if(gridReflectionObj.option.onCellMouseDown){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-cell').mousedown(function(e){
							gridReflectionObj.bindCellEvent(gridReflectionObj.option.onCellMouseDown, this, e);
						});
					}
					//�󶨵�Ԫ������ͷŷ���
					if(gridReflectionObj.option.onCellMouseUp){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-cell').mouseup(function(e){
							gridReflectionObj.bindCellEvent(gridReflectionObj.option.onCellMouseUp, this, e);
						});
					}
					//���е�������
					if(gridReflectionObj.option.onRowClick){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-cell').click(function(e){
							gridReflectionObj.bindRowEvent(gridReflectionObj.option.onRowClick, this, e);
						});
					}
					//����˫������
					if(gridReflectionObj.option.onRowDblClick){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-cell').dblclick(function(e){
							gridReflectionObj.bindRowEvent(gridReflectionObj.option.onRowDblClick, this, e);
						});
					}
					//������껬������
					if(gridReflectionObj.option.onRowMouseOver){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-cell').mouseover(function(e){
							gridReflectionObj.bindRowEvent(gridReflectionObj.option.onRowMouseOver, this, e);
						});
					}
					//��������ƶ�����
					if(gridReflectionObj.option.onRowMouseMove){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-cell').mousemove(function(e){
							gridReflectionObj.bindRowEvent(gridReflectionObj.option.onRowMouseMove, this, e);
						});
					}
					//������껬������
					if(gridReflectionObj.option.onRowMouseOut){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-cell').mouseout(function(e){
							gridReflectionObj.bindRowEvent(gridReflectionObj.option.onRowMouseOut, this, e);
						});
					}
					//������갴�·���
					if(gridReflectionObj.option.onRowMouseDown){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-cell').mousedown(function(e){
							gridReflectionObj.bindRowEvent(gridReflectionObj.option.onRowMouseDown, this, e);
						});
					}
					//��������ͷŷ���
					if(gridReflectionObj.option.onRowMouseUp){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-cell').mouseup(function(e){
							gridReflectionObj.bindRowEvent(gridReflectionObj.option.onRowMouseUp, this, e);
						});
					}
					//�󶨱�ͷ��������
					if(gridReflectionObj.option.onHeaderClick){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-header').click(function(e){
							gridReflectionObj.bindHeaderEvent(gridReflectionObj.option.onHeaderClick, this, e);
						});
					}
					/**
					 * �޸�����ͷ˫�ӷ������ڱ�ͷ�ĵ���������Ҫ���¼��أ�����˫���¼��޷���Ӧ��ȡ�����¼�
					 */
					/**
					//�󶨱�ͷ˫������
					if(gridReflectionObj.option.onHeaderDblClick){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-header').dblclick(function(e){
							gridReflectionObj.bindHeaderEvent(gridReflectionObj.option.onHeaderDblClick, this, e);
						});
					}
					 */
					//�󶨱�ͷ��껬������
					if(gridReflectionObj.option.onHeaderMouseOver){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-header').mouseover(function(e){
							gridReflectionObj.bindHeaderEvent(gridReflectionObj.option.onHeaderMouseOver, this, e);
						});
					}
					//�󶨱�ͷ����ƶ�����
					if(gridReflectionObj.option.onHeaderMouseMove){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-header').mousemove(function(e){
							gridReflectionObj.bindHeaderEvent(gridReflectionObj.option.onHeaderMouseMove, this, e);
						});
					}
					//�󶨱�ͷ��껬������
					if(gridReflectionObj.option.onHeaderMouseOut){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-header').mouseout(function(e){
							gridReflectionObj.bindHeaderEvent(gridReflectionObj.option.onHeaderMouseOut, this, e);
						});
					}
					//�󶨱�ͷ��갴�·���
					if(gridReflectionObj.option.onHeaderMouseDown){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-header').mousedown(function(e){
							gridReflectionObj.bindHeaderEvent(gridReflectionObj.option.onHeaderMouseDown, this, e);
						});
					}
					//�󶨱�ͷ����ͷŷ���
					if(gridReflectionObj.option.onHeaderMouseUp){
						$('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-header').mouseup(function(e){
							gridReflectionObj.bindHeaderEvent(gridReflectionObj.option.onHeaderMouseUp, this, e);
						});
					}
					//�󶨱�񵥻�����
					if(gridReflectionObj.option.onGridClick){
						$('#dlshouwen_grid_'+gridId).click(function(e){
							gridReflectionObj.bindGridEvent(gridReflectionObj.option.onGridClick, e);
						});
					}
					//�󶨱��˫������
					if(gridReflectionObj.option.onGridDblClick){
						$('#dlshouwen_grid_'+gridId).dblclick(function(e){
							gridReflectionObj.bindGridEvent(gridReflectionObj.option.onGridDblClick, e);
						});
					}
					//�󶨱����껬������
					if(gridReflectionObj.option.onGridMouseOver){
						$('#dlshouwen_grid_'+gridId).mouseover(function(e){
							gridReflectionObj.bindGridEvent(gridReflectionObj.option.onGridMouseOver, e);
						});
					}
					//�󶨱������ƶ�����
					if(gridReflectionObj.option.onGridMouseMove){
						$('#dlshouwen_grid_'+gridId).mousemove(function(e){
							gridReflectionObj.bindGridEvent(gridReflectionObj.option.onGridMouseMove, e);
						});
					}
					//�󶨱����껬������
					if(gridReflectionObj.option.onGridMouseOut){
						$('#dlshouwen_grid_'+gridId).mouseout(function(e){
							gridReflectionObj.bindGridEvent(gridReflectionObj.option.onGridMouseOut, e);
						});
					}
					//�󶨱����갴�·���
					if(gridReflectionObj.option.onGridMouseDown){
						$('#dlshouwen_grid_'+gridId).mousedown(function(e){
							gridReflectionObj.bindGridEvent(gridReflectionObj.option.onGridMouseDown, e);
						});
					}
					//�󶨱������ͷŷ���
					if(gridReflectionObj.option.onGridMouseUp){
						$('#dlshouwen_grid_'+gridId).mouseup(function(e){
							gridReflectionObj.bindGridEvent(gridReflectionObj.option.onGridMouseUp, e);
						});
					}
					//�󶨱�������ɷ���
					if(gridReflectionObj.option.onGridComplete){
						gridReflectionObj.bindGridEvent(gridReflectionObj.option.onGridComplete);
					}
					//����������
					$('#dlshouwen_grid_'+gridId+' .extra-column-event').click(function(e){
						var dataNo = $(this).attr('dataNo');
						if($('#dlshouwen_grid_'+gridId+'_extra_columns_'+dataNo).hasClass('hidden')){
							$('#dlshouwen_grid_'+gridId+'_extra_columns_'+dataNo).removeClass('hidden');
							$(this).html($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].extraColumn.close);
							//����չ��չ������
							if(gridReflectionObj.option.onExtraOpen){
								var row = $('#dlshouwen_grid_'+gridId+' tr[dataNo="'+dataNo+'"]');
								gridReflectionObj.bindExtraEvent(gridReflectionObj.option.onExtraOpen, row, e);
							}
						}else{
							$('#dlshouwen_grid_'+gridId+'_extra_columns_'+dataNo).addClass('hidden');
							$(this).html($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].extraColumn.open);
							//����չ�йرշ���
							if(gridReflectionObj.option.onExtraClose){
								var row = $('#dlshouwen_grid_'+gridId+' tr[dataNo="'+dataNo+'"]');
								gridReflectionObj.bindExtraEvent(gridReflectionObj.option.onExtraClose, row, e);
							}
						}
					});
					//�����򷽷�
					$('#dlshouwen_grid_'+gridId+' .can-sort').click(function(){
						//��ȡ�б��
						var columnId = $(this).attr('columnId');
						//���ݵ�ǰ���������������ʾ������ͼ��
						if(gridReflectionObj.sortParameter==null){
							gridReflectionObj.sortParameter = new Object();
						}
						if(!gridReflectionObj.sortParameter.columnId||gridReflectionObj.sortParameter.columnId!=columnId){
							gridReflectionObj.sortParameter.columnId = columnId;
							gridReflectionObj.sortParameter.sortType = 1;
						}else{
							var sortType = gridReflectionObj.sortParameter.sortType;
							if(sortType==0){
								gridReflectionObj.sortParameter.sortType = 1;
							}else if(sortType==1){
								gridReflectionObj.sortParameter.sortType = 2;
							}else if(sortType==2){
								gridReflectionObj.sortParameter.sortType = 0;
							}
						}
						//���¼�������
						gridReflectionObj.reload();
					});
					//�󶨸�ѡ����
					if(gridReflectionObj.option.onCheck){
						$('input[id*=dlshouwen_grid_'+gridId+'_check_]').click(function(e){
							gridReflectionObj.bindCheckEvent(gridReflectionObj.option.onCheck, this, e);
						});
					}
					//�󶨸�ѡ������ȫѡ��ѡ��
					if(gridReflectionObj.option.check){
						$('#dlshouwen_grid_'+gridId+'_check').click(function(e){
							$('input[id*=dlshouwen_grid_'+gridId+'_check_]').prop('checked', this.checked);
							if(gridReflectionObj.option.onCheck){
								$('input[id*=dlshouwen_grid_'+gridId+'_check_]').each(function(){
									gridReflectionObj.bindCheckEvent(gridReflectionObj.option.onCheck, this, e);
								});
							}
						});
					}
				},
				//�󶨵�Ԫ���¼�
				bindCellEvent : function(func, cellObject, e){
					//���������ӳ��
					var gridReflectionObj = this;
					//����gridId
					var gridId = gridReflectionObj.option.id;
					//��ȡ���ݺš��к�
					var dataNo = $(cellObject).attr('dataNo');
					var columnNo = $(cellObject).attr('columnNo');
					//��ȡ��ǰColumn����
					var column = gridReflectionObj.option.columns[columnNo];
					//��ȡ��ǰ��¼
					var record = gridReflectionObj.exhibitDatas[dataNo];
					//��ȡ��ǰֵ�������ģ�
					var value;
					if(column.resolution){
						value = column.resolution(record[column.id], record, column, gridReflectionObj, dataNo, columnNo);
					}else{
						value = gridReflectionObj.formatContent(column, record[column.id]);
					}
					//��ȡ��ǰ��Ԫ��jQuery����
					var cell = $(cellObject);
					//��ȡ��ǰ��jQuery����
					var row = $('#dlshouwen_grid_'+gridId+' tr[dataNo="'+dataNo+'"]');
					//��ȡ��չ��jQuery����
					var extraCell = $('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-extra-columns>td[dataNo="'+dataNo+'"]');
					func(value, record, column, gridReflectionObj, dataNo, columnNo, cell, row, extraCell, e);
				},
				//�����¼�
				bindRowEvent : function(func, cellObject, e){
					//���������ӳ��
					var gridReflectionObj = this;
					//����gridId
					var gridId = gridReflectionObj.option.id;
					//��ȡ���ݺš��к�
					var dataNo = $(cellObject).attr('dataNo');
					var columnNo = $(cellObject).attr('columnNo');
					//��ȡ��ǰColumn����
					var column = gridReflectionObj.option.columns[columnNo];
					//��ȡ��ǰ��¼
					var record = gridReflectionObj.exhibitDatas[dataNo];
					//��ȡ��ǰֵ�������ģ�
					var value;
					if(column.resolution){
						value = column.resolution(record[column.id], record, column, gridReflectionObj, dataNo, columnNo);
					}else{
						value = gridReflectionObj.formatContent(column, record[column.id]);
					}
					//��ȡ��ǰ��Ԫ��jQuery����
					var cell = $(cellObject);
					//��ȡ��ǰ��jQuery����
					var row = $('#dlshouwen_grid_'+gridId+' tr[dataNo="'+dataNo+'"]');
					//��ȡ��չ��jQuery����
					var extraCell = $('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-extra-columns>td[dataNo="'+dataNo+'"]');
					func(value, record, column, gridReflectionObj, dataNo, columnNo, cell, row, extraCell, e);
				},
				//�󶨱�ͷ�¼�
				bindHeaderEvent : function(func, headerObject, e){
					//���������ӳ��
					var gridReflectionObj = this;
					//����gridId
					var gridId = gridReflectionObj.option.id;
					//��ȡ�к�
					var columnNo = $(headerObject).attr('columnNo');
					//��ȡ��ǰColumn����
					var column = gridReflectionObj.option.columns[columnNo];
					//��ȡ��ǰ��ͷ����
					var title = column.title;
					//��ȡ��ǰ��Ԫ��jQuery����
					var header = $(headerObject);
					//��ȡ��ǰ��jQuery����
					var headerRow = $('#dlshouwen_grid_'+gridId+' tr.dlshouwen-grid-headers');
					func(title, column, gridReflectionObj, columnNo, header, headerRow, e);
				},
				//�󶨱�ͷ�¼�
				bindGridEvent : function(func, e){
					//���������ӳ��
					var gridReflectionObj = this;
					func(gridReflectionObj, e);
				},
				//����չ���¼�
				bindExtraEvent : function(func, rowObject, e){
					//���������ӳ��
					var gridReflectionObj = this;
					//����gridId
					var gridId = gridReflectionObj.option.id;
					//��ȡ���ݺ�
					var dataNo = $(rowObject).attr('dataNo');
					//��ȡ��ǰ��¼
					var record = gridReflectionObj.exhibitDatas[dataNo];
					//��ȡ��ǰ��jQuery����
					var row = $('#dlshouwen_grid_'+gridId+' tr[dataNo="'+dataNo+'"]');
					//��ȡ��չ��jQuery����
					var extraCell = $('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-extra-columns>td[dataNo="'+dataNo+'"]');
					func(record, gridReflectionObj, dataNo, row, extraCell, e);
				},
				//�󶨸�ѡ�¼�
				bindCheckEvent : function(func, checkInput, e){
					//���������ӳ��
					var gridReflectionObj = this;
					//����gridId
					var gridId = gridReflectionObj.option.id;
					//��ȡ���ݺš��к�
					var dataNo = $(checkInput).attr('dataNo');
					//��ȡ��ǰ��¼
					var record = gridReflectionObj.exhibitDatas[dataNo];
					//��ȡ��ǰ��jQuery����
					var row = $('#dlshouwen_grid_'+gridId+' tr[dataNo="'+dataNo+'"]');
					//��ȡ��չ��jQuery����
					var extraCell = $('#dlshouwen_grid_'+gridId+' .dlshouwen-grid-extra-columns>td[dataNo="'+dataNo+'"]');
					func(checkInput.checked, record, gridReflectionObj, dataNo, row, extraCell, e);
				},
				//������ҳ����
				constructGridPageBar : function(){
					//���������ӳ��
					var gridReflectionObj = this;
					//��չ�����
					$('#'+gridReflectionObj.option.toolbarContainer+' .dlshouwen-grid-pager').html('');
					//��ȡ��ǰҳ��ÿҳ��������ҳ��
					var nowPage = gridReflectionObj.pager.nowPage;
					var pageCount = gridReflectionObj.pager.pageCount;
					//���ù�������ʼ����
					var gridStatus = document.createElement('span');
					if(gridReflectionObj.exhibitDatas==null||gridReflectionObj.exhibitDatas.length<=0){
						gridStatus.className = 'dlshouwen-grid-pager-status text-primary';
						gridStatus.innerHTML = $.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.nothing;
					}else{
						gridStatus.className = 'dlshouwen-grid-pager-status text-primary';
						var info = $.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.info;
						info = $.fn.dlshouwen.grid.tools.replaceAll(info, '{startRecord}', gridReflectionObj.pager.startRecord);
						info = $.fn.dlshouwen.grid.tools.replaceAll(info, '{nowPage}', gridReflectionObj.pager.nowPage);
						info = $.fn.dlshouwen.grid.tools.replaceAll(info, '{recordCount}', gridReflectionObj.pager.recordCount);
						info = $.fn.dlshouwen.grid.tools.replaceAll(info, '{pageCount}', gridReflectionObj.pager.pageCount);
						//����ÿҳ������DOM����
						var pageSizeElement = '';
						var pageSize = gridReflectionObj.pager.pageSize;
						//��������
						if(typeof gridReflectionObj.option.pageSizeLimit == 'object'){
							pageSizeElement += '<select id="dlshouwen_grid_change_page_size_'+gridReflectionObj.option.id+'" name="dlshouwen_grid_change_page_size_'+gridReflectionObj.option.id+'" class="form-control change-page-size">';
							//���Ͽ���ҳ��
							var isHasNowPageSize = false;
							var pageSizeLimit = new Array();
							for(var i=0; i<gridReflectionObj.option.pageSizeLimit.length; i++){
								var loopPageSize = gridReflectionObj.option.pageSizeLimit[i];
								pageSizeLimit.push(parseFloat(loopPageSize));
								if(pageSize==loopPageSize){
									isHasNowPageSize = true;
								}
							}
							if(!isHasNowPageSize){
								pageSizeLimit.push(pageSize);
							}
							//�Ե�ǰҳ����������
							pageSizeLimit.sort(function(s1, s2){
								return s1>s2;
							});
							//д�����
							for(var i=0; i<pageSizeLimit.length; i++){
								var loopPageSize = pageSizeLimit[i];
								pageSizeElement += '	<option '+(pageSize==loopPageSize?'selected="selected"':'')+' value="'+loopPageSize+'">'+loopPageSize+'</option>';
							}
							pageSizeElement += '</select>';
							info = $.fn.dlshouwen.grid.tools.replaceAll(info, '{pageSize}', pageSizeElement);
						}else if(typeof gridReflectionObj.option.pageSizeLimit == 'number'){
							//�������ֵ������Ϊ�ı���
							pageSizeElement += '<input id="dlshouwen_grid_change_page_size_'+gridReflectionObj.option.id+'" name="dlshouwen_grid_change_page_size_'+gridReflectionObj.option.id+'" type="text" class="form-control change-page-size" value="'+gridReflectionObj.pager.pageSize+'" />';
							info = $.fn.dlshouwen.grid.tools.replaceAll(info, '{pageSize}', pageSizeElement);
						}else{
							info = $.fn.dlshouwen.grid.tools.replaceAll(info, '{pageSize}', pageSize);
						}
						gridStatus.innerHTML = info;
					}
					var operations = document.createElement('ul');
					operations.id = gridReflectionObj.option.id+'_dlshouwenGridOperations';
					operations.className = 'pagination pagination-sm dlshouwen-grid-pager-button';
					$('#'+gridReflectionObj.option.toolbarContainer+' .dlshouwen-grid-pager').append(operations);
					$('#'+gridReflectionObj.option.toolbarContainer+' .dlshouwen-grid-pager').append(gridStatus);
					//���޸�ÿҳ��ʾ�������¼�
					$('#dlshouwen_grid_change_page_size_'+gridReflectionObj.option.id).change(function(){
						var changePageSize = parseFloat(this.value);
						if(isNaN(changePageSize)){
							$.fn.dlshouwen.grid.tools.toast($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.errors.notANumber, 'warning', 3000);
							$('#dlshouwen_grid_change_page_size_'+gridReflectionObj.option.id).val(gridReflectionObj.pager.pageSize);
							return;
						}
						if(typeof gridReflectionObj.option.pageSizeLimit == 'number'){
							if(changePageSize>gridReflectionObj.option.pageSizeLimit){
								$.fn.dlshouwen.grid.tools.toast($.fn.dlshouwen.grid.tools.replaceAll($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.errors.maxPageSize, '{pageSizeLimit}', gridReflectionObj.option.pageSizeLimit), 'warning', 3000);
								$('#dlshouwen_grid_change_page_size_'+gridReflectionObj.option.id).val(gridReflectionObj.pager.pageSize);
								return;
							}
						}
						gridReflectionObj.pager.pageSize = changePageSize;
						gridReflectionObj.reload(true);
					});
					//�����ҳ��ť
					if(gridReflectionObj.exhibitDatas!=null&&gridReflectionObj.exhibitDatas.length>0){
						//��һҳ��ť
						var goFirstBtn = document.createElement('li');
						goFirstBtn.id = 'dlshouwen_grid_'+gridReflectionObj.option.id+'_page_first';
						goFirstBtn.title = $.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.firstPageTitle;
						if(nowPage<=1){
							goFirstBtn.className = 'disabled';
							goFirstBtn.title = $.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.alreadyFirstPage;
						}
						goFirstBtn.innerHTML = '<a href="javascript:void(0);">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.firstPage+'</a>';
						$('#'+gridReflectionObj.option.id+'_dlshouwenGridOperations').append(goFirstBtn);
						$('#dlshouwen_grid_'+gridReflectionObj.option.id+'_page_first').click(function(){
							gridReflectionObj.loadByPage('first');
						});
						//��һҳ��ť
						var goPrevBtn = document.createElement('li');
						goPrevBtn.id = 'dlshouwen_grid_'+gridReflectionObj.option.id+'_page_prev';
						goPrevBtn.title = $.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.prevPageTitle;
						if(nowPage<=1){
							goPrevBtn.className = 'disabled';
							goPrevBtn.title = $.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.alreadyFirstPage;
						}
						goPrevBtn.innerHTML = '<a href="javascript:void(0);">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.prevPage+'</a>';
						$('#'+gridReflectionObj.option.id+'_dlshouwenGridOperations').append(goPrevBtn);
						$('#dlshouwen_grid_'+gridReflectionObj.option.id+'_page_prev').click(function(){
							gridReflectionObj.loadByPage('prev');
						});
						//ҳ���б�
						if(pageCount<=5){
							for(var i=1; i<=pageCount; i++){
								var goPageBtn = document.createElement('li');
								goPageBtn.id = 'dlshouwen_grid_'+gridReflectionObj.option.id+'_page_'+i;
								goPageBtn.setAttribute('page', i);
								goPageBtn.title = $.fn.dlshouwen.grid.tools.replaceAll($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.nowPageTitle, '{nowPage}', i);
								goPageBtn.className = i==nowPage?'active':'';
								goPageBtn.innerHTML = '<a href="javascript:void(0);">'+$.fn.dlshouwen.grid.tools.replaceAll($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.nowPage, '{nowPage}', i)+'</a>';
								$('#'+gridReflectionObj.option.id+'_dlshouwenGridOperations').append(goPageBtn);
								if(i!=nowPage){
									$('#dlshouwen_grid_'+gridReflectionObj.option.id+'_page_'+i).click(function(){
										gridReflectionObj.goPage($(this).attr('page'));
									});
								}
							}
						}else{
							//��ȡ��ʼ��������
							var before = 2;
							var after = 2;
							var start = (nowPage-before)<1?1:(nowPage-before);
							var end = (nowPage+after)>pageCount?pageCount:(nowPage+after);
							if((end-start+1)<(before+after+1)){
								if(start==1){
									end = end+((before+after+1)-(end-start+1));
									end = end>pageCount?pageCount:end;
								}
								if(end==pageCount){
									start = start-((before+after+1)-(end-start+1));
									start = start<1?1:start;
								}
							}
							for(var i=start; i<=end; i++){
								var goPageBtn = document.createElement('li');
								goPageBtn.id = 'dlshouwen_grid_'+gridReflectionObj.option.id+'_page_'+i;
								goPageBtn.setAttribute('page', i);
								goPageBtn.title = $.fn.dlshouwen.grid.tools.replaceAll($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.nowPageTitle, '{nowPage}', i);
								goPageBtn.className = i==nowPage?'active':'';
								goPageBtn.innerHTML = '<a href="javascript:void(0);">'+$.fn.dlshouwen.grid.tools.replaceAll($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.nowPage, '{nowPage}', i)+'</a>';
								$('#'+gridReflectionObj.option.id+'_dlshouwenGridOperations').append(goPageBtn);
								if(i!=nowPage){
									$('#dlshouwen_grid_'+gridReflectionObj.option.id+'_page_'+i).click(function(){
										gridReflectionObj.goPage($(this).attr('page'));
									});
								}
							}
						}
						var showPageText = document.createElement('li');
						showPageText.className = 'active';
						showPageText.innerHTML = '<a href="javascript:void(0);">'+gridReflectionObj.pager.nowPage+'</a>';
						//��һҳ��ť
						var goNextBtn = document.createElement('li');
						goNextBtn.id = 'dlshouwen_grid_'+gridReflectionObj.option.id+'_page_next';
						goNextBtn.title = $.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.nextPageTitle;
						if(nowPage>=pageCount){
							goNextBtn.className = 'disabled';
							goNextBtn.title = $.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.alreadyLastPage;
						}
						goNextBtn.innerHTML = '<a href="javascript:void(0);">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.nextPage+'</a>';
						$('#'+gridReflectionObj.option.id+'_dlshouwenGridOperations').append(goNextBtn);
						$('#dlshouwen_grid_'+gridReflectionObj.option.id+'_page_next').click(function(){
							gridReflectionObj.loadByPage('next');
						});
						//���һҳ��ť
						var goLastBtn = document.createElement('li');
						goLastBtn.id = 'dlshouwen_grid_'+gridReflectionObj.option.id+'_page_last';
						goLastBtn.title = $.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.lastPageTitle;
						if(nowPage>=pageCount){
							goLastBtn.className = 'disabled';
							goLastBtn.title = $.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.alreadyLastPage;
						}
						goLastBtn.innerHTML = '<a href="javascript:void(0);">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].pageInfo.lastPage+'</a>';
						$('#'+gridReflectionObj.option.id+'_dlshouwenGridOperations').append(goLastBtn);
						$('#dlshouwen_grid_'+gridReflectionObj.option.id+'_page_last').click(function(){
							gridReflectionObj.loadByPage('last');
						});
					}
					//�������
					$('#'+gridReflectionObj.option.toolbarContainer+' .dlshouwen-grid-pager').append('<div class="clearfix"></div>');
					$('#'+gridReflectionObj.option.toolbarContainer).append('<div class="clearfix"></div>');
				},
				//��������������
				toolbar : function(type){
					//ӳ�������
					var gridReflectionObj = this;
					//���幤��������
					var toolbars = {
						refresh : '<li title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].toolbar.refreshTitle+'"><a href="javascript:void(0);" id="refreshGrid_replaceId">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].toolbar.refresh+'</a></li>',
						fastQuery : '<li title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].toolbar.fastQueryTitle+'"><a href="javascript:void(0);" id="fastQuery_replaceId">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].toolbar.fastQuery+'</a></li>',
						advanceQuery : '<li title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].toolbar.advanceQueryTitle+'"><a href="javascript:void(0);" id="advanceQuery_replaceId">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].toolbar.advanceQuery+'</a></li>',
						exportExcel : '<li title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].toolbar.exportExcelTitle+'"><a href="javascript:void(0);" id="exportExcelGrid_replaceId">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].toolbar.exportExcel+'</a></li>',
						exportCsv : '<li title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].toolbar.exportCsvTitle+'"><a href="javascript:void(0);" id="exportCsvGrid_replaceId">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].toolbar.exportCsv+'</a></li>',
						exportPdf : '<li title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].toolbar.exportPdfTitle+'"><a href="javascript:void(0);" id="exportPdfGrid_replaceId">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].toolbar.exportPdf+'</a></li>',
						exportTxt : '<li title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].toolbar.exportTxtTitle+'"><a href="javascript:void(0);" id="exportTxtGrid_replaceId">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].toolbar.exportTxt+'</a></li>',
						print : '<li title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].toolbar.printTitle+'"><a href="javascript:void(0);" id="printGrid_replaceId">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].toolbar.print+'</a></li>'
					};
					return toolbars[type];
				},
				//����������
				constructGridToolBar : function(){
					//ӳ�������
					var gridReflectionObj = this;
					//��չ�����
					$('#'+gridReflectionObj.option.toolbarContainer).html('<span class="pagination pagination-sm dlshouwen-grid-tools"></span><span class="dlshouwen-grid-pager"></span>');
					//���Ϊ�������κβ���
					if(gridReflectionObj.option.tools==undefined||gridReflectionObj.option.tools==null||gridReflectionObj.option.tools==''){
						return;
					}
					//���������������б�
					var tools = gridReflectionObj.option.tools;
					for(var i=0; i<tools.split('|').length; i++){
						var tool = tools.split('|')[i];
						//����ˢ��
						if(tool=='refresh'){
							var content = $.fn.dlshouwen.grid.tools.replaceAll(gridReflectionObj.toolbar('refresh'), 'replaceId', gridReflectionObj.option.id);
							$('#'+gridReflectionObj.option.toolbarContainer+' .dlshouwen-grid-tools').append(content);
							//�󶨷���
							$('#refreshGrid_'+gridReflectionObj.option.id).click(function(){
								gridReflectionObj.reload(true);
							});
						}
						//������ٲ�ѯ
						if(tool=='fastQuery'){
							var content = $.fn.dlshouwen.grid.tools.replaceAll(gridReflectionObj.toolbar('fastQuery'), 'replaceId', gridReflectionObj.option.id);
							$('#'+gridReflectionObj.option.toolbarContainer+' .dlshouwen-grid-tools').append(content);
							//�󶨷���
							$('#fastQuery_'+gridReflectionObj.option.id).click(function(){
								gridReflectionObj.fastQuery();
							});
						}
						//����߼���ѯ
						if(tool=='advanceQuery'){
							var content = $.fn.dlshouwen.grid.tools.replaceAll(gridReflectionObj.toolbar('advanceQuery'), 'replaceId', gridReflectionObj.option.id);
							$('#'+gridReflectionObj.option.toolbarContainer+' .dlshouwen-grid-tools').append(content);
							//�󶨷���
							$('#advanceQuery_'+gridReflectionObj.option.id).click(function(){
								gridReflectionObj.advanceQuery();
							});
						}
						//������
						if(tool.indexOf('export')!=-1){
							tool = $.fn.dlshouwen.grid.tools.replaceAll(tool, 'export', '');
							tool = $.fn.dlshouwen.grid.tools.replaceAll(tool, '\\[', '');
							tool = $.fn.dlshouwen.grid.tools.replaceAll(tool, '\\]', '');
							var content = '';
							for(var j=0; j<tool.split(',').length; j++){
								var exportTool = tool.split(',')[j];
								if(exportTool=='excel'){
									content += $.fn.dlshouwen.grid.tools.replaceAll(gridReflectionObj.toolbar('exportExcel'), 'replaceId', gridReflectionObj.option.id);
								}
								if(exportTool=='csv'){
									content += $.fn.dlshouwen.grid.tools.replaceAll(gridReflectionObj.toolbar('exportCsv'), 'replaceId', gridReflectionObj.option.id);
								}
								if(exportTool=='pdf'){
									content += $.fn.dlshouwen.grid.tools.replaceAll(gridReflectionObj.toolbar('exportPdf'), 'replaceId', gridReflectionObj.option.id);
								}
								if(exportTool=='txt'){
									content += $.fn.dlshouwen.grid.tools.replaceAll(gridReflectionObj.toolbar('exportTxt'), 'replaceId', gridReflectionObj.option.id);
								}
							}
							$('#'+gridReflectionObj.option.toolbarContainer+' .dlshouwen-grid-tools').append(content);
							//�󶨷���
							for(var j=0; j<tool.split(',').length; j++){
								var exportTool = tool.split(',')[j];
								if(exportTool=='excel'){
									$('#exportExcelGrid_'+gridReflectionObj.option.id).click(function(){
										gridReflectionObj.exportFile('excel');
									});
								}
								if(exportTool=='csv'){
									$('#exportCsvGrid_'+gridReflectionObj.option.id).click(function(){
										gridReflectionObj.exportFile('csv');
									});
								}
								if(exportTool=='pdf'){
									$('#exportPdfGrid_'+gridReflectionObj.option.id).click(function(){
										gridReflectionObj.exportFile('pdf');
									});
								}
								if(exportTool=='txt'){
									$('#exportTxtGrid_'+gridReflectionObj.option.id).click(function(){
										gridReflectionObj.exportFile('txt');
									});
								}
							}
						}
						//�����ӡ
						if(tool=='print'){
							var content = $.fn.dlshouwen.grid.tools.replaceAll(gridReflectionObj.toolbar('print'), 'replaceId', gridReflectionObj.option.id);
							$('#'+gridReflectionObj.option.toolbarContainer+' .dlshouwen-grid-tools').append(content);
							//�󶨷���
							$('#printGrid_'+gridReflectionObj.option.id).click(function(){
								gridReflectionObj.print();
							});
						}
					}
				},
				/**
				 * ��������ڲ�ʹ�÷���
				 */
				//����������
				processBarThread : null,
				processWidth : null,
				showProcessBar : function(){
					var gridReflectionObj = this;
					clearInterval(gridReflectionObj.processBarThread);
					$('#dlshouwen_grid_process_bar_top_'+gridReflectionObj.option.id).remove();
					$('#dlshouwen_grid_process_bar_bottom_'+gridReflectionObj.option.id).remove();
					gridReflectionObj.processWidth = 0;
					gridReflectionObj.processBarThread = null;
					var content = '';
					content += '<div class="dlshouwen-grid-process-bar-top bg-primary" id="dlshouwen_grid_process_bar_top_'+gridReflectionObj.option.id+'"></div>';
					content += '<div class="dlshouwen-grid-process-bar-bottom bg-primary" id="dlshouwen_grid_process_bar_bottom_'+gridReflectionObj.option.id+'"></div>';
					$('#'+gridReflectionObj.option.gridContainer).append(content);
					gridReflectionObj.processWidth += Math.random()*(100-gridReflectionObj.processWidth)*0.1;
					$('#dlshouwen_grid_process_bar_top_'+gridReflectionObj.option.id).animate({width:gridReflectionObj.processWidth+'%'}, 200);
					$('#dlshouwen_grid_process_bar_bottom_'+gridReflectionObj.option.id).animate({width:gridReflectionObj.processWidth+'%'}, 200);
					gridReflectionObj.processBarThread = setInterval(function(){
						gridReflectionObj.processWidth += Math.random()*(100-gridReflectionObj.processWidth)*0.1;
						$('#dlshouwen_grid_process_bar_top_'+gridReflectionObj.option.id).animate({width:gridReflectionObj.processWidth+'%'}, 200);
						$('#dlshouwen_grid_process_bar_bottom_'+gridReflectionObj.option.id).animate({width:gridReflectionObj.processWidth+'%'}, 200);
					}, 200);
				},
				hideProcessBar : function(callback){
					var gridReflectionObj = this;
					clearInterval(gridReflectionObj.processBarThread);
					var gridReflectionObj = this;
					$('#dlshouwen_grid_process_bar_top_'+gridReflectionObj.option.id).animate({width:'100%'}, 100, function(){
						$('#dlshouwen_grid_process_bar_top_'+gridReflectionObj.option.id).remove();
						callback();
					});
					$('#dlshouwen_grid_process_bar_bottom_'+gridReflectionObj.option.id).animate({width:'100%'}, 100, function(){
						$('#dlshouwen_grid_process_bar_bottom_'+gridReflectionObj.option.id).remove();
					});
				},
				//��ʽ������
				formatContent:function(column, value){
					try{
						//�����codeTable
						if(column.codeTable){
							var codeTableValue = column.codeTable[value];
							return codeTableValue?codeTableValue:value;
						}
						//�����number��date������Ҫ���Ǹ�ʽ������
						if(column.type=='number'&&column.format){
							return $.fn.dlshouwen.grid.tools.numberFormat(value, column.format);
						}
						if(column.type=='date'&&column.format){
							if(column.otype){
								if(column.otype=='time_stamp_s'){
									value = new Date(parseFloat(value)*1000);
									return $.fn.dlshouwen.grid.tools.dateFormat(value, column.format);
								}else if(column.otype=='time_stamp_ms'){
									value = new Date(parseFloat(value));
									return $.fn.dlshouwen.grid.tools.dateFormat(value, column.format);
								}else if(column.otype=='string'){
									if(column.oformat){
										value = $.fn.dlshouwen.grid.tools.toDate(value, column.oformat);
										return $.fn.dlshouwen.grid.tools.dateFormat(value, column.format);
									}
								}
							}else{
								return $.fn.dlshouwen.grid.tools.dateFormat(value, column.format);
							}
						}
					}catch(e){}
					return value;
				},
				//�ж����׵�������ť���Ƿ���ʾ
				getExtraColumnClass : function(){
					//���������ӳ��
					var gridReflectionObj = this;
					var extraColumnClass = '';
					var temp = [true, true, true, true];
					var columns = gridReflectionObj.option.columns;
					for(var i=0; i<columns.length; i++){
						var column = columns[i];
						if(column.hide!=true&&column.hideType!=undefined){
							var hideTypeArr = column.hideType.split('|');
							for(var j=0; j<hideTypeArr.length; j++){
								var type = hideTypeArr[j];
								if(type=='lg') temp[0]='visible-lg';
								if(type=='md') temp[1]='visible-md';
								if(type=='sm') temp[2]='visible-sm';
								if(type=='xs') temp[3]='visible-xs';
							}
						}
					}
					for(var i=0; i<temp.length; i++){
						if(temp[i]!=true) extraColumnClass += temp[i] + ' ';
					}
					if(extraColumnClass=='')
						extraColumnClass = 'hidden ';
					return extraColumnClass;
				},
				//��ȡ����������ʽ��
				getColumnClassForHide : function(column){
					var showClass = '';
					if(column.hide==true){
						showClass += 'hidden ';
						return showClass;
					}
					if(column.hideType!=undefined){
						var hideTypeArr = column.hideType.split('|');
						for(var i=0; i<hideTypeArr.length; i++){
							var type = hideTypeArr[i];
							if(type=='lg') showClass += 'hidden-lg ';
							if(type=='md') showClass += 'hidden-md ';
							if(type=='sm') showClass += 'hidden-sm ';
							if(type=='xs') showClass += 'hidden-xs ';
						}
					}
					return showClass;
				},
				//��ȡ��չ����������ʽ��
				getExtraColumnClassForHide : function(column){
					var showClass = '';
					if(column.hide==true){
						showClass += 'hidden ';
						return showClass;
					}
					if(column.hideType!=undefined){
						var hideTypeArr = column.hideType.split('|');
						for(var i=0; i<hideTypeArr.length; i++){
							var type = hideTypeArr[i];
							if(type=='lg') showClass += 'visible-lg ';
							if(type=='md') showClass += 'visible-md ';
							if(type=='sm') showClass += 'visible-sm ';
							if(type=='xs') showClass += 'visible-xs ';
						}
						if(showClass=='')
							showClass = 'hidden ';
					}else{
						showClass = 'hidden ';
					}
					return showClass;
				},
				//��תҳ��
				goPage : function(_page){
					//���������ӳ��
					var gridReflectionObj = this;
					var pageSize = gridReflectionObj.pager.pageSize;
					var pageCount = gridReflectionObj.pager.pageCount;
					var page = parseFloat(_page);
					if(!isNaN(page)){
						if(0<page&&page<=pageCount){
							gridReflectionObj.pager.nowPage = page;
							gridReflectionObj.pager.startRecord = pageSize*(page-1);
							gridReflectionObj.load();
						}
						if(page<=0){
							gridReflectionObj.loadByPage('first');
						}
						if(page>pageCount){
							gridReflectionObj.loadByPage('last');
						}
					}
				},
				//����ҳ�����¼��أ������ò�����first��prev��next��last
				loadByPage : function(type){
					//���������ӳ��
					var gridReflectionObj = this;
					type = type?type:'';
					if(type=='first'){
						var nowPage = gridReflectionObj.pager.nowPage;
						if(nowPage>1){
							gridReflectionObj.pager.startRecord = 0;
							gridReflectionObj.pager.nowPage = 1;
							gridReflectionObj.load();
						}
					}else if(type=='prev'){
						var nowPage = gridReflectionObj.pager.nowPage;
						var pageSize = gridReflectionObj.pager.pageSize;
						if(nowPage>1){
							nowPage--;
							gridReflectionObj.pager.nowPage = nowPage;
							gridReflectionObj.pager.startRecord = pageSize*(nowPage-1);
							gridReflectionObj.load();
						}
					}else if(type=='next'){
						var nowPage = gridReflectionObj.pager.nowPage;
						var pageSize = gridReflectionObj.pager.pageSize;
						var pageCount = gridReflectionObj.pager.pageCount;
						if(nowPage<pageCount){
							nowPage++;
							gridReflectionObj.pager.nowPage = nowPage;
							gridReflectionObj.pager.startRecord = pageSize*(nowPage-1);
							gridReflectionObj.load();
						}
					}else if(type=='last'){
						var nowPage = gridReflectionObj.pager.nowPage;
						var pageCount = gridReflectionObj.pager.pageCount;
						if(nowPage<pageCount){
							var pageSize = gridReflectionObj.pager.pageSize;
							var pageCount = gridReflectionObj.pager.pageCount;
							gridReflectionObj.pager.nowPage = pageCount==0?1:pageCount;
							gridReflectionObj.pager.startRecord = pageSize*(pageCount-1);
							if(gridReflectionObj.pager.startRecord<0)
								gridReflectionObj.pager.startRecord = 0;
							gridReflectionObj.load();
						}
					}else{
						gridReflectionObj.load();
					}
				},
				/**
				 * ���ٲ�ѯ���
				 */
				//ִ�п��ٲ�ѯ
				fastQuery : function(){
					//���������ӳ��
					var gridReflectionObj = this;
					//����Ѿ���ʼ�����������ʾ
					if(gridReflectionObj.init.fastQueryWindowIsInit){
						$('#fast_query_'+gridReflectionObj.option.id+'_modal').modal('show');
						return;
					}
					var content = '';
					content += $.fn.dlshouwen.grid.tools.getWindowStart('fast_query_'+gridReflectionObj.option.id, $.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].fastQuery.title);
					content += '<form id="fastQueryForm_'+gridReflectionObj.option.id+'">';
					content += '	<div class="modal-body form-horizontal">';
					for(var j=0; j<gridReflectionObj.option.columns.length; j++){
						var column = gridReflectionObj.option.columns[j];
						if(column.fastQuery==true){
							content += '<div class="form-group">';
							content += '	<label class="col-sm-3 control-label text-right">'+column.title+'��</label>';
							if(column.fastQueryType=='range'){
								content += '<div class="col-sm-4">';
								if(column.type=='date'){
									content += '<div class="input-group">';
									content += '	<input type="text" class="form-control" id="ge_'+column.id+'" name="ge_'+column.id+'" format="'+column.format+'" placeholder="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].fastQuery.selectStart+column.title+'" onclick="WdatePicker({dateFmt:\''+$.fn.dlshouwen.grid.tools.replaceAll(column.format, 'h', 'H')+'\'});" />';
									content += '	<div class="input-group-addon"><i class="fa fa-calendar"></i></div>';
									content += '</div>';
								}else{
									content += '<input type="text" class="form-control" id="ge_'+column.id+'" name="ge_'+column.id+'" placeholder="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].fastQuery.inputStart+column.title+'" />';
								}
								content += '</div>';
								content += '<div class="col-sm-4">';
								if(column.type=='date'){
									content += '<div class="input-group">';
									content += '	<input type="text" class="form-control" id="le_'+column.id+'" name="le_'+column.id+'" format="'+column.format+'" placeholder="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].fastQuery.selectEnd+column.title+'" onclick="WdatePicker({dateFmt:\''+$.fn.dlshouwen.grid.tools.replaceAll(column.format, 'h', 'H')+'\'});" />';
									content += '	<div class="input-group-addon"><i class="fa fa-calendar"></i></div>';
									content += '</div>';
								}else{
									content += '<input type="text" class="form-control" id="le_'+column.id+'" name="le_'+column.id+'" placeholder="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].fastQuery.inputEnd+column.title+'" />';
								}
								content += '</div>';
							}else if(column.codeTable){
								content += '<div class="col-sm-4">';
								content += '	<select class="form-control" id="'+column.fastQueryType+'_'+column.id+'" name="'+column.fastQueryType+'_'+column.id+'">';
								content += '		<option value="">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].fastQuery.codeTableSelectAll+'</option>';
								for(var key in column.codeTable){
									content += '	<option value="'+key+'">'+column.codeTable[key]+'</option>';
								}
								content += '	</select>';
								content += '</div>';
							}else{
								content += '<div class="col-sm-4">';
								if(column.type=='date'){
									content += '<div class="input-group">';
									var hoderName = $.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].fastQuery.selectStart;
									if(column.fastQueryType=='lt'||column.fastQueryType=='le'){
										hoderName = $.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].fastQuery.selectEnd;
									}
									content += '	<input type="text" class="form-control" id="'+column.fastQueryType+'_'+column.id+'" name="'+column.fastQueryType+'_'+column.id+'" format="'+column.format+'" placeholder="'+hoderName+column.title+'" onclick="WdatePicker({dateFmt:\''+$.fn.dlshouwen.grid.tools.replaceAll(column.format, 'h', 'H')+'\'});" />';
									content += '	<div class="input-group-addon"><i class="fa fa-calendar"></i></div>';
									content += '</div>';
								}else{
									content += '<input type="text" class="form-control" id="'+column.fastQueryType+'_'+column.id+'" name="'+column.fastQueryType+'_'+column.id+'" placeholder="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].fastQuery.input+column.title+'" />';
								}
								content += '</div>';
							}
							content += '</div>';
						}
					}
					content += '	</div>';
					content += '</form>';
					var buttons = '';
					buttons += '<button type="button" class="btn btn-warning" id="resetFastQuery_'+gridReflectionObj.option.id+'">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].fastQuery.buttons.reset+'</button>';
					buttons += '<button type="button" class="btn btn-primary" id="doFastQuery_'+gridReflectionObj.option.id+'">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].fastQuery.buttons.query+'</button>';
					content += $.fn.dlshouwen.grid.tools.getWindowEnd($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].buttons.close, buttons);
					$('body').append(content);
					//�󶨷���
					$('#resetFastQuery_'+gridReflectionObj.option.id).click(function(){
						document.forms['fastQueryForm_'+gridReflectionObj.option.id].reset();
					});
					$('#doFastQuery_'+gridReflectionObj.option.id).click(function(){
						gridReflectionObj.doFastQuery(document.forms['fastQueryForm_'+gridReflectionObj.option.id]);
						$('#fast_query_'+gridReflectionObj.option.id+'_modal').modal('hide');
					});
					//��ʾ���ٲ�ѯ
					$('#fast_query_'+gridReflectionObj.option.id+'_modal').modal('show');
					//��ʶ��ʼ�����
					gridReflectionObj.init.fastQueryWindowIsInit = true;
				},
				//���ٲ�ѯ����
				doFastQuery : function(form){
					//���������ӳ��
					var gridReflectionObj = this;
					//��տ��ٲ�ѯ�еĲ���
					gridReflectionObj.fastQueryParameters = new Object();
					//������ȡ���ٲ�ѯ����
					var elements = form.elements;
					for(var i=0;i<elements.length;i++){
						var element = elements[i];
						if($.fn.dlshouwen.grid.tools.equalsIgnoreCase(element.type, 'text') 
								|| $.fn.dlshouwen.grid.tools.equalsIgnoreCase(element.type, 'hidden') 
								|| $.fn.dlshouwen.grid.tools.equalsIgnoreCase(element.type, 'textarea') 
								|| $.fn.dlshouwen.grid.tools.equalsIgnoreCase(element.type, 'select-one') 
								|| $.fn.dlshouwen.grid.tools.equalsIgnoreCase(element.type, 'password')){
							if (element.name != ""){
								gridReflectionObj.fastQueryParameters[element.name] = element.value;
								gridReflectionObj.fastQueryParameters[element.name+'_format'] = element.getAttribute('format');
							}
						}else if (($.fn.dlshouwen.grid.tools.equalsIgnoreCase(element.type, 'checkbox') || $.fn.dlshouwen.grid.tools.equalsIgnoreCase(element.type, 'radio')) && element.checked){
							if (element.name != ""){
								gridReflectionObj.fastQueryParameters[element.name] = element.value;
								gridReflectionObj.fastQueryParameters[element.name+'_format'] = element.getAttribute('format');
							}
						}
					}
					gridReflectionObj.load();
				},
				//���ٲ�ѯ���ݹ��ˣ����޷�ajax��ҳ����ģʽ��
				doFastQueryDatasFilter : function(originalDatas, fastQueryParameters){
					var returnDatas = new Array();
					for(var i=0; i<originalDatas.length; i++){
						var record = originalDatas[i];
						var isShow = true;
						for(var key in fastQueryParameters){
							if(fastQueryParameters[key]&&fastQueryParameters[key]!=null&&fastQueryParameters[key]!=''){
								if($.fn.dlshouwen.grid.tools.startsWith(key, 'eq_')){
									var value = record[key.replace('eq_', '')];
									value = value?value:'';
									if(value!=fastQueryParameters[key]){
										isShow = false;
										continue;
									}
								}
								if($.fn.dlshouwen.grid.tools.startsWith(key, 'ne_')){
									var value = record[key.replace('ne_', '')];
									value = value?value:'';
									if(value==fastQueryParameters[key]){
										isShow = false;
										continue;
									}
								}
								if($.fn.dlshouwen.grid.tools.startsWith(key, 'lk_')){
									var value = record[key.replace('lk_', '')];
									value = value?value:'';
									if(value.indexOf(fastQueryParameters[key])==-1){
										isShow = false;
										continue;
									}
								}
								if($.fn.dlshouwen.grid.tools.startsWith(key, 'll_')){
									var value = record[key.replace('ll_', '')];
									value = value?value:'';
									if(!$.fn.dlshouwen.grid.tools.startsWith(value, fastQueryParameters[key])){
										isShow = false;
										continue;
									}
								}
								if($.fn.dlshouwen.grid.tools.startsWith(key, 'rl_')){
									var value = record[key.replace('rl_', '')];
									value = value?value:'';
									if(!$.fn.dlshouwen.grid.tools.endsWith(value, fastQueryParameters[key])){
										isShow = false;
										continue;
									}
								}
								if($.fn.dlshouwen.grid.tools.startsWith(key, 'gt_')){
									var value = record[key.replace('gt_', '')];
									value = value?value:'';
									//���ڱȽ�
									if(value instanceof Date){
										if((value.getTime()-$.fn.dlshouwen.grid.tools.toDate(fastQueryParameters[key], fastQueryParameters[key+'_format']).getTime())<=0){
											isShow = false;
											continue;
										}
									}
									//��ֵ�Ƚ�
									if(!(value instanceof Date)&&!isNaN(value)){
										if((parseFloat(value) - parseFloat(fastQueryParameters[key]))<=0){
											isShow = false;
											continue;
										}
									}
									//��ͨ�Ƚ�
									if(!(value instanceof Date)&&isNaN(value)){
										if(value.localeCompare(fastQueryParameters[key])<=0){
											isShow = false;
											continue;
										}
									}
								}
								if($.fn.dlshouwen.grid.tools.startsWith(key, 'ge_')){
									var value = record[key.replace('ge_', '')];
									value = value?value:'';
									//���ڱȽ�
									if(value instanceof Date){
										if((value.getTime()-$.fn.dlshouwen.grid.tools.toDate(fastQueryParameters[key], fastQueryParameters[key+'_format']).getTime())<0){
											isShow = false;
											continue;
										}
									}
									//��ֵ�Ƚ�
									if(!(value instanceof Date)&&!isNaN(value)){
										if((parseFloat(value) - parseFloat(fastQueryParameters[key]))<0){
											isShow = false;
											continue;
										}
									}
									//��ͨ�Ƚ�
									if(!(value instanceof Date)&&isNaN(value)){
										if(value.localeCompare(fastQueryParameters[key])<0){
											isShow = false;
											continue;
										}
									}
								}
								if($.fn.dlshouwen.grid.tools.startsWith(key, 'lt_')){
									var value = record[key.replace('lt_', '')];
									value = value?value:'';
									//���ڱȽ�
									if(value instanceof Date){
										if((value.getTime()-$.fn.dlshouwen.grid.tools.toDate(fastQueryParameters[key], fastQueryParameters[key+'_format']).getTime())>=0){
											isShow = false;
											continue;
										}
									}
									//��ֵ�Ƚ�
									if(!(value instanceof Date)&&!isNaN(value)){
										if((parseFloat(value) - parseFloat(fastQueryParameters[key]))>=0){
											isShow = false;
											continue;
										}
									}
									//��ͨ�Ƚ�
									if(!(value instanceof Date)&&isNaN(value)){
										if(value.localeCompare(fastQueryParameters[key])>=0){
											isShow = false;
											continue;
										}
									}
								}
								if($.fn.dlshouwen.grid.tools.startsWith(key, 'le_')){
									var value = record[key.replace('le_', '')];
									value = value?value:'';
									//���ڱȽ�
									if(value instanceof Date){
										if((value.getTime()-$.fn.dlshouwen.grid.tools.toDate(fastQueryParameters[key], fastQueryParameters[key+'_format']).getTime())>0){
											isShow = false;
											continue;
										}
									}
									//��ֵ�Ƚ�
									if(!(value instanceof Date)&&!isNaN(value)){
										if((parseFloat(value) - parseFloat(fastQueryParameters[key]))>0){
											isShow = false;
											continue;
										}
									}
									//��ͨ�Ƚ�
									if(!(value instanceof Date)&&isNaN(value)){
										if(value.localeCompare(fastQueryParameters[key])>0){
											isShow = false;
											continue;
										}
									}
								}
							}
						}
						if(isShow){
							returnDatas.push(record);
						}
					}
					return returnDatas;
				},
				/**
				 * �߼���ѯ���
				 */
				//�߼���ѯ����
				advanceQuery : function(){
					//���������ӳ��
					var gridReflectionObj = this;
					//����Ѿ���ʼ�����������ʾ
					if(gridReflectionObj.init.advanceQueryWindowIsInit){
						$('#advance_query_'+gridReflectionObj.option.id+'_modal').modal('show');
						return;
					}
					//���ز�ѯ����
					var content = '';
					content += $.fn.dlshouwen.grid.tools.getWindowStart('advance_query_'+gridReflectionObj.option.id, $.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.title);
					content += '<div class="modal-body advance-query">';
					content += '	<ul class="nav nav-tabs" role="tablist">';
//					content += '		<li><a href="#advance_query_plan_'+gridReflectionObj.option.id+'" role="tab" data-toggle="tab">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.plan.title+'</a></li>';
					content += '		<li class="active"><a href="#advance_query_condition_'+gridReflectionObj.option.id+'" role="tab" data-toggle="tab">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.title+'</a></li>';
					content += '		<li><a href="#advance_query_sort_'+gridReflectionObj.option.id+'" role="tab" data-toggle="tab">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.sort.title+'</a></li>';
					content += '	</ul>';
					content += '	<div class="tab-content">';
//					content += '		<div class="tab-pane" id="advance_query_plan_'+gridReflectionObj.option.id+'">';
//					content += '			<div class="panel panel-default">';
//					content += '				<input type="hidden" id="advanceQueryId_'+gridReflectionObj.option.id+'" name="advanceQueryId_'+gridReflectionObj.option.id+'" />';
//					content += '				<div class="form-horizontal" style="padding-top:15px;">';
//					content += '					<div class="form-group">';
//					content += '						<label class="col-sm-3 control-label text-right">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.plan.advanceQueryName+'</label>';
//					content += '						<div class="col-sm-6">';
//					content += '							<input type="text" class="form-control" id="advanceQueryName_'+gridReflectionObj.option.id+'" name="advanceQueryName_'+gridReflectionObj.option.id+'" placeholder="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.plan.advanceQueryNamePlaceHoder+'">';
//					content += '						</div>';
//					content += '					</div>';
//					content += '					<div class="form-group">';
//					content += '						<label class="col-sm-3 control-label text-right">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.plan.remark+'</label>';
//					content += '						<div class="col-sm-6">';
//					content += '							<textarea id="remark_'+gridReflectionObj.option.id+'" name="remark_'+gridReflectionObj.option.id+'" class="form-control" placeholder="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.plan.remarkPlaceHoder+'"></textarea>';
//					content += '						</div>';
//					content += '					</div>';
//					content += '					<div class="form-group">';
//					content += '						<div class="col-sm-offset-3 col-sm-12">';
//					content += '							<button id="addAdvanceQuery_'+gridReflectionObj.option.id+'" title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.plan.buttons.addAdvanceQueryTitle+'" class="btn btn-xs btn-primary">';
//					content += '								'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.plan.buttons.addAdvanceQuery;
//					content += '							</button>';
//					content += '							<button id="editAdvanceQuery_'+gridReflectionObj.option.id+'" title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.plan.buttons.editAdvanceQueryTitle+'" class="btn btn-xs btn-primary">';
//					content += '								'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.plan.buttons.editAdvanceQuery;
//					content += '							</button>';
//					content += '							<button id="copyAdvanceQuery_'+gridReflectionObj.option.id+'" title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.plan.buttons.copyAdvanceQueryTitle+'" class="btn btn-xs btn-warning">';
//					content += '								'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.plan.buttons.copyAdvanceQuery;
//					content += '							</button>';
//					content += '							<button id="deleteAdvanceQuery_'+gridReflectionObj.option.id+'" title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.plan.buttons.deleteAdvanceQueryTitle+'" class="btn btn-xs btn-danger">';
//					content += '								'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.plan.buttons.deleteAdvanceQuery;
//					content += '							</button>';
//					content += '						</div>';
//					content += '					</div>';
//					content += '				</div>';
//					content += '			</div>';
//					content += '		</div>';
					content += '		<div class="tab-pane active" id="advance_query_condition_'+gridReflectionObj.option.id+'">';
					content += '			<div class="panel panel-default">';
					content += '				<div class="form-horizontal text-right advance-query-buttons">';
					content += '					<button id="insertConditionTr_'+gridReflectionObj.option.id+'" title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.buttons.insertTitle+'" class="btn btn-xs btn-primary">';
					content += '						'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.buttons.insert;
					content += '					</button>';
					content += '					<button id="clearConditionTr_'+gridReflectionObj.option.id+'" title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.buttons.clearTitle+'" class="btn btn-xs btn-danger">';
					content += '						'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.buttons.clear;
					content += '					</button>';
					content += '				</div>';
					content += '				<div class="advance-query-table-container">';
					content += '					<table id="conditionTable_'+gridReflectionObj.option.id+'" class="table table-bordered table-striped table-hover table-condition table-center" style="width:860px;">';
					content += '						<tr>';
					content += '							<th style="width:50px;">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.table.sequence+'</th>';
					content += '							<th style="width:100px;">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.table.operation+'</th>';
					content += '							<th style="width:80px;">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.table.leftParentheses+'</th>';
					content += '							<th style="width:140px;">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.table.field+'</th>';
					content += '							<th style="width:120px;">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.table.condition+'</th>';
					content += '							<th>'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.table.value+'</th>';
					content += '							<th style="width:80px;">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.table.rightParentheses+'</th>';
					content += '							<th style="width:90px;">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.table.logic+'</th>';
					content += '						</tr>';
					content += '					</table>';
					content += '				</div>';
					content += '				<div class="clearfix"></div>';
					content += '			</div>';
					content += '		</div>';
					content += '		<div class="tab-pane" id="advance_query_sort_'+gridReflectionObj.option.id+'">';
					content += '			<div class="panel panel-default">';
					content += '				<div class="form-horizontal text-right advance-query-buttons">';
					content += '					<button id="insertSortTr_'+gridReflectionObj.option.id+'" title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.sort.buttons.insertTitle+'" class="btn btn-xs btn-primary">';
					content += '						'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.sort.buttons.insert;
					content += '					</button>';
					content += '					<button id="clearSortTr_'+gridReflectionObj.option.id+'" title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.sort.buttons.clearTitle+'" class="btn btn-xs btn-danger">';
					content += '						'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.sort.buttons.clear;
					content += '					</button>';
					content += '				</div>';
					content += '				<div class="advance-query-table-container">';
					content += '					<table id="sortTable_'+gridReflectionObj.option.id+'" class="table table-bordered table-striped table-hover table-condition table-center">';
					content += '						<tr>';
					content += '							<th>'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.sort.table.sequence+'</th>';
					content += '							<th>'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.sort.table.operation+'</th>';
					content += '							<th>'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.sort.table.field+'</th>';
					content += '							<th>'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.sort.table.logic+'</th>';
					content += '						</tr>';
					content += '					</table>';
					content += '				</div>';
					content += '				<div class="clearfix"></div>';
					content += '			</div>';
					content += '		</div>';
					content += '	</div>';
					content += '</div>';
					var buttons = '';
					buttons += '<button type="button" class="btn btn-primary" id="doAdvanceQuery_'+gridReflectionObj.option.id+'">';
					buttons += '	'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.buttons.query;
					buttons += '</button>';
					content += $.fn.dlshouwen.grid.tools.getWindowEnd($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].buttons.close, buttons);
					$('body').append(content);
//					//�����߼���ѯ����
//					$('#insertConditionTr_'+gridReflectionObj.option.id).click(function(){
//					});
//					//�༭�߼���ѯ����
//					$('#editConditionTr_'+gridReflectionObj.option.id).click(function(){
//					});
//					//��ֵ�߼���ѯ����
//					$('#copyConditionTr_'+gridReflectionObj.option.id).click(function(){
//					});
//					//ɾ���߼���ѯ����
//					$('#deleteConditionTr_'+gridReflectionObj.option.id).click(function(){
//					});
					//����һ�в�ѯ����
					$('#insertConditionTr_'+gridReflectionObj.option.id).click(function(){
						gridReflectionObj.insertConditionTr();
					});
					//��ղ�ѯ����
					$('#clearConditionTr_'+gridReflectionObj.option.id).click(function(){
						gridReflectionObj.clearConditionTr();
					});
					//����һ����������
					$('#insertSortTr_'+gridReflectionObj.option.id).click(function(){
						gridReflectionObj.insertSortTr();
					});
					//�����������
					$('#clearSortTr_'+gridReflectionObj.option.id).click(function(){
						gridReflectionObj.clearSortTr();
					});
					//�󶨷�����ִ�и߼���ѯ
					$('#doAdvanceQuery_'+gridReflectionObj.option.id).click(function(){
						gridReflectionObj.doAdvanceQuery();
					});
					//��ʾ�߼���ѯ
					$('#advance_query_'+gridReflectionObj.option.id+'_modal').modal('show');
					//��ʶ��ʼ�����
					gridReflectionObj.init.advanceQueryWindowIsInit = true;
				},
				//�߼���ѯִ��
				doAdvanceQuery : function(){
					//���������ӳ��
					var gridReflectionObj = this;
					//У��
					var pass = true;
					var advanceQueryConditionList = new Array();
					$('#conditionTable_'+gridReflectionObj.option.id+' tr[id*=tr_'+gridReflectionObj.option.id+'_]').each(function(){
						var id = this.id.split('_')[2];
						var seq = $('#conditionTable_'+gridReflectionObj.option.id+' #seqTd_'+gridReflectionObj.option.id+'_'+id).html();
						var leftParentheses = $('#conditionTable_'+gridReflectionObj.option.id+' #leftParentheses_'+gridReflectionObj.option.id+'_'+id).val();
						var field = $('#conditionTable_'+gridReflectionObj.option.id+' #field_'+gridReflectionObj.option.id+'_'+id).val();
						var format = $('#conditionTable_'+gridReflectionObj.option.id+' #format_'+gridReflectionObj.option.id+'_'+id).val();
						var condition = $('#conditionTable_'+gridReflectionObj.option.id+' #condition_'+gridReflectionObj.option.id+'_'+id).val();
						var value = $('#conditionTable_'+gridReflectionObj.option.id+' #value_'+gridReflectionObj.option.id+'_'+id).val();
						var rightParentheses = $('#conditionTable_'+gridReflectionObj.option.id+' #rightParentheses_'+gridReflectionObj.option.id+'_'+id).val();
						var logic = $('#conditionTable_'+gridReflectionObj.option.id+' #logic_'+gridReflectionObj.option.id+'_'+id).val();
						if(field==''){
							$.fn.dlshouwen.grid.tools.toast($.fn.dlshouwen.grid.tools.replaceAll($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.errors.fieldMustSelect, '{sequence}', seq), 'warning', 3000);
							pass = false;
							return false;
						}
						if(condition==''){
							$.fn.dlshouwen.grid.tools.toast($.fn.dlshouwen.grid.tools.replaceAll($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.errors.conditionMustSelect, '{sequence}', seq), 'warning', 3000);
							pass = false;
							return false;
						}
						var advanceQueryCondition = new Object();
						advanceQueryCondition.id = id;
						advanceQueryCondition.seq = seq;
						advanceQueryCondition.leftParentheses = leftParentheses;
						advanceQueryCondition.field = field;
						advanceQueryCondition.format = format;
						advanceQueryCondition.condition = condition;
						advanceQueryCondition.value = value;
						advanceQueryCondition.rightParentheses = rightParentheses;
						advanceQueryCondition.logic = logic;
						advanceQueryConditionList.push(advanceQueryCondition);
					});
					var advanceQuerySortList = new Array();
					$('#sortTable_'+gridReflectionObj.option.id+' tr[id*=tr_'+gridReflectionObj.option.id+'_]').each(function(){
						var id = this.id.split('_')[2];
						var seq = $('#sortTable_'+gridReflectionObj.option.id+' #seqTd_'+gridReflectionObj.option.id+'_'+id).html();
						var sortField = $('#sortTable_'+gridReflectionObj.option.id+' #sortField_'+gridReflectionObj.option.id+'_'+id).val();
						var sortLogic = $('#sortTable_'+gridReflectionObj.option.id+' #sortLogic_'+gridReflectionObj.option.id+'_'+id).val();
						if(sortField==''){
							$.fn.dlshouwen.grid.tools.toast($.fn.dlshouwen.grid.tools.replaceAll($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.sort.errors.fieldMustSelect, '{sequence}', seq), 'warning', 3000);
							pass = false;
							return false;
						}
						if(sortLogic==''){
							$.fn.dlshouwen.grid.tools.toast($.fn.dlshouwen.grid.tools.replaceAll($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.sort.errors.logicMustSelect, '{sequence}', seq), 'warning', 3000);
							pass = false;
							return false;
						}
						var advanceQuerySort = new Object();
						advanceQuerySort.field = sortField;
						advanceQuerySort.logic = sortLogic;
						advanceQuerySortList.push(advanceQuerySort);
					});
					if(pass){
						gridReflectionObj.advanceQueryParameter = new Object();
						gridReflectionObj.advanceQueryParameter.advanceQueryConditions = advanceQueryConditionList;
						gridReflectionObj.advanceQueryParameter.advanceQuerySorts = advanceQuerySortList;
						gridReflectionObj.load();
						$('#advance_query_'+gridReflectionObj.option.id+'_modal').modal('hide');
					}
				},
				//�߼���ѯ���ݹ��ˣ����޷�ajax��ȫ������ģʽ��
				doAdvanceQueryDatasFilter : function(originalDatas, advanceQueryParameter){
					var returnDatas = new Array();
					for(var i=0; i<originalDatas.length; i++){
						var record = originalDatas[i];
						if(advanceQueryParameter.advanceQueryConditions&&advanceQueryParameter.advanceQueryConditions.length>0){
							var condition = '';
							for(var j=0; j<advanceQueryParameter.advanceQueryConditions.length; j++){
								var advanceQueryCondition = advanceQueryParameter.advanceQueryConditions[j];
								condition += advanceQueryCondition.leftParentheses;
								if(advanceQueryCondition.condition=='0'){
									condition += 'record["'+advanceQueryCondition.field+'"]=="'+advanceQueryCondition.value+'"';
								}
								if(advanceQueryCondition.condition=='1'){
									condition += 'record["'+advanceQueryCondition.field+'"]!="'+advanceQueryCondition.value+'"';
								}
								if(advanceQueryCondition.condition=='2'){
									condition += 'record["'+advanceQueryCondition.field+'"].indexOf("'+advanceQueryCondition.value+'")!=-1';
								}
								if(advanceQueryCondition.condition=='3'){
									condition += '$.fn.dlshouwen.grid.tools.startsWith(record["'+advanceQueryCondition.field+'"], "'+advanceQueryCondition.value+'")';
								}
								if(advanceQueryCondition.condition=='4'){
									condition += '$.fn.dlshouwen.grid.tools.endsWith(record["'+advanceQueryCondition.field+'"], "'+advanceQueryCondition.value+'")';
								}
								if(advanceQueryCondition.condition=='5'){
									var value = record[advanceQueryCondition.field];
									//���ڱȽ�
									if(value instanceof Date){
										condition += '(record["'+advanceQueryCondition.field+'"].getTime()-$.fn.dlshouwen.grid.tools.toDate("'+advanceQueryCondition.value+'", "'+advanceQueryCondition.format+'").getTime())>0';
									}
									//��ֵ�Ƚ�
									if(!(value instanceof Date)&&!isNaN(value)){
										condition += '(parseFloat(record["'+advanceQueryCondition.field+'"]) - parseFloat("'+advanceQueryCondition.value+'"))>0';
									}
									//��ͨ�Ƚ�
									if(!(value instanceof Date)&&isNaN(value)){
										condition += 'record["'+advanceQueryCondition.field+'"].localeCompare("'+advanceQueryCondition.value+'")>0';
									}
								}
								if(advanceQueryCondition.condition=='6'){
									var value = record[advanceQueryCondition.field];
									//���ڱȽ�
									if(value instanceof Date){
										condition += '(record["'+advanceQueryCondition.field+'"].getTime()-$.fn.dlshouwen.grid.tools.toDate("'+advanceQueryCondition.value+'", "'+advanceQueryCondition.format+'").getTime())>=0';
									}
									//��ֵ�Ƚ�
									if(!(value instanceof Date)&&!isNaN(value)){
										condition += '(parseFloat(record["'+advanceQueryCondition.field+'"]) - parseFloat("'+advanceQueryCondition.value+'"))>=0';
									}
									//��ͨ�Ƚ�
									if(!(value instanceof Date)&&isNaN(value)){
										condition += 'record["'+advanceQueryCondition.field+'"].localeCompare("'+advanceQueryCondition.value+'")>=0';
									}
								}
								if(advanceQueryCondition.condition=='7'){
									var value = record[advanceQueryCondition.field];
									//���ڱȽ�
									if(value instanceof Date){
										condition += '(record["'+advanceQueryCondition.field+'"].getTime()-$.fn.dlshouwen.grid.tools.toDate("'+advanceQueryCondition.value+'", "'+advanceQueryCondition.format+'").getTime())<0';
									}
									//��ֵ�Ƚ�
									if(!(value instanceof Date)&&!isNaN(value)){
										condition += '(parseFloat(record["'+advanceQueryCondition.field+'"]) - parseFloat("'+advanceQueryCondition.value+'"))<0';
									}
									//��ͨ�Ƚ�
									if(!(value instanceof Date)&&isNaN(value)){
										condition += 'record["'+advanceQueryCondition.field+'"].localeCompare("'+advanceQueryCondition.value+'")<0';
									}
								}
								if(advanceQueryCondition.condition=='8'){
									var value = record[advanceQueryCondition.field];
									//���ڱȽ�
									if(value instanceof Date){
										condition += '(record["'+advanceQueryCondition.field+'"].getTime()-$.fn.dlshouwen.grid.tools.toDate("'+advanceQueryCondition.value+'", "'+advanceQueryCondition.format+'").getTime())<=0';
									}
									//��ֵ�Ƚ�
									if(!(value instanceof Date)&&!isNaN(value)){
										condition += '(parseFloat(record["'+advanceQueryCondition.field+'"]) - parseFloat("'+advanceQueryCondition.value+'"))<=0';
									}
									//��ͨ�Ƚ�
									if(!(value instanceof Date)&&isNaN(value)){
										condition += 'record["'+advanceQueryCondition.field+'"].localeCompare("'+advanceQueryCondition.value+'")<=0';
									}
								}
								if(advanceQueryCondition.condition=='9'){
									condition += '!record["'+advanceQueryCondition.field+'"]';
								}
								if(advanceQueryCondition.condition=='10'){
									condition += 'record["'+advanceQueryCondition.field+'"]';
								}
								condition += advanceQueryCondition.rightParentheses;
								if(advanceQueryCondition.logic=='0'){
									condition += '&&';
								}
								if(advanceQueryCondition.logic=='1'){
									condition += '||';
								}
							}
							try{
								if(eval(condition)){
									returnDatas.push(record);
								}
							}catch(e){
								$.fn.dlshouwen.grid.tools.toast($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.errors.conditionError, 'error', 3000);
								return originalDatas;
							}
						}else{
							returnDatas.push(record);
						}
					}
					//��������
					if(advanceQueryParameter.advanceQuerySorts&&advanceQueryParameter.advanceQuerySorts.length>0){
						returnDatas = returnDatas.sort(function(record1, record2){
							for(var i=0; i<advanceQueryParameter.advanceQuerySorts.length; i++){
								var advanceQuerySort = advanceQueryParameter.advanceQuerySorts[i];
								var value1 = record1[advanceQuerySort.field];
								var value2 = record2[advanceQuerySort.field];
								//�����ͬ��Ƚ���һ��
								if(value1==value2){
									continue;
								}
								//��ֵ�Ƚ�
								if(!isNaN(value1)&&!isNaN(value2)){
									if(advanceQuerySort.logic=='0'){
										return value1-value2;
									}
									if(advanceQuerySort.logic=='1'){
										return value2-value1;
									}
								}
								//���ڱȽ�
								if(value1 instanceof Date&&value2 instanceof Date){
									if(advanceQuerySort.logic=='0'){
										return value1.getTime()-value2.getTime();
									}
									if(advanceQuerySort.logic=='1'){
										return value2.getTime()-value1.getTime();
									}
								}
								//��ͨ�Ƚ�
								if(value1!=null&&advanceQuerySort.logic=='0'){
									return value1.localeCompare(value2);
								}
								if(value2!=null&&advanceQuerySort.logic=='1'){
									return value2.localeCompare(value1);
								}
							}
							return 0;
						});
					}
					return returnDatas;
				},
				//��ѯ�������к�
				sequenceCondition : 0,
				//����һ�в�ѯ����
				insertConditionTr : function(){
					//���������ӳ��
					var gridReflectionObj = this;
					//��������
					var content = '';
					content += '<tr id="tr_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition+'">';
					content += '	<td id="seqTd_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition+'"></td>';
					content += '	<td>';
					content += '		<button type="button" id="moveUpConditionTr_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition+'" class="btn btn-primary btn-xs" title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.table.buttons.upTitle+'">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.table.buttons.up+'</button>';
					content += '		<button type="button" id="moveDownConditionTr_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition+'" class="btn btn-primary btn-xs" title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.table.buttons.downTitle+'">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.table.buttons.down+'</button>';
					content += '		<button type="button" id="deleteConditionTr_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition+'" class="btn btn-danger btn-xs" title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.table.buttons.deleteTitle+'">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.condition.table.buttons['delete']+'</button>';
					content += '	</td>';
					content += '	<td>';
					content += '		<input type="text" id="leftParentheses_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition+'" name="leftParentheses_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition+'" class="form-control" />';
					content += '	</td>';
					content += '	<td>';
					content += '		<select id="field_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition+'" name="field_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition+'" class="form-control">';
					content += '			<option value=""></option>';
					for(var i=0; i<gridReflectionObj.option.columns.length; i++){
						var column = gridReflectionObj.option.columns[i];
						if(column.advanceQuery!=false){
							content += '	<option value="'+column.id+'">'+column.title+'</option>';
						}
					}
					content += '		</select>';
					content += '		<input type="hidden" id="format_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition+'" name="format_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition+'" />';
					content += '	</td>';
					content += '	<td>';
					content += '		<select id="condition_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition+'" name="condition_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition+'" class="form-control">';
					content += '			<option value=""></option>';
					content += '			<option value="0">=</option>';
					content += '			<option value="1">!=</option>';
					content += '			<option value="2">like</option>';
					content += '			<option value="3">start with</option>';
					content += '			<option value="4">end with</option>';
					content += '			<option value="5">&gt;</option>';
					content += '			<option value="6">&gt;=</option>';
					content += '			<option value="7">&lt;</option>';
					content += '			<option value="8">&lt;=</option>';
					content += '			<option value="9">is null</option>';
					content += '			<option value="10">is not null</option>';
					content += '		</select>';
					content += '	</td>';
					content += '	<td id="valueTd_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition+'"></td>';
					content += '	<td>';
					content += '		<input type="text" id="rightParentheses_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition+'" name="rightParentheses_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition+'" class="form-control" />';
					content += '	</td>';
					content += '	<td>';
					content += '		<select id="logic_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition+'" name="logic_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition+'" class="form-control">';
					content += '			<option value=""></option>';
					content += '			<option value="0">and</option>';
					content += '			<option value="1">or</option>';
					content += '		</select>';
					content += '	</td>';
					content += '</tr>';
					$('#conditionTable_'+gridReflectionObj.option.id).append(content);
					//�󶨷���-����
					$('#moveUpConditionTr_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition).click(function(){
						var sequenceCondition = this.id.split('_')[2];
						gridReflectionObj.moveUpConditionTr(sequenceCondition);
					});
					//�󶨷���-����
					$('#moveDownConditionTr_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition).click(function(){
						var sequenceCondition = this.id.split('_')[2];
						gridReflectionObj.moveDownConditionTr(sequenceCondition);
					});
					//�󶨷���-ɾ��
					$('#deleteConditionTr_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition).click(function(){
						var sequenceCondition = this.id.split('_')[2];
						gridReflectionObj.deleteConditionTr(sequenceCondition);
					});
					//�󶨷���-������
					$('#leftParentheses_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition).keyup(function(){
						var sequenceCondition = this.id.split('_')[2];
						gridReflectionObj.validLeftParentheses(sequenceCondition);
					});
					//�󶨷���-�ֶα��
					$('#field_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition).change(function(){
						var sequenceCondition = this.id.split('_')[2];
						gridReflectionObj.fieldChange(sequenceCondition);
					});
					//�󶨷���-�������
					$('#condition_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition).change(function(){
						var sequenceCondition = this.id.split('_')[2];
						gridReflectionObj.conditionChange(sequenceCondition);
					});
					//�󶨷���-������
					$('#rightParentheses_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceCondition).keyup(function(){
						var sequenceCondition = this.id.split('_')[2];
						gridReflectionObj.validRightParentheses(sequenceCondition);
					});
					gridReflectionObj.sequenceCondition++;
					gridReflectionObj.resetConditionSeq();
				},
				//���������
				clearConditionTr : function(){
					//���������ӳ��
					var gridReflectionObj = this;
					$('#conditionTable_'+gridReflectionObj.option.id+' tr[id*=tr_'+gridReflectionObj.option.id+'_]').remove();
				},
				//���к�����
				resetConditionSeq : function(){
					//���������ӳ��
					var gridReflectionObj = this;
					var seq = 1;
					$('#conditionTable_'+gridReflectionObj.option.id+' tr[id*=tr_'+gridReflectionObj.option.id+'_]').each(function(){
						var id = this.id.split('_')[2];
						$('#conditionTable_'+gridReflectionObj.option.id+' #seqTd_'+gridReflectionObj.option.id+'_'+id).html(seq);
						seq++;
					});
				},
				//����
				moveUpConditionTr : function(id){
					//���������ӳ��
					var gridReflectionObj = this;
					$('#conditionTable_'+gridReflectionObj.option.id+' #tr_'+gridReflectionObj.option.id+'_'+id).prev('#conditionTable_'+gridReflectionObj.option.id+' tr[id*=tr_'+gridReflectionObj.option.id+'_]').before($('#conditionTable_'+gridReflectionObj.option.id+' #tr_'+gridReflectionObj.option.id+'_'+id));
					gridReflectionObj.resetConditionSeq();
				},
				//����
				moveDownConditionTr : function(id){
					//���������ӳ��
					var gridReflectionObj = this;
					$('#conditionTable_'+gridReflectionObj.option.id+' #tr_'+gridReflectionObj.option.id+'_'+id).next('#conditionTable_'+gridReflectionObj.option.id+' tr[id*=tr_'+gridReflectionObj.option.id+'_]').after($('#conditionTable_'+gridReflectionObj.option.id+' #tr_'+gridReflectionObj.option.id+'_'+id));
					gridReflectionObj.resetConditionSeq();
				},
				//ɾ����ǰ��
				deleteConditionTr : function(id){
					//���������ӳ��
					var gridReflectionObj = this;
					$('#conditionTable_'+gridReflectionObj.option.id+' #tr_'+gridReflectionObj.option.id+'_'+id).remove();
					gridReflectionObj.resetConditionSeq();
				},
				//�����ŵ���֤����
				validLeftParentheses : function(id){
					//���������ӳ��
					var gridReflectionObj = this;
					//ִ����֤
					var value = $('#leftParentheses_'+gridReflectionObj.option.id+'_'+id).val();
					if(!value.match(/^[\(]*$/g)){
						value = $.fn.dlshouwen.grid.tools.replaceAll(value, '��', '(');
						value = value.replace(/[^\(]/g, '');
						$('#leftParentheses_'+gridReflectionObj.option.id+'_'+id).val(value);
					}
				},
				//�б������
				fieldChange : function(id){
					//���������ӳ��
					var gridReflectionObj = this;
					//��ȡ��ǰ��ֵ
					var field = $('#field_'+gridReflectionObj.option.id+'_'+id).val();
					//���Ϊ�ջ�����һ��Ϊ9-10���Ϳ�ֵ��
					var condition = $('#condition_'+gridReflectionObj.option.id+'_'+id).val();
					if(field=='' || condition=='9' || condition=='10'){
						$('#valueTd_'+gridReflectionObj.option.id+'_'+id).html('');
						return;
					}
					//��ȡ�ж���
					var column = new Object();
					for(var i=0; i<gridReflectionObj.option.columns.length; i++){
						if(gridReflectionObj.option.columns[i].id==field&&gridReflectionObj.option.columns[i].advanceQuery!=false){
							column = gridReflectionObj.option.columns[i];
							break;
						}
					}
					//������������
					if(column.type=='date'){
						var content = '';
						content += '<div class="input-group">';
						content += '	<input id="value_'+gridReflectionObj.option.id+'_'+id+'" name="value_'+gridReflectionObj.option.id+'_'+id+'" class="form-control" onclick="WdatePicker({dateFmt:\''+$.fn.dlshouwen.grid.tools.replaceAll(column.format, 'h', 'H')+'\'})" />';
						content += '	<div class="input-group-addon"><i class="fa fa-calendar"></i></div>';
						content += '</div>';
						$('#valueTd_'+gridReflectionObj.option.id+'_'+id).html(content);
						$('#format_'+gridReflectionObj.option.id+'_'+id).val(column.format);
						return;
					}
					//����codeTable����
					if(column.codeTable){
						var content = '';
						content += '<select id="value_'+gridReflectionObj.option.id+'_'+id+'" name="value_'+gridReflectionObj.option.id+'_'+id+'" class="form-control">';
						content += '	<option value=""></option>';
						for(var key in column.codeTable){
							content += '<option value="'+key+'">'+column.codeTable[key]+'</option>';
						}
						content += '</select>';
						$('#valueTd_'+gridReflectionObj.option.id+'_'+id).html(content);
						return;
					}
					//������ΪĬ���ı�
					var content = '<input id="value_'+gridReflectionObj.option.id+'_'+id+'" name="value_'+gridReflectionObj.option.id+'_'+id+'" class="form-control" />';
					$('#valueTd_'+gridReflectionObj.option.id+'_'+id).html(content);
				},
				//��������
				conditionChange : function(id){
					//���������ӳ��
					var gridReflectionObj = this;
					var condition = $('#condition_'+gridReflectionObj.option.id+'_'+id).val();
					if(condition == '9' || condition == '10'){
						$('#valueTd_'+gridReflectionObj.option.id+'_'+id).html('');
					}else{
						var valueHtml = $('#valueTd_'+gridReflectionObj.option.id+'_'+id).html();
						if(valueHtml==''){
							gridReflectionObj.fieldChange(id);
						}
					}
				},
				//�����ŵ���֤����
				validRightParentheses : function(id){
					//���������ӳ��
					var gridReflectionObj = this;
					var value = $('#rightParentheses_'+gridReflectionObj.option.id+'_'+id).val();
					if(!value.match(/^[\(]*$/g)){
						value = $.fn.dlshouwen.grid.tools.replaceAll(value, '��', ')');
						value = value.replace(/[^\)]/g, '');
						$('#rightParentheses_'+gridReflectionObj.option.id+'_'+id).val(value);
					}
				},
				//�����������к�
				sequenceSort : 0,
				//����һ����������
				insertSortTr : function(){
					//���������ӳ��
					var gridReflectionObj = this;
					//��������
					var content = '';
					content += '<tr id="tr_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceSort+'">';
					content += '	<td id="seqTd_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceSort+'"></td>';
					content += '	<td>';
					content += '		<button type="button" id="moveUpSortTr_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceSort+'" class="btn btn-primary btn-xs" title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.sort.table.buttons.upTitle+'">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.sort.table.buttons.up+'</button>';
					content += '		<button type="button" id="moveDownSortTr_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceSort+'" class="btn btn-primary btn-xs" title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.sort.table.buttons.downTitle+'">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.sort.table.buttons.down+'</button>';
					content += '		<button type="button" id="deleteSortTr_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceSort+'" class="btn btn-danger btn-xs" title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.sort.table.buttons.deleteTitle+'">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.sort.table.buttons['delete']+'</button>';
					content += '	</td>';
					content += '	<td>';
					content += '		<select id="sortField_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceSort+'" name="sortField_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceSort+'" class="form-control">';
					content += '			<option value=""></option>';
					for(var i=0; i<gridReflectionObj.option.columns.length; i++){
						var column = gridReflectionObj.option.columns[i];
						if(column.advanceQuery!=false){
							content += '	<option value="'+column.id+'">'+column.title+'</option>';
						}
					}
					content += '		</select>';
					content += '	</td>';
					content += '	<td>';
					content += '		<select id="sortLogic_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceSort+'" name="sortLogic_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceSort+'" class="form-control">';
					content += '			<option value=""></option>';
					content += '			<option value="0">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.sort.logic.asc+'</option>';
					content += '			<option value="1">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].advanceQuery.sort.logic.desc+'</option>';
					content += '		</select>';
					content += '	</td>';
					content += '</tr>';
					$('#sortTable_'+gridReflectionObj.option.id).append(content);
					//�󶨷���-����
					$('#moveUpSortTr_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceSort).click(function(){
						var sequenceSort = this.id.split('_')[2];
						gridReflectionObj.moveUpSortTr(sequenceSort);
					});
					//�󶨷���-����
					$('#moveDownSortTr_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceSort).click(function(){
						var sequenceSort = this.id.split('_')[2];
						gridReflectionObj.moveDownSortTr(sequenceSort);
					});
					//�󶨷���-ɾ��
					$('#deleteSortTr_'+gridReflectionObj.option.id+'_'+gridReflectionObj.sequenceSort).click(function(){
						var sequenceSort = this.id.split('_')[2];
						gridReflectionObj.deleteSortTr(sequenceSort);
					});
					gridReflectionObj.sequenceSort++;
					gridReflectionObj.resetSortSeq();
				},
				//���������������
				clearSortTr : function(){
					//���������ӳ��
					var gridReflectionObj = this;
					$('#sortTable_'+gridReflectionObj.option.id+' tr[id*=tr_'+gridReflectionObj.option.id+'_]').remove();
				},
				//���к�����
				resetSortSeq : function(){
					//���������ӳ��
					var gridReflectionObj = this;
					var seq = 1;
					$('#sortTable_'+gridReflectionObj.option.id+' tr[id*=tr_'+gridReflectionObj.option.id+'_]').each(function(){
						var id = this.id.split('_')[2];
						$('#sortTable_'+gridReflectionObj.option.id+' #seqTd_'+gridReflectionObj.option.id+'_'+id).html(seq);
						seq++;
					});
				},
				//����
				moveUpSortTr : function(id){
					//���������ӳ��
					var gridReflectionObj = this;
					$('#sortTable_'+gridReflectionObj.option.id+' #tr_'+gridReflectionObj.option.id+'_'+id).prev('#sortTable_'+gridReflectionObj.option.id+' tr[id*=tr_'+gridReflectionObj.option.id+'_]').before($('#sortTable_'+gridReflectionObj.option.id+' #tr_'+gridReflectionObj.option.id+'_'+id));
					gridReflectionObj.resetSortSeq();
				},
				//����
				moveDownSortTr : function(id){
					//���������ӳ��
					var gridReflectionObj = this;
					$('#sortTable_'+gridReflectionObj.option.id+' #tr_'+gridReflectionObj.option.id+'_'+id).next('#sortTable_'+gridReflectionObj.option.id+' tr[id*=tr_'+gridReflectionObj.option.id+'_]').after($('#sortTable_'+gridReflectionObj.option.id+' #tr_'+gridReflectionObj.option.id+'_'+id));
					gridReflectionObj.resetSortSeq();
				},
				//ɾ����ǰ��
				deleteSortTr : function(id){
					//���������ӳ��
					var gridReflectionObj = this;
					$('#sortTable_'+gridReflectionObj.option.id+' #tr_'+gridReflectionObj.option.id+'_'+id).remove();
					gridReflectionObj.resetSortSeq();
				},
				/**
				 * ��ӡ���
				 */
				//��ӡ
				print : function(){
					//ӳ�����
					var gridReflectionObj = this;
					//����Ѿ���ʼ�����������ʾ
					if(gridReflectionObj.init.printWindowIsInit){
						$('#dlshouwen_grid_print_'+gridReflectionObj.option.id+'_modal').modal('show');
						return;
					}
					//�����µĴ�ӡѡ��
					var content = '';
					content += $.fn.dlshouwen.grid.tools.getWindowStart('dlshouwen_grid_print_'+gridReflectionObj.option.id, $.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].print.title);
					content += '				<table class="table table-bordered table-print">';
					content += '					<thead>';
					content += '						<tr>';
					content += '							<th><input type="checkbox" id="dlshouwen_grid_print_check_'+gridReflectionObj.option.id+'" checked="checked" /></th>';
					content += '							<th>'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].print.table.column+'</th>';
					content += '							<th>'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].print.table.operation+'</th>';
					content += '						</tr>';
					content += '					</thead>';
					content += '					<tbody>';
					//��������Ϣ
					for(var i=0; i<gridReflectionObj.option.columns.length; i++){
						var column = gridReflectionObj.option.columns[i];
						if(column.print==false){
							continue;
						}
						//��ȡ��¼��
						content += '					<tr id="dlshouwen_grid_print_tr_'+gridReflectionObj.option.id+'_'+i+'">';
						content += '						<td><input type="checkbox" id="dlshouwen_grid_print_check_'+gridReflectionObj.option.id+'_'+i+'" checked="checked" value="'+i+'" /></td>';
						content += '						<td>'+column.title+'</td>';
						content += '						<td>';
						content += '							<button type="button" class="btn btn-primary btn-xs" dataId="'+i+'" id="dlshouwen_grid_print_up_'+gridReflectionObj.option.id+'_'+i+'" title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].print.table.buttons.upTitle+'">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].print.table.buttons.up+'</button>';
						content += '							<button type="button" class="btn btn-primary btn-xs" dataId="'+i+'" id="dlshouwen_grid_print_down_'+gridReflectionObj.option.id+'_'+i+'" title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].print.table.buttons.downTitle+'">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].print.table.buttons.down+'</button>';
						content += '						</td>';
						content += '					</tr>';
					}
					content += '					</tbody>';
					content += '				</table>';
					var buttons = '';
					buttons += '<button type="button" class="btn btn-primary" id="dlshouwen_grid_print_execute_'+gridReflectionObj.option.id+'">';
					buttons += '	'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].print.buttons.print;
					buttons += '</button>';
					content += $.fn.dlshouwen.grid.tools.getWindowEnd($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].buttons.close, buttons);
					$('body').append(content);
					//�󶨸�ѡȫѡ��ѡ����
					$('#dlshouwen_grid_print_check_'+gridReflectionObj.option.id).click(function(){
						$('input[id*=dlshouwen_grid_print_check_'+gridReflectionObj.option.id+'_]').prop('checked', this.checked);
					});
					//�����Ʒ���
					$('button[id*=dlshouwen_grid_print_up_'+gridReflectionObj.option.id+'_]').click(function(){
						var dataId = $(this).attr('dataId');
						var gridId = gridReflectionObj.option.id;
						$('#dlshouwen_grid_print_tr_'+gridId+'_'+dataId).prev('#dlshouwen_grid_print_'+gridId+'_modal tr[id*=dlshouwen_grid_print_tr_'+gridId+']').before($('#dlshouwen_grid_print_tr_'+gridId+'_'+dataId));
					});
					//�����Ʒ���
					$('button[id*=dlshouwen_grid_print_down_'+gridReflectionObj.option.id+'_]').click(function(){
						var dataId = $(this).attr('dataId');
						var gridId = gridReflectionObj.option.id;
						$('#dlshouwen_grid_print_tr_'+gridId+'_'+dataId).next('#dlshouwen_grid_print_'+gridId+'_modal tr[id*=dlshouwen_grid_print_tr_'+gridId+']').after($('#dlshouwen_grid_print_tr_'+gridId+'_'+dataId));
					});
					//�󶨴�ӡ����
					$('#dlshouwen_grid_print_execute_'+gridReflectionObj.option.id).click(function(){
						//�����
						var content = '';
						content += '<table class="dlshouwen-grid '+gridReflectionObj.option.tableClass+'" id="dlshouwen_grid_print_'+gridReflectionObj.option.id+'" style="'+gridReflectionObj.option.tableStyle+'">';
						if(gridReflectionObj.option.showHeader!=false){
							content += '<thead>';
							content += '	<tr>';
							$('input[id*=dlshouwen_grid_print_check_'+gridReflectionObj.option.id+'_]:checked').each(function(){
								var columnNo = this.value;
								content += '<th class="'+gridReflectionObj.option.columns[columnNo].headerClass+'" style="'+gridReflectionObj.option.columns[columnNo].headerStyle+'">'+gridReflectionObj.option.columns[columnNo].title+'</th>';
							});
							content += '	</tr>';
							content += '</thead>';
						}
						//�������
						content += '	<tbody>';
						if(gridReflectionObj.exhibitDatas!=null){
							for(var i=0; i<gridReflectionObj.exhibitDatas.length; i++){
								content += '	<tr>';
								$('input[id*=dlshouwen_grid_print_check_'+gridReflectionObj.option.id+'_]:checked').each(function(){
									var columnNo = this.value;
									content += '	<td class="'+gridReflectionObj.option.columns[columnNo].columnClass+'" style="'+gridReflectionObj.option.columns[columnNo].columnStyle+'">';
									if(gridReflectionObj.option.columns[columnNo].resolution){
										content += gridReflectionObj.option.columns[columnNo].resolution(gridReflectionObj.exhibitDatas[i][gridReflectionObj.option.columns[columnNo].id], gridReflectionObj.exhibitDatas[i], gridReflectionObj.option.columns[columnNo], gridReflectionObj, i, columnNo);
									}else{
										content += gridReflectionObj.formatContent(gridReflectionObj.option.columns[columnNo], gridReflectionObj.exhibitDatas[i][gridReflectionObj.option.columns[columnNo].id]);
									}
									content += '	</td>';
								});
								content += '	</tr>';
							}
						}
						content += '	</tbody>';
						content += '</table>';
						//����body�����ô�ӡ����
						var scrollTop = $('body').scrollTop();
						$('body').hide();
						$('html').append(content);
						window.print();
						$('#dlshouwen_grid_print_'+gridReflectionObj.option.id).remove();
						$('body').show();
						$('#dlshouwen_grid_print_'+gridReflectionObj.option.id+'_modal').modal('hide');
						$('body').scrollTop(scrollTop);
					});
					//��ʾ��ӡѡ��
					$('#dlshouwen_grid_print_'+gridReflectionObj.option.id+'_modal').modal('show');
					//��ʶ��ʼ�����
					gridReflectionObj.init.printWindowIsInit = true;
				},
				/**
				 * �������
				 */
				//����
				exportFile : function(exportType){
					//ӳ�����
					var gridReflectionObj = this;
					//����Ѿ���ʼ��������ʾ����ѡ��
					if(gridReflectionObj.init.exportWindowIsInit[exportType]){
						//��ʾ����ѡ��
						$('#dlshouwen_grid_export_'+exportType+'_'+gridReflectionObj.option.id+'_modal').modal('show');
						return;
					}
					//�����µĵ���ѡ��
					var content = '';
					content += $.fn.dlshouwen.grid.tools.getWindowStart('dlshouwen_grid_export_'+exportType+'_'+gridReflectionObj.option.id, $.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang]['export'][exportType].title);
					content += '				<div class="form-export modal-body form-horizontal form-export">';
					content += '					<div class="form-group">';
					content += '						<label class="col-sm-3 control-label">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang]['export'][exportType].exportType.title+'</label>';
					content += '						<div class="col-sm-9">';
					content += '							<div class="checkbox">';
					content += '								<label><input type="radio" name="dlshouwen_grid_export_export_all_data_'+exportType+'_'+gridReflectionObj.option.id+'" value="0" checked="checked" /> '+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang]['export'][exportType].exportType.now+'</label>';
					content += '								<label><input type="radio" name="dlshouwen_grid_export_export_all_data_'+exportType+'_'+gridReflectionObj.option.id+'" value="1" /> '+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang]['export'][exportType].exportType.all+'</label>';
					content += '							</div>';
					content += '						</div>';
					content += '					</div>';
					content += '				</div>';
					content += '				<table class="table table-bordered table-export">';
					content += '					<thead>';
					content += '						<tr>';
					content += '							<th><input type="checkbox" id="dlshouwen_grid_export_check_'+exportType+'_'+gridReflectionObj.option.id+'" checked="checked" /></th>';
					content += '							<th>'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang]['export'][exportType].table.column+'</th>';
					content += '							<th>'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang]['export'][exportType].table.operation+'</th>';
					content += '						</tr>';
					content += '					</thead>';
					content += '					<tbody>';
					//��������Ϣ
					for(var i=0; i<gridReflectionObj.option.columns.length; i++){
						var column = gridReflectionObj.option.columns[i];
						if(column['export']==false){
							continue;
						}
						content += '					<tr id="dlshouwen_grid_export_tr_'+exportType+'_'+gridReflectionObj.option.id+'_'+i+'">';
						content += '						<td><input type="checkbox" id="dlshouwen_grid_export_check_'+exportType+'_'+gridReflectionObj.option.id+'_'+i+'" checked="checked" value="'+i+'" /></td>';
						content += '						<td>'+column.title+'</td>';
						content += '						<td>';
						content += '							<button type="button" class="btn btn-primary btn-xs" dataId="'+i+'" id="dlshouwen_grid_export_up_'+exportType+'_'+gridReflectionObj.option.id+'_'+i+'" title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang]['export'][exportType].table.buttons.upTitle+'">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang]['export'][exportType].table.buttons.up+'</button>';
						content += '							<button type="button" class="btn btn-primary btn-xs" dataId="'+i+'" id="dlshouwen_grid_export_down_'+exportType+'_'+gridReflectionObj.option.id+'_'+i+'" title="'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang]['export'][exportType].table.buttons.downTitle+'">'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang]['export'][exportType].table.buttons.down+'</button>';
						content += '						</td>';
						content += '					</tr>';
					}
					content += '					</tbody>';
					content += '				</table>';
					var buttons = '';
					buttons += '<button type="button" class="btn btn-primary" id="dlshouwen_grid_export_execute_'+exportType+'_'+gridReflectionObj.option.id+'">';
					buttons += '	'+$.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang]['export'][exportType].buttons['export'];
					buttons += '</button>';
					content += $.fn.dlshouwen.grid.tools.getWindowEnd($.fn.dlshouwen.grid.lang[gridReflectionObj.option.lang].buttons.close, buttons);
					$('body').append(content);
					//�󶨸�ѡ����
					$('#dlshouwen_grid_export_check_'+exportType+'_'+gridReflectionObj.option.id).click(function(){
						$('input[id*=dlshouwen_grid_export_check_'+exportType+'_'+gridReflectionObj.option.id+'_]').prop('checked', this.checked);
					});
					//�����Ʒ���
					$('button[id*=dlshouwen_grid_export_up_'+exportType+'_'+gridReflectionObj.option.id+'_]').click(function(){
						var dataId = $(this).attr('dataId');
						var gridId = gridReflectionObj.option.id;
						$('#dlshouwen_grid_export_tr_'+exportType+'_'+gridId+'_'+dataId).prev('#dlshouwen_grid_export_'+exportType+'_'+gridId+'_modal tr[id*=dlshouwen_grid_export_tr_'+exportType+'_'+gridId+']').before($('#dlshouwen_grid_export_tr_'+exportType+'_'+gridId+'_'+dataId));
					});
					//�����Ʒ���
					$('button[id*=dlshouwen_grid_export_down_'+exportType+'_'+gridReflectionObj.option.id+'_]').click(function(){
						var dataId = $(this).attr('dataId');
						var gridId = gridReflectionObj.option.id;
						$('#dlshouwen_grid_export_tr_'+exportType+'_'+gridId+'_'+dataId).next('#dlshouwen_grid_export_'+exportType+'_'+gridId+'_modal tr[id*=dlshouwen_grid_export_tr_'+exportType+'_'+gridId+']').after($('#dlshouwen_grid_export_tr_'+exportType+'_'+gridId+'_'+dataId));
					});
					//�󶨵�������
					$('#dlshouwen_grid_export_execute_'+exportType+'_'+gridReflectionObj.option.id).click(function(){
						//ɾ��ԭ��
						$('#dlshouwen_grid_export_form_container_'+exportType+'_'+gridReflectionObj.option.id).remove();
						//���������ݺ�̨ʹ��α�����е���
						var exportFormContainer = document.createElement('div');
						exportFormContainer.id = 'dlshouwen_grid_export_form_container_'+exportType+'_'+gridReflectionObj.option.id;
						exportFormContainer.className = 'hidden';
						var exportIframe = document.createElement('iframe');
						exportIframe.name = 'dlshouwen_grid_export_iframe_'+exportType+'_'+gridReflectionObj.option.id;
						exportFormContainer.appendChild(exportIframe);
						var exportForm = document.createElement('form');
						exportForm.id = 'dlshouwen_grid_export_form_'+exportType+'_'+gridReflectionObj.option.id;
						exportForm.method = 'post';
						exportForm.target = 'dlshouwen_grid_export_iframe_'+exportType+'_'+gridReflectionObj.option.id;
						if(gridReflectionObj.option.ajaxLoad==false||gridReflectionObj.option.loadAll==true){
							exportForm.action = gridReflectionObj.option.exportURL;
						}else{
							exportForm.action = gridReflectionObj.option.loadURL;
						}
						var gridPager = new Object();
						gridPager.pageSize = gridReflectionObj.pager.pageSize;
						gridPager.startRecord = gridReflectionObj.pager.startRecord;
						gridPager.nowPage = gridReflectionObj.pager.nowPage;
						gridPager.recordCount = gridReflectionObj.pager.recordCount;
						gridPager.pageCount = gridReflectionObj.pager.pageCount;
						gridPager.isExport = true;
						gridPager.exportFileName = gridReflectionObj.option.exportFileName;
						gridPager.exportType = exportType;
						gridPager.exportAllData = $('input[name*=dlshouwen_grid_export_export_all_data_'+exportType+'_'+gridReflectionObj.option.id+']:checked').val()=='1'?true:false;
						gridPager.parameters = new Object();
						gridPager.fastQueryParameters = new Object();
						gridPager.advanceQueryConditions = new Array();
						gridPager.advanceQuerySorts = new Array();
						if(gridReflectionObj.parameters){
							gridPager.parameters = gridReflectionObj.parameters;
						}
						if(gridReflectionObj.fastQueryParameters){
							gridPager.fastQueryParameters = gridReflectionObj.fastQueryParameters;
						}
						if(gridReflectionObj.advanceQuery&&gridReflectionObj.advanceQuery.advanceQueryConditions){
							gridPager.advanceQueryConditions = gridReflectionObj.advanceQuery.advanceQueryConditions;
						}
						if(gridReflectionObj.advanceQuery&&gridReflectionObj.advanceQuery.advanceQuerySorts){
							gridPager.advanceQuerySorts = gridReflectionObj.advanceQuery.advanceQuerySorts;
						}
						var exportColumns = new Array();
						$('input[id*=dlshouwen_grid_export_check_'+exportType+'_'+gridReflectionObj.option.id+'_]:checked').each(function(){
							exportColumns.push(gridReflectionObj.option.columns[this.value]);
						});
						gridPager.exportColumns = exportColumns;
						//��ȡԭ������
						var originalDatas = new Array();
						var exportDataIsProcessed = false;
						if(!gridPager.exportAllData){
							originalDatas = gridReflectionObj.exhibitDatas;
							exportDataIsProcessed = true;
						}else{
							if(gridReflectionObj.option.ajaxLoad==false||gridReflectionObj.option.loadAll==true){
								originalDatas = gridReflectionObj.originalDatas;
								exportDataIsProcessed = true;
							}
						}
						gridPager.exportDataIsProcessed = exportDataIsProcessed;
						//ƴ�ӵ�������
						var exportDatas = new Array();
						for(var i=0; i<originalDatas.length; i++){
							var data = originalDatas[i];
							var exportData = new Object();
							$('input[id*=dlshouwen_grid_export_check_'+exportType+'_'+gridReflectionObj.option.id+'_]:checked').each(function(){
								var column = gridReflectionObj.option.columns[this.value];
								var fieldContent = gridReflectionObj.formatContent(column, data[column.id]);
								exportData[column.id] = fieldContent;
							});
							exportDatas.push(exportData);
						}
						gridPager.exportDatas = exportDatas;
						var gridPagerInput = document.createElement('input');
						gridPagerInput.type = 'hidden';
						gridPagerInput.id = 'gridPager';
						gridPagerInput.name = 'gridPager';
						gridPagerInput.value = JSON.stringify(gridPager);
						exportForm.appendChild(gridPagerInput);
						exportFormContainer.appendChild(exportForm);
						$('body').append(exportFormContainer);
						$('#dlshouwen_grid_export_form_'+exportType+'_'+gridReflectionObj.option.id).submit();
						$('#dlshouwen_grid_export_'+exportType+'_'+gridReflectionObj.option.id+'_modal').modal('hide');
					});
					//���ó�ʼ�����
					gridReflectionObj.init.exportWindowIsInit[exportType] = true;
					//��ʾ����ѡ��
					$('#dlshouwen_grid_export_'+exportType+'_'+gridReflectionObj.option.id+'_modal').modal('show');
				},
				/**
				 * ���⿪�Ź��߷���
				 */
				//��ȡѡ������
				getCheckedRecords: function(){
					//���ñ���ӳ��
					gridReflectionObj = this;
					//��ȡ����
					var records = new Array();
					$('input[id*=dlshouwen_grid_'+gridReflectionObj.option.id+'_check_]:checked').each(function(){
						records.push(gridReflectionObj.exhibitDatas[this.value]);
					});
					return records;
				},
				//���¼��أ�trueΪ���´����ݿ��л�ȡ����
				reload : function(allReload){
					//���������ӳ��
					var gridReflectionObj = this;
					if(allReload){
						gridReflectionObj.load();
					}else{
						//���¼�������
						gridReflectionObj.constructGrid();
						gridReflectionObj.constructGridPageBar();
					}
				},
				//���¼������ط���
				refresh : function(allReload){
					//���������ӳ��
					var gridReflectionObj = this;
					gridReflectionObj.reload(allReload);
				}
			};
			return gridObject;
		},
		//���߷���
		tools : {
			//����guid
			guid : function(){
				return 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
			    	var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
			        return v.toString(16);
				});
			},
			//����һ��ģ̬���ڣ���ʼ��
			getWindowStart : function(id, title){
				var content = '';
				content += '<div class="modal fade" id="'+id+'_modal" tabindex="-1" role="dialog" aria-labelledby="'+id+'ModalLabel" aria-hidden="true">';
				content += '	<div class="modal-dialog">';
				content += '		<div class="modal-content">';
				content += '			<div class="modal-header">';
				content += '				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
				content += '				<h4 class="modal-title" id="'+id+'ModalLabel">'+title+'</h4>';
				content += '			</div>';
				return content;
			},
			//����һ��ģ̬���ڣ�������
			getWindowEnd : function(closeButtonTitle, buttons){
				var content = '';
				content += '			<div class="modal-footer">';
				content += '				<button type="button" class="btn btn-default" data-dismiss="modal">';
				content += '					'+closeButtonTitle;
				content += '				</button>';
				content += '				'+buttons;
				content += '			</div>';
				content += '		</div>';
				content += '	</div>';
				content += '</div>';
				return content;
			},
			/**
			 * ��ʾ��
			 */
			toastZIndex : 1090,
			toastThread : null,
			toastFadeInAnimateTime : 500,
			toastFadeOutAnimateTime : 500,
			openToast : function(content, level, time){
				// default level��time
				level = level?level:'info';
				time = time?time:3000;
				// get the level class
				var levelClass = '';
				if(level=='info') levelClass='text-primary';
				if(level=='warning') levelClass='text-warning';
				if(level=='error') levelClass='text-danger';
				if(level=='success') levelClass='text-success';
				// close other toast div
				clearTimeout($.fn.dlshouwen.grid.tools.toastThread);
				$('.toast').remove();
				// constructs the html content
				var toastContent = '<div class="toast '+levelClass+'" style="z-index:'+$.fn.dlshouwen.grid.tools.toastZIndex+'">'+content+'</div>';
				// append to the ducoment
				$('body').append(toastContent);
				// set the offset
				var x = $(window).width()/2-$('.toast').width()/2-20;
				//toast(x);
				$('.toast').css("left", x);
				// show the div
				$('.toast').fadeIn($.fn.dlshouwen.grid.tools.toastFadeInAnimateTime, function(){
					// callback close
					if(time){
						$.fn.dlshouwen.grid.tools.toastThread = setTimeout($.fn.dlshouwen.grid.tools.removeToast, time);
					}
				});
			},
			//close an toast
			removeToast : function(){
				$('.toast').fadeOut($.fn.dlshouwen.grid.tools.toastFadeOutAnimateTime, function(){
					$('.toast').remove();
				});
			},
			//����Toast����
			toast : function(content, level, time){
				$.fn.dlshouwen.grid.tools.openToast(content, level, time);
			},
			//���ַ���ת��������ʱ�䣬��Ĭ�ϸ�ʽ 
			toDate : function(date, pattern) {
				if (!pattern||pattern == null)
					pattern = 'yyyy-MM-dd hh:mm:ss';
				var compare = {
					'y+' : 'y',
					'M+' : 'M',
					'd+' : 'd',
					'h+' : 'h',
					'm+' : 'm',
					's+' : 's'
				};
				var result = {
					'y' : '',
					'M' : '',
					'd' : '',
					'h' : '00',
					'm' : '00',
					's' : '00'
				};
				var tmp = pattern;
				for ( var k in compare) {
					if (new RegExp('(' + k + ')').test(pattern)) {
						result[compare[k]] = date.substring(tmp.indexOf(RegExp.$1), tmp.indexOf(RegExp.$1) + RegExp.$1.length);
					}
				}
				return new Date(result['y'], result['M'] - 1, result['d'], result['h'], result['m'], result['s']);
			},
			// ��ʽ��ʱ��
			dateFormat : function(value, format){
				if(value==''){
					return '';
				}
				if(value.time){
					value = new Date(value.time);
				}
				var o = {
					"M+" : value.getMonth()+1, //month
					"d+" : value.getDate(),    //day
					"h+" : value.getHours(),   //hour
					"m+" : value.getMinutes(), //minute
					"s+" : value.getSeconds(), //second
					"q+" : Math.floor((value.getMonth()+3)/3), //quarter
					"S" : value.getMilliseconds() //millisecond
				};
				if(/(y+)/.test(format)) format=format.replace(RegExp.$1, (value.getFullYear()+"").substr(4 - RegExp.$1.length));
				for(var k in o)if(new RegExp("("+ k +")").test(format))
					format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
				return format;
			},
			//�ַ���ȫ���滻
			replaceAll : function(s, s1, s2){
				return s.replace(new RegExp(s1, "gm"), s2);
			},
			//�ж��ַ�����ʼ����
			startsWith : function(str, prefix){
				if(prefix==undefined)
					return false;
				if(str.indexOf(prefix)==0)
					return true;
				return false;
			},
			//�ж��ַ�����������
			endsWith : function(str, suffix){
				if(suffix==undefined)
					return false;
				if(str.lastIndexOf(suffix)==str.length-suffix.length)
					return true;
				return false;
			},
			//�ַ��������ִ�Сд�ıȽ�
			equalsIgnoreCase : function(str1, str2){
				return (new String(str1.toLowerCase()) == (new String(str2)).toLowerCase());
			},
			//���ָ�ʽ������[#,0��ʽ]
			numberFormat : function(number, pattern){
				var negFlag = "false";
				var str = Number(number).toString();
				if (str.indexOf("-")==0){
					negFlag = "true";
					str = str.replace("-","");
					number = -number;
				}
				var strInt;
				var strFloat;
				var formatInt;
				var formatFloat;
				if($.trim(str)=="")
					return "";
				//�ж�ģʽ���Ƿ���С����ʽ
				if(/\./g.test(pattern)){
					formatInt = pattern.split('.')[0];
					formatFloat = pattern.split('.')[1];
				}else{
					formatInt = pattern;
					formatFloat = null;
				}
				if(/\./g.test(str)){
					//����ַ�����С��
					if(formatFloat!=null){
						var tempFloat = Math.round(parseFloat('0.'+str.split('.')[1])*Math.pow(10,formatFloat.length))/Math.pow(10,formatFloat.length);
						strInt = (Math.floor(number)+Math.floor(tempFloat)).toString();
						strFloat = /\./g.test(tempFloat.toString())?tempFloat.toString().split('.')[1]:'0';
					}else{
						strInt = Math.round(number).toString();
						strFloat = '0';
					}
				}else{
					strInt = str;
					strFloat = '0';
				}
				//����������λ�ĸ�ʽ��
				if(formatInt!=null){
					var outputInt = '';
					var zero = formatInt.match(/0*$/)[0].length;
					var comma = null;
					if(/,/g.test(formatInt)){
						comma = formatInt.match(/,[^,]*/)[0].length-1;
					}
					var newReg = new RegExp('(\\d{'+comma+'})','g');
					if(strInt.length<zero){
						outputInt = new Array(zero+1).join('0')+strInt;
						outputInt = outputInt.substr(outputInt.length-zero,zero);
					}else{
						outputInt = strInt;
					}
					outputInt = outputInt.substr(0,outputInt.length%comma)+outputInt.substring(outputInt.length%comma).replace(newReg,(comma!=null?',':'')+'$1');
					outputInt = outputInt.replace(/^,/,'');
					strInt = outputInt;
				}
				//����С��λ�ĸ�ʽ��
				if(formatFloat!=null){
					var outputFloat = '';
					var zero = formatFloat.match(/^0*/)[0].length;
					if(strFloat.length<zero){
						outputFloat = strFloat+new Array(zero+1).join('0');
						var outputFloat1 = outputFloat.substring(0,zero);
						var outputFloat2 = outputFloat.substring(zero,formatFloat.length);
						outputFloat = outputFloat1+outputFloat2.replace(/0*$/,'');
					}else{
						//���С����0������ģʽ����С����ʽ��Ҳ������0����ֻ�����������֡�
						if(strFloat==0&&zero==0)
							outputFloat = '';
						else
						outputFloat = strFloat.substring(0,formatFloat.length);
					}
					strFloat = outputFloat;
				}else{
					if(pattern!='' || (pattern=='' && strFloat=='0'))
						strFloat = '';
				}
				if(negFlag == "true")
					return "-" + strInt+(strFloat==''?'':'.'+strFloat);
				else
					return strInt+(strFloat==''?'':'.'+strFloat);
			}
		}
	};
})(jQuery);

//Ĭ������
(function($) {
	$.fn.dlshouwen.grid.defaultOptions = {
		grid : {
			lang : 'zh-ch',
			ajaxLoad : true,
			loadAll : false,
			postParams : false,//�Ƿ񴫵ݲ���,ֻ��loadAll=trueʱ��Ч
			isreload : false,//ˢ��ʱ�Ƿ����´ӷ�������ȡ����,ֻ��loadAll=trueʱ��Ч
			loadURL : '',
			datas : null,
			extraWidth : null,
			check : false,
			checkWidth : null,
			tableStyle : '',
			tableClass : 'table table-bordered table-hover table-responsive',
			showHeader : true,
			gridContainer : 'gridContainer',
			toolbarContainer : 'gridToolBarContainer',
			tools : 'refresh|fastQuery|advanceQuery|export[excel,csv,pdf,txt]|print',
			exportFileName : 'datas',
			exportURL : '/grid/export',
			pageSize : 20,
			pageSizeLimit : [20, 50, 100]
		},
		column : {
			id : 'field',
			title : 'field',
			width : null,
			type : 'string', 
			format : null,
			otype : null, 
			oformat : null,
			columnStyle : '',
			columnClass : '',
			headerStyle : '',
			headerClass : '',
			hide : false,
			hideType : '',
			extra : true,
			codeTable : null,
			fastQuery : false,
			fastQueryType : '',
			advanceQuery : true,
			'export' : true,
			print : true,
			resolution : null
		}
	};
})(jQuery);