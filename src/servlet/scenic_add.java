package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javabean.db_conn;

public class scenic_add extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 开景区名称始获取各种参数
		req.setCharacterEncoding("utf-8");
		// 景区名称
		String scenic_name = req.getParameter("scenic_name");
		// 开放时间
		String open_time = req.getParameter("open_time");
		// 成人票价格
		String adults_price_str = req.getParameter("adults_price");
		Integer adults_price = Integer.parseInt(adults_price_str);
		// 儿童票价格
		String children_price_str = req.getParameter("children_price");
		Integer children_price = Integer.parseInt(children_price_str);
		// 景区描述
		String scenic_describe = req.getParameter("scenic_describe");
		// 景区位置
		String scenic_position = req.getParameter("scenic_position");
		// 参数获取结束

		// 创建数据库连接
		db_conn conn = new db_conn();
//构造sql语句  执行插入数据命令
		String sql = "insert into scenic (scenic_name,open_time,price,price_children,scenic_describe,position) values('"
				+ scenic_name + "','" + open_time + "'," + adults_price + "," + children_price + ",'" + scenic_describe
				+ "','" + scenic_position + "')";
		// 执行sql语句
		conn.executeInsert(sql);
		//跳转到景区列表界面
		resp.sendRedirect("admin/scenic_list.jsp");

	}
}
