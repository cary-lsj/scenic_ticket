<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<nav class="navbar navbar-default navbar-fixed-top bg-white">
		<nav class="navbar navbar-default"
			style="min-height: 30px; line-height: 30px; margin-bottom: 0px; border-radius: 0;">
			<div class="container font12">

				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<ul class="nav navbar-nav nav-top-small" style="margin-left: -15px;">
					<li class="dropdown">
						<%
							if (session.getAttribute("user_id") != null) {
						%> <a href="javacript:none" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> 您好，<%=session.getAttribute("user_id").toString()%>
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="logout.jsp">退出</a></li>
						</ul> <%
 	} else {
 %> <a href="../user_center" class="dropdown-toggle"
						role="button" aria-haspopup="true" aria-expanded="false"> 请登录！
					</a> <%
 	}
 %>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right nav-top-small">
					<li class="dropdown"><a href="message_board.jsp"
						class="dropdown-toggle"> 留言板 </a></li>

				</ul>

			</div>
		</nav>

		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<h1 class="red font36">景区网络售票系统</h1>

			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="/scenic_ticket/index"><i
							class="icon iconfont icon-nav-block font24">&#xe620;</i> 首页</a></li>
					<li><a href="/scenic_ticket/user_center"><i
							class="icon iconfont icon-nav-block font24">&#xe61c;</i> 用户中心</a></li>

				</ul>
			</div>

		</div>
	</nav>