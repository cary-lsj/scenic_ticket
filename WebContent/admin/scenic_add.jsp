
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="verify_login.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="/scenic_ticket/admin/asset/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/scenic_ticket/admin/asset/css/plugins/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="/scenic_ticket/admin/asset/css/plugins/animate.min.css" />
<link rel="stylesheet" type="text/css"
	href="/scenic_ticket/admin/asset/css/style.css">
</head>
<body>
	<form method="post" action="../url_scenic_add" name="nameform" onSubmit="return isValid(this);">

		<div class="panel">
			<div class="panel-body">
				<div class="col-md-12">
					<h3 class="animated fadeInLeft">添加景区门票</h3>
					<p class="animated fadeInDown">
						景区门票管理<span class="fa-angle-right fa"></span>添加景区门票
					</p>
				</div>
			</div>
		</div>

		<div class="form-element">
			<div class="col-md-12 padding-0">
				<div class="col-md-12">
					<div class="panel form-element-padding">
						<div class="panel-heading">
							<h4>新景区</h4>
						</div>
						<div class="panel-body" style="padding-bottom: 30px;">
							<div class="col-md-12">

								<div class="form-group">

									<label class="col-sm-1 control-label text-right"
										style="width: 100px;">景区名称</label>
									<div class="col-sm-11" style="width: 800px;">
										<input name="scenic_name" type="text" class="form-control"
											placeholder="例：上海迪士尼乐园">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-1 control-label text-right"
										style="width: 100px;">开放时间</label>
									<div class="col-sm-3" style="width: 200px;">
										<input name="open_time" type="text" placeholder="例：8:00至22:00"
											class="form-control">
									</div>

									<label class="col-sm-1 control-label text-right"
										style="width: 100px;">成人票价格</label>
									<div class="col-sm-3" style="width: 200px;">
										<input name="adults_price" type="text" placeholder="例：500"
											class="form-control">
									</div>
									<label class="col-sm-1 control-label text-right"
										style="width: 100px;">儿童票价格</label>
									<div class="col-sm-3" style="width: 200px;">
										<input name="children_price" type="text" placeholder="例：300"
											class="form-control">
									</div>

								</div>

								<div class="form-group">
									<label class="col-sm-1 control-label text-right"
										style="width: 100px;">景区描述</label>
									<div class="col-sm-11" style="width: 800px;">
										<input name="scenic_describe" type="text" class="form-control"
											placeholder="例：一座神奇王国经典迪士尼乐园">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-1 control-label text-right"
										style="width: 100px;">景区位置</label>
									<div class="col-sm-11" style="width: 800px;">
										<input name="scenic_position" type="text" class="form-control"
											placeholder="例：上海市浦东新区申迪北路753号">
									</div>
								</div>

							</div>
						</div>
					</div>

					<div class="col-md-12 text-center" style="margin: 20px;">
						<input class="submit btn btn-danger" type="submit" value="提交">
					</div>


				</div>
			</div>
		</div>

	</form>
</body>
<script>
	function isValid() {
		if (nameform.adults_price.value == "") {
			window.alert("您必须输入成人票价格!");
			nameform.adults_price.focus();
			return false;
		}

		if (nameform.children_price.value == "") {
			window.alert("您必须完输入儿童票价格!");
			nameform.adults_price.focus();
			return false;
		}
	}
</script>
</html>