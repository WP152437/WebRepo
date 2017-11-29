package org.dimigo.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Cat_signup
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/cat_signup" })
public class Cat_signupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cat_signupServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/cat_signup.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean result = true;
		String gender = request.getParameter("gender");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String name = request.getParameter("name");
		PreparedStatement pstmt = null;
		Connection conn = null;
		String sql = "INSERT INTO CAT VALUES(gender, year, month, name)";
		
		if(result) {
			request.setAttribute("msg", "message");
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/home.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("msg", "error");
			request.setAttribute("name", request.getParameter("name"));
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/signup.jsp");
			rd.forward(request, response);
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int cnt = pstmt.executeUpdate();// select는 query, 나머지 셋은 update
			if(cnt==0)
				throw new Exception("고양이 등록 성공.");
		} catch(Exception e) {
			e.printStackTrace();
			try {
				throw new Exception("실패.");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		} finally {
			if(pstmt!=null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		doGet(request, response);
	}
}