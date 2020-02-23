
<%@page import="vo.ScenicVO"%>
<%@page import="model.ScenicModel"%>
<%@page import="java.util.List"%>
<%@page import="vo.TicketOrderVO"%>
<%@page import="model.TicketOrderModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//添加URL session ，作为用户登录后跳转回来的依据,登录servlet中已经写了判断程序，如果有url_cookie，就跳转到url_cookie，如果没有，就跳转到用户中心
	session.setAttribute("url", request.getRequestURI());
%>
<%@ include file="verify_login.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单列表</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">
<link href="css/corptravel.css" rel="stylesheet">
<link href="css/enterprise.css" rel="stylesheet">
<link href="css/iconfont.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body class="bg-body">

	<%@ include file="header.jsp"%>

	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class=" " href="index.jsp"><img src="images/logo.png"
				width="210" height="70" alt="系统LOGO" class="pull-left mar-right-30"
				style="margin-left: -15px;"></a>

		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="index.jsp"><i
						class="icon iconfont icon-nav-block font24">&#xe620;</i>首页</a></li>
				<li><a href="/scenic_ticket/user_center"><i
						class="icon iconfont icon-nav-block font24">&#xe61c;</i> 用户中心</a></li>

			</ul>
		</div>

	</div>
	</nav>

	<%@ include file="header.jsp"%>

	<!-- list start -->
	<div class="container bg-gray-eee box-shadow mar-bottom-30"
		style="padding-right: 0px; padding-left: 0px; position: relative; margin-top: 120px;">
		<table border="0" cellspacing="0" cellpadding="0"
			class="table table-hover table-striped font12 table-bordered v-align-top">
			<tr>
				<th style="width: 10%;">联系人</th>
				<th style="width: 10%;">联系电话</th>
				<th style="width: 10%;">联系人身份证</th>
				<th style="width: 10%;">入场时间</th>
				<th style="width: 10%;">成人票数量</th>
				<th style="width: 10%;">儿童票数量</th>
				<th style="width: 10%;">景区名称</th>
				<th style="width: 10%;">景区位置</th>
				<th style="width: 10%;">景区开放时间</th>

			</tr>

			<%
				TicketOrderModel model = new TicketOrderModel();
				ScenicModel scenicModel = new ScenicModel();
				String user_id = session.getAttribute("user_id").toString();
				List<TicketOrderVO> list = model.getAllTicketOrderByUserid(user_id);
				for (TicketOrderVO vo : list) {

					ScenicVO scenicVo = scenicModel.getScenic(vo.scenic_id);
			%>

			<tr>
				<td><%=vo.user_name%></td>
				<td><%=vo.phone%></td>
				<td><%=vo.user_id_card%></td>
				<td><%=vo.enter_time%></td>
				<td><%=vo.adults_num%></td>
				<td><%=vo.children_num%></td>
				<td><%=scenicVo.scenic_name%></td>
				<td><%=scenicVo.scenic_position%></td>
				<td><%=scenicVo.open_time%></td>

			</tr>

			<%
				}
				model.destroy();
				scenicModel.destroy();
			%>

		</table>
	</div>

	<!-- list end -->
</body>
</html>