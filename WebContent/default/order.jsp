<%@page import="javabean.db_conn"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//添加URL session ，作为用户登录后跳转回来的依据,登录servlet中已经写了判断程序，如果有url_cookie，就跳转到url_cookie，如果没有，就跳转到用户中心
	session.setAttribute("url", request.getRequestURI());
%>
<%!String scenic_id = "";//id
	String scenic_name = "";//景区名字
	String open_time = "";//开放时间
	String adults_price = "";//成人票价格
	String children_price = "";//儿童票价格
	String scenic_describe = "";//描述
	String scenic_position = "";//景区位置%>
<%
	scenic_id = request.getParameter("scenic_id");
	if (scenic_id == null) {
		scenic_id = "1";
	}
%>
<%
	db_conn conn = new db_conn();
	String sql = "select * from scenic where id='" + scenic_id + "'";
	ResultSet res = conn.executeQuery(sql);
	if (res.next()) {
		scenic_id = res.getString(1);//id
		scenic_name = res.getString(2);//景区名字
		open_time = res.getString(3);//开放时间
		adults_price = res.getString(4);//成人票价格
		children_price = res.getString(5);//儿童票价格
		scenic_describe = res.getString(6);//描述
		scenic_position = res.getString(7);//景区位置
	}
%>

<%@ include file="verify_login.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单</title>
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

	<!-- content start -->

	<form action="../add_order" method="post">
		<input type="hidden" name="scenic_id" value="<%=scenic_id%>">
		<div class="container bg-gray-eee box-shadow mar-bottom-30"
			style="padding-right: 0px; padding-left: 0px; position: relative; margin-top: 120px;">
			<div class="col-sm-7 container bg-white  pad-bottom-20"
				style="margin-top: 30px; margin-bottom: 30px;">
				<div style="overflow: hidden;">
					<h3 class="mar-bottom-20" style="display: block; float: left;">联系人</h3>
				</div>
				<div>
					<input name="user_name" type="text"
						class="form-control input-sm w300" style="display: inline-block;"
						placeholder="姓名，与入场所持证件中的姓名一致"> <input type="date"
						name="enter_time" />
				</div>
				<div class="mar-top-10">
					<select name="grade" class="form-control input-sm w150"
						style="display: inline-block;">
						<option value="身份证" selected="selected">身份证</option>
						<option value="学生证">学生证</option>
					</select> <input name="user_id_card" type="text"
						class="form-control input-sm w300" style="display: inline-block;"
						placeholder="身份证件号码">
				</div>

				<div class="mar-top-10">
					<select name="select"
						class="form-control input-sm w110 mar-right-10"
						style="display: inline-block;">
						<option value="国家" selected="selected">中国&nbsp;&nbsp;+86</option>
					</select> <input name="phone" type="text" class="form-control input-sm"
						style="display: inline-block; width: 337px;" placeholder="手机号码">
				</div>

				<div class="mar-top-10">
					成人票/人： <input name="ticket_num" type="number"
						class="form-control input-sm"
						style="display: inline-block; width: 150px;" placeholder="0">
					儿童票/人： <input name="children_num" type="number"
						class="form-control input-sm"
						style="display: inline-block; width: 150px;" placeholder="0">
				</div>

			</div>
			<div class="col-sm-5 bg-gray-eee">
				<div style="margin-left: -15px;">
					<h4 style="overflow: hidden; margin-left: 10px;">
						<span style="display: block; float: left;"></span> <span
							style="display: block; float: left; font-size: 36px; margin-left: 10px;"><%=scenic_name%></span>
						<span
							style="display: block; float: right; color: #999; font-size: 14px; margin-right: 5px;"></span>
					</h4>
				</div>
				<div style="overflow: hidden; margin-top: 20px;">
					<div class="flight-from" style="float: left;">
						<span class="time text-center">开放时间：<%=open_time%></span><br /> <span
							class="text-center">景区地址：<%=scenic_position%></span>
					</div>

				</div>
				<div>
					<div class="tuigaiqian" style="cursor: pointer; color: #337ab7;">退改签说明</div>
					<div class="instruction">
						<table class="table table-bordered" style="height: 150px;">
							<tr>
								<td>成人票/儿童票</td>
								<td>退票手续费</td>
								<td>改签</td>
							</tr>
							<tr>
								<td>离入场超过24小时</td>
								<td>收取5%手续费</td>
								<td>可以改签</td>
							</tr>
							<tr>
								<td>离入场不足24小时</td>
								<td>不能退票</td>
								<td>可以改签</td>
							</tr>
						</table>
					</div>
				</div>


			</div>

		</div>


		<div class="text-center mar-top-10" style="margin-bottom: 20px;">
			<input type="submit" value="提交订单" class="btn btn-danger mar-top-20">
		</div>
	</form>


	<!-- content end -->
</body>
</html>