package model;

import javabean.db_conn;

/*
 * ModelBase类
 * Model的基类，所有Model模块共同的操作放在这里
 * 例：连接数据库
 * */
public abstract class ModelBase {

	// db_conn数据库操作类
	protected db_conn conn;
	
	// 构造函数
	public ModelBase() {
		// 实例化 db_conn数据库操作类
		conn = new db_conn();
	}

	public void destroy() {
		// 关闭数据库连接
		conn.closeDB();
		// 将conn值为null空
		conn = null;
	}
}
