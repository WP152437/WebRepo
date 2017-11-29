/**
 * 
 */
package org.dimigo.action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dimigo.service.UserService;
import org.dimigo.util.CommonUtil;
import org.dimigo.vo.UserVO;

/**
 * <pre>
 * org.dimigo.action
 *   |_ LoginAction.java
 * 1. 개요 :
 * 2. 작성일 : 2017. 11. 1.
 * </pre>
 *
 * @author : jjjj
 * @version : 1.0
 */
public class LoginAction implements IAction {

	// 입력값 검증
	private void validate(String id, String pwd) throws Exception {
		if (CommonUtil.isEmpty(id))
			throw new Exception("아이디를 입력하세요");
		if (CommonUtil.isEmpty(pwd))
			throw new Exception("비밀번호를 입력하세요");
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			// 1. 입력값 추출
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			System.out.printf("id : %s pwd : %s\n", id, pwd);

			// 2. 입력값 검증
			validate(id, pwd);

			// 3. id, pwd 정합성 체크
			UserService service = new UserService();
			UserVO vo = new UserVO();
			vo.setId(id);
			vo.setPwd(pwd);
			UserVO result = service.login(vo);

			if (result != null) {
				// 세션에 사용자 정보 생성
				HttpSession session = request.getSession();
				session.setAttribute("user", result);

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/home.jsp");
				rd.forward(request, response);
			} else {
				throw new Exception("Invalid username or password");
			}
		} catch (Exception e) {
			e.printStackTrace();
//			request.setAttribute("msg", "error");
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/login.jsp");
			rd.forward(request, response);
		}
	}
}
