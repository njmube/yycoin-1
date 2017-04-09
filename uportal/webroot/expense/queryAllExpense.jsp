<%@page contentType="text/html; charset=UTF-8"%>
<%@include file="../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<p:link title="出差费用报销管理" link="true" guid="true" cal="true" dialog="true" />
<script src="../js/common.js"></script>
<script src="../js/public.js"></script>
<script src="../js/pop.js"></script>
<script src="../js/plugin/highlight/jquery.highlight.js"></script>
<script type="text/javascript">

var gurl = '../tcp/expense.do?method=';
var addUrl = '../tcp/addExpense.jsp';
var ukey = 'Expense';

var allDef = getAllDef();
var guidMap;
var thisObj;
function load()
{
     preload();
     
     guidMap = {
         title: '所有报销列表',
         url: gurl + 'queryAllExpense',
         colModel : [
             {display: '选择', name : 'check', content : '<input type=radio name=checkb value={id} lstatus={status}>', width : 40, align: 'center'},
             {display: '标识', name : 'id', width : '15%'},
             {display: '目的', name : 'name', width : '10%'},
             {display: '报销人', name : 'stafferName', width : '8%'},
             {display: '系列', name : 'stype', cc: 'tcpStype', width : '5%'},
             {display: '类型', name : 'type', cc: 'tcpType', width : '12%'},
             {display: '状态', name : 'status', cc: 'tcpStatus', width : '10%'},
             {display: '费用', name : 'showTotal', sortable: true, cname: 'total', width : '8%'},
             {display: '付款', name : 'showBorrowTotal', sortable: true, cname: 'borrowTotal', width : '8%'},
             {display: '合规标识', name : 'compliance', cc: 'tcpComplianceType', width : '5%'},
             {display: '时间', name : 'logTime', sortable: true, width : 'auto'}
             ],
         extAtt: {
             id : {begin : '<a href=' + gurl + 'find' + ukey + '&id={id}>', end : '</a>'}
         },
         buttons : [
             {id: 'search', bclass: 'search', onpress : doSearch},
             {id: 'export', bclass: 'replied',  caption: '导出结果', onpress : exports}
             ],
        <p:conf/>
     };
     
     $("#mainTable").flexigrid(guidMap, thisObj);
}
 
function $callBack()
{
    loadForm();
    highlights($("#mainTable").get(0), ['结束'], 'blue');
    highlights($("#mainTable").get(0), ['驳回'], 'red');
}

function addBean(opr, grid)
{
    $l(gurl + 'preForAdd' + ukey + '&type=11');
    //$l(addUrl);
}

function delBean(opr, grid)
{
    if (getRadio('checkb') && (getRadio('checkb').lstatus == 0 || getRadio('checkb').lstatus == 1))
    {    
        if(window.confirm('确定删除?'))    
        $ajax(gurl + 'delete' + ukey + '&id=' + getRadioValue('checkb'), callBackFun);
    }
    else
    $error('不能操作');
}

function updateBean()
{
	if (getRadio('checkb') && getRadioValue('checkb'))
	{	
		$l(gurl + 'find' + ukey + '&update=1&id=' + getRadioValue('checkb'));
	}
	else
	$error('不能操作');
}

function exports()
{
    document.location.href = gurl + 'exportExpense';
}


function doSearch()
{
    $modalQuery('../admin/query.do?method=popCommonQuery2&key=tcp.queryAllExpense');
}

</script>
</head>
<body onload="load()" class="body_class">
<form name="mainForm" method="post">
<p:cache></p:cache>
</form>
<p:message></p:message>
<table id="mainTable" style="display: none"></table>
<p:query height="300px"/>
</body>