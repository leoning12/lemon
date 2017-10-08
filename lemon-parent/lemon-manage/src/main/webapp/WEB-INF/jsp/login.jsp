<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="<%=request.getContextPath()%>"></c:set>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>登录</title>
	<jsp:include page="../common/commonCss.jsp"></jsp:include>
	<link href="${ctx }/static/css/login.css" rel="stylesheet">
    <style type="text/css">
    	.btn{
    		outline: none!important;
    	}
    </style>
</head>
<body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-7">
                <div class="signin-info">
                    <div class="logopanel m-b">
                        <h1>lemon-project</h1>
                    </div>
                    <h4>欢迎欢迎，热烈欢迎</h4>
                    <ul class="m-b">
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势一</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势二</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势三</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势四</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势五</li>
                    </ul>
                    <strong>还没有账号？ <a href="#">立即注册&raquo;</a></strong>
                </div>
            </div>
            <div class="col-sm-5">
                <form method="post" action="${ctx }/session">
                    <h4 class="no-margins">登录：</h4>
                    <c:if test="${not empty errMsg }">
					<div class="alert alert-danger alert-dismissable m-t">
                      <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                      	${errMsg }
                     </div>
                     </c:if>
                    <input type="text" class="form-control uname" name="userName" placeholder="用户名" required/>
                    <input type="password" class="form-control pword m-b" name="password" placeholder="密码" required/>
					<div class="input-group">
                        <input type="text" id="verifyCode" name="verifyCode" style="width:80%;margin-top: 0;color: #333;" class="form-control" placeholder="请输入验证码" title="验证码" maxlength="4">
                        <span class="input-group-addon" style="padding: 0px;"><img id="randCodeImage" src="${ctx }/randomCodeImage"></span>
                    </div>
					<a href="">忘记密码了？</a>
                    <button class="btn btn-success btn-block">登录</button>
                </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy; 2015 All Rights Reserved. lemon
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="${ctx }/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx }/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript">
	$(function(){
		//$('#randCodeImage').attr('src','${ctx }/randomCodeImage?a='+Math.random());
		$('#randCodeImage').click(function(){
			$('#randCodeImage').attr('src','${ctx }/randomCodeImage?a='+Math.random());
		});
	});
</script>
</html>