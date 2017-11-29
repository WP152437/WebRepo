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
import org.dimigo.vo.CatVO;
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
public class Cat_SignupAction implements IAction{

	private void validate(CatVO vo) throws Exception{
		if(CommonUtil.isEmpty(vo.getGender())) throw new Exception("성별을 입력하세요");
		if((vo.getYear())<0) throw new Exception("나이를 올바르게 입력하세요");
		if((vo.getMonth())<0) throw new Exception("개월을 올바르게 입력하세요");
		if(CommonUtil.isEmpty(vo.getName())) throw new Exception("이름을 입력하세요");
		
	}
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html);charset=utf-8");
			// 추출
			String gender = request.getParameter("gender");
			int year = Integer.parseInt(request.getParameter("year"));
			int month = Integer.parseInt(request.getParameter("month"));
			String name = request.getParameter("name");
			
			CatVO user = new CatVO(name,gender,year,month);
			//user.setPwd(pwd);
			// 검증
			validate(user);
			// 서비스 호출
			
			UserService service = new UserService();
			service.Cat_signup(user);
			
			if (user != null) {
				// 세션에 사용자 정보 생성
				HttpSession session = request.getSession();
				session.setAttribute("cat", user);

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/list4.jsp");
				rd.forward(request, response);
			} else {
				throw new Exception("Invalid catname");
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/cat_signup.jsp");
			rd.forward(request, response);
		}
	}

}
