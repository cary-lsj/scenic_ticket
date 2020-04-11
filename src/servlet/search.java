package servlet;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ScenicModel;
import vo.ScenicVO;

public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 设置编码格式为utf-8
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		// 景区名称
		String scenic_name = req.getParameter("scenic_name");
		scenic_name = URLEncoder.encode(scenic_name,"utf-8");  
		resp.sendRedirect("/scenic_ticket/default/index.jsp?scenic_name="+scenic_name);
		
	}
}
