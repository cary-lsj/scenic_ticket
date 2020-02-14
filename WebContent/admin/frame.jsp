<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="verify_login.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%--包含导航栏所用的css-start--%>
<link rel="stylesheet" type="text/css" href="/scenic_ticket/admin/asset/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/scenic_ticket/admin/asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="/scenic_ticket/admin/asset/css/style.css" >
<%--包含导航栏所用的css-end--%>
<link rel="stylesheet" href="/scenic_ticket/admin/css/page.css" />
<script type="text/javascript" src="/scenic_ticket/admin/js/jquery.min.js" ></script>

<title>景区网络售票后台管理</title>
</head>
<body>
	<div id="left">
		<div class="bigTitle">景区网络售票系统</div>

		<div id="left-menu">
			<div class="sub-left-menu scroll" style="width: 20%;">
				<ul class="nav nav-list">

					<li class="active ripple"><a class="tree-toggle nav-header"><span
							class="fa-home fa"></span>景区门票管理<span
							class="fa-angle-right fa right-arrow text-right"></span> </a>
						<ul class="nav nav-list tree">
						<li><a target="frame" href="/scenic_ticket/admin/scenic_add.jsp">添加景区门票</a></li>
							<li><a target="frame" href="/scenic_ticket/admin/scenic_list.jsp">景区门票列表</a></li>							
						</ul>
					</li>
					
					<li class="ripple"><a class="tree-toggle nav-header"> <span
							class="fa-diamond fa"></span>订单信息管理<span
							class="fa-angle-right fa right-arrow text-right"></span>
					</a>
						<ul class="nav nav-list tree">
							<li><a target="frame" href="/scenic_ticket/admin/order_list.jsp">订单信息列表</a></li>
						</ul>
					</li>
					<li class=" ripple"><a class="tree-toggle nav-header"><span
							class="fa fa-check-square-o"></span>用户信息管理<span
							class="fa-angle-right fa right-arrow text-right"></span> </a>
						<ul class="nav nav-list tree">
							<li><a target="frame" href="/scenic_ticket/admin/user_list.jsp">用户信息列表</a></li>
						</ul>
					</li>
					<li class=" ripple"><a class="tree-toggle nav-header"><span class="fa fa-calendar-o"></span></span>留言评论管理<span
							class="fa-angle-right fa right-arrow text-right"></span> </a>
						<ul class="nav nav-list tree">
							<li><a target="frame" href="/scenic_ticket/admin/feedback_list.jsp">查看留言列表</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>

	</div>
	
	<div id="right">
		<div id="right_top">
			<div class="leftTiyle" id="flTitle"></div>
			<div class="thisUser">
				当前用户：<%=session.getAttribute("admin_id") %>
				<div class="logout"><a href="/scenic_ticket/admin/logout.jsp">退出</a></div>
			</div>
			
		</div>
		<div id="right_bottom">
			<iframe name="frame" scrolling="auto" width="100%" height="100%" frameborder="0" src="/scenic_ticket/admin/welcome.jsp"></iframe>
		</div>
	</div>
		
	
<%--包含导航栏所用的js-start--%>
<script src="/scenic_ticket/admin/asset/js/jquery.min.js"></script> 
<script src="/scenic_ticket/admin/asset/js/bootstrap.min.js"></script> 
<script src="/scenic_ticket/admin/asset/js/plugins/jquery.nicescroll.js"></script> 
<script src="/scenic_ticket/admin/asset/js/main.js"></script> 
<%--包含导航栏所用的js-end--%>
</body>
</html>