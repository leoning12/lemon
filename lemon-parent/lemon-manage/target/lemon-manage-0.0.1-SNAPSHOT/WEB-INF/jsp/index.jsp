<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<jsp:include page="../common/commonCss.jsp"></jsp:include>
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation" style="z-index: 1991;">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                                <span><img alt="image" width="180" height="61" src="${ctx }/static/img/jeecg-aceplus.png" /></span>
                    </div>
                    <div class="logo-element">LEMON
                    </div>
                </li>

                <%-- <t:menu style="hplus" menuFun="${menuMap}"></t:menu> --%>
                <li>
                        <a href="#">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">主页</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="index_v1.html" data-index="0">主页示例一</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="index_v2.html">主页示例二</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="index_v3.html">主页示例三</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="index_v4.html">主页示例四</a>
                            </li>
                            <li>
                                <a href="index_v5.html" target="_blank">主页示例五</a>
                            </li>
                        </ul>

                    </li>

            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header" style="height: 60px;"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                    <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                        <div class="form-group">
                            <input type="text" placeholder="请输入要在站内搜索的内容 …" class="form-control" name="top-search" id="top-search">
                        </div>
                    </form>
                </div>
                
                
                <ul class="nav navbar-top-links navbar-right">
                <!-- update-start--Author: chenj Date:20160812 for: TASK #1269 【ace h+】风格无用的右上角功能隐藏，暂时注释掉 -->
                   <%--  <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope"></i> <span class="label label-warning">0</span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a>
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> 您有0条未读消息
                                        <span class="pull-right text-muted small">4分钟前</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a class="" href="javascript:goAllNotice();">
                                        <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell"></i> <span class="label label-primary">0</span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a>
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> 您有0条未读消息
                                        <span class="pull-right text-muted small">4分钟前</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a class="" href="javascript:goAllMessage();">
                                        <strong>查看所有 </strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li> --%>
                    <!-- update-end--Author: chenj Date:20160812 for: TASK #1269 【ace h+】风格无用的右上角功能隐藏，暂时注释掉 -->
                    
                    <!-- //update-start--Author: chenj Date:20160726 for: TASK #1207 [改造]h+风格下，去掉logo下面的内容，迁移位置到右上角，主题位置 -->
                    
                    <li class="dropdown" onfocus="bindFrameClick()">
                    	<a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <span ><strong class="font-bold">徐宁</strong></span>
                                <span >管理员<b class="caret"></b></span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="javascript:;">
                                    hehe
                                </a>
                            </li>
                            <li><a href="javascript:;"/></a></li>
                           <!--  <li class="divider"></li>
                            <li><a href="javascript:logout()">注销</a></li> -->
                        </ul>
                    </li>                    
                     
                    <li class="dropdown hidden-xs">
                        <a class="right-sidebar-toggle" aria-expanded="false">
                            <i class="fa fa-tasks"></i> 主题
                        </a>
                    </li>
                   <!-- //update-begin--Author: chenj Date:20160729 for: TASK #1207 [改造]h+风格下，修改 退出 按钮的位置 -->
                      <li class="dropdown">
                     <a href="javascript:logout()" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
                     </li>
                     <!-- //update-end--Author: chenj Date:20160729 for: TASK #1207 [改造]h+风格下，修改 退出 按钮的位置 -->
                </ul>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:;" class="active J_menuTab" data-id="http://www.baidu.com">首页</a>
                </div>
            <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
            </button>
            <div class="btn-group roll-nav roll-right">
                <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                </button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabShowActive"><a>定位当前选项卡</a>
                    </li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                    </li>
                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- update-begin--Author:zhoujf  Date:20170710 for：TASK #2003 【UI改进】列表加载慢的时候会出现白板  -->
        <style type="text/css">  
		<!--  
		.proccess{display:none;background-color:#f2f2f2;border:0px solid;border-color:#009900;height:100%;line-height:600px;width:100%;text-align:center;margin:100;position:absolute;top:0;left:0;}  
		.proccess b{vertical-align:middle;background:url(plug-in/layer/skin/default/loading-0.gif) no-repeat 0 center;padding-left:55px;display:inline-block;}  
		-->  
		</style> 
        <div class="row J_mainContent" id="content-main" style="margin-left:-13px;">
            <div class="proccess" id="panelloadingDiv"><b>&nbsp;</b></div> 
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="loginController.do?hplushome" frameborder="0" data-id="loginController.do?hplushome" seamless></iframe>
        </div>
        <div class="footer" style="border-top:none;">
            <div class="pull-right">&copy; <t:mutiLang langKey="system.version.number"/> <a href="#" target="_blank">lemon-project</a>
            </div>
        </div>        
    </div>
    <!--右侧部分结束-->
    <!--右侧边栏开始-->
    <div id="right-sidebar">
        <div class="sidebar-container">

            <ul class="nav nav-tabs navs-3">

                <li class="active">
                    <a data-toggle="tab" href="#tab-1">
                        <i class="fa fa-gear"></i> 主题
                    </a>
                </li>
               <li class=""><a data-toggle="tab" href="#tab-2">
                   <i class="fa fa-comments-o" aria-hidden="true"></i>通知
                </a>
                </li>
                <li><a data-toggle="tab" href="#tab-3">
                    <i class="fa fa-info-circle" aria-hidden="true"></i>公告
                </a>
                </li>
            </ul>

            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="sidebar-title">
                        <h3> <i class="fa fa-comments-o"></i> 主题设置</h3>
                        <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                    </div>
                    <div class="skin-setttings">
                        <div class="title">主题设置</div>
                        <div class="setings-item">
                            <span>收起左侧菜单</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
                                    <label class="onoffswitch-label" for="collapsemenu">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>固定顶部</span>

                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                    <label class="onoffswitch-label" for="fixednavbar">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                                <span>
                        固定宽度
                    </span>

                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
                                    <label class="onoffswitch-label" for="boxedlayout">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="title">皮肤选择</div>
                        <div class="setings-item default-skin nb">
                                <span class="skin-name ">
                         <a href="#" class="s-skin-0">
                             默认皮肤
                         </a>
                    </span>
                        </div>
                        <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-1">
                            蓝色主题
                        </a>
                    </span>
                        </div>
                        <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-3">
                            黄色/紫色主题
                        </a>
                    </span>
                        </div>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane">
                    <div class="sidebar-title">
                        <h3> <i class="fa fa-comments-o"></i> 最新通知<small id="messageCount"><i class="fa fa-tim"></i> 您当前有0条未读通知</small></h3>
                    </div>
                    <ul class="sidebar-list">
                        <li id="messageContent">

                        </li>

                        <li>
                            <a href="javascript:goAllMessage();" id="messageFooter">
                                查看全部
                                <i class="icon-arrow-right"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <div id="tab-3" class="tab-pane">
                    <div class="sidebar-title">
                        <h3> <i class="fa fa-cube"></i> 最新公告<small id="noticeCount"><i class="fa fa-tim"></i> 您当前有0个公告</small></h3>

                    </div>
                    <ul class="sidebar-list">
                        <li id="noticeContent">

                        </li>
                        <li>
                            <a href="javascript:goAllNotice();" id="noticeFooter">
                                查看所有公告
                                <i class="icon-arrow-right"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
    <!--右侧边栏结束-->
    <!--mini聊天窗口开始-->
    <%--<div class="small-chat-box fadeInRight animated">

        <div class="heading" draggable="true">
            <small class="chat-date pull-right">
                2015.9.1
            </small> 与 Beau-zihan 聊天中
        </div>

        <div class="content">

            <div class="left">
                <div class="author-name">
                    Beau-zihan <small class="chat-date">
                    10:02
                </small>
                </div>
                <div class="chat-message active">
                    你好
                </div>

            </div>
            <div class="right">
                <div class="author-name">
                    游客
                    <small class="chat-date">
                        11:24
                    </small>
                </div>
                <div class="chat-message">
                    你好，请问H+有帮助文档吗？
                </div>
            </div>
            <div class="left">
                <div class="author-name">
                    Beau-zihan
                    <small class="chat-date">
                        08:45
                    </small>
                </div>
                <div class="chat-message active">
                    有，购买的H+源码包中有帮助文档，位于docs文件夹下
                </div>
            </div>
            <div class="right">
                <div class="author-name">
                    游客
                    <small class="chat-date">
                        11:24
                    </small>
                </div>
                <div class="chat-message">
                    那除了帮助文档还提供什么样的服务？
                </div>
            </div>
            <div class="left">
                <div class="author-name">
                    Beau-zihan
                    <small class="chat-date">
                        08:45
                    </small>
                </div>
                <div class="chat-message active">
                    1.所有源码(未压缩、带注释版本)；
                    <br> 2.说明文档；
                    <br> 3.终身免费升级服务；
                    <br> 4.必要的技术支持；
                    <br> 5.付费二次开发服务；
                    <br> 6.授权许可；
                    <br> ……
                    <br>
                </div>
            </div>


        </div>
        <div class="form-chat">
            <div class="input-group input-group-sm">
                <input type="text" class="form-control"> <span class="input-group-btn"> <button
                    class="btn btn-primary" type="button">发送
            </button> </span>
            </div>
        </div>

    </div>--%>
    <%--<div id="small-chat">
        <span class="badge badge-warning pull-right">5</span>
        <a class="open-small-chat">
            <i class="fa fa-comments"></i>

        </a>
    </div>--%>
    <!--mini聊天窗口结束-->
</div>

<!-- 全局js -->
<script src="${ctx }/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx }/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx }/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx }/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${ctx }/static/js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="${ctx }/static/js/hplus.js?v=4.1.0"></script>
<!--右键菜单-->
<script type="text/javascript" src="${ctx }/static/js/jquery-smartMenu.js"></script>
<script type="text/javascript" src="${ctx }/static/js/contabs.js"></script>
<%-- <t:base type="tools"></t:base> --%>
<!-- 第三方插件 -->
<script src="${ctx }/static/js/plugins/pace/pace.min.js"></script>
<!-- Sweet alert -->
<script src="${ctx }/static/js/plugins/sweetalert/sweetalert.min.js"></script>
<!-- <script src="plug-in/jquery-plugs/storage/jquery.storageapi.min.js"></script> -->

<!-- 弹出TAB -->
<script type="text/javascript" src="${ctx }/static/js/hplus-tab.js"></script>
<!-- 在线聊天 -->
<%-- <%@include file="/context/layui.jsp"%> --%>
<script>
    function logout(){
        /*bootbox.confirm("<t:mutiLang langKey="common.exit.confirm"/>", function(result) {
            if(result)
                location.href="loginController.do?logout";
        });*/
        /*swal({
            title: "您确定要注销吗？",
            text: "注销后需要重新登录！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定",
            cancelButtonText: "取消",
            closeOnConfirm: false,
            closeOnCancel: true
        },
        function (isConfirm) {
            if (isConfirm) {
                //swal("注销成功！", "您已经成功注销。", "success");
                location.href="loginController.do?logout";
            } else {
                return false;
            }
        });*/
        layer.confirm('您确定要注销吗？', {
            btn: ['确定','取消'], //按钮
            shade: false //不显示遮罩
        }, function(){
            location.href="loginController.do?logout";
        }, function(){
            return;
        });
    }
    function clearLocalstorage(){
        var storage=$.localStorage;
        if(!storage)
            storage=$.cookieStorage;
        storage.removeAll();
        //bootbox.alert( "浏览器缓存清除成功!");
        layer.msg("浏览器缓存清除成功!");
    }

    $(document).ready(function(){
        //加载公告
/*         var url = "noticeController.do?getNoticeList";
        jQuery.ajax({
            url:url,
            type:"GET",
            dataType:"JSON",
            async: false,
            success:function(data){
                if(data.success){
                    var noticeList = data.attributes.noticeList;
                    var noticeCount = data.obj;
                    //加载公告条数
                    if(noticeCount>99){
                        $("#noticeCount").html("99+");
                    }else{
                        $("#noticeCount").html(noticeCount);
                    }
                    //加载公告提示
                    var noticeTip = "";
                    noticeTip += "<i class='icon-warning-sign'></i>";
                    noticeTip += noticeCount+" "+data.attributes.tip;
                    $("#noticeTip").html(noticeTip);

                    //加载公告条目
                    var noticeContent = "";
                    if(noticeList.length > 0){
                        for(var i=0;i<noticeList.length;i++){
                            noticeContent +="<li><a href='javascript:goNotice(&quot;"+noticeList[i].id+"&quot;)' ";
                            noticeContent +="style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>";
                            noticeContent +="<i class='btn btn-xs btn-primary fa fa-user'></i>";
                            noticeContent +="&nbsp;"+noticeList[i].noticeTitle + "</a></li></ul></li>";
                        }
                    }
                    //alert(noticeContent);
                    $("#noticeContent").html(noticeContent);

                    //加载公告底部文字
                    var noticeSeeAll = data.attributes.seeAll +"<i class='ace-icon fa fa-arrow-right'></i>";
                    $("#noticeFooter").html(noticeSeeAll);
                }
            }
        }); */


        //加载消息
/*         var url = "tSSmsController.do?getMessageList";
        $.ajax({
            url:url,
            type:"GET",
            dataType:"JSON",
            async: false,
            success:function(data){
                if(data.success){
                    var messageList = data.attributes.messageList;
                    var messageCount = data.obj;
                    //加载消息条数
                    if(messageCount>99){
                        $("#messageCount").html("99+");
                    }else{
                        $("#messageCount").html(messageCount);
                    }
                    //加载消息tip提示
                    var messageTip = "";
                    messageTip += "<i class='ace-icon fa fa-envelope-o'></i>";
                    messageTip += messageCount+" "+data.attributes.tip;
                    $("#messageTip").html(messageTip);

                    //加载消息条目（有限）
                    var messageContent = "";
                    if(messageList.length > 0){
                        for(var i=0;i<messageList.length;i++){
                            messageContent +="<li><a href='javascript:goMessage(&quot;"+messageList[i].id+"&quot;)' class='clearfix'>";
                            messageContent +="<img src='plug-in/ace/avatars/avatar3.png' class='msg-photo' alt='Alex’s Avatar' />";
                            messageContent +="<span class='msg-body'><span class='msg-title'>";
                            messageContent +="<span class='blue'>"+messageList[i].esSender+":</span>";
                            messageContent += messageList[i].esTitle + "</span>";
                            messageContent +="<span class='msg-time'><i class='ace-icon fa fa-clock-o'></i><span>"+messageList[i].esSendtimeTxt+"</span></span>";
                            messageContent +="</span></a><input id='"+messageList[i].id+"_title' type='hidden' value='"+messageList[i].esTitle+"'>";
                            messageContent +="<input id='"+messageList[i].id+"_status' type='hidden' value='"+messageList[i].esStatus+"'>";
                            messageContent +="<input id='"+messageList[i].id+"_content' type='hidden' value='"+messageList[i].esContent+"'></li>";
                        }
                    }
                    $("#messageContent").html(messageContent);

                    //加载消息底部文字
                    var messageSeeAll = data.attributes.seeAll +"<i class='ace-icon fa fa-arrow-right'></i>";
                    $("#messageFooter").html(messageSeeAll);
                }
            }
        }); */

    });

    function goAllNotice(){
        var addurl = "noticeController.do?noticeList";
        createdetailwindow("公告", addurl, 800, 400);
    }

    function goNotice(id){
        var addurl = "noticeController.do?goNotice&id="+id;
        createdetailwindow("通知公告详情", addurl, 750, 600);
    }

    function goAllMessage(){
        var addurl = "tSSmsController.do?getSysInfos";
        createdetailwindow("通知", addurl, 800, 400);
    }

    function goMessage(id){
        var title = $("#"+id+"_title").val();
        var content = $("#"+id+"_content").val();
        $("#msgId").val(id);
        $("#msgTitle").html(title);
        $("#msgContent").html(content);
        var status = $("#"+id+"_status").val();
        if(status==1){
            $("#msgStatus").html("未读");
        }else{
            $("#msgStatus").html("已读");
        }

        $('.theme-popover-mask').fadeIn(100);
        $('.theme-popover').slideDown(200);
    }

/*     function readMessage(){
        var msgId = $("#msgId").val();
        var url = "tSSmsController.do?readMessage";
        $.ajax({
            url:url,
            type:"GET",
            dataType:"JSON",
            data:{
                messageId:msgId
            },
            success:function(data){
                if(data.success){
                    $("#msgStatus").html("已读");
                    $("#"+msgId+"_status").val('2');
                }
            }
        });
    } */

    //个人信息弹出层回缩
    function frameBodyClick(){ 
		$(".count-info").attr("aria-expanded","false").parent().removeClass("open");
	}
    //新增iframe中绑定click事件回调父级函数
    function bindFrameClick(){
    	$(".J_iframe").contents().find("body").attr("onclick", "parent.frameBodyClick()"); 
    }

</script>
</body>
 <script type="text/javascript">

$(function () {
	$.ajax({
        type: "GET", 
        url: "<%=request.getContextPath()%>/menu/0", 
        dataType: 'json',
        contentType: "application/json", 
        success: function(data){
                 if(data.menu.level == 0 && data.menu.children.length > 0){
                 	var menuHtml = buildMenu(data.menu);
                 	$("#side-menu").append(menuHtml);
                 	$('#side-menu').metisMenu();
                 	//通过遍历给菜单项加上data-index属性
                    $(".J_menuItem").each(function (index) {
                        if (!$(this).attr('data-index')) {
                            $(this).attr('data-index', index);
                        }
                    });
                    $('.J_menuItem').on('click', menuItem);
                 }
        }, 
         error: function(data) {
        	 alert("error"); 
        } 
         });
    //计算元素集合的总宽度
    function calSumWidth(elements) {
        var width = 0;
        $(elements).each(function () {
            width += $(this).outerWidth(true);
        });
        return width;
    }
    //滚动到指定选项卡
    function scrollToTab(element) {
        var marginLeftVal = calSumWidth($(element).prevAll()), marginRightVal = calSumWidth($(element).nextAll());
        // 可视区域非tab宽度
        var tabOuterWidth = calSumWidth($(".content-tabs").children().not(".J_menuTabs"));
        //可视区域tab宽度
        var visibleWidth = $(".content-tabs").outerWidth(true) - tabOuterWidth;
        //实际滚动宽度
        var scrollVal = 0;
        if ($(".page-tabs-content").outerWidth() < visibleWidth) {
            scrollVal = 0;
        } else if (marginRightVal <= (visibleWidth - $(element).outerWidth(true) - $(element).next().outerWidth(true))) {
            if ((visibleWidth - $(element).next().outerWidth(true)) > marginRightVal) {
                scrollVal = marginLeftVal;
                var tabElement = element;
                while ((scrollVal - $(tabElement).outerWidth()) > ($(".page-tabs-content").outerWidth() - visibleWidth)) {
                    scrollVal -= $(tabElement).prev().outerWidth();
                    tabElement = $(tabElement).prev();
                }
            }
        } else if (marginLeftVal > (visibleWidth - $(element).outerWidth(true) - $(element).prev().outerWidth(true))) {
            scrollVal = marginLeftVal - $(element).prev().outerWidth(true);
        }
        $('.page-tabs-content').animate({
            marginLeft: 0 - scrollVal + 'px'
        }, "fast");
    }
    //查看左侧隐藏的选项卡
    function scrollTabLeft() {
        var marginLeftVal = Math.abs(parseInt($('.page-tabs-content').css('margin-left')));
        // 可视区域非tab宽度
        var tabOuterWidth = calSumWidth($(".content-tabs").children().not(".J_menuTabs"));
        //可视区域tab宽度
        var visibleWidth = $(".content-tabs").outerWidth(true) - tabOuterWidth;
        //实际滚动宽度
        var scrollVal = 0;
        if ($(".page-tabs-content").width() < visibleWidth) {
            return false;
        } else {
            var tabElement = $(".J_menuTab:first");
            var offsetVal = 0;
            while ((offsetVal + $(tabElement).outerWidth(true)) <= marginLeftVal) {//找到离当前tab最近的元素
                offsetVal += $(tabElement).outerWidth(true);
                tabElement = $(tabElement).next();
            }
            offsetVal = 0;
            if (calSumWidth($(tabElement).prevAll()) > visibleWidth) {
                while ((offsetVal + $(tabElement).outerWidth(true)) < (visibleWidth) && tabElement.length > 0) {
                    offsetVal += $(tabElement).outerWidth(true);
                    tabElement = $(tabElement).prev();
                }
                scrollVal = calSumWidth($(tabElement).prevAll());
            }
        }
        $('.page-tabs-content').animate({
            marginLeft: 0 - scrollVal + 'px'
        }, "fast");
    }
    //查看右侧隐藏的选项卡
    function scrollTabRight() {
        var marginLeftVal = Math.abs(parseInt($('.page-tabs-content').css('margin-left')));
        // 可视区域非tab宽度
        var tabOuterWidth = calSumWidth($(".content-tabs").children().not(".J_menuTabs"));
        //可视区域tab宽度
        var visibleWidth = $(".content-tabs").outerWidth(true) - tabOuterWidth;
        //实际滚动宽度
        var scrollVal = 0;
        if ($(".page-tabs-content").width() < visibleWidth) {
            return false;
        } else {
            var tabElement = $(".J_menuTab:first");
            var offsetVal = 0;
            while ((offsetVal + $(tabElement).outerWidth(true)) <= marginLeftVal) {//找到离当前tab最近的元素
                offsetVal += $(tabElement).outerWidth(true);
                tabElement = $(tabElement).next();
            }
            offsetVal = 0;
            while ((offsetVal + $(tabElement).outerWidth(true)) < (visibleWidth) && tabElement.length > 0) {
                offsetVal += $(tabElement).outerWidth(true);
                tabElement = $(tabElement).next();
            }
            scrollVal = calSumWidth($(tabElement).prevAll());
            if (scrollVal > 0) {
                $('.page-tabs-content').animate({
                    marginLeft: 0 - scrollVal + 'px'
                }, "fast");
            }
        }
    }

    //通过遍历给菜单项加上data-index属性
    /*$(".J_menuItem").each(function (index) {
        if (!$(this).attr('data-index')) {
            $(this).attr('data-index', index);
        }
    });*/

    function menuItem() {
        // 获取标识数据
        var dataUrl = $(this).attr('href'),
            dataIndex = $(this).data('index'),
            menuName = $.trim($(this).text()),
            flag = true;
        if (dataUrl == undefined || $.trim(dataUrl).length == 0)return false;

        // 选项卡菜单已存在
        $('.J_menuTab').each(function () {
            if ($(this).data('id') == dataUrl) {
                if (!$(this).hasClass('active')) {
                    $(this).addClass('active').siblings('.J_menuTab').removeClass('active');
                    scrollToTab(this);
                    // 显示tab对应的内容区
                    $('.J_mainContent .J_iframe').each(function () {
                        if ($(this).data('id') == dataUrl) {
                            $(this).show().siblings('.J_iframe').hide();
                            return false;
                        }
                    });
                }
                flag = false;
                return false;
            }
        });

        // 选项卡菜单不存在
        if (flag) {
            var str = '<a href="javascript:;" class="active J_menuTab" data-id="' + dataUrl + '">' + menuName + ' <i class="fa fa-times-circle"></i></a>';
            $('.J_menuTab').removeClass('active');

            // 添加选项卡对应的iframe
            var str1 = '<iframe class="J_iframe" name="iframe' + dataIndex + '" width="100%" height="100%" src="' + dataUrl + '" frameborder="0" data-id="' + dataUrl + '" seamless></iframe>';
            $('.J_mainContent').find('iframe.J_iframe').hide().parents('.J_mainContent').append(str1);

            //显示loading提示
//            var loading = layer.load();
//
//            $('.J_mainContent iframe:visible').load(function () {
//                //iframe加载完成后隐藏loading提示
//                layer.close(loading);
//            });
            // 添加选项卡
            $('.J_menuTabs .page-tabs-content').append(str);
            scrollToTab($('.J_menuTab.active'));
        }
        return false;
    }

    //$('.J_menuItem').on('click', menuItem);

    // 关闭选项卡菜单
    function closeTab() {
        var closeTabId = $(this).parents('.J_menuTab').data('id');
        var currentWidth = $(this).parents('.J_menuTab').width();

        // 当前元素处于活动状态
        if ($(this).parents('.J_menuTab').hasClass('active')) {

            // 当前元素后面有同辈元素，使后面的一个元素处于活动状态
            if ($(this).parents('.J_menuTab').next('.J_menuTab').size()) {

                var activeId = $(this).parents('.J_menuTab').next('.J_menuTab:eq(0)').data('id');
                $(this).parents('.J_menuTab').next('.J_menuTab:eq(0)').addClass('active');

                $('.J_mainContent .J_iframe').each(function () {
                    if ($(this).data('id') == activeId) {
                        $(this).show().siblings('.J_iframe').hide();
                        return false;
                    }
                });

                var marginLeftVal = parseInt($('.page-tabs-content').css('margin-left'));
                if (marginLeftVal < 0) {
                    $('.page-tabs-content').animate({
                        marginLeft: (marginLeftVal + currentWidth) + 'px'
                    }, "fast");
                }

                //  移除当前选项卡
                $(this).parents('.J_menuTab').remove();

                // 移除tab对应的内容区
                $('.J_mainContent .J_iframe').each(function () {
                    if ($(this).data('id') == closeTabId) {
                        $(this).remove();
                        return false;
                    }
                });
            }

            // 当前元素后面没有同辈元素，使当前元素的上一个元素处于活动状态
            if ($(this).parents('.J_menuTab').prev('.J_menuTab').size()) {
                var activeId = $(this).parents('.J_menuTab').prev('.J_menuTab:last').data('id');
                $(this).parents('.J_menuTab').prev('.J_menuTab:last').addClass('active');
                $('.J_mainContent .J_iframe').each(function () {
                    if ($(this).data('id') == activeId) {
                        $(this).show().siblings('.J_iframe').hide();
                        return false;
                    }
                });

                //  移除当前选项卡
                $(this).parents('.J_menuTab').remove();

                // 移除tab对应的内容区
                $('.J_mainContent .J_iframe').each(function () {
                    if ($(this).data('id') == closeTabId) {
                        $(this).remove();
                        return false;
                    }
                });
            }
        }
        // 当前元素不处于活动状态
        else {
            //  移除当前选项卡
            $(this).parents('.J_menuTab').remove();

            // 移除相应tab对应的内容区
            $('.J_mainContent .J_iframe').each(function () {
                if ($(this).data('id') == closeTabId) {
                    $(this).remove();
                    return false;
                }
            });
            scrollToTab($('.J_menuTab.active'));
        }
        return false;
    }

    $('.J_menuTabs').on('click', '.J_menuTab i', closeTab);

    //关闭其他选项卡
    function closeOtherTabs(){
        $('.page-tabs-content').children("[data-id]").not(":first").not(".active").each(function () {
            $('.J_iframe[data-id="' + $(this).data('id') + '"]').remove();
            $(this).remove();
        });
        $('.page-tabs-content').css("margin-left", "0");
    }
    $('.J_tabCloseOther').on('click', closeOtherTabs);

    //滚动到已激活的选项卡
    function showActiveTab(){
        scrollToTab($('.J_menuTab.active'));
    }
    $('.J_tabShowActive').on('click', showActiveTab);


    // 点击选项卡菜单
    function activeTab() {
        if (!$(this).hasClass('active')) {
            var currentId = $(this).data('id');
            // 显示tab对应的内容区
            $('.J_mainContent .J_iframe').each(function () {
                if ($(this).data('id') == currentId) {
                    $(this).show().siblings('.J_iframe').hide();
                    return false;
                }
            });
            $(this).addClass('active').siblings('.J_menuTab').removeClass('active');
            scrollToTab(this);
        }
    }

    $('.J_menuTabs').on('click', '.J_menuTab', activeTab);

    //刷新iframe
    function refreshTab() {
        var target = $('.J_iframe[data-id="' + $(this).data('id') + '"]');
        var url = target.attr('src');
//        //显示loading提示
//        var loading = layer.load();
//        target.attr('src', url).load(function () {
//            //关闭loading提示
//            layer.close(loading);
//        });
    }

    $('.J_menuTabs').on('dblclick', '.J_menuTab', refreshTab);

    // 左移按扭
    $('.J_tabLeft').on('click', scrollTabLeft);

    // 右移按扭
    $('.J_tabRight').on('click', scrollTabRight);

    // 关闭全部
    $('.J_tabCloseAll').on('click', function () {
        $('.page-tabs-content').children("[data-id]").not(":first").each(function () {
            $('.J_iframe[data-id="' + $(this).data('id') + '"]').remove();
            $(this).remove();
        });
        $('.page-tabs-content').children("[data-id]:first").each(function () {
            $('.J_iframe[data-id="' + $(this).data('id') + '"]').show();
            $(this).addClass("active");
        });
        $('.page-tabs-content').css("margin-left", "0");
    });

});
var menuHtml = '';
function buildMenu(menu){
	if(menu.level == 0 && menu.children.length > 0){//判断是根节点并且有一级菜单
		for(var i=0;i<menu.children.length;i++){
			buildMenu(menu.children[i]);
		}
		return menuHtml;
	}else if(menu.level == 1){//判断是一级菜单
		menuHtml += '<li><a href="#">'
			 +'<i class="fa fa-sitemap"></i><span class="nav-label">'+menu.name+'</span>'
			 +'<span class="fa arrow"></span></a>';
		if(menu.children.length > 0){//一级菜单有二级菜单
			menuHtml += '<ul class="nav nav-second-level collapse" style="height:0px;">';//为二级菜单提供容器
			for(var i = 0; i < menu.children.length; i++){
				buildMenu(menu.children[i]);//递归二级菜单
			}
			menuHtml += '</ul>';
		}
		menuHtml += '</li>';
	}else if(menu.level == 2){//判断是二级菜单
		menuHtml += '<li><a href="'+menu.href+'">'+menu.name+'<span class="fa arrow"></span></a>';
		if(menu.children.length > 0){
			menuHtml += '<ul class="nav nav-third-level">';//为三级菜单提供容器
			for(var i = 0; i < menu.children.length; i++){
				buildMenu(menu.children[i]);//递归三级级菜单
			}
			menuHtml += '</ul>';
		}
		menuHtml += '</li>';
	}else if(menu.level == 3){
		menuHtml += '<li><a class="J_menuItem" href="'+menu.href+'">'+menu.name+'</a></li>';
	}
}
</script>
</html>
