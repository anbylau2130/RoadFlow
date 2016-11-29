﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Set_Step.aspx.cs" Inherits="WebForm.Platform.WorkFlowDesigner.Set_Step" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="tabdiv">
    <div id="div_base" title="&nbsp;&nbsp;基本&nbsp;&nbsp;">
    <div style="height:8px;"></div>
    <table cellpadding="0" cellspacing="1" border="0" width="99%" class="formtable">
        <tr>
            <th>步骤ID：</th>
            <td colspan="3"><input type="text" id="base_ID" value="<%=stepID %>" class="mytext" readonly="readonly" style="width:75%"/></td>
        </tr>
        <tr>
            <th>步骤名称：</th>
            <td colspan="3"><input type="text" id="base_Name" class="mytext" style="width:75%"/></td>
        </tr>
        <tr>
            <th style="width:100px">意见显示：</th>
            <td style="width:35%"> 
                <select class="myselect" value1="1" style="width:75%;" id="base_OpinionDisplay">
                    <option value="1">显示</option>
                    <option value="0">不显示</option>
                </select>
            </td>
            <th style="width:100px">超期提示：</th>
            <td style="width:35%">
                <select class="myselect" value1="1" style="width:75%;" id="base_ExpiredPrompt">
                    <option value="1">提示</option>
                    <option value="0">不提示</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>审签类型：</th>
            <td>
                <select class="myselect" value1="2" style="width:75%;" id="base_SignatureType">
                    <option value="0">无签批意见栏</option>
                    <option value="1">有签批意见(无须签章)</option>
                    <option value="2">有签批意见(须签章)</option>
                </select>
            </td>
            <th>工时(小时)：</th>
            <td><input type="text" id="base_WorkTime" class="mytext" style="width:73%;"/></td>
        </tr>
        <tr>
            <th>是否归档：</th>
            <td>
                <select class="myselect" value1="0" style="width:75%;" id="base_Archives">
                    <option value="0">不归档</option>
                    <option value="1">归档</option>
                </select>
            </td>
            <th></th>
            <td>
            </td>
        </tr>
        <tr>
            <th>表单：</th>
            <td colspan="3">
                <select class="myselect" style="width:130px; max-height:200px;" onchange="form_types_change(this.value);" id="form_types">
                    <option value=""></option>
                    <%=appLibraryTypes %>
                </select>
                <select class="myselect" style="width:390px;" id="form_forms" ></select> 
            </td>
        </tr>
        <tr>
            <th>说明：</th>
            <td colspan="3"><textarea id="base_Note" class="mytext" style="width:89%; height:50px;"></textarea></td>
        </tr>
    </table>
    </div>

    <div id="div_behavior" title="&nbsp;&nbsp;策略&nbsp;&nbsp;">
    <div style="height:8px;"></div>
    <table cellpadding="0" cellspacing="1" border="0" width="99%" class="formtable">
        <tr>
            <th style="width:13%">流转类型：</th>
            <td style="width:37%">
                <select class="myselect" style="width:210px;" id="behavior_FlowType">
                    <option value="1">单选一个分支流转</option>
                    <option value="0">系统控制</option>
                    <option value="2">多选几个分支流转</option>
                </select>
            </td>
            <th>运行时选择：</th>
            <td>
                <select class="myselect" style="width:210px;" id="behavior_RunSelect">
                    <option value="1">允许</option>
                    <option value="0">不允许</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>处理者类型：</th>
            <td>
                <select class="myselect" style="width:210px;" id="behavior_HandlerType">
                    <option value="0">所有成员</option>
                    <option value="1">部门</option>
                    <option value="2">岗位</option>
                    <option value="3">工作组</option>
                    <option value="4">人员</option>
                    <option value="5">发起者</option>
                    <option value="6">前一步骤处理者</option>
                    <option value="7">某一步骤处理者</option>
                    <option value="8">字段值</option>
                    <option value="9">发起者领导</option>
                    <option value="10">发起者分管领导</option>
                    <option value="11">前一步处理者领导</option>
                    <option value="12">前一步处理者分管领导</option>
                </select>
            </td>
            <th>选择范围：</th>
            <td><input type="text" id="behavior_SelectRange" onchange="handlerTypeCng()" user="0" more="0" dept="1" station="1" workgroup="1" class="mymember" style="width:169px;"/></td>
        </tr>
        <tr>
            <th>处理者步骤：</th>
            <td>
                <select class="myselect" style="width:210px;" id="behavior_HandlerStep"></select>
            </td>
            <th>值字段：</th>
            <td>
                <select class="myselect" style="width:210px;" id="behavior_ValueField"></select>
            </td>
        </tr>
        <tr>
            <th>默认处理者：</th>
            <td><input type="text" class="mymember" dept="1" station="1" workgroup="1" user="1" more="1" id="behavior_DefaultHandler" style="width:169px;"/></td>
            <th>退回策略：</th>
            <td>
                <select class="myselect" style="width:210px;" id="behavior_BackModel">
                    <option value="1">根据处理策略退回</option>
                    <option value="0">不能退回</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>处理策略：</th>
            <td>
                <select class="myselect" style="width:210px;" id="behavior_HanlderModel">
                    <option value="0">所有人必须同意</option>
                    <option value="1">一人同意即可</option>
                    <option value="2">依据人数比例</option>
                    <option value="3">独立处理</option>
                </select>
            </td>
            <th>退回类型：</th>
            <td>
                <select class="myselect" style="width:210px;" id="behavior_BackType">
                    <option value="0">退回前一步</option>
                    <option value="1">退回第一步</option>
                    <option value="2">退回某一步</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>策略百分比：</th>
            <td><input type="text" id="behavior_Percentage" class="mytext" style="width:205px" /></td>
            <th>退回步骤：</th>
            <td>
                <select class="myselect" style="width:210px;" id="behavior_BackStep">
                </select>
            </td>
        </tr>
        <tr>
            <th>会签策略：</th>
            <td>
                <select class="myselect" value1="0" style="width:210px;" id="behavior_Countersignature">
                    <option value="0">不会签</option>
                    <option value="1">所有步骤同意</option>
                    <option value="2">一个步骤同意即可</option>
                    <option value="3">依据比例</option>
                </select>
            </td>
            <th>会签百分比：</th>
            <td>
                <input type="text" id="behavior_CountersignaturePercentage" class="mytext" style="width:205px" />
            </td>
        </tr>
    </table>
    </div>

    <!--
    <div id="div_form" class="mytab_div" style="display:none; width:99%; margin:0 auto;">
    <div>
        <table cellpadding="0" cellspacing="1" border="0">
            <tr>
                <td style="padding-right:4px;">
                    <select class="myselect" style="width:130px; max-height:200px;" onchange="form_types_change(this.value);" id="form_types">
                        <option value=""></option>
                           
                    </select>
                </td>
                <td>
                        
                </td>
                    
                <td style="padding-left:3px;"><input type="button" class="mybutton" value="添加" onclick="form_add();" /></td>
                   
            </tr>
        </table>
    </div>
    <div style="border:0px solid #e8e8e8; margin-top:6px; padding:3px 5px 3px 5px;" id="form_list">
        <div style="width:98%;"></div>
    </div>
    </div>
    -->
     
    <div id="div_button" style="width:99%;margin:0 auto;" title="&nbsp;&nbsp;按钮&nbsp;&nbsp;">
    <div style="height:8px;"></div>
    <div id="button_List" style="width:220px; height:270px; overflow:auto; border:1px solid #e8e8e8; padding:3px; float:left;">
    <div style="width:94%;">  
    <ul class="listulli" note="按钮之间的分隔线" title="按钮之间的分隔线" val="other_splitline" onmouseover="$(this).removeClass().addClass('listulli1');" onmouseout="if($currentButton==null || $currentButton.get(0)!==this){$(this).removeClass().addClass('listulli');}" onclick="button_click(this);" ondblclick="button_dblclick(this)" >---分隔线---</ul>
    <% 
    foreach(var button in bworkFlowButtons.GetAll(true))
    {
    %>
        <ul class="listulli" note="<%=button.Note %>" title="<%=button.Note %>"  val="<%=button.ID %>" onmouseover="$(this).removeClass().addClass('listulli1');" onmouseout="if($currentButton==null || $currentButton.get(0)!==this){$(this).removeClass().addClass('listulli');}" onclick="button_click(this);" ondblclick="button_dblclick(this)" ><label style="background:url(../../<%=button.Ico%>) no-repeat left;padding-left:20px;"><%=button.Title %></label></ul>
    <%}%>
    </div>
    </div>
    <div style="float:left; width:50px; text-align:center; padding-top:100px;">
        <input type="button" class="mybutton" value="添加" onclick="button_add();" /><br /><br />
        <input type="button" class="mybutton" value="删除" onclick="button_remove();" />
    </div>
    <div id="button_Select" style="width:220px; height:270px; overflow:auto; border:1px solid #e8e8e8; padding:3px; float:left;">
        <div style="width:94%;"></div>
    </div>
    <div style="width:20px; height:270px; float:left;"></div>
    <div id="button_Note" style="width:150px; height:270px; overflow:auto; border:1px solid #e8e8e8; padding:3px; float:left; overflow:auto;">
        <div style="font-weight:bold; line-height:22px;">按钮说明：</div>
        <div id="button_Note1" style="line-height:22px;"></div>
    </div>
    <div style="clear:both;"></div>
    </div>

    <div id="div_data" style="width:99%; margin:0 auto;" title="&nbsp;&nbsp;数据&nbsp;&nbsp;">
    <div style="height:8px;"></div>
    <table cellpadding="0" cellspacing="1" border="0">
        <tr>
            <td>数据表：</td>
            <td style="padding-right:8px;"><select class="myselect" id="data_alltable" style="width:140px;"></select></td>
            <td style="height:32px;">将所有字段设置为：</td>
            <td style="padding-right:8px;"><select class="myselect" id="data_allstate" onchange="data_StateCng(this.value)"><option value=""></option><option value="0">编辑</option><option value="1">只读</option><option value="2">隐藏</option></select></td>
            <td>将所有字段检查设置为：</td>
            <td><select class="myselect" id="data_allcheck" style="width:120px;" onchange="data_CheckCng(this.value)"><option value=""></option><option value="0">不检查</option><option value="1">允许为空,非空时检查</option><option value="2">不允许为空,并检查</option></select></td>
        </tr>
    </table>
    <div style="width:100%; height:256px; overflow:auto;">
    <table cellpadding="0" cellspacing="1" border="0" width="100%" class="listtable" id="data_table">
        <thead>
        <tr>
            <th>数据连接</th>
            <th>数据表</th>
            <th>字段名称</th>
            <th>字段状态</th>
            <th>数据检查</th>
        </tr>
        </thead>
        <tbody>
            
        </tbody>
    </table>
    </div>
    </div>

    <div id="div_event" title="&nbsp;&nbsp;事件&nbsp;&nbsp;">
    <div style="height:8px;"></div>
    <table cellpadding="0" cellspacing="1" border="0" width="99%" class="formtable">
        <tr>
            <th style="width:130px;">步骤提交前事件：</th>
            <td><input type="text" id="event_SubmitBefore" class="mytext" style="width:75%" /></td>
        </tr>
        <tr>
            <th>步骤提交后事件：</th>
            <td><input type="text" id="event_SubmitAfter" class="mytext" style="width:75%" /></td>
        </tr>
        <tr>
            <th>步骤退回前事件：</th>
            <td><input type="text" id="event_BackBefore" class="mytext" style="width:75%" /></td>
        </tr>
        <tr>
            <th>步骤退回后事件：</th>
            <td><input type="text" id="event_BackAfter" class="mytext" style="width:75%" /></td>
        </tr>
    </table>
   
    </div>
    </div>
    <div style="width:100%; margin:10px auto 10px auto; text-align:center;">
        <input type="button" class="mybutton" value=" 确 定 " onclick="confirm1();" />
        <input type="button" class="mybutton" value=" 取 消 " onclick="new RoadUI.Window().close();" />
    </div>
    </form>
    <script type="text/javascript">
        var frame = null;
        var openerid = '<%=Request.QueryString["openerid"]%>';
        var stepid = '<%=stepID%>';
        $(function ()
        {
            new RoadUI.Tab({ id: "tabdiv", replace: true, contextmenu:false });
            var iframes = top.frames;
            for (var i = 0; i < iframes.length; i++)
            {
                if (iframes[i].name == openerid + "_iframe")
                {
                    frame = iframes[i]; break;
                }
            }
            if (frame == null) return;

             
            //初始化行为里面字段值选择项以及字段状态列表
            var fields = frame.links_tables_fields;
            var tables = [];
            if(fields && fields.length>0)
            {
                var trs='';
                var valueFieldOptions='<option value=""></option>';
                for(var i=0;i<fields.length;i++)
                {
                    valueFieldOptions+='<option value="'+fields[i].link+'.'+fields[i].table+'.'+fields[i].field+'">'+fields[i].linkName+'.'+fields[i].table+'.'+fields[i].field+(fields[i].fieldNote?'('+fields[i].fieldNote+')':'')+'</option>';
                    trs+='<tr>';
                    trs+='<td style="background:#ffffff; height:30px;">';
                    trs+='<input type="hidden" value="'+i.toString()+'" id="data_check_index_'+i.toString()+'" />';
                    trs+='<input type="hidden" value="'+fields[i].link+'.'+fields[i].table+'.'+fields[i].field+'" id="data_check_field_'+i.toString()+'" />';
                    trs+=fields[i].linkName+'</td>';
                    trs+='<td style="background:#ffffff;">'+fields[i].table+'</td>';
                    trs+='<td style="background:#ffffff;">'+fields[i].field+(fields[i].fieldNote?'('+fields[i].fieldNote+')':'')+'</td>';
                    trs+='<td style="background:#ffffff;"><select class="myselect" id="data_check_status_'+i.toString()+'" style="width:60px;"><option value="0">编辑</option><option value="1">只读</option><option value="2">隐藏</option></select></td>';
                    trs+='<td style="background:#ffffff;"><select class="myselect" id="data_check_check_'+i.toString()+'" style="width:100px;"><option value="0">不检查</option><option value="1">允许为空,非空时检查</option><option value="2">不允许为空,并检查</option></select></td>';
                    trs+='</tr>';
                    tables.push(fields[i].table);
                }
                $("#behavior_ValueField").html(valueFieldOptions);
                $("#data_table tbody").append(trs);
                new RoadUI.Select().init($(".myselect", $("#data_table tbody")));
            }
            //初始化所有表过滤下拉选择
            tables = tables.unique();
            var tablesoptions='<option value=""></option>';
            for(var i=0; i<tables.length; i++)
            {
                tablesoptions+='<option value="'+tables[i]+'">'+tables[i]+'</option>';
            }
            $("#data_alltable").html(tablesoptions).bind("change",function()
            {
                var value=$(this).val();
                var $trs=$("#data_table tbody tr");
                if(value.length==0)
                {
                    $trs.show();
                    return;
                }

                for(var i=0;i<$trs.size();i++)
                {
                    var $tds=$("td",$trs.eq(i));
                    if($tds.size()>2 && $tds.eq(1).text()!=value)
                    {
                        $trs.eq(i).hide();
                    }
                    else
                    {
                        $trs.eq(i).show();
                    }
                }
            });


            var json = frame.wf_json;
            var step;
             
            if(json && json.steps && json.steps.length>0)
            {
                var stepOptions='<option value=""></option>';//初始化行为里面的处理者步骤和退回步骤选择
                for(var i=0;i<json.steps.length;i++)
                {
                    if(json.steps[i].id==stepid)
                    {
                        step=json.steps[i];
                    }
                    else
                    {
                        stepOptions+='<option value="'+json.steps[i].id+'">'+json.steps[i].name+'</option>';
                    }
                }
                $("#behavior_HandlerStep").html(stepOptions);
                $("#behavior_BackStep").html(stepOptions);
            }

            initStep(step);
             
            //按钮排序
            new RoadUI.DragSort($("#button_Select div"));

        });

        function form_types_change(value)
        {
            $.ajax({ url: top.rootdir + "/Platform/RoleApp/GetApps.ashx", data: { type: value }, async: false, type: "post", success: function (txt)
            {
                $("#form_forms").html('<option value=""></option>'+txt);
            }
            });
        }

        function form_add(formid, formtitle, formtype)
        {
            formid = formid || $("#form_forms").val();
            if (!formid)
            {
                alert("请选择要添加的表单!");
                return false;
            }
            else if ($("#form_list div ul[val='" + formid + "']").size() > 0)
            {
                alert("该表单已经添加了!");
                return false;
            }
            var formtitle = formtitle || $("#form_forms option[value='" + formid + "']").text();
            var formtype = formtype || $("#form_types option[value='" + $("#form_types").val() + "']").text();

            var $ul = $('<ul class="listulli" val="' + formid + '"><span>' + formtitle +
            '</span> - <span style="color:#999999;">' + formtype + '</span>' +
            '<span onclick="form_remove(this); return false;" style="padding-right:12px; margin-left:10px; height:18px; line-height:18px; cursor:pointer;' +
            ' background:url(../../Images/ico/cancel.gif) no-repeat left; padding-left:19px;"><a href="javascript:form_remove(this);return false;">删除</a></span></ul>');

            $("#form_list div").append($ul);

            new RoadUI.DragSort($("#form_list div"));
        }
        function form_remove(span)
        {
            //if (confirm("您真的要删除该表单吗?"))
            //{
            $(span).parent().remove();
            //new RoadUI.DragSort($("#form_list div"));
            //}
        }

        var $currentButton = null;
        function button_click(ul)
        {
            $currentButton = $(ul);
            var $buttons = null;
            if ($currentButton.parent().parent().attr('id') == "button_List")
            {
                $buttons = $("#button_List div ul");
            }
            else if($currentButton.parent().parent().attr('id') == "button_Select")
            {
                $buttons = $("#button_Select div ul");
            }
            $buttons.each(function ()
            {
                $(this).removeClass().addClass("listulli");
            });
            $(ul).removeClass().addClass("listulli1");
            $("#button_Note1").text($(ul).attr("note"));
        }

        function button_dblclick(ul)
        {
            button_click(ul);
            button_add();
        }

        function button_add()
        {
            if ($currentButton == null)
            {
                alert("请选择要添加的按钮!");return false;
            }
            if ($currentButton.parent().parent().attr('id') == "button_List")
            {
                if($("#button_Select div ul[val='" + $currentButton.attr("val") + "']").size()>0)
                {
                    alert("当前按钮已经选择了!"); return false;
                }
                $("#button_Select div").append($currentButton.clone());
            }
            else if ($currentButton.parent().parent().attr('id') == "button_Select")
            {
                $currentButton.remove();
            }
            $currentButton = null;
            new RoadUI.DragSort($("#button_Select div"));
        }
        function button_remove()
        {
            if ($currentButton == null)
            {
                alert("请选择要删除的按钮!"); return false;
            }
            $currentButton.remove();
            new RoadUI.DragSort($("#button_Select div"));
        }

        function initStep(step)
        {
            if(!step) 
            {
                $("#base_Name").val("新步骤");
                return;
            }

            $("#base_Name").val(step.name);
            if(step.opinionDisplay) $("#base_OpinionDisplay").val(step.opinionDisplay);
            if(step.expiredPrompt) $("#base_ExpiredPrompt").val(step.expiredPrompt);
            if(step.signatureType) $("#base_SignatureType").val(step.signatureType);
            if(step.workTime) $("#base_WorkTime").val(step.workTime);
            //if(step.limitTime) $("#base_LimitTime").val(step.limitTime);
            //if(step.otherTime) $("#base_OtherTime").val(step.otherTime);
            if(step.archives) $("#base_Archives").val(step.archives);
            if(step.note) $("#base_Note").val(step.note);
        
            if(step.behavior.flowType) $("#behavior_FlowType").val(step.behavior.flowType);
            if(step.behavior.runSelect) $("#behavior_RunSelect").val(step.behavior.runSelect);
            if(step.behavior.handlerType) $("#behavior_HandlerType").val(step.behavior.handlerType);
            if(step.behavior.selectRange) 
            {
                $("#behavior_SelectRange").val(step.behavior.selectRange); 
                new RoadUI.Member().setValue($("#behavior_SelectRange"));
            }
            if(step.behavior.handlerStep) $("#behavior_HandlerStep").val(step.behavior.handlerStep);
            if(step.behavior.valueField) $("#behavior_ValueField").val(step.behavior.valueField);
            if(step.behavior.defaultHandler)
            {
                $("#behavior_DefaultHandler").val(step.behavior.defaultHandler); 
                new RoadUI.Member().setValue($("#behavior_DefaultHandler"));
            }
            if(step.behavior.hanlderModel) $("#behavior_HanlderModel").val(step.behavior.hanlderModel);
            if(step.behavior.backModel) $("#behavior_BackModel").val(step.behavior.backModel);
            if(step.behavior.backType) $("#behavior_BackType").val(step.behavior.backType);
            if(step.behavior.backStep) $("#behavior_BackStep").val(step.behavior.backStep);
            if(step.behavior.percentage) $("#behavior_Percentage").val(step.behavior.percentage);
            if(step.behavior.countersignature) $("#behavior_Countersignature").val(step.behavior.countersignature);
            if(step.behavior.countersignaturePercentage) $("#behavior_CountersignaturePercentage").val(step.behavior.countersignaturePercentage);

            var forms=step.forms;
            if(forms && forms.length>0)
            {
                for(var i=0;i<forms.length;i++)
                {
                    //form_add(forms[i].id,forms[i].name,forms[i].type);
                    $('#form_types').val(forms[i].type);
                    form_types_change(forms[i].type);
                    $("#form_forms").val(forms[i].id);
                }
            }

            var buttons=step.buttons;
            if(buttons && buttons.length>0)
            {
                for(var i=0;i<buttons.length;i++)
                {
                    var $ul=$("#button_List div ul[val='"+buttons[i].id+"']");
                    if($ul.size()>0)
                    {
                        $currentButton=$ul;
                        button_add();
                    }
                }
            }

            initDataFiledStatus(step.fieldStatus);

            if(step.event)
            {
                $("#event_SubmitBefore").val(step.event.submitBefore);
                $("#event_SubmitAfter").val(step.event.submitAfter);
                $("#event_BackBefore").val(step.event.backBefore);
                $("#event_BackAfter").val(step.event.backAfter);
            }
        }

        function initDataFiledStatus(fields)//初始化字段状态列表
        {
            if(!fields || fields.length==0)
            {
                return;
            }

            $("#data_table tbody tr").each(function(){
                var field=$("input[id^='data_check_field_']",$(this)).val();
                var status="0";
                var check="0";
                for(var i=0;i<fields.length;i++)
                {
                    if(fields[i].field==field)
                    {
                        status=fields[i].status;
                        check=fields[i].check;
                        break;
                    }
                }
                $("select[id^='data_check_status_']",$(this)).val(status)
                $("select[id^='data_check_check_']",$(this)).val(check)
            });
        }

        function data_StateCng(value)
        {
            $("select:visible[id^='data_check_status_']", $("#data_table tbody")).val(value);
        }

        function data_CheckCng(value)
        {
            $("select:visible[id^='data_check_check_']", $("#data_table tbody")).val(value);
        }

        function confirm1()
        {
            var step = {};
            step.id = stepid;
            step.type = "normal";
            step.name = $("#base_Name").val() || "";
            step.opinionDisplay = $("#base_OpinionDisplay").val() || ""; 
            step.expiredPrompt = $("#base_ExpiredPrompt").val()||"";
            step.signatureType = $("#base_SignatureType").val() || "";
            step.workTime = $("#base_WorkTime").val() || "";
            step.limitTime = "" // $("#base_LimitTime").val() || "";
            step.otherTime = "" // $("#base_OtherTime").val() || "";
            step.archives = $("#base_Archives").val() || "";
            step.archivesParams = $("#base_ArchivesParams").val()||"";
            step.note = $("#base_Note").val() || "";
            step.position = {x:<%=stepX%>, y:<%=stepY%>, width:<%=stepWidth%>, height:<%=stepHeight%>};
            step.countersignature = $("#base_Countersignature_1").prop("checked") ? 1 : 0;

            step.behavior={
                flowType: $("#behavior_FlowType").val() || "",
                runSelect: $("#behavior_RunSelect").val() || "",
                handlerType: $("#behavior_HandlerType").val() || "",
                selectRange: $("#behavior_SelectRange").val() || "",
                handlerStep: $("#behavior_HandlerStep").val() || "",
                valueField: $("#behavior_ValueField").val() || "",
                defaultHandler: $("#behavior_DefaultHandler").val() || "",
                hanlderModel: $("#behavior_HanlderModel").val() || "",
                backModel: $("#behavior_BackModel").val() || "",
                backType: $("#behavior_BackType").val() || "",
                backStep: $("#behavior_BackStep").val()||"",
                percentage: $("#behavior_Percentage").val() || "",
                countersignature: $("#behavior_Countersignature").val() || "0",
                countersignaturePercentage: $("#behavior_CountersignaturePercentage").val() || ""
            };
          
            step.forms = [];
            //$("#form_list div ul").each(function(i){
            //    var $spans=$(this).children('span');
            //    step.forms.push({ id: $(this).attr("val"), name:$spans.eq(0).text(), type:$spans.eq(1).text(), srot:i });
            //});
            var form_type=$('#form_types').val()||"";
            var form_forms=$("#form_forms").val()||"";
            if(form_forms.length > 0 && form_type.length > 0)
            {
                step.forms.push({ id: form_forms, name:"", type:form_type, srot:0 });
            }
                                                                                                 
            step.buttons=[];
            $("#button_Select div ul").each(function(i){
                step.buttons.push({ id: $(this).attr("val"), sort: i });
            });

            step.fieldStatus=[];
            $("#data_table tbody input[type='hidden'][id^='data_check_index_']").each(function(i){
                var index=$(this).val();
                var fields=$("#data_check_field_"+index).val();
                var status=$("#data_check_status_"+index).val();
                var check=$("#data_check_check_"+index).val();
                step.fieldStatus.push({field:fields,status:status,check:check});
            });

            step.event = { submitBefore: $("#event_SubmitBefore").val()||"",
                submitAfter: $("#event_SubmitAfter").val() || "",
                backBefore: $("#event_BackBefore").val() || "",
                backAfter: $("#event_BackAfter").val() || ""
            };

            frame.addStep1(step);
            frame.setStepText(step.id,step.name);
            new RoadUI.Window().close();
        }
    </script>

</body>
</html>
