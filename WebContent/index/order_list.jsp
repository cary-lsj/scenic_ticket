<%@page import="model.ScenicModel"%>
<%@page import="model.TicketOrderModel"%>
<%@page import="java.util.List"%>
<%@page import="vo.TicketOrderVO"%>
<%@page import="vo.ScenicVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="verify_login.jsp"%><%--包含验证登陆代码--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../default/css/bootstrap.min.css" rel="stylesheet">
<link href="../default/css/common.css" rel="stylesheet">
<link href="../default/css/corptravel.css" rel="stylesheet">
</head>
<body>

	<div class="container bg-gray-eee box-shadow mar-bottom-30"
		style="width: 95%; padding-right: 0px; padding-left: 0px; position: relative; margin-top: 120px;">

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
				<th style="width: 5%;">状态</th>
				<th style="width: 5%;">操作</th>
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
				<td><%=vo.getState()%></td>
				<%
					if (vo.isNormal()) {
				%>
				<td><a style="text-decoration: none;"
					href="../url_return_ticket?id=<%=vo.id%>&type=apply"> 退票 </a></td>
				<%
					}else{
				%>
				<td>不可操作</td>
				<%
					}
				%>

			</tr>

			<%
				}
				model.destroy();
				scenicModel.destroy();
			%>

		</table>
	</div>

</body>
</html>