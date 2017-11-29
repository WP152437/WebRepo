/**
 * 
 */
package org.dimigo.util;

/**
 * <pre>
 * org.dimigo.util
 *   |_ CommonUtil.java
 * 1. 개요 :
 * 2. 작성일 : 2017. 11. 1.
 * </pre>
 *
 * @author : jjjj
 * @version : 1.0
 */
public class CommonUtil {
	public static boolean isEmpty(String s) {
		return s == null || "".equals(s.trim());
	}

	public static void main(String[] args) {
		String uri = "/WebClass/jsp/login.do";
		
		String actionName = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf("."));//login
		
		System.out.println("actionName : " + actionName);
	}
}
