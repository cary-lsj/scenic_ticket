package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.TicketOrderModel;
import vo.TicketOrderVO;


public class return_ticket extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 设置编码格式
		req.setCharacterEncoding("utf-8");
		// 获取session
		HttpSession session = req.getSession();
		// 获取id
		String id = req.getParameter("id");
		// 获取type
		String type = req.getParameter("type");
		// 实例化TicketOrderModel
		TicketOrderModel model = new TicketOrderModel();
		// 根据id获取TicketOrderVO
		TicketOrderVO vo = model.getTicketOrder(id);
		if (type.equals("apply")) {
			// 请求退票
			// 获取当前时间
			Date curDate = new Date();
			// 获取入场时间
			Date enterTime = vo.getDate();
			// 计算差值 单位毫秒
			long time = enterTime.getTime() - curDate.getTime();

			// 判断时间是否大于0
			if (time > 0) {
				vo.applyReturnTicket();
				model.updateTicketOrder(vo);
				resp.sendRedirect("/scenic_ticket/index/order_list.jsp");
			} else {
				resp.setContentType("text/html;charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("离入场不足24小时，无法退票");
				resp.setHeader("refresh", "2;/scenic_ticket/index/order_list.jsp");
			}
		}else if (type.equals("agree")) {
			// 同意退票
			vo.agreeReturnTicket();
			model.updateTicketOrder(vo);
			resp.sendRedirect("/scenic_ticket/admin/order_list.jsp");
		}


	}
}
