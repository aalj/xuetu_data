/**
 * MyTest.java
 * com.xuetu.test
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2016年2月20日 		Stone
 *
 * Copyright (c) 2016, TNT All Rights Reserved.
*/

package com.xuetu.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.junit.Test;

import com.xuetu.utils.DBconnection;

/**
 * ClassName:MyTest<br/>
 * Function: TODO ADD FUNCTION<br/>
 * Reason:	 TODO ADD REASON<br/>
 *
 * @author   Stone
 * @version  
 * @since    Ver 1.1
 * @Date	 2016年2月20日		下午1:55:21
 *
 * @see 	 

 */
public class MyTest {
	
	@Test
	public void select() throws SQLException{
		Connection connection = DBconnection.getConnection();
		String sql = "desc student;";
		Statement statement = connection.createStatement();
		ResultSet query = statement.executeQuery(sql);
		while (query.next()) {
			String name = query.getString(1);
			System.out.println(name);
			
		}
	}
	
	
	

}

