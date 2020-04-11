
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="verify_login.jsp" %><%--包含验证登陆的代码--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/scenic_ticket/index/css/core.css">
<link type="text/css" rel="stylesheet" href="/scenic_ticket/index/css/home.css">
<link rel="stylesheet" type="text/css" href="css/normalize.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/sign-up-login.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/inputEffect.css" />
<link rel="stylesheet" type="text/css" href="css/tooltips.css" />
<link rel="stylesheet" type="text/css" href="css/spop.min.css" />

<script src="js/jquery.min.js"></script>
<script src="js/jquery.pure.tooltips.js"></script>
<script src="js/spop.min.js"></script>
<script>
function edit(){//登录
	var oldpassword = $("#oldpassword").val(),
	newpassword = $("#newpassword").val(),
	repassword = $("#repassword").val();
	var flag=false;
//判断用户名密码是否为空
if(oldpassword == ""){
	$.pt({
		target: $("#oldpassword"),
		position: 'r',
		align: 't',
		width: 'auto',
		height: 'auto',
		content:"用户名不能为空"
	});
	flag = true;
}
if(newpassword == ""){
	$.pt({
		target: $("#newpassword"),
		position: 'r',
		align: 't',
		width: 'auto',
		height: 'auto',
		content:"密码不能为空"
	});
	flag = true;
}else{
	if(oldpassword == repassword){
		$.pt({
    		target: $("#newpassword"),
    		position: 'r',
    		align: 't',
    		width: 'auto',
    		height: 'auto',
    		content:"新密码不能和旧密码一样"
    	});
		flag = true;
	}
	
	if(newpassword != repassword){
		$.pt({
    		target: $("#repassword"),
    		position: 'r',
    		align: 't',
    		width: 'auto',
    		height: 'auto',
    		content:"两次输入的密码不一致"
    	});
		flag = true;
	}
}


if(flag){
	return false;
}else{//注册
	return true;
}
}
</script>

</head>
<body>

	<div class="ydc-content-slide ydc-body">
		<div class="ydc-flex">
			<div class="ydc-column ydc-column-8">
				<div class="ydc-release-content">
					<div class="ydc-tabPanel ydc-tabPanel-release">
						<div class="ydc-release-tab-head">
							<ul>
								<li class="hit">帐号设置</li>
							</ul>
						</div>
						<div class="ydc-panes">
							<form action="../edit_info" onSubmit="return edit(this);" method="post">
								<div class="ydc-reg-form-class ydc-reg-form-reg"
									style="margin-top: 40px;">
									<div class="ydc-reg-form-group clearfix">
										<label>帐号:</label>
										<div class="ydc-reg-form-input"><%=session.getAttribute("user_id") %></div>
									</div>

									<div class="ydc-reg-form-group clearfix">
										<label>旧密码:</label>
										<div class="ydc-reg-form-input">
											<input type="password" id="oldpassword" name="oldpassword"
												class="ydc-form-control" autocomplete="off"
												placeholder="请输入旧密码">
										</div>
									</div>
									<div class="ydc-reg-form-group clearfix">
										<label>新密码:</label>
										<div class="ydc-reg-form-input">
											<input type="password" id="newpassword" name="newpassword"
												class="ydc-form-control" autocomplete="off"
												placeholder="请输入新密码">
										</div>
									</div>
									<div class="ydc-reg-form-group clearfix">
										<label>确认密码:</label>
										<div class="ydc-reg-form-input">
											<input type="password" id="repassword" name="repassword"
												class="ydc-form-control" autocomplete="off"
												placeholder="请输入新密码">
										</div>
									</div>


								</div>
								<div class="ydc-reg-form-group clearfix"
									style="margin-top: 40px;">
									<div class="ydc-reg-form-button" style="margin-left: 255px;">
										<input type="submit" value="修改" class="btn fl" href="/scenic_ticket/index/edit_info.jsp">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>