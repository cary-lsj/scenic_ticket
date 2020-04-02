package javabean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//数据库操作类
public class db_conn {
	// 数据库连接
	public Connection conn = null;
	// 执行sql语句后返回的结果
	public ResultSet res = null;
	// Statement 对象来将 SQL 语句发送到数据库
	public Statement st = null;
	
	//数据库初始化连接
	public  db_conn() {
		// 连接数据库地址
		String URL = "jdbc:mysql://localhost:3306/ticket?serverTimezone=UTC";
		// 数据库用户名
		String USER = "root";
		// 数据库密码
		String PWD = "root";
		
		try{
			// 返回com.mysql.jdbc.Driver对象。
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e){
			System.out.println(e);
		}try{
			// 连接数据库
			conn = DriverManager.getConnection(URL,USER,PWD);
			// 创建一个 Statement 对象来将 SQL 语句发送到数据库
			st=conn.createStatement();
		}catch(SQLException e){
			System.out.println(e);
		}
	}
	
	//向数据库中添加数据
	public int executeInsert(String sql){
		int num=0;
		try{
			// 将 SQL 语句发送到数据库
			num=st.executeUpdate(sql);
		}
		catch(SQLException e){
			System.out.println("添加数据出错信息:"+e.getMessage());
		}
		return num;
	}
	
	//从数据库中查询数据
	public ResultSet executeQuery(String sql){
		res=null;
		try{
			// 将 SQL 语句发送到数据库
			res=st.executeQuery(sql);
		}
		catch(SQLException e){
			System.out.print("查询出错信息:"+e.getMessage());
		}
		return res;
	}
	
	//更新数据
	public int Update(String sql){
		int num=0;
		try{
			// 将 SQL 语句发送到数据库
			num=st.executeUpdate(sql);
		}catch(SQLException ex){
			System.out.print("执行修改有错误："+ex.getMessage());
		}
		return num;
	}
	
	//删除数据
	public int executeDelete(String sql){
		int num=0;
		try{
			// 将 SQL 语句发送到数据库
			num=st.executeUpdate(sql);
		}
		catch(SQLException e){
			System.out.print("执行删除有错误:"+e.getMessage());
		}
		return num;
	}
	
	//关闭数据库连接
	public void closeDB(){
		try{
			// 关闭Statement
			st.close();
			// 关闭数据库连接
			conn.close();
		}
		catch(Exception e){
			System.out.print("执行关闭Connection对象有错误:"+e.getMessage());
		}
	}
}
