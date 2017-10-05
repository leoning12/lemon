<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="row border-bottom">
   <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
	   <div class="navbar-header">
	       <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
	   </div>
       <ul class="nav navbar-top-links navbar-right">
           <li>
               <span class="m-r-sm text-muted welcome-message">欢迎徐宁老大</span>
           </li>
           <li>
               <a href="<%=request.getContextPath()%>/logout">
                   <i class="fa fa-sign-out"></i>退出
               </a>
           </li>
       </ul>
   </nav>
</div>