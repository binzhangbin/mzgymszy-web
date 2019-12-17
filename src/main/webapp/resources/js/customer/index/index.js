var webside = {
    index : {
        initHomePage : function() {
            $(".page-content").load(sys.rootPath + "/welcome.jsp");
            $(".breadcrumb").html('<li><i class="ace-icon fa fa-home home-icon"></i><a href="javascript:webside.index.initHomePage();">��ҳ</a></li><li class="active">����̨</li>');
        },
        menu : {
            initMenuEvent : function() {
                $("[nav-menu]").each(function() {
                	
                    $(this).bind("click", function() {
                    	var lay;
                        var nav = $(this).attr("nav-menu");
                        var sn = nav.split(",");
                        //����û���Ϣ�˵���ʽ
                        $(".user-menu").find('li').each(function() {
                            $(this).removeClass('active');
                        });
                        //������-�´��ڴ�
                        if (sn[sn.length - 1] == '/sirona' || sn[sn.length - 1] == '/druid') {
                            window.open(sys.rootPath + sn[sn.length - 1]);
                        } else {
                            var breadcrumb = '<li><i class="ace-icon fa fa-home home-icon"></i><a href="javascript:webside.index.initHomePage();">��ҳ</a></li>';
                            for (var i = 0; i < sn.length - 1; i++) {
                                breadcrumb += '<li class="active">' + sn[i] + '</li>';
                            }
                            lay = layer.load();
                            //�������м����
                            $(".breadcrumb").html(breadcrumb);
                            //����ҳ��
                            $(".page-content").empty();//����ýڵ���Ԫ��
                            $(".page-content").load(sys.rootPath + sn[sn.length - 1],function(){
                            	layer.close(lay);
                            });
                        }
                        var level = $(this).parent("li").attr("level");
                        if (level == 'level1' || level == 'level2') {
                            //����Ŀ¼���͵ĵ���¼�-�����˵�
                            $(this).parent("li").siblings().find("ul.nav-show").removeClass('nav-show').addClass('nav-hide').attr('style', 'display:none');
                            //����˵����͵ĵ���¼�
                            $(this).parent().parent().parent("li").siblings().find("ul.nav-show").removeClass('nav-show').addClass('nav-hide').attr('style', 'display:none');
                            $("ul.nav-list").find("li.active").removeClass("active").removeClass('open');
                            $(this).parent().addClass("active").parent().parent("li").addClass('active open');
                        } else if (level == 'level3') {
                            //����Ŀ¼���͵ĵ���¼�-�����˵�
                            $(this).parent("li").siblings().find("ul.nav-show").removeClass('nav-show').addClass('nav-hide').attr('style', 'display:none');
                            //����˵����͵ĵ���¼�
                            $(this).parent().parent().parent().parent().parent("li").siblings().find("ul.nav-show").removeClass('nav-show').addClass('nav-hide').attr('style', 'display:none');
                            $("ul.nav-list").find("li.active").removeClass("active").removeClass('open');
                            $(this).parent().addClass("active").parent().parent().parent().parent("li").addClass('active open');
                        } else {
                            //����Ŀ¼���͵ĵ���¼�-�ļ��˵�
                            $(this).parent("li").siblings().find("ul.nav-show").removeClass('nav-show').addClass('nav-hide').attr('style', 'display:none');
                            //����˵����͵ĵ���¼�
                            $(this).parent().parent().parent().parent().parent().parent().parent("li").siblings().find("ul.nav-show").removeClass('nav-show').addClass('nav-hide').attr('style', 'display:none');
                            $("ul.nav-list").find("li.active").removeClass("active").removeClass('open');
                            $(this).parent().addClass("active").parent().parent().parent().parent().parent().parent("li").addClass('active open');
                        }
                        
                    });
                });
            },
            initDropdownMenuStyle : function() {
                $(".user-menu").find('li').each(function() {
                    $(this).bind('click', function() {
                        $(this).siblings().removeClass('active');
                        $(this).addClass('active');
                    });
                });
            }
        },
        initNavigation : function() {
            $("#ace-settings-navbar").click();
            $("#ace-settings-sidebar").click();
            //$("#ace-settings-breadcrumbs").click();
        },
        initScrollBar : function() {
            $("html").niceScroll({
                cursorborderradius : "5px",
                cursorwidth : 10
            });
        },
        /*
         * ������������ڴ�С�仯
         */
        resizeScrollBar : function() {
            $(window).resize(function() {
                $("html").getNiceScroll().resize();
            });
        }
    },
    common : {
        /**
         *���طǲ˵�չʾҳ��
         * @param nav �����ص���ԴURL
         */
        loadPage : function(nav) {
            //����ҳ��
            $(".page-content").load(sys.rootPath + nav);
        },
        /**
         * ����
         * @param {Object} nav  �ύurl
         */
        addModel : function(nav) {
            //��������ҳ��
            webside.common.loadPage(nav);
        },
        /**
         * �༭
         * @param {Object} nav  �ύurl
         */
        editModel : function(nav) {
            //��ǰҳ��
            var nowPage = grid.pager.nowPage;
            //��ȡÿҳ��ʾ�ļ�¼��(��: select���е�10,20,30)
            var pageSize = grid.pager.pageSize;
            //��ȡ�����ֶ�
            var columnId = grid.sortParameter.columnId;
            //��ȡ����ʽ [0-������1-����2-����]
            var sortType = grid.sortParameter.sortType;
            //��ȡѡ�����
            var rows = grid.getCheckedRecords();
            if (rows.length == 1) {
                webside.common.loadPage(nav + '?id=' + rows[0].id + "&page=" + nowPage + "&rows=" + pageSize + "&sidx=" + columnId + "&sord=" + sortType);
            } else {
                layer.msg("��û��ѡ���л�ѡ���˶�������", {
                    icon : 0
                });
            }
        },
        /**
         * ɾ��
         * @param {Object} nav  �ύurl
         * @param callback ������ִ����Ϻ���õĻص���������
         */
        delModel : function(nav, callback) {
            var rows = grid.getCheckedRecords();
            if (rows.length == 1) {
                if (nav == '/user/deleteBatch.html') {
                    if (rows[0].role.name == '��������Ա') {
                        layer.msg('���û�Ϊ��������Ա,����ɾ��!', {
                            icon : 0
                        });
                        return false;
                    }
                }
                if (nav == '/role/deleteBatch.html') {
                    if (rows[0].name == '��������Ա') {
                        layer.msg('�ý�ɫΪ������ɫ,����ɾ��!', {
                            icon : 0
                        });
                        return false;
                    }
                }
                layer.confirm('ȷ��ɾ����', {
                    icon : 3,
                    title : 'ɾ����ʾ'
                }, function(index, layero) {
                    var delete_ids = [];
                    /*
                     $.each(rows, function(index, value) {
                     ids.push(this.id);
                     });
                     */
                    delete_ids.push(rows[0].id);
                    $.ajax({
                        type : "POST",
                        url : sys.rootPath + nav,
                        data : {
                            "ids" : delete_ids.join(',')
                        },
                        dataType : "json",
                        success : function(resultdata) {
                            if (resultdata.success) {
                                layer.msg(resultdata.message, {
                                    icon : 1
                                });
                                if (callback) {
                                    callback();
                                }
                            } else {
                                layer.msg(resultdata.message, {
                                    icon : 5
                                });
                            }
                        },
                        error : function(errorMsg) {
                            layer.msg('������δ��Ӧ,���Ժ�����', {
                                icon : 3
                            });
                        }
                    });
                    layer.close(index);
                });
            } else {
                layer.msg("��û��ѡ���л�ѡ���˶�������", {
                    icon : 0
                });
            }
        },
        /**
         * �ύ��
         * ���ó�����form�����ύ����Ҫ�����û�����ɫ����Դ�ȱ�����ӡ��޸ĵ�
         * @param {Object} commitUrl ���ύ��ַ
         * @param {Object} listUrl ���ύ�ɹ���ת����б�ҳ��ַ
         */
        commit : function(formId, commitUrl, jumpUrl) {
            //��װ������
            var index;
            var data = $("#" + formId).serialize();
            if (undefined != $("#pageNum").val()) {
                jumpUrl = jumpUrl + '?page=' + $("#pageNum").val() + '&rows=' + $("#pageSize").val() + '&sidx=' + $("#orderByColumn").val() + '&sord=' + $("#orderByType").val();
            }
            $.ajax({
                type : "POST",
                url : sys.rootPath + commitUrl,
                data : data,
                dataType : "json",
                beforeSend : function() {
                    index = layer.load();
                },
                success : function(resultdata) {
                    layer.close(index);
                    if (resultdata.success) {
                        layer.msg(resultdata.message, {
                            icon : 1
                        });
                        webside.common.loadPage(jumpUrl);
                    } else {
                        layer.msg(resultdata.message, {
                            icon : 5
                        });
                    }
                },
                error : function(data, errorMsg) {
                    layer.close(index);
                    layer.msg(data.responseText, {
                        icon : 2
                    });
                }
            });
        }
    },
    form : {
        user : {
            validateUserForm : function() {
                $('#userForm').validate({
                    errorElement : 'div',
                    errorClass : 'help-block',
                    focusInvalid : false,
                    ignore : "",
                    rules : {
                        accountName : {
                            required : true,
                            email : true,
                            remote : {//����ʱ����֤
                                param : {
                                    url : sys.rootPath + '/user/withoutAuth/validateAccountName.html',
                                    cache : false
                                },
                                depends : function() {
                                    return typeof ($("#userId").val()) == "undefined";
                                }
                            }
                        },
                        password : {
                            required : true,
                            minlength : 6
                        },
                        repassword : {
                            required : true,
                            minlength : 6,
                            equalTo : "#password"
                        },
                        userName : {
                            required : true
                        },
                        "role.id" : {
                            required : true
                        }
                    },
                    messages : {
                        accountName : {
                            required : "����д����",
                            email : "����д��ȷ������",
                            remote : "��������ע��,��ʹ����������"
                        },
                        password : {
                            required : "����д����",
                            minlength : "���볤�Ȳ�������6���ַ�"
                        },
                        repassword : {
                            required : "���ٴ���д����",
                            minlength : "���볤�Ȳ�������6���ַ�",
                            equalTo : "������д���벻һ�£���������д"
                        },
                        userName : "����д��ʵ����",
                        "role.id" : "��ѡ���ɫ"
                    },
                    highlight : function(e) {
                        $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
                    },
                    success : function(e) {
                        $(e).closest('.form-group').removeClass('has-error').addClass('has-success');
                        $(e).remove();
                    },
                    errorPlacement : function(error, element) {
                        if (element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
                            var controls = element.closest('div[class*="col-"]');
                            if (controls.find(':checkbox,:radio').length > 1)
                                controls.append(error);
                            else
                                error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                        } else if (element.is('.select2')) {
                            error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
                        } else if (element.is('.chosen-select')) {
                            error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
                        } else
                            error.insertAfter(element.parent());
                    },
                    submitHandler : function(form) {
                        var userId = $("#userId").val();
                        var url = "";
                        if (userId != undefined) {
                            url = '/user/edit.html';
                        } else {
                            url = '/user/add.html';
                        }
                        webside.common.commit('userForm', url, '/user/listUI.html');
                    }
                });
            },
            validateUserPasswordForm : function() {
                $('#userPassword').validate({
                    errorElement : 'div',
                    errorClass : 'help-block',
                    focusInvalid : false,
                    ignore : "",
                    rules : {
                        password : {
                            required : true,
                            minlength : 6
                        },
                        repassword : {
                            required : true,
                            minlength : 6,
                            equalTo : "#password"
                        }
                    },
                    messages : {
                        password : {
                            required : "����д����",
                            minlength : "���볤�Ȳ�������6���ַ�"
                        },
                        repassword : {
                            required : "���ٴ���д����",
                            minlength : "���볤�Ȳ�������6���ַ�",
                            equalTo : "������д���벻һ�£���������д"
                        }
                    },
                    highlight : function(e) {
                        $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
                    },
                    success : function(e) {
                        $(e).closest('.form-group').removeClass('has-error').addClass('has-success');
                        $(e).remove();
                    },
                    errorPlacement : function(error, element) {
                        error.insertAfter(element.parent());
                    },
                    submitHandler : function(form) {
                        webside.common.commit('userPassword', '/user/password.html', '/logout.html');
                    },
                    invalidHandler : function(form) {
                    }
                });
            }
        },
        userInfo : {
            initButton : function() {
                $("#btnEdit").click(function() {
                    //��ť�л�
                    $(this).hide();
                    $("#btnAdd").show();
                    //���л�
                    $("#lableDiv").hide();
                    $("#formDiv").show();
                });
            },
            initBirthday : function() {
                $("#birthday").datepicker({
                    format : 'yyyy-mm-dd',
                    autoclose : true,
                    language : 'zh-CN',
                    todayHighlight : true,
                    clearBtn : true,
                    immediateUpdates : true,
                    clearDate : function() {
                        $("#birthday").val('').datepicker('update');
                    }
                });
            },
            validateUserInfoForm : function() {
                jQuery.validator.addMethod("phone", function(value, element) {
                    return this.optional(element) || /^1[3|4|5|7|8]\d{9}$/.test(value);
                }, "������11λ�ֻ�����");

                $('#userInfoForm').validate({
                    errorElement : 'div',
                    errorClass : 'help-block',
                    focusInvalid : false,
                    ignore : "",
                    rules : {
                        userName : {
                            required : true
                        },
                        "userInfo.sex" : {
                            required : true
                        },
                        "userInfo.birthday" : {
                            required : true
                        },
                        "userInfo.telephone" : {
                            required : true,
                            phone : 'required'
                        },
                        "userInfo.address" : {
                            required : true
                        }
                    },
                    messages : {
                        userName : "����д��ʵ����",
                        "userInfo.sex" : "��ѡ���Ա�",
                        "userInfo.birthday" : "����д��������",
                        "userInfo.telephone" : {
                            required : "����д�ֻ�����",
                            phone : "����д11λ�ֻ�����"
                        },
                        "userInfo.address" : "����д��ϵ��ַ"
                    },
                    highlight : function(e) {
                        $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
                    },
                    success : function(e) {
                        $(e).closest('.form-group').removeClass('has-error').addClass('has-success');
                        $(e).remove();
                    },
                    errorPlacement : function(error, element) {
                        if (element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
                            var controls = element.closest('div[class*="col-"]');
                            if (controls.find(':checkbox,:radio').length > 1)
                                controls.append(error);
                            else
                                error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                        } else if (element.is('.select2')) {
                            error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
                        } else if (element.is('.chosen-select')) {
                            error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
                        } else
                            error.insertAfter(element.parent());
                    },
                    submitHandler : function(form) {
                        webside.common.commit('userInfoForm', '/user/edit.html', '/user/infoUI.html?id=' + $("#userInfoId").val());
                    }
                });
            }
        },
        role : {
            validateRoleForm : function() {
                $('#roleForm').validate({
                    errorElement : 'div',
                    errorClass : 'help-block',
                    focusInvalid : false,
                    ignore : "",
                    rules : {
                        name : {
                            required : true,
                            remote : {
                                param : {
                                    url : sys.rootPath + '/role/withoutAuth/validateRoleName.html',
                                    cache : false
                                },
                                depends : function() {
                                    return typeof ($("#roleId").val()) == "undefined";
                                }
                            }
                        },
                        key : {
                            required : true
                        }
                    },
                    messages : {
                        name : {
                            required : "����д��ɫ����",
                            remote : "�ý�ɫ�Ѵ���"
                        },
                        key : "����д��ɫ��ʶ"
                    },
                    highlight : function(e) {
                        $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
                    },
                    success : function(e) {
                        $(e).closest('.form-group').removeClass('has-error').addClass('has-success');
                        $(e).remove();
                    },
                    errorPlacement : function(error, element) {
                        error.insertAfter(element.parent());
                    },
                    submitHandler : function(form) {
                        var roleId = $("#roleId").val();
                        var url = "";
                        if (roleId != undefined) {
                            url = '/role/edit.html';
                        } else {
                            url = '/role/add.html';
                        }
                        webside.common.commit('roleForm', url, '/role/listUI.html');
                    }
                });
            }
        },
        resource : {
            initSourceType : function() {
                $('#type').select2({
                    language : "zh-CN",
                    minimumResultsForSearch : Infinity
                });
            },
            initSourceTree : function() {
                $('#parentId').select2({
                    placeholder : "��ѡ���ϼ���Դ...",
                    language : "zh-CN",
                    minimumResultsForSearch : Infinity,
                    templateResult : webside.form.resource.formatState,
                    templateSelection : function(selection) {
                        return $.trim(selection.text);
                    }
                });
            },
            formatState : function(state) {
                if (!state.id) {
                    return state.text;
                }
                var $state = $('<span><i class="fa fa-file-text-o green"></i>&nbsp;&nbsp;' + state.text + '</span>');
                return $state;
            },
            initIcon : function() {
                $("#icon").bind('focus', function(event) {
                    var iconLayer = layer.open({
                        type : 2,
                        scrollbar : false,
                        content : sys.rootPath + '/resource/icon.html',
                        area : 'auto',
                        maxmin : true,
                        shift : 4,
                        title : '<i class="fa fa-cogs"></i>&nbsp;ѡ��ͼ��'
                    });
                    //������ȫ��
                    layer.full(iconLayer);
                });
                $("#iconShow").bind('click', function(event) {
                    $("#icon").val('');
                    $(this).removeClass();
                });
                $('[data-rel=tooltip]').tooltip();
            },
            initType : function() {
                $("#parentId").change(function() {
                    var parentId = $.trim($(this).children('option:selected').val());
                    if (parentId == null || parentId == '') {
                        //$("#iconDiv").show();
                        //$("#sourceUrlDiv").hide();
                    } else {
                        //$("#iconDiv").hide();
                        //$("#sourceUrlDiv").show();
                    }
                });
            },
            validateResourceForm : function() {
                $('#resourceForm').validate({
                    errorElement : 'div',
                    errorClass : 'help-block',
                    focusInvalid : false,
                    ignore : "",
                    rules : {
                        parentId : {
                            required : true
                        },
                        name : {
                            required : true
                        },
                        sourceKey : {
                            required : true
                        },
                        type : {
                            required : true
                        },
                        sourceUrl : {
                            required : function() {
                                /*
                                 //��Ŀ¼�˵�����Ҫurl
                                 var parentId = $.trim($("#parentId").val());
                                 if (parentId == null || parentId == "") {
                                 return false;
                                 } else {
                                 return true;
                                 }
                                 */
                                return false;
                            }
                        },
                        icon : {
                            required : function() {
                                /*
                                 //��Ŀ¼�˵���Ҫicon
                                 var parentId = $.trim($("#parentId").val());
                                 if (parentId == null || parentId == "") {
                                 return true;
                                 } else {
                                 return false;
                                 }
                                 */
                                return false;
                            }
                        }
                    },
                    messages : {
                        parentId : "��ѡ���ϼ���Դ",
                        name : "����д��Դ����",
                        sourceKey : "����д��Դ��ʶ",
                        type : "��ѡ����Դ����",
                        sourceUrl : "����д��ԴURL",
                        icon : "��ѡ��˵�ͼ��"
                    },
                    highlight : function(e) {
                        $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
                    },
                    success : function(e) {
                        $(e).closest('.form-group').removeClass('has-error').addClass('has-success');
                        $(e).remove();
                    },
                    errorPlacement : function(error, element) {
                        if (element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
                            var controls = element.closest('div[class*="col-"]');
                            if (controls.find(':checkbox,:radio').length > 1)
                                controls.append(error);
                            else
                                error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                        } else if (element.is('.select2')) {
                            error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
                        } else if (element.is('.chosen-select')) {
                            error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
                        } else
                            error.insertAfter(element.parent());
                    },
                    submitHandler : function(form) {
                        var resourceId = $("#resourceId").val();
                        var url = "";
                        if (resourceId != undefined) {
                            url = '/resource/edit.html';
                        } else {
                            url = '/resource/add.html';
                        }
                        webside.common.commit('resourceForm', url, '/resource/listUI.html');
                    }
                });
            },
            authorize : {
                ids : [],
                initResourceTree : function() {
                    $('#tree').jstree({
                        "core" : {
                            'data' : {
                                "url" : sys.rootPath + "/resource/resourceTree.html?roleId=" + $("#id").val(),
                                "dataType" : "json"
                            },
                            "themes" : {
                                "responsive" : true
                            },
                            "multiple" : true,
                            "animation" : 200,
                            "dblclick_toggle" : true,
                            "expand_selected_onload" : true
                        },
                        "checkbox" : {
                            "keep_selected_style" : true,
                            "three_state" : false,
                            "cascade" : "up"
                        },
                        "plugins" : ["checkbox"]
                    });
                },
                /**
                 * �ݹ�����ڵ㣬��ȡ�ýڵ�����и��ڵ�
                 * @param {Object} treeObj  jstree����
                 * @param {Object} nodeObj  jstree node�ڵ����
                 */
                getParents : function(treeObj, nodeObj) {
                    var parentId = treeObj.get_parent(nodeObj);
                    if (parentId != "#") {
                        webside.form.resource.authorize.ids.push(parentId);
                        webside.form.resource.authorize.getParents(treeObj, treeObj.get_node(parentId));
                    }
                },
                /**
                 * �ύ��
                 * ���ó�����form�����ύ����ɫ��Ȩ�ύ
                 * @param {Object} commitUrl ���ύ��ַ
                 * @param {Object} listUrl ���ύ�ɹ���ת����б�ҳ��ַ
                 */
                commitPerm : function(commitUrl, listUrl) {
                    webside.form.resource.authorize.ids = [];
                    var tree = $('#tree').jstree();
                    //��ȡ����ѡ�нڵ�id
                    var selectedIds = tree.get_checked();
                    //��ȡ����ѡ�нڵ�
                    var selected = tree.get_checked(true);
                    //�����ڵ㣬��ȡѡ�нڵ�����и��ڵ�
                    for (var i = 0; i < selected.length; i++) {
                        webside.form.resource.authorize.getParents(tree, selected[i]);
                    }
                    var index;
                    $.ajax({
                        type : "POST",
                        url : sys.rootPath + commitUrl,
                        data : {
                            "roleId" : $("#id").val(),
                            "resourceIds" : _.union(webside.form.resource.authorize.ids, selectedIds).join(',')
                        },
                        dataType : "json",
                        beforeSend : function() {
                            index = layer.load();
                        },
                        success : function(resultdata) {
                            layer.close(index);
                            if (resultdata.success) {
                                layer.msg(resultdata.message, {
                                    icon : 1
                                });
                                webside.common.loadPage(listUrl + '?page=' + $("#pageNum").val() + '&rows=' + $("#pageSize").val() + '&sidx=' + $("#orderByColumn").val() + '&sord=' + $("#orderByType").val());
                            } else {
                                layer.msg(resultdata.message, {
                                    icon : 5
                                });
                            }
                        },
                        error : function(errorMsg) {
                            layer.close(index);
                            layer.msg('������δ��Ӧ,���Ժ�����', {
                                icon : 2
                            });
                        }
                    });
                }
            }
        },
        schedule: {
            initJobGroup:function(){
                $('#jobGroupSelect').select2({
                    language : "zh-CN",
                    minimumResultsForSearch : Infinity,
                    placeholder : "��ѡ��������..."
                }).on('change',function(){
                    $("#jobGroup").val($(this).find("option:selected").text());
                    $("#jobClassName").val($(this).val());
                });
            },
            initStartDate:function(){
                $("#startDate").datepicker({
                    format : 'yyyy-mm-dd',
                    autoclose : true,
                    language : 'zh-CN',
                    todayHighlight : true,
                    clearBtn : true,
                    immediateUpdates : true,
                    clearDate : function() {
                        $("#startDate").val('').datepicker('update');
                    }
                }).on('changeDate',function(e){
                    var startDate = e.date;
                    $('#endDate').datepicker('setStartDate',startDate);  
                });
            },
            initEndDate:function(){
                $("#endDate").datepicker({
                    format : 'yyyy-mm-dd',
                    autoclose : true,
                    language : 'zh-CN',
                    todayHighlight : true,
                    clearBtn : true,
                    immediateUpdates : true,
                    clearDate : function() {
                        $("#endDate").val('').datepicker('update');
                    }
                }).on('changeDate',function(e){
                    var EndDate = e.date;
                    $('#startDate').datepicker('setEndDate',EndDate);  
                });
            },
            initTrigger : function(){
                $("#triggerDiv").fadeOut(1);
                $("#isAddTrigger").bootstrapSwitch({
                    state : false,
                    onColor : 'success',
                    offColor : 'warning',
                    onText : '��',
                    offText : '��',
                    labelText : '�Ƿ����trigger',
                    labelWidth : 100,
                    onSwitchChange : function(event, state){
                        if(state)
                        {
                            $("#triggerDiv").fadeIn();
                        }else
                        {
                            $("#triggerDiv").fadeOut();
                        }
                    }
                });
            },
            validateJobForm : function(){
                $('#jobForm').validate({
                    errorElement : 'div',
                    errorClass : 'help-block',
                    focusInvalid : false,
                    ignore : "",
                    rules : {
                        jobName :{
                           required : true 
                        },
                        jobGroupSelect : {
                           required : true 
                        },
                        triggerName : {
                            required : function() {
                                 return $("#isAddTrigger").prop("checked");
                            }
                        },
                        triggerGroup: {
                            required : function() {
                                 return false;//$("#isAddTrigger").prop("checked");
                            }
                        },
                        cronExpression : {
                            required : function() {
                                 return $("#isAddTrigger").prop("checked");
                            },
                            remote : {
                                param : {
                                    url : sys.rootPath + '/scheduleJob/withoutAuth/validateCron.html',
                                    cache : false
                                },
                                depends : function() {
                                    return $("#isAddTrigger").prop("checked");
                                }
                            }
                        },
                        startDate : {
                            required : function() {
                                 return $("#isAddTrigger").prop("checked");
                            }
                        },
                        endDate : {
                            required : function() {
                                 return $("#isAddTrigger").prop("checked");
                            }
                        }
                    },
                    messages : {
                        jobName : "����д��������",
                        jobGroupSelect : "��ѡ��������",
                        triggerName: "����дtrigger����",
                        triggerGroup: "����дtrigger��",
                        cronExpression : {
                            required : "����д���񴥷����ʽ",
                            remote : "���ʽ����ȷ"
                        },
                        startDate : "��ѡ������ʼ����",
                        endDate : "��ѡ�������������"
                    },
                    highlight : function(e) {
                        $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
                    },
                    success : function(e) {
                        $(e).closest('.form-group').removeClass('has-error').addClass('has-success');
                        $(e).remove();
                    },
                    errorPlacement : function(error, element) {
                        if (element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
                            var controls = element.closest('div[class*="col-"]');
                            if (controls.find(':checkbox,:radio').length > 1)
                                controls.append(error);
                            else
                                error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                        } else if (element.is('.select2')) {
                            error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
                        } else if (element.is('.chosen-select')) {
                            error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
                        } else
                            error.insertAfter(element.parent());
                    },
                    submitHandler : function(form) {
                        webside.common.commit('jobForm', '/scheduleJob/addJob.html', '/scheduleJob/planningJobListUI.html');
                    }
                });
            },
            validateTriggerForm:function(){
                $('#triggerForm').validate({
                    errorElement : 'div',
                    errorClass : 'help-block',
                    focusInvalid : false,
                    ignore : "",
                    rules : {
                        triggerName : {
                            required : true
                        },
                        triggerGroup:{
                            required : false
                        },
                        cronExpression : {
                            required : true,
                            remote : {
                                param : {
                                    url : sys.rootPath + '/scheduleJob/withoutAuth/validateCron.html',
                                    cache : false
                                }
                            }
                        },
                        startDate : {
                            required : true
                        },
                        endDate : {
                            required : true
                        }
                    },
                    messages : {
                        triggerName: "����дtrigger����",
                        triggerGroup: "����дtrigger��",
                        cronExpression : {
                            required : "����д���񴥷����ʽ",
                            remote : "���ʽ����ȷ"
                        },
                        startDate : "��ѡ������ʼ����",
                        endDate : "��ѡ�������������"
                    },
                    highlight : function(e) {
                        $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
                    },
                    success : function(e) {
                        $(e).closest('.form-group').removeClass('has-error').addClass('has-success');
                        $(e).remove();
                    },
                    errorPlacement : function(error, element) {
                        if (element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
                            var controls = element.closest('div[class*="col-"]');
                            if (controls.find(':checkbox,:radio').length > 1)
                                controls.append(error);
                            else
                                error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                        } else if (element.is('.select2')) {
                            error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
                        } else if (element.is('.chosen-select')) {
                            error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
                        } else
                            error.insertAfter(element.parent());
                    },
                    submitHandler : function(form) {
                        var jobTriggerHide = $("#jobTriggerHide").val();
                        var jobName = $("#jobName").val();
                        var jobGroup = $("#jobGroup").val();
                        var url = "";
                        if (jobTriggerHide != undefined) {
                            url = '/scheduleJob/editTrigger.html';
                        } else {
                            url = '/scheduleJob/addTrigger.html';
                        }
                        webside.common.commit('triggerForm', url, '/scheduleJob/jobTriggerListUI.html?jobName='+jobName+'&jobGroup='+jobGroup);
                    }
                });
            },
            editModel : function(nav) {
                //��ȡѡ�����
                var rows = grid.getCheckedRecords();
                if (rows.length == 1) {
                    webside.common.loadPage(nav + '?jobName=' + rows[0].jobName+'&jobGroup='+rows[0].jobGroup+'&triggerName='+rows[0].triggerName+'&triggerGroup='+rows[0].triggerGroup);
                } else {
                    layer.msg("��û��ѡ���л�ѡ���˶�������", {
                        icon : 0
                    });
                }
            },
            delModel:function(nav,callback){
                var index;
                var rows = grid.getCheckedRecords();
                var jobName = $("#jobName").val();
                var param = {};
                if(undefined ==jobName)
                {
                    //ִ��job
                    param.jobName = rows[0].jobName;
                    param.jobGroup = rows[0].jobGroup;
                }else
                {
                    //ִ��trigger
                    param.triggerName = rows[0].triggerName;
                    param.triggerGroup = rows[0].triggerGroup;
                }
                if (rows.length == 1) {
                    layer.confirm('ȷ��ɾ����', {
                    icon : 3,
                    title : 'ɾ����ʾ'
                }, function(index, layero) {
                    $.ajax({
                        type : "POST",
                        url : sys.rootPath + nav,
                        data : param,
                        dataType : "json",
                        success : function(resultdata) {
                            if (resultdata.success) {
                                layer.msg(resultdata.message, {
                                    icon : 1
                                });
                                if (callback) {
                                    callback();
                                }
                            } else {
                                layer.msg(resultdata.message, {
                                    icon : 5
                                });
                            }
                        },
                        error : function(errorMsg) {
                            layer.msg('������δ��Ӧ,���Ժ�����', {
                                icon : 3
                            });
                        }
                    });
                    layer.close(index);
                });
                } else {
                    layer.msg("��û��ѡ���л�ѡ���˶�������", {
                        icon : 0
                    });
                }
            },
            executeJob:function(nav, callback){
                var rows = grid.getCheckedRecords();
                var jobName = $("#jobName").val();
                var param = {};
                if(undefined ==jobName)
                {
                    //ִ��job
                    param.jobName = rows[0].jobName;
                    param.jobGroup = rows[0].jobGroup;
                }else
                {
                    //ִ��trigger
                    param.triggerName = rows[0].triggerName;
                    param.triggerGroup = rows[0].triggerGroup;
                }
                var index;
                if (rows.length == 1) {
                    $.ajax({
                        type : "POST",
                        url : sys.rootPath + nav,
                        beforeSend : function() {
                            index = layer.load();
                        },
                        data : param,
                        dataType : "json",
                        success : function(resultdata) {
                            layer.close(index);
                            if (resultdata.success) {
                                layer.msg(resultdata.message, {
                                    icon : 1
                                });
                                if (callback) {
                                    callback();
                                }
                            } else {
                                layer.msg(resultdata.message, {
                                    icon : 5
                                });
                            }
                        },
                        error : function(errorMsg) {
                            layer.msg('������δ��Ӧ,���Ժ�����', {
                                icon : 3
                            });
                        }
                    });
                }else {
                    layer.msg("��û��ѡ�������ѡ���˶������", {
                        icon : 0
                    });
                }
            },
            getTrigger:function(jobName, jobGroup)
            {
                webside.common.loadPage('/scheduleJob/jobTriggerListUI.html?jobName='+jobName+'&jobGroup='+jobGroup);
            }
        }
    }
};