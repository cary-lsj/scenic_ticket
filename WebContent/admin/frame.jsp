<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="verify_login.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%--包含导航栏所用的css-start--%>
<link rel="stylesheet" type="text/css"
	href="/scenic_ticket/admin/asset/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/scenic_ticket/admin/asset/css/plugins/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="/scenic_ticket/admin/asset/css/style.css">
<%--包含导航栏所用的css-end--%>
<link rel="stylesheet" href="/scenic_ticket/admin/css/page.css" />
<script type="text/javascript"
	src="/scenic_ticket/admin/js/jquery.min.js"></script>

<title>景区网络售票后台管理</title>
</head>
<body>
	<div id="left">
		<div class="bigTitle">景区网络售票系统</div>

		<div id="left-menu">
			<div class="sub-left-menu scroll" style="width: 20%;">
				<ul class="nav nav-list">

					<li id="scenic_management" class="ripple"><a class="tree-toggle nav-header"><span
							class="fa-home fa"></span>景区门票管理<span
							class="fa-angle-right fa right-arrow text-right"></span> </a>
						<ul id="scenic_tree" class="nav nav-list tree">
							<li ><a id="scenic_add" class="tree-a" href="/scenic_ticket/frame?type=scenic_add">添加景区门票</a></li>
							<li ><a id="scenic_list" class="tree-a" href="/scenic_ticket/frame?type=scenic_list">景区门票列表</a></li>
						</ul></li>

					<li id="order_management" class="ripple"><a class="tree-toggle nav-header"> <span
							class="fa-diamond fa"></span>订单信息管理<span
							class="fa-angle-right fa right-arrow text-right"></span>
					</a>
						<ul id="order_tree" class="nav nav-list tree">
							<li ><a id="order_list" class="tree-a" href="/scenic_ticket/frame?type=order_list">订单信息列表</a></li>
						</ul></li>
					<li id="user_management" class=" ripple"><a class="tree-toggle nav-header"><span
							class="fa fa-check-square-o"></span>用户信息管理<span
							class="fa-angle-right fa right-arrow text-right"></span> </a>
						<ul id="user_tree" class="nav nav-list tree">
							<li ><a id ="user_list" class="tree-a" href="/scenic_ticket/frame?type=user_list">用户信息列表</a></li>
						</ul></li>
					<li id="feedback_management" class=" ripple"><a class="tree-toggle nav-header"><span
							class="fa fa-calendar-o"></span></span>留言评论管理<span
							class="fa-angle-right fa right-arrow text-right"></span> </a>
						<ul id="feedback_tree" class="nav nav-list tree">
							<li ><a id="feedback_list" class="tree-a" href="/scenic_ticket/frame?type=feedback_list">查看留言列表</a></li>
						</ul></li>
				</ul>
			</div>
		</div>

	</div>

	<div id="right">
		<div id="right_top">
			<div class="leftTiyle" id="flTitle"></div>
			<div class="thisUser">
				当前用户：<%=session.getAttribute("admin_id")%>
				<div class="logout">
					<a href="/scenic_ticket/admin/logout.jsp">退出</a>
				</div>
			</div>

		</div>
		<div id="right_bottom">
			<iframe name="frame" id="iframe_content" scrolling="auto" width="100%" height="100%"
				frameborder="0" ></iframe>
		</div>
	</div>


	<%--包含导航栏所用的js-start--%>
	<script src="/scenic_ticket/admin/asset/js/jquery.min.js"></script>
	<script src="/scenic_ticket/admin/asset/js/bootstrap.min.js"></script>
	<script
		src="/scenic_ticket/admin/asset/js/plugins/jquery.nicescroll.js"></script>
	<script src="/scenic_ticket/admin/asset/js/main.js"></script>
	<%--包含导航栏所用的js-end--%>

	<script>
		function select(type) {
			//移除所有选中
			$("li").removeClass("active");

			switch (type) {
			case "scenic_add":
				//给选中项添加选中样式
				$("#scenic_management").addClass("active");
				$("#scenic_add").addClass("tree-a-activr");
				$("#scenic_tree").css('display','block')
				iframe_content.src = "/scenic_ticket/admin/scenic_add.jsp";
				break;
			case "scenic_list":
				$("#scenic_management").addClass("active");
				$("#scenic_list").addClass("tree-a-activr");
				$("#scenic_tree").css('display','block')
				iframe_content.src = "/scenic_ticket/admin/scenic_list.jsp";
				break;
			case "order_list":
				$("#order_management").addClass("active");
				$("#order_list").addClass("tree-a-activr");
				$("#order_tree").css('display','block')
				iframe_content.src = "/scenic_ticket/admin/order_list.jsp";
				break;
			case "user_list":
				$("#user_management").addClass("active");
				$("#user_list").addClass("tree-a-activr");
				$("#user_tree").css('display','block')
				iframe_content.src = "/scenic_ticket/admin/user_list.jsp";
				break;
			case "feedback_list":
				$("#feedback_management").addClass("active");
				$("#feedback_list").addClass("tree-a-activr");
				$("#feedback_tree").css('display','block')
				iframe_content.src = "/scenic_ticket/admin/feedback_list.jsp";
				break;
			default:
				iframe_content.src = "/scenic_ticket/admin/welcome.jsp";
				break;
			}
		};

		function getUrlParam(name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
			var r = window.location.search.substr(1).match(reg); //匹配目标参数
			if (r != null)
				return unescape(r[2]);
			return null; //返回参数值
		}

		var type = getUrlParam('type');
		select(type);
	</script>
</body>
</html>