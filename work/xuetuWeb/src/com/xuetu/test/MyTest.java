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

import com.mysql.jdbc.log.Log;
import com.xuetu.dao.LoginDao;
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
		LoginDao dao = new LoginDao();
		dao.getStoreName("name");
	}
	
	
	

}

