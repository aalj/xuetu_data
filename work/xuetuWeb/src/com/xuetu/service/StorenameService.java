/**
 * StorenameServlet.java
 * com.xuetu.service
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2016年2月20日 		Administrator
 *
 * Copyright (c) 2016, TNT All Rights Reserved.
*/

package com.xuetu.service;
/**
 * ClassName:StorenameServlet
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   Administrator
 * @version  
 * @since    Ver 1.1
 * @Date	 2016年2月20日		下午8:58:45
 *
 * @see 	 

 */

import com.xuetu.dao.StoreNameDao;
import com.xuetu.entity.StoreName;
public class StorenameService{
	private StoreNameDao storeNameDao = new StoreNameDao();
	
	public void registerStore(StoreName storeName){
		storeNameDao.addStoreName(storeName);
	}
	
	
	
	
	
	
}