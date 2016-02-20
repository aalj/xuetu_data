/**
 * Class.java
 * com.xuetu.entity
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2016年2月19日 		Stone
 *
 * Copyright (c) 2016, TNT All Rights Reserved.
*/

package com.xuetu.entity;

/**
 * ClassName:Class 课程表对应的实体类<br/>
 *
 * @author Stone
 * @version
 * @since Ver 1.1
 * @Date 2016年2月19日 下午10:34:39
 *
 * @see
 * 
 */
public class Class {
	private int clsId = 0;
	private String clasName = null;
	private int clsWeek = 0;
	private String clsFew = null;

	public Class() {

		//

	}

	private String clsRoom = null;

	public int getClsId() {
		return clsId;
	}

	public void setClsId(int clsId) {
		this.clsId = clsId;
	}

	public String getClasName() {
		return clasName;
	}

	public void setClasName(String clasName) {
		this.clasName = clasName;
	}

	public int getCls_Week() {
		return clsWeek;
	}

	public void setCls_Week(int cls_Week) {
		this.clsWeek = cls_Week;
	}

	public String getCls_Few() {
		return clsFew;
	}

	public void setCls_Few(String cls_Few) {
		this.clsFew = cls_Few;
	}

	public String getCls_Room() {
		return clsRoom;
	}

	public void setCls_Room(String cls_Room) {
		this.clsRoom = cls_Room;
	}

	public Class(int clsId, String clasName, int cls_Week, String cls_Few, String cls_Room) {
		super();
		this.clsId = clsId;
		this.clasName = clasName;
		this.clsWeek = cls_Week;
		this.clsFew = cls_Few;
		this.clsRoom = cls_Room;
	}

}
