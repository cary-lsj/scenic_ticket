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



public class deal_order extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		if(session.getAttribute("user_id")!=null) {
			// 实例化 TicketOrderVO
			TicketOrderVO vo = new TicketOrderVO();
			// 获取各个参数
			vo.user_id = session.getAttribute("user_id").toString();
			vo.user_name = req.getParameter("user_name");
			vo.enter_time = req.getParameter("enter_time");
			vo.phone = req.getParameter("phone");
			vo.children_num = req.getParameter("children_num");
			vo.adults_num = req.getParameter("adults_num");
			vo.user_id_card = req.getParameter("user_id_card");
			vo.scenic_id = req.getParameter("scenic_id");
			
			// 判断参数是否为空
			if (vo.user_name != "" && vo.user_id_card != "" && vo.enter_time != "" && vo.phone != ""
					&& vo.adults_num != "" && vo.children_num != "" && vo.scenic_id != "") {

				// 实例化TicketOrderModel
				TicketOrderModel model = new TicketOrderModel();

				// 获取当前时间
				Date curDate = new Date();
				// 获取入场时间
				Date enterTime = vo.getDate();

				// 计算差值 单位毫秒
				long time = curDate.getTime() - enterTime.getTime();
				// 一天有多少毫秒
				long day = 24 * 60 * 60 * 1000;

				if (time > day) {
					// 过期的票 离入场已经超过24小时
					resp.setContentType("text/html;charset=utf-8");
					PrintWriter out = resp.getWriter();
					out.println("您所选日期的门票已经停售");
					resp.setHeader("refresh", "2;url=default/order.jsp");
				} else {
					int addnum = model.addTicketOrder(vo);
					if (addnum > 0) {
						resp.sendRedirect("/scenic_ticket/user_center?type=order_list");
					}
				}
			} else {
				resp.setContentType("text/html;charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("请填写完整的信息");
				resp.setHeader("refresh", "2;url=default/order.jsp");
			}
		}

	}
}
