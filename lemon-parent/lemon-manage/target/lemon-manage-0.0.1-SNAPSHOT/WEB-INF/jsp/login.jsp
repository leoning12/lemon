<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>登录</title>
	<jsp:include page="../common/commonInclude.jsp"></jsp:include>
    <style type="text/css">
    	.btn{
    		outline: none!important;
    	}
    </style>
</head>
<body  class="gray-bg">
       <div class="middle-box loginscreen animated fadeInDown">
            <div>
                <h1 class="logo-name">XN</h1>
            </div>
            <form id="loginForm" class="m-t" role="form" method="post" action="<%=request.getContextPath()%>/login">
                <div class="form-group">
	                <div class="input-group">
					      <span class="input-group-btn">
					        <button class="btn btn-info" type="button">用户名</button>
					      </span>
					      <input type="text" name="userName" class="form-control" placeholder="用户名" required>
				     </div>
                </div>
                <div class="form-group">
                <div class="input-group">
	                <span class="input-group-btn">
			        	<button class="btn btn-info" type="button">密&#12288;码</button>
			        </span>
                    <input type="password" name="password" class="form-control" placeholder="密码" required>
                </div>
                </div>
                <!-- <div class="form-group">
                <div class="input-group">
                	<span class="input-group-btn">
			        	<button class="btn btn-info" type="button">验证码</button>
			        </span>
                    <input type="text" id="vCode" name="vCode" class="form-control" placeholder="验证码" maxlength=4; style="width: 50%;">
                    <img id="login_imgCode" class="form-control" title="点击更换" src="" style="width: 50%;">
                </div>
                </div> -->
                <!-- <div class="form-group">
                    <img id="login_imgCode" class="form-control" title="点击更换" src="" style="width: 40%;">
                </div> -->
                <div class="form-group">
                	<button type="submit" class="btn btn-primary block full-width m-b">登录</button>
                </div>
            </form>
            <p class="m-t"> <small>Copyright 2017-2027 All Rights Reserved 版权所有：徐宁 </small></p>
    </div>
<script type="text/javascript">
$(document).ready(function() {
	
	<%-- $("#login_imgCode").attr("src", "<%=request.getContextPath()%>/captcha?t=" + Math.random());
	 $("#login_imgCode").click(function() {
		 $(this).attr("src", "<%=request.getContextPath()%>/captcha?t=" + Math.random());
    }); --%>
	 
	 $("#loginForm").submit(function(){
		 
	 });
	 
	 
    $('#loginForm').bootstrapValidator({
//        live: 'disabled',
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            userName: {
                validators: {
                    notEmpty: {
                        message: '用户名必填不能为空'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: '密码必填不能为空'
                    }
                }
            }/* ,
            vCode: {
                validators: {
                    notEmpty: {
                        message: '验证码必填不能为空'
                    }
                }
            } */
        }
    });
    
    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#loginForm').bootstrapValidator('validate');
    });

    $('#resetBtn').click(function() {
        $('#loginForm').data('bootstrapValidator').resetForm(true);
    });
});
</script>
</body>
</html>