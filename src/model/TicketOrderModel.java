package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.TicketOrderVO;

/*
 * TicketOrderModel类
 * 对ticket_order表操作的封装
 * */
public class TicketOrderModel extends ModelBase {

	/**
	 * 获得订单所有数据
	 */
	public List<TicketOrderVO> getAllTicketOrder() {
		// 组织sql语句 查询ticket_order订单表
		String sql = "select * from ticket_order";
		// 执行sql语句
		ResultSet res = conn.executeQuery(sql);

		// 实例化list订单列表 来存储TicketOrderVO订单数据包
		List<TicketOrderVO> list = new ArrayList<TicketOrderVO>();
		try {
			// 读取下一条数据 直到读取到最后一条
			while (res.next()) {
				// 构造TicketOrderVO订单数据包
				TicketOrderVO vo = new TicketOrderVO();
				// 将res数据添加到TicketOrderVO订单数据包中
				vo.update(res);
				// 将数据包添加到list订单列表中
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 返回list订单列表
		return list;
	}

	/**
	 * 根据订单id获得订单数据
	 */
	public TicketOrderVO getTicketOrder(String id) {
		// 组织sql语句 查询ticket_order订单表中 id为指定id的一条数据
		String sql = "select * from ticket_order where id='" + id + "'";
		// 执行sql语句
		ResultSet res = conn.executeQuery(sql);
		try {
			if (res.next()) {
				// 构造TicketOrderVO订单数据包
				TicketOrderVO vo = new TicketOrderVO();
				// 将res数据添加到TicketOrderVO订单数据包中
				vo.update(res);
				// 返回TicketOrderVO订单数据包
				return vo;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 失败时返回null空数据
		return null;
	}

	/**
	 * 根据 联系人身份证 获得订单数据
	 */
	public TicketOrderVO getTicketOrderbyIdCard(String id) {
		// 组织sql语句 查询ticket_order订单表中 id为指定id的一条数据
		String sql = "select * from ticket_order where user_id_card='" + id + "'";
		// 执行sql语句
		ResultSet res = conn.executeQuery(sql);
		try {
			if (res.next()) {
				// 构造TicketOrderVO订单数据包
				TicketOrderVO vo = new TicketOrderVO();
				// 将res数据添加到TicketOrderVO订单数据包中
				vo.update(res);
				// 返回TicketOrderVO订单数据包
				return vo;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 失败时返回null空数据
		return null;
	}

	/**
	 * 向ticket_order表中添加订单
	 */
	public int addTicketOrder(TicketOrderVO vo) {

		// 构造sql语句 执行插入数据命令
		String sql = "insert into ticket_order (user_name,user_id,enter_time,phone,children_num,adults_num,user_id_card,scenic_id) values('"
				+ vo.user_name + "','" + vo.user_id + "','" + vo.enter_time + "','" + vo.phone + "','" + vo.children_num
				+ "','" + vo.adults_num + "','" + vo.user_id_card + "','" + vo.scenic_id + "')";
		// 执行sql语句 用num接收返回值 插入数据的数量
		int num = conn.executeInsert(sql);
		// 返回num插入数据的数量
		return num;
	}
}
