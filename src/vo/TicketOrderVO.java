package vo;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * TicketOrderVO类
 * 和ticket_order表中字段一一对应方便操作
 * */
public class TicketOrderVO extends VOBase {
	/**
	 * Scenic id
	 */
	public int id;
	/**
	 * 联系人名字
	 */
	public String user_name;
	/**
	 * 用户id
	 */
	public String user_id;
	/**
	 * 入场时间
	 */
	public String enter_time;
	/**
	 * 手机号
	 */
	public String phone;
	/**
	 * 购买儿童票数量
	 */
	public String children_num;
	/**
	 * 成人票数量
	 */
	public String adults_num;
	/**
	 * 联系人身份证
	 */
	public String user_id_card;
	/**
	 * 景区id
	 */
	public String scenic_id;
	/**
	 * 当前状态：0正常状态，1申请退票，2：已退票
	 */
	public String state;

	public boolean isNormal() {
		return state.equals("0");
	}

	public boolean isApplyReturnTicket() {
		return state.equals("1");
	}

	public boolean isReturnTicket() {
		return state.equals("2");
	}

	public String getState() {
		String res = "";
		switch (state) {
		case "0":
			res = "正常";
			break;
		case "1":
			res = "申请退票";
			break;
		case "2":
			res = "已退票";
			break;
		default:
			res = "正常";
			break;
		}
		return res;
	}

	public void applyReturnTicket() {
		state = "1";
	}

	public void agreeReturnTicket() {
		state = "2";
	}

	@Override
	public void update(ResultSet res) {
		try {
			// 根据表中数据依次读取数据
			id = res.getInt(1);
			user_name = res.getString(2);
			user_id = res.getString(3);
			Date time = res.getDate(4);
			enter_time = time.toString();
			phone = res.getString(5);
			children_num = res.getString(6);
			adults_num = res.getString(7);
			user_id_card = res.getString(8);
			scenic_id = res.getString(9);
			state = res.getString(10);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
