/**
 * LoginDao.java
 * com.xuetu.dao
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2016年2月21日 		Stone
 *
 * Copyright (c) 2016, TNT All Rights Reserved.
*/

package com.xuetu.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.xuetu.entity.StoreName;
import com.xuetu.utils.DBconnection;

/**
 * ClassName:LoginDao<br/>
 * Function: 登录页面dao层<br/>
 * Reason: TODO ADD REASON<br/>
 *
 * @author Stone
 * @version
 * @since Ver 1.1
 * @Date 2016年2月21日 上午12:03:58
 *
 * @see
 * 
 */
public class LoginDao {

	public StoreName getStoreName(String username) {
		ResultSet query = null;
		Connection conn = null;
		Statement statement = null;
		try {
			conn = DBconnection.getConnection();
			statement = conn.createStatement();
			String sql = "select * from storename where sto_user_name= " +"'"+ username +"';";
			query = statement.executeQuery(sql);
			StoreName storeName = null;
			if (query.next()) {
				storeName = new StoreName();
				//ID
				storeName.setStoID(query.getInt(1));
				//stoUserName
				storeName.setStoUserName(query.getString(2));
				//stoTel
				storeName.setStoTel(query.getString(3));
				//stoAddress
				storeName.setStoAddress(query.getString(4));
				//stoName
				storeName.setStoName(query.getString(5));
				//stoIntroduction
				storeName.setStoIntroduction(query.getString(6));
				//stoIma
				storeName.setStoIma(query.getString(7));
				//stoPwd
				storeName.setStoPwd(query.getString(8));
				
			}
			return storeName;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (conn != null && statement != null && query != null) {
					conn.close();
					statement.close();
					query.close();
				}
			} catch (SQLException e) {

				//
				e.printStackTrace();

			}
		}

	}

}
