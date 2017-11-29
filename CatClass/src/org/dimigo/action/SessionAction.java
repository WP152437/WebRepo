/**
 * 
 */
package org.dimigo.action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <pre>
 * org.dimigo.action
 *   |_ SessionAction.java
 * 1. 개요 :
 * 2. 작성일 : 2017. 11. 3.
 * </pre>
 *
 * @author : jjjj
 * @version : 1.0
 */
public class SessionAction implements IAction{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getSession().getAttribute("user")==null) {
			response.sendRedirect("/jsp/login.jsp"); // 리퀘스트 디스패쳐랑 다르게 그냥 새로 여는 방식
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/sessionInfo.jsp");
			rd.forward(request, response); // 다른 jsp에서도 이 리퀘스트랑 리스폰스를 공유
		}
	}

}
