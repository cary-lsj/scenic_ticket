package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javabean.oDate;
import model.MessageModel;
import vo.MessageVO;

public class deal_message extends HttpServlet {

	private static final long serialVersionUID = 1L;

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("default/message_board.jsp");
		//用户非法的操作，直接忽略即可
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		// 判断是否登录
		if (session.getAttribute("user_id") == null) {
			resp.sendRedirect("/scenic_ticket/index/login_reg.jsp");
			// 为什么要写绝对路径？因为用户从servlet中正常访问和用户直接访问页面时，路径是不一样的，所以
			// 写成绝对路径，防范错误发生
			return;
		}
		// 获取用户id
		String user_id = session.getAttribute("user_id").toString();
		// 设置编码格式为 utf-8
		req.setCharacterEncoding("utf-8");
		// 实例化oDate对象
		oDate o_date=new oDate();
		// 获取留言内容
		String content = req.getParameter("message").toString();
		// 获取当前时间
		String message_date = o_date.get_date();

		if (!content.equals("")) {

			// 实例化MessageModel对象
			MessageModel model = new MessageModel();
			// 实例化MessageVO对象
			MessageVO vo = new MessageVO();
			// 用户id
			vo.user_id = user_id;
			// 留言内容
			vo.content = content;
			// 留言时间
			vo.message_date = message_date;
			// 添加留言
			model.addmessage(vo);
			// 销毁MessageModel对象
			model.destroy();
		}
		resp.sendRedirect("default/message_board.jsp");
	}
}
