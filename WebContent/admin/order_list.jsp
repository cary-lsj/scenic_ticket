
<%@page import="model.ScenicModel"%>
<%@page import="model.TicketOrderModel"%>
<%@page import="java.util.List"%>
<%@page import="vo.TicketOrderVO"%>
<%@page import="vo.ScenicVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="verify_login.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="asset/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/animate.min.css" />
<link href="asset/css/style.css" rel="stylesheet">
</head>
<body>

	<div class="panel">
		<div class="panel-body">
			<div class="col-md-12">
				<h3 class="animated fadeInLeft">订单列表</h3>
				<p class="animated fadeInDown">
					订单管理<span class="fa-angle-right fa"></span>订单列表
				</p>
			</div>
		</div>
	</div>


	<div class="col-md-12 padding-0 form-element">

		<div class="panel">
			<div class="panel-heading">
				<h3>列表内容</h3>
			</div>

			<div class="panel-body">
				<div class="responsive-table">
					<div id="datatables-example_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap no-footer">
						<div class="row">
							<div class="col-sm-12">
								<table
									class="table table-striped table-bordered dataTable no-footer"
									width="100%" cellspacing="0" style="width: 100%;">
									<thead>
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
											List<TicketOrderVO> list = model.getAllTicketOrder();
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
												if (vo.isApplyReturnTicket()) {
											%>
											<td><a style="text-decoration: none;"
												href="../url_return_ticket?id=<%=vo.id%>&type=agree"> 同意 </a></td>
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
									
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>