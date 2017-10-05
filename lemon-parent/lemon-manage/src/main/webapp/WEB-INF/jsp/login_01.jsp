<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>用户登录</title>
<link href="<%=request.getContextPath()%>/css/login/login.css?v=2" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/js/jquery.min.js?v=2.1.4"></script>
</head>

<body>

	<div class="wrap">
		<div class="banner-show" id="js_ban_content">
			<div class="cell bns-01">
				<div class="con"></div>
			</div>
			<div class="cell bns-02" style="display:none;">
				<div class="con">
					<a href="http://sc.chinaz.com" target="_blank" class="banner-link">
						<i>圈子</i>
					</a>
				</div>
			</div>
			<div class="cell bns-03" style="display:none;">
				<div class="con">
					<a href="http://sc.chinaz.com" target="_blank" class="banner-link">
						<i>企业云</i>
					</a>
				</div>
			</div>
		</div>
		<div class="banner-control" id="js_ban_button_box">
			<a href="javascript:;" class="left">左</a> <a href="javascript:;" class="right">右</a>
		</div>
		<script type="text/javascript">
			;
			(function() {

				var defaultInd = 0;
				var list = $('#js_ban_content').children();
				var count = 0;
				var change = function(newInd, callback) {
					if (count)
						return;
					count = 2;
					$(list[defaultInd]).fadeOut(400, function() {
						count--;
						if (count <= 0) {
							if (start.timer)
								window.clearTimeout(start.timer);
							callback && callback();
						}
					});
					$(list[newInd]).fadeIn(400, function() {
						defaultInd = newInd;
						count--;
						if (count <= 0) {
							if (start.timer)
								window.clearTimeout(start.timer);
							callback && callback();
						}
					});
				}

				var next = function(callback) {
					var newInd = defaultInd + 1;
					if (newInd >= list.length) {
						newInd = 0;
					}
					change(newInd, callback);
				}

				var start = function() {
					if (start.timer)
						window.clearTimeout(start.timer);
					start.timer = window.setTimeout(function() {
						next(function() {
							start();
						});
					}, 8000);
				}

				start();

				$('#js_ban_button_box').on('click', 'a', function() {
					var btn = $(this);
					if (btn.hasClass('right')) {
						//next
						next(function() {
							start();
						});
					} else {
						//prev
						var newInd = defaultInd - 1;
						if (newInd < 0) {
							newInd = list.length - 1;
						}
						change(newInd, function() {
							start();
						});
					}
					return false;
				});

			})();
		</script>
		<div class="container">
			<div class="register-box">
				<div class="reg-slogan">用户登录</div>
				<div class="reg-form" id="js-form-mobile">
					<br> <br>
					<div class="cell">
						<input type="text" name="mobile" id="js-mobile_ipt" placeholder="请输入账号"  class="text" maxlength="11" />
					</div>
					<div class="cell">
						<input type="password" name="passwd" id="js-mobile_pwd_ipt" class="text" placeholder="请输入密码" /> 
						<input type="text" name="passwd" id="js-mobile_pwd_ipt_txt" class="text" maxlength="20" style="display:none;" /> 
						<b class="icon-form ifm-view js-view-pwd" title="查看密码" style="display: none"> 查看密码</b>
					</div>
					<!-- !短信验证码 -->
					<div class="cell vcode">
						<input type="text" name="code" id="js-mobile_vcode_ipt" class="text" maxlength="6" placeholder="请输入验证码" />
						<img id="login_imgCode" title="点击更换" src="<%=request.getContextPath()%>/validateCode" width="85" height="25">
					</div>
					<div class="bottom">
						<a id="js-mobile_btn" href="javascript:;" class="button btn-green">登录</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="con">
			<div class="copy-right">
				<div class="cell">
					<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
						<p>Copyright 2010-2015 All Rights Reserved     版权所有：leoning</p>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>
