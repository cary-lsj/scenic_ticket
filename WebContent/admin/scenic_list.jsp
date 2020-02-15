<%@page import="java.util.List"%>
<%@page import="vo.ScenicVO"%>
<%@page import="model.ScenicModel"%>
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
											ScenicModel model = new ScenicModel();
											List<ScenicVO> list = model.getAllScenic();

											for (int i = 0; i < list.size(); i++) {
												ScenicVO vo = (ScenicVO) list.get(i);
												String row = null;
												if (i % 2 == 0) {
													row = "even";
												} else {
													row = "odd";
												}
										%>
										<tr role="row" class="<%=row%>">
											<td class="sorting_1"><%=vo.scenic_name%></td>
											<td><%=vo.open_time%></td>
											<td><%=vo.price_adults%></td>
											<td><%=vo.price_children%></td>
											<td><%=vo.scenic_describe%></td>
											<td><%=vo.scenic_position%></td>
											<td><a style="text-decoration: none;"
												href="../del_message?id=<%=vo.id%>&class=scenic"> 删除 </a></td>
										</tr>
										<%
											}
											// 销毁ScenicModel对象
											model.destroy();
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