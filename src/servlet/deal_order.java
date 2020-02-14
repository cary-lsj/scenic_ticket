package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javabean.db_conn;

public class deal_order extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		if(session.getAttribute("user_id")!=null) {
			String user_id=session.getAttribute("user_id").toString();
			String user_name=req.getParameter("user_name");
			String enter_time=req.getParameter("enter_time");
			String phone=req.getParameter("phone");
			String children_num=req.getParameter("children_num");
			String ticket_num=req.getParameter("ticket_num");
			String user_id_card=req.getParameter("user_id_card");
			String scenic_id =req.getParameter("scenic_id");
			
			if(user_name!=""&&user_id_card!=""&&enter_time!=""&&phone!=""&&ticket_num!=""&&children_num!=""&&scenic_id!="") {
				db_conn conn=new db_conn();
				String sql="insert into scenic_order (user_id,user_name,user_id_card,enter_time,phone,ticket_num,children_num,scenic_id) "+
						  					  "values('"+user_id+"','"+user_name+"','"+user_id_card+"','"+enter_time+"','"+phone+"','"+ticket_num+"','"+children_num+"','"+scenic_id+"')";
				Integer res=conn.executeInsert(sql);
				System.out.println(res);
				if(res.equals(1)) {
					resp.sendRedirect("default/order_list.jsp");
				}else {
					resp.sendRedirect("default/order.jsp");
				}
				
			}else {
				resp.sendRedirect("default/order.jsp");
			}
			
		}else {
			resp.sendRedirect("default/order.jsp");
		}	
		
	}
}
