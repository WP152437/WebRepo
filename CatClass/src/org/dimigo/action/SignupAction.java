/**
 * 
 */
package org.dimigo.action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dimigo.service.UserService;
import org.dimigo.util.CommonUtil;
import org.dimigo.vo.UserVO;

/**
 * <pre>
 * org.dimigo.action
 *   |_ SignupAction.java
 * 1. 개요 :
 * 2. 작성일 : 2017. 11. 3.
 * </pre>
 *
 * @author : jjjj
 * @version : 1.0
 */
public class SignupAction implements IAction{

	private void validate(UserVO vo) throws Exception{
		if(CommonUtil.isEmpty(vo.getId())) throw new Exception("아이디를 입력하세요");
		if(CommonUtil.isEmpty(vo.getPwd())) throw new Exception("비밀번호를 입력하세요");
		if(CommonUtil.isEmpty(vo.getName())) throw new Exception("이름을 입력하세요");
		if(CommonUtil.isEmpty(vo.getNickname())) throw new Exception("별명을 입력하세요");
	}
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html);charset=utf-8");
			// 추출
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String nickname = request.getParameter("nickname");
			System.out.printf("id : %s, pwd : %s, name : %s, nickname : %s\n",id,pwd,name,nickname);
			
			UserVO user = new UserVO(id,name,nickname);
			user.setPwd(pwd);
			// 검증
			validate(user);
			// 서비스 호출
			UserService service = new UserService();
			service.signup(user);
			
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/login.jsp");
			rd.forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/signup.jsp");
			rd.forward(request, response);
		}
	}

}
