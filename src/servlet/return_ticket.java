package servlet;

import java.io.IOException;

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
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		String id = req.getParameter("id");
		String type = req.getParameter("type");
		TicketOrderModel model = new TicketOrderModel();
		TicketOrderVO vo = model.getTicketOrder(id);
		if (type.equals("apply")) {
			vo.applyReturnTicket();
		}else if (type.equals("agree")) {
			vo.agreeReturnTicket();
		}
		model.updateTicketOrder(vo);

	}
}
