package com.sist.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.sist.web.db.DBManager;
import com.sist.web.model.User;

public class UserDao0720 {

	
private static Logger logger = LogManager.getLogger(UserDao0720.class);
	
	//사용자 조회
	//user객체를 이용해 받을 것임
	public User userSelect(String userId)
	{
		User user = null;  
		Connection conn = null;  //Connection객체 얻어오기
		PreparedStatement pstmt = null; 
		
		ResultSet rs = null; 
		
		StringBuilder sql = new StringBuilder();
		
		
		sql.append("SELECT USER_ID, ");
		sql.append("   		NVL(USER_PWD,'') AS USER_PWD, ");  
		sql.append("		NVL(USER_NAME, '') AS USER_NAME, ");
		sql.append("		NVL(USER_EMAIL,'') AS USER_EMAIL, ");
		sql.append("		NVL(STATUS,'N') AS STATUS, ");
		sql.append("		NVL(TO_CHAR(REG_DATE, 'YYYY.MM.DD HH24:MI:SS'), '') AS REG_DATE ");
		sql.append("    FROM JSP_USER ");
		sql.append("  WHERE USER_ID = ? "); 
		//?는 매번 값이 바뀜
		
		
		try {
			conn = DBManager.getConnection(); 
			
			pstmt = conn.prepareStatement(sql.toString());
			
			//?에 값대입
			pstmt.setString(1, userId);

			
			rs = pstmt.executeQuery(); 
			
			
			if(rs.next()) { 
				
				user = new User(); 
				
				user.setUserId(rs.getString("USER_ID")); 
				user.setUserPwd(rs.getString("USER_PWD"));
				user.setUserName(rs.getString("USER_NAME"));
				user.setUserEmail(rs.getString("USER_EMAIL"));
				user.setStatus(rs.getString("STATUS"));
				user.setRegDate(rs.getNString("REG_DATE"));
				
				
			}
		}
		catch(Exception e) {
			
			logger.error("[UserDao0720]userSelect Exception", e);  
		}
		finally {
			
			DBManager.close(rs, pstmt, conn);  
		}
		
		return user;  
	}
	
	//아이디 존재 확인
	public int userIdSelectCount(String userId) //(String userId) 는 userProc.jsp의 변수 userId가 들어와 그 안의 값이 들어온거임
	{
		int count = 0; //여기서 꼭 0으로 초기화 해줘야함 
		//왜?? -> 밑에 try에서 if(rs.next()) {count = rs.getInt("CNT");} 타지 않으면 0으로 넣어 줘야하니까
		
		Connection conn = null;
		PreparedStatement pstmt = null; //쿼리 날림
		ResultSet rs = null;  //쿼리결과값 받을려고
		StringBuilder sql = new StringBuilder(); //문자열조합위해
		
		sql.append("SELECT COUNT(USER_ID) AS CNT ");  
		sql.append("	FROM JSP_USER ");
		sql.append(" 	WHERE USER_ID = ? ");
	    //이거는 리턴타입이 resultSet임 
		
		try
		{
			conn = DBManager.getConnection();  //connection객체 가져옴
			pstmt = conn.prepareStatement(sql.toString()); //conn객체 안에prepareStatement이용해서 문자열가져와서 넣어놓음
			
			pstmt.setString(1, userId); //?에 값 세팅
			
			rs = pstmt.executeQuery();  
			
			if(rs.next()) {
				
				count = rs.getInt("CNT");
			}
					
		}
		catch(Exception e)
		{
			logger.error("[UserDao0720]userIdSelectCount Execption", e);  //에러가 나면 이 문구를 로그에 찍도록함
			
		}
		finally 
		{
			
			DBManager.close(rs, pstmt, conn);
		}
		return count;
		//해당하는 아이디가 DB에 존재하나 안하냐
		//결과 건수를 가져오겠다
	}
	
	//사용자 등록
	public int userInsert(User user)
	{//user는 넘어올떄 값을 다 세팅해서 넘어옴
		
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		
		sql.append("INSERT INTO JSP_USER ");
		sql.append("(USER_ID, USER_PWD, USER_NAME, USER_EMAIL, STATUS, REG_DATE) ");
		sql.append("VALUES ( ? , ?, ?, ?, ?, SYSDATE) ");  
		
		try 
		{
			int idx = 0;
			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(++idx, user.getUserId());
			pstmt.setString(++idx, user.getUserPwd());
			pstmt.setString(++idx, user.getUserName());
			pstmt.setString(++idx, user.getUserEmail());
			pstmt.setString(++idx, user.getStatus());
			
			count = pstmt.executeUpdate(); 
		}
		catch(Exception e)
		{
			logger.error("[UserDao0720]userInsert", e);  //userDao클래스에서 userIsert가 오류났다~ 라는 뜻
		}
		finally 
		{
			DBManager.close(pstmt, conn);
		}
		return count;
	}
	
	//사용자 정보 수정
	public int userUpdate(User user)
	{
		int count = 0;
		
		return count;
	}
	
}
