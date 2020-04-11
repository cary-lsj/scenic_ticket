package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.ScenicVO;

/*
 * ScenicModel类
 * 对Scenic表操作的封装
 * */
public class ScenicModel extends ModelBase {

	/**
	 * 获得景区所有数据
	 */
	public List<ScenicVO> getAllScenic() {
		// 组织sql语句 查询scenic景区表
		String sql = "select * from scenic";
		// 执行sql语句
		ResultSet res = conn.executeQuery(sql);

		// 实例化list景区列表 来存储ScenicVO景区数据包
		List<ScenicVO> list = new ArrayList<ScenicVO>();
		try {
			// 读取下一条数据 直到读取到最后一条
			while (res.next()) {
				// 构造ScenicVO景区数据包
				ScenicVO vo = new ScenicVO();
				// 将res数据添加到ScenicVO景区数据包中
				vo.update(res);
				// 将数据包添加到list景区列表中
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 返回list景区列表
		return list;
	}

	/**
	 * 根据景区id获得景区数据
	 */
	public ScenicVO getScenic(String id) {
		// 组织sql语句 查询scenic景区表中 id为指定id的一条数据
		String sql = "select * from scenic where id='" + id + "'";
		// 执行sql语句
		ResultSet res = conn.executeQuery(sql);
		try {
			if (res.next()) {
				// 构造ScenicVO景区数据包
				ScenicVO vo = new ScenicVO();
				// 将res数据添加到ScenicVO景区数据包中
				vo.update(res);
				// 返回ScenicVO景区数据包
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
	 * 根据景区名词模糊查找景区数据
	 */
	public List<ScenicVO> getScenicByName(String name) {
		// 组织sql语句 查询scenic景区表中 根据景区名词模糊查找景区数据
		String sql = "select * from scenic where scenic_name like '%" + name + "%'";
		// 执行sql语句
		ResultSet res = conn.executeQuery(sql);
		// 实例化list景区列表 来存储ScenicVO景区数据包
		List<ScenicVO> list = new ArrayList<ScenicVO>();
		try {
			while (res.next()) {
				// 构造ScenicVO景区数据包
				ScenicVO vo = new ScenicVO();
				// 将res数据添加到ScenicVO景区数据包中
				vo.update(res);
				// 将数据包添加到list景区列表中
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 失败时返回null空数据
		return list;
	}

	/**
	 * 向scenic表中添加景区
	 */
	public int addScenic(ScenicVO vo) {

		// 构造sql语句 执行插入数据命令
		String sql = "insert into scenic (scenic_name,open_time,price_adults,price_children,scenic_describe,scenic_position) values('"
				+ vo.scenic_name + "','" + vo.open_time + "'," + vo.price_adults + "," + vo.price_children + ",'" + vo.scenic_describe
				+ "','" + vo.scenic_position + "')";
		// 执行sql语句 用num接收返回值 插入数据的数量
		int num = conn.executeInsert(sql);
		// 返回num插入数据的数量
		return num;
	}

	/**
	 * 删除scenic表中景区
	 */
	public int delScenic(String id) {

		// 构造sql语句 删除目标数据
		String sql = "delete from scenic where id='" + id + "'";

		// 执行sql语句 用num接收返回值 删除数据的数量
		int num = conn.executeDelete(sql);
		// 返回num删除数据的数量
		return num;
	}
}
