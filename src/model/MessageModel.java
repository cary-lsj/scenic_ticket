package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.MessageVO;

/*
 * messageModel类
 * 对message表操作的封装
 * */
public class MessageModel extends ModelBase {

	/**
	 * 获得留言所有数据
	 */
	public List<MessageVO> getAllmessage() {
		// 组织sql语句 查询message留言表
		String sql = "select * from message";
		// 执行sql语句
		ResultSet res = conn.executeQuery(sql);

		// 实例化list留言列表 来存储MessageVO留言数据包
		List<MessageVO> list = new ArrayList<MessageVO>();
		try {
			// 读取下一条数据 直到读取到最后一条
			while (res.next()) {
				// 构造MessageVO留言数据包
				MessageVO vo = new MessageVO();
				// 将res数据添加到MessageVO留言数据包中
				vo.update(res);
				// 将数据包添加到list留言列表中
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 返回list留言列表
		return list;
	}

	/**
	 * 根据留言id获得留言数据
	 */
	public MessageVO getmessage(String id) {
		// 组织sql语句 查询message留言表中 id为指定id的一条数据
		String sql = "select * from message where id='" + id + "'";
		// 执行sql语句
		ResultSet res = conn.executeQuery(sql);
		try {
			if (res.next()) {
				// 构造MessageVO留言数据包
				MessageVO vo = new MessageVO();
				// 将res数据添加到MessageVO留言数据包中
				vo.update(res);
				// 返回MessageVO留言数据包
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
	 * 向message表中添加留言
	 */
	public int addmessage(MessageVO vo) {

		// 构造sql语句 执行插入数据命令
		String sql = "insert into message (user_id,content,message_date) values('"
				+ vo.user_id + "','" + vo.content + "','" + vo.message_date + "')";
		// 执行sql语句 用num接收返回值 插入数据的数量
		int num = conn.executeInsert(sql);
		// 返回num插入数据的数量
		return num;
	}

	/**
	 * 删除message表中留言
	 */
	public int delmessage(String id) {

		// 构造sql语句 删除目标数据
		String sql = "delete from message where id='" + id + "'";

		// 执行sql语句 用num接收返回值 删除数据的数量
		int num = conn.executeDelete(sql);
		// 返回num删除数据的数量
		return num;
	}
}
