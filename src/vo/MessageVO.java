package vo;

import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * MessageVO类
 * 和Message表中字段一一对应方便操作
 * */
public class MessageVO extends VOBase {
	/**
	 * Message id
	 */
	public int id;
	/**
	 * 用户id
	 */
	public String user_id;
	/**
	 * 留言内容
	 */
	public String content;
	/**
	 * 留言时间
	 */
	public String message_date;


	public MessageVO() {
		super();
	}

	@Override
	public void update(ResultSet res) {
		try {
			// 根据表中数据依次读取数据
			id = res.getInt(1);
			user_id = res.getString(2);
			content = res.getString(3);
			message_date = res.getString(4);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
