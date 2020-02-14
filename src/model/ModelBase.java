package model;

import javabean.db_conn;

public abstract class ModelBase {

	protected db_conn conn;
	
	public void ModelBase() {
		conn = new db_conn();
	}
}
