/**
 * 
 */
package org.dimigo.action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * <pre>
 * org.dimigo.action
 *   |_ LogoutAction.java
 * 1. 개요 :
 * 2. 작성일 : 2017. 11. 3.
 * </pre>
 *
 * @author : jjjj
 * @version : 1.0
 */
public class LogoutAction implements IAction {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate(); // 세션 무효화
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/home.jsp");
		rd.forward(request, response);
	}

}
