/**
 * LoginService.java
 * com.xuetu.service
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2016年2月21日 		Stone
 *
 * Copyright (c) 2016, TNT All Rights Reserved.
*/

package com.xuetu.service;

import com.xuetu.dao.LoginDao;
import com.xuetu.entity.StoreName;

/**
 * ClassName:LoginService<br/>
 * Function: 登录页面的服务层<br/>
 * Reason: TODO ADD REASON<br/>
 *
 * @author Stone
 * @version
 * @since Ver 1.1
 * @Date 2016年2月21日 上午12:00:31
 *
 * @see
 * 
 */
public class LoginService {
	

	/**
	 * 
	 * verificationNamePwd:(通过用户名查询数据库得到对应 的数据对象)<br/>
	 *
	 * 
	 * @param @param
	 *            name
	 * @param @return
	 *            设定文件
	 * @return StoreName DOM对象
	 * @throws @since
	 *             CodingExample Ver 1.1
	 */
	private StoreName verificationNamePwd(String name) {
		LoginDao dao = new LoginDao();
		return dao.getStoreName(name);

	}


	/**
	 * 
	 * getStoreName:(通过查询数据库得到数据对像)<br/>
	
	 *
	 * @param  @param name
	 * @param  @param pwd
	 * @param  @return    设定文件
	 * @return StoreName    DOM对象
	 * @throws 
	 * @since  CodingExample　Ver 1.1
	 */
	public StoreName getStoreName(String name, String pwd) {
		LoginDao dao = new LoginDao();
		StoreName storeName = verificationNamePwd(name);
		if (pwd.equals(storeName.getStoPwd())) {
			return dao.getStoreName(name);
		}

		return null;

	}

}
