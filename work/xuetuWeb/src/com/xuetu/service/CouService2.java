/**
 * CouService.java
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
 * ClassName:CouService
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   Administrator
 * @version  
 * @since    Ver 1.1
 * @Date	 2016年2月20日		下午8:52:00
 *
 * @see 	 

 */

import java.util.List;

import com.xuetu.dao.CouponDao2;
import com.xuetu.entity.Coupon;
public class CouService2{
	/**
	 * 
	 * getListCoupon:(通过店家ID查询该店家发布的所有优惠券)<br/>
	
	 *
	 * @param  @param StoreNmaeID
	 * @param  @return    设定文件
	 * @return List<Coupon>    DOM对象
	 * @throws 
	 * @since  CodingExample　Ver 1.1
	 */
	public List<Coupon> getListCoupon(int StoreNmaeID){
		CouponDao2 dao  = new CouponDao2() ;
		return dao.queryCouponList(StoreNmaeID);
		
		
		
	}
	
	
	public Coupon getCoupon(int id){
		CouponDao2 couponDao2 = new CouponDao2();
		return couponDao2.queryCoupon(id);
	}
	
	
	
	public boolean saveCoupon(Coupon coupon){
		CouponDao2 couponDao2 = new CouponDao2();
		
		
		return couponDao2.ChangeCoupon(coupon);
		
	}
	
	
}

