<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"	 %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
 <meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>采购详情管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 采购管理 <span class="c-gray en">&gt;</span> 采购详情 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<form action="cgctrl/selectOrderDetail.do" method="post" id="myform">
	<div class="text-c"> 日期范围：
		<input type="text" value="<fmt:formatDate value="${cod.codDatemin }" pattern="yyyy-MM-dd"/>" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" name="codDatemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" value="<fmt:formatDate value="${cod.codDatemax }" pattern="yyyy-MM-dd"/>" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" name="codDatemax" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入采购详情单编号" value="${cod.orderDetailId }" id="orderDetailId" name="orderDetailId">
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索采购单详情信息</button>
		<button type="reset" class="btn btn-success radius"><i class="Hui-iconfont">&#xe6f7;</i>重置</button>
	</div>
	</form>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="member_add('添加采购单详情','cgctrl/goaddOrderDetail.do','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加采购单详情</a></span> <span class="r">共有数据：<strong>${codp.total }</strong> 条</span> </div>
	<div class="mt-20">
	<form action="cgctrl/deleteAllOrderDetail.do" method="post" id="myform1">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="80">采购详情编号</th>
				<th width="80">采购单编号</th>
				<th width="80">产品编号</th>
				<th width="80">产品数量</th>
				<th width="80">产品价格</th>
				<th width="80">是否入库</th>
				<th width="80">操作人员</th>
				<th width="">备注信息</th>
				<th width="80">公司编号</th>
				<th width="">最后修改时间</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${codp.list }" var="cod">
			<tr class="text-c">
				<td><input type="checkbox" value="${cod.orderDetailId }" name="orderDetailIds"></td>
				<td>${cod.orderDetailId }</td>
				<td>${cod.orderId }</td>
				<td>${cod.productId }</td>
				<td>${cod.productNum }</td>
				<td>${cod.productPrice }</td>
				<td>
				<c:if test="${cod.productWarehousing=='yes'}">
				<span class="label label-success" id="isp" style="text-decoration: none">已入库</span></c:if>
				<c:if test="${cod.productWarehousing=='no'}">
				<a class="label label-danger" id="isp" href="javascript:;" style="text-decoration: none"
				onclick="tosubcod('${cod.orderDetailId}','${cod.productWarehousing}')">未入库</a></c:if>
				</td>
				<td>${cod.staffId }</td>
				<td>${cod.orderaterRemark }</td>
				<td>${cod.companyId }</td>
				<td><fmt:formatDate value="${cod.lastModifyDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td class="td-manage">
				<a title="编辑" href="javascript:;" onclick="member_edit('编辑','cgctrl/goaddOrderDetail.do','${cod.orderDetailId }','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>  
				<a title="删除" href="javascript:;" onclick="member_del(this,'${cod.orderDetailId }')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</form>
	</div>
	
	<div class="dataTables_info" role="status" aria-live="polite" style="float: left;margin-top: 10px;margin-bottom: 10px">当前第 ${codp.pageNum }/${codp.pages }页，共 ${codp.total }条</div>
	<div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_paginate" style="float: right;margin-top: 10px;margin-bottom: 10px">
	<a class="paginate_button" aria-controls="DataTables_Table" id="DataTables_Table_previous" href="javascript:void(0)" onclick="gopage(${codp.navigateFirstPage })">首页</a>
	<a class="paginate_button previous" aria-controls="DataTables_Table" id="DataTables_Table_previous" href="javascript:void(0)" onclick="gopage(${codp.prePage })">上一页</a>
	<a class="paginate_button next" aria-controls="DataTables_Table" id="DataTables_Table_next" href="javascript:void(0)" onclick="gopage(${codp.nextPage })">下一页</a>
	<a class="paginate_button" aria-controls="DataTables_Table" id="DataTables_Table_previous" href="javascript:void(0)" onclick="gopage(${codp.navigateLastPage })">尾页</a>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
		]
	});
	$("#DataTables_Table_0_info").hide();
	
	$("#DataTables_Table_0_paginate").hide();
	$("#DataTables_Table_0_length").hide();
			$("#DataTables_Table_0_filter").hide();
});
/*采购详情-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*采购详情-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}

/*采购详情-编辑*/
function member_edit(title,url,id,w,h){
	url=url+"?orderDetailId="+id,
	layer_show(title,url,w,h);
}

/*采购详情——更多信息*/
function change_password(title,url,id,w,h){
	url=url+"?orderDetailId="+id;
	layer_show(title,url,w,h);	
}
	function gopage(pageNum){
   $("#pageNum").val(pageNum);
   $("#myform").submit();
}
/*采购详情-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'cgctrl/deleteOrderDetail.do',
			data:"orderDetailId="+id,
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

//分页
function gopage(pageNum){
   $("#pageNum").val(pageNum);
   $("#myform").submit();
}
//单独修改入库状态
function tosubcod(id, ispay){
	layer.confirm('确认要更改入库状态吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'cgctrl/productWarehousing.do?',
			data:"orderDetailId=" + id + "&productWarehousing=" + ispay,
			dataType: 'json',
			success: function(data){
				layer.msg('已更改!',{icon:1,time:1000});
				location.reload();
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

function datadel(){
   
   $("input[name='orderDetailIds']")
   
   if($("input[name='orderDetailIds']:checked").length>=1){
   
	   layer.confirm('确认要删除这些数据吗？',function(index){
	      $("#myform1").submit();
	      layer.msg('已删除!',{icon:1,time:1000});
	   });
   }else{
       layer.msg('请至少选择一条数据!',{icon:5,time:1000});
   }
}
</script> 
</body>
</html>
