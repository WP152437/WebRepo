/**
 * 
 */
package org.dimigo.vo;

/**
 * <pre>
 *
 * org.dimigo.vo
 * 	|_ UserVO
 *
 * 1. 개요 : 
 * 2. 작성일 : 2017. 9. 25.
 *
 *</pre>
 *
 *@author	: 조아진
 *@version	: 1.0
 */
public class UserVO {
	private String id;
	private String name;
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	private String nickname;
	/**
	 * @return the nickname
	 */
	public String getNickname() {
		return nickname;
	}
	/**
	 * @param nickname the nickname to set
	 */
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
