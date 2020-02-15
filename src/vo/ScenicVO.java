package vo;

import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * ScenicVO类
 * 和Scenic表中字段一一对应方便操作
 * */
public class ScenicVO extends VOBase {
	/**
	 * Scenic id
	 */
	public int id;
	/**
	 * 景区名字
	 */
	public String scenic_name;
	/**
	 * 景区开放时间
	 */
	public String open_time;
	/**
	 * 成人票价格
	 */
	public String price_adults;
	/**
	 * 儿童票价格
	 */
	public String price_children;
	/**
	 * 景区描述
	 */
	public String scenic_describe;
	/**
	 * 景区地理位置
	 */
	public String scenic_position;

	public ScenicVO() {
		super();
	}

	@Override
	public void update(ResultSet res) {
		try {
			// 根据表中数据依次读取数据
			id = res.getInt(1);
			scenic_name = res.getString(2);
			open_time = res.getString(3);
			price_adults = res.getString(4);
			price_children = res.getString(5);
			scenic_describe = res.getString(6);
			scenic_position = res.getString(7);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
