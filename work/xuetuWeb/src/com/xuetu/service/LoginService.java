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
 * Reason:	 TODO ADD REASON<br/>
 *
 * @author   Stone
 * @version  
 * @since    Ver 1.1
 * @Date	 2016年2月21日		上午12:00:31
 *
 * @see 	 

 */
public class LoginService {
	/**
	 * 
	 * verificationNamePwd:(查数据库的到账号密码比较返回结果)<br/>
	
	 *
	 * @param  @param name
	 * @param  @param pwd
	 * @param  @return    设定文件
	 * @return boolean    DOM对象
	 * @throws 
	 * @since  CodingExample　Ver 1.1
	 */
	public boolean verificationNamePwd(String name ,String pwd){
		LoginDao dao = new LoginDao();
		StoreName storeName = dao.getStoreName(name);
		return pwd.equals(storeName.getStoPwd());
	}
	
	
	
	

}

