<%@page import="java.sql.ResultSet"%>
<%@page import="javabean.db_conn"%>
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
				<h3 class="animated fadeInLeft">景区门票列表</h3>
				<p class="animated fadeInDown">
					景区门票管理<span class="fa-angle-right fa"></span>景区门票列表
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
										<tr role="row">
											<th class="sorting_asc" style="width: 10%;">景区名称</th>
											<th class="sorting" style="width: 8%;">开放时间</th>
											<th class="sorting" style="width: 5%;">成人票价格</th>
											<th class="sorting" style="width: 5%;">儿童票价格</th>
											<th class="sorting" style="width: 15%;">景区描述</th>
											<th class="sorting" style="width: 15%;">景区位置</th>
											<th class="sorting" style="width: 2%;">操作</th>
										</tr>
									</thead>

									<tbody>

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
												String row = null;

												if (res.getRow() % 2 == 0) {
													row = "even";
												} else {
													row = "odd";
												}
										%>
										<tr role="row" class="<%=row%>">
											<td class="sorting_1"><%=scenic_name%></td>
											<td><%=open_time%></td>
											<td><%=adults_price%></td>
											<td><%=children_price%></td>
											<td><%=scenic_describe%></td>
											<td><%=scenic_position%></td>
											<td><a style="text-decoration: none;"
												href="../del_message?id=<%=scenic_id%>&class=scenic">
													删除 </a></td>
										</tr>
										<%
											}
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