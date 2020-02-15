package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ScenicModel;
import vo.ScenicVO;

public class scenic_add extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 设置编码格式为utf-8
		req.setCharacterEncoding("utf-8");
		// 实例化 ScenicVO
		ScenicVO vo = new ScenicVO();
		// 景区名称
		vo.scenic_name = req.getParameter("scenic_name");
		// 开放时间
		vo.open_time = req.getParameter("open_time");
		// 成人票价格
		vo.price_adults = req.getParameter("adults_price");
		// 儿童票价格
		vo.price_children = req.getParameter("children_price");
		// 景区描述
		vo.scenic_describe = req.getParameter("scenic_describe");
		// 景区位置
		vo.scenic_position = req.getParameter("scenic_position");

		// 实例化 ScenicModel
		ScenicModel model = new ScenicModel();
		// 向scenic表中添加景区
		model.addScenic(vo);
		// 销毁ScenicModel对象
		model.destroy();
		//跳转到景区列表界面
		resp.sendRedirect("admin/scenic_list.jsp");

	}
}
