package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javabean.db_conn;
import javabean.get_md5;
import model.TicketOrderModel;
import vo.TicketOrderVO;



public class edit_info extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		if(session.getAttribute("user_id")!=null) {
			// 获取各个参数
			String user_name = req.getParameter("newpassword");
			String user_id = session.getAttribute("user_id").toString();
			String oldpassword = req.getParameter("oldpassword");
			String newpassword = req.getParameter("newpassword");
			String repassword = req.getParameter("repassword");
			
			if(oldpassword==null||newpassword==null||repassword==null) {
				resp.setContentType("text/html;charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("请填写完整的信息");
				resp.setHeader("refresh", "2;/scenic_ticket/index/edit_info.jsp");
				return;
			}
			
			db_conn conn = new db_conn();//创建数据库连接对象
			get_md5 MD5 = new get_md5();
			oldpassword = MD5.getMD5(oldpassword);
			oldpassword = MD5.getMD5(oldpassword);
			newpassword = MD5.getMD5(newpassword);
			newpassword = MD5.getMD5(newpassword);
			
		
			String sql = "select * from common_user where user_name = '"+user_id+"'";
			ResultSet res = conn.executeQuery(sql);
			try {
				
				if(res.next()) {
					String user_pwd = res.getString(2);
					
					if(oldpassword.equals(user_pwd)) {
						
						String updateSql = "update common_user set " + "user_pwd='" + newpassword + "' where user_name='" + user_id + "'";
						
						int num = conn.executeInsert(updateSql);
						session.setAttribute("user_id", null);
						resp.setContentType("text/html;charset=utf-8");
						PrintWriter out = resp.getWriter();
						out.println("<script language='javascript'>top.location.href='/scenic_ticket/index/login_reg.jsp';</script>");
						
					}else {
						try {
							//System.out.println("用户密码错误");
							resp.setContentType("text/html;charset=utf-8");
							PrintWriter out = resp.getWriter();
							out.println("账号或密码错误，请重新登录");
							resp.setHeader("refresh", "2;/scenic_ticket/index/edit_info.jsp");
						}catch (IOException e) {
							System.out.println("出错信息如下："+e);
						}
						
					}				
				}else {
					
						resp.setContentType("text/html;charset=utf-8");
						PrintWriter out = resp.getWriter();
						out.println("账号或密码错误，请重新登录");
						resp.setHeader("refresh", "2;/scenic_ticket/index/edit_info.jsp");
				}
			}
			catch (SQLException e) {
				System.out.println("出错信息如下："+e);
			}
			conn.closeDB();
		}

	}
}
