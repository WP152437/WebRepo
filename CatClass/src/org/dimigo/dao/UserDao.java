/**
 * 
 */
package org.dimigo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.dimigo.vo.CatVO;
import org.dimigo.vo.UserVO;

/**
 * <pre>
 * org.dimigo.dao
 *   |_ UserDao.java
 * 1. 개요 :
 * 2. 작성일 : 2017. 11. 13.
 * </pre>
 *
 * @author : jjjj
 * @version : 1.0
 */
public class UserDao {
	private Connection conn = null;
	
	public UserDao(Connection conn) {
		this.conn = conn;
	}
	public UserVO searchUser(UserVO vo) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM USER WHERE ID=? AND PWD=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());// 인덱스 1부터 시작
			pstmt.setString(2, vo.getPwd());
			
			rs = pstmt.executeQuery();
			UserVO result = null;
			if(rs.next()){
				result = new UserVO();
				result.setId(rs.getString(1));//column index도 1부터 시작
				result.setName(rs.getString(3));
				result.setNickname(rs.getString(4));
			}
			System.out.println(result);
			return result;
		} catch(Exception e) {
			e.printStackTrace();
			throw new Exception("사용자 조회 시 오류가 발생했습니다.");
		} finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
		}
	}
	public UserVO searchUserById(UserVO vo) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM USER WHERE ID=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			
			rs = pstmt.executeQuery();
			UserVO result = null;
			if(rs.next()){
				result = new UserVO();
				result.setId(rs.getString(1));
				result.setName(rs.getString(3));
				result.setNickname(rs.getString(4));
			}
			System.out.println(result);
			return result;
		} catch(Exception e) {
			e.printStackTrace();
			throw new Exception("사용자 조회 시 오류가 발생했습니다.");
		} finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
		}
	}
	public void insertUser(UserVO vo) throws Exception {
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO USER VALUES(?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getNickname());
			
			int cnt = pstmt.executeUpdate();// select는 query, 나머지 셋은 update
			if(cnt==0)
				throw new Exception("회원가입에 실패하였습니다.");
		} catch(Exception e) {
			e.printStackTrace();
			throw new Exception("회원가입 시 오류가 발생했습니다.");
		} finally {
			if(pstmt!=null)pstmt.close();
		}
	}
	
	public void insertCat(CatVO vo) throws Exception {
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO CAT VALUES(?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getGender());
			pstmt.setInt(2, vo.getYear());
			pstmt.setInt(3, vo.getMonth());
			pstmt.setString(4, vo.getName());
			
			
			int cnt = pstmt.executeUpdate();// select는 query, 나머지 셋은 update
			if(cnt==0)
				throw new Exception("고양이 등록 성공.");
		} catch(Exception e) {
			e.printStackTrace();
			throw new Exception("실패.");
		} finally {
			if(pstmt!=null)pstmt.close();
		}
	}
	
	public List<UserVO> searchUserList() throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT ID, NAME, NICKNAME FROM USER";
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			UserVO result = null;
			List<UserVO> list = new ArrayList<>();
			while(rs.next()){
				result = new UserVO();
				result.setId(rs.getString(1));
				result.setName(rs.getString(2));
				result.setNickname(rs.getString(3));
				list.add(result);
			}
			System.out.println(list);
			return list;
		} catch(Exception e) {
			e.printStackTrace();
			throw new Exception("사용자 목록 조회 시 오류가 발생했습니다.");
		} finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
		}
	}
}
