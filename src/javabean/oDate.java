package javabean;

import java.text.SimpleDateFormat;
import java.util.Date;

public class oDate {
	public String get_date() {
		Date date = new Date(); // this object contains the current date value

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String res = formatter.format(date);
		return res;
	}
	 
}
