<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <jsp:include page="../../common/commonCss.jsp"></jsp:include>
  <link href="${ctx }/static/css/bootstrap.min.css" rel="stylesheet">
  <link href="${ctx }/static/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
  </head>
  
  <body>
    <div class="panel panel-default">
	  <div class="panel-body">
	    Basic panel example
	  </div>
</div>
<table id="userList"></table>
  </body>
  <script type="text/javascript" src="${ctx }/static/js/jquery.min.js"></script>
  <script type="text/javascript" src="${ctx }/static/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${ctx }/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
  <script type="text/javascript" src="${ctx }/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
  <script type="text/javascript">
  	$(function(){
  		$('#userList').bootstrapTable({
            url: '${ctx}/user/list',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            contentType: "application/x-www-form-urlencoded",
            dataField: "rows",
            totalField:"total",
            //toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: true,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            //queryParams: oTableInit.queryParams,//传递参数（*）
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10,20,30,50,100,"ALL"],        //可供选择的每页的行数（*）
            //search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            //strictSearch: true,
            //showColumns: true,                  //是否显示所有的列
            //showRefresh: true,                  //是否显示刷新按钮
            //minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            height: 300,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            //showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            paginationLoop:false,
            columns: [{
                checkbox: true
            }, {
                field: 'id',
                title: '标识',
                sortable:true
            }, {
                field: 'loginName',
                title: '登录名称',
                sortable:true
            }, {
                field: 'loginPass',
                title: '登录密码',
                sortable:true
            }, {
                field: 'userName',
                title: '姓名',
                sortable:true
            }, ]
        });
  	})
  </script>
</html>
