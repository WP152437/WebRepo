/**
 * 
 */
package org.dimigo.vo;

/**
 * <pre>
 * org.dimigo.vo
 *   |_ UserVO.java
 * 1. 개요 :
 * 2. 작성일 : 2017. 9. 25.
 * </pre>
 *
 * @author : jjjj
 * @version : 1.0
 */
public class CatVO {
	
	private String name;
	private String gender;
	private int year;
	private int month;
	
	public CatVO(String name,String gender,int year,int month) {
		this.name = name;
		this.gender=gender;
		this.year=year;
		this.month=month;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}
		
}
