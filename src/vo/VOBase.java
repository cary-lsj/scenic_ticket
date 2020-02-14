package vo;

import java.sql.ResultSet;

public abstract class VOBase {
	public VOBase() {

	}

	/**
	 * 将ResultSet数据添加到VO数据包中
	 */
	public abstract void update(ResultSet res);
}
