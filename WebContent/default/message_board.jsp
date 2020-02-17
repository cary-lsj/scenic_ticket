<%@page import="vo.MessageVO"%>
<%@page import="java.util.List"%>
<%@page import="model.MessageModel"%>
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
<title>留言板</title>
<link rel="stylesheet" href="css/semantic.css" type="text/css">
<link rel="stylesheet" href="css/zyComment.css" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">
<link href="css/corptravel.css" rel="stylesheet">
<link href="css/enterprise.css" rel="stylesheet">
<link href="css/iconfont.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style type="text/css" media="print, screen">
label {
	font-weight: bold;
}

a {
	font-family: Microsoft YaHei;
}

#articleComment {
	width: 600px;
	margin: 0 auto;
}
</style>
</head>
<body class="bg-body">

	<%@ include file="header.jsp"%>

	<!-- 留言板开始 -->
	<div id="articleComment" style="margin-top: 150px;">
		<div id="commentItems" class="ui threaded comments"
			style="margin-bottom: 20px;">
			<div class="text"
				style="font-size: 2rem; padding-bottom: 10px; border-bottom: 1px solid #DFDFDF;">
				欢迎您留下宝贵的意见</div>
			<%
				//实例化MessageModel对象
				MessageModel model = new MessageModel();
				//获取message留言表中所有留言数据list
				List<MessageVO> list = model.getAllmessage();
				//销毁MessageModel对象
				model.destroy();
				//所有留言数据list
				for (MessageVO vo : list) {
			%>

			<div class="comment">
				<a class="avatar"> <img src="images/foot.png">
				</a>
				<div class="content topStyle">
					<a class="author"> <%=vo.user_id%>
					</a>
					<div class="metadata">
						<span class="date"> <%=vo.message_date%>
						</span>
					</div>
					<div class="text"><%=vo.content%></div>
				</div>
			</div>

			<%
				}
			%>

		</div>
		<div id="commentFrom">
			<form id="replyBoxAri" action="../messageBoard" method="post"
				class="ui reply form">
				<div class="ui large form ">

					<div class="contentField field">
						<textarea id="commentContent" name="message"
							placeholder="留下你宝贵的建议"></textarea>
						<label class="commentContentLabel areadefault"
							for="commentContent"></label>
					</div>

					<input type="submit" value="提交评论">

				</div>
			</form>
		</div>
	</div>
	<!-- 留言板结束 -->

</body>
</html>