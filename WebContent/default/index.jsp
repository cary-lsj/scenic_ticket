<%@page import="javabean.db_conn"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//添加URL session ，作为用户登录后跳转回来的依据,登录servlet中已经写了判断程序，如果有url_cookie，就跳转到url_cookie，如果没有，就跳转到用户中心
	session.setAttribute("url", request.getRequestURI());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>景区网络售票系统</title>
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
	
	<!-- 搜索 -->
	<div class="index-wall white " style="">
		<div class="container"
			style="position: relative; margin-left: 650px; width: auto;">
			<form class="form-inline" action="../search" method="post">

				<div class="form-group">
					<input name="scenic_name" type="text" class="form-control"
						style="width: 400px;" id="" value="" placeholder="景区名称">
				</div>
				<button type="submit" class="btn btn-warning mar-left-10">搜索</button>
			</form>
		</div>
	</div>
	<!-- 搜索结束 -->

	<!-- 列表开始 -->
	<div class="container mar-bottom-30 ">
		<div class="hangbanlist">
			<div>
				<%
					db_conn conn = new db_conn();
					String sql = "select * from scenic";
					ResultSet res = conn.executeQuery(sql);
					while (res.next()) {
						String scenic_id = res.getString(1);//id
						String scenic_name = res.getString(2);//景区名字
						String open_time = res.getString(3);//开放时间
						String adults_price = res.getString(4);//成人票价格
						String children_price = res.getString(5);//儿童票价格
						String scenic_describe = res.getString(6);//描述
						String scenic_position = res.getString(7);//景区位置
				%>

				<!-- 表头 -->
				<ul class="list-inline bor-bottom-solid-1  ">
					<li class="w-percentage-25"><strong class="time"><%=scenic_name%></strong></li>
					<li class="text-right">开放时间：<%=open_time%></li>

				</ul>

				<span class="mar-left-20">景点地址：</span><span><%=scenic_position%></span>
				<h5 class="mar-left-10">“<%=scenic_describe%>”</h5>

				<!-- 表头结束 -->
				<!-- 表BODY -->
				<div class="collapse" id="collapseExample" style="display: block;">
					<div class="hangbanlist-body " style="background-color: #FEFCFC;">
						<ul class="list-inline">
							<li class="w-percentage-20"><strong class="blue-0093dd">成人票</strong></li>
							<li class="w-percentage-25">已售：50</li>
							<li class="w-percentage-20 ">价格：<strong
								class="rmb orange-f60 font16">￥<%=adults_price%></strong></li>
							<li class="pull-right "><button type="button"
									class="btn btn-danger btn-sm"
									onClick="window.location.href ='order.jsp?scenic_id=<%=scenic_id%>&type=m';">预订</button>
							</li>
						</ul>
						<ul class="list-inline">
							<li class="w-percentage-20"><strong class=" red">儿童票</strong></li>
							<li class="w-percentage-25">已售：20</li>
							<li class="w-percentage-20 ">价格：<strong
								class="rmb orange-f60 font16">￥<%=children_price%></strong></li>
							<li class="pull-right ">
								<button type="button" class="btn btn-danger btn-sm"
									onClick="window.location.href ='ticket_order.jsp?scenic_id=<%=scenic_id%>&type=c';">预订</button>
							</li>
						</ul>

					</div>
				</div>
				<!-- 表BODY 结束 -->

				<%
					}
				%>

			</div>


			<div class="clearfix"></div>
		</div>
	</div>

</body>
</html>