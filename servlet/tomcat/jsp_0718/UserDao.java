package com.sist.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.sist.web.db.DBManager;
import com.sist.web.model.User;
import com.sist.web.model.User2;

public class UserDao 
{
	private static Logger logger = LogManager.getLogger(UserDao.class);
	
	//사용자 조회
	//user객체를 이용해 받을 것임
	public User userSelect(String userId)
	{
		User user = null;  //user객체 선언함
		
		//select을 할때는 이 4개가 필수임!
		Connection conn = null;  //Connection객체 얻어오기
		PreparedStatement pstmt = null; //쿼리 날리기 위해
		//PreparedStatement,Connection는 쿼리문 날리기 위해 꼭 필요
		
		ResultSet rs = null; //결과 받을거  ,, 퀴리문이 select 일떄 무조건 와야함
		//select의 리턴타입이ResultSet이기 때문에 그 값을 담기 위해서 필요
		
		StringBuilder sql = new StringBuilder(); //오라클 쿼리 작성해놓은거 스트링빌더로 만들어놓을거임
		//StringBuilder -> 문자열을 조합하기 위해서 사용, 문자열을 만들기 위해서 필요
		//Stirng타입의 문제점 : 메모리할당을 계속받아서 느림
		
		//"" 사이에서 앞은 상관 없지만 뒤쪽은 무조건 한칸 띄워야함 
		//oracle에서 sql쿼리 직접 돌려보고 거기서 복사해와서 붙여넣기 하셈
		sql.append("SELECT USER_ID, ");
		sql.append("   		NVL(USER_PWD,'') AS USER_PWD, ");  //이런쿼리 뒤에 , "); 처럼 컴마뒤에 공백을 안넣으면 오류남!! 꼭 공백넣어!!
		sql.append("		NVL(USER_NAME, '') AS USER_NAME, ");
		sql.append("		NVL(USER_EMAIL,'') AS USER_EMAIL, ");
		sql.append("		NVL(STATUS,'N') AS STATUS, ");
		sql.append("		NVL(TO_CHAR(REG_DATE, 'YYYY.MM.DD HH24:MI:SS'), '') AS REG_DATE ");
		sql.append("    FROM TBL_USER ");
		sql.append("  WHERE USER_ID = ? "); //물음표(?)에 값을 하나씩 저장해 줄거임,, 물음표로 대입함
		
		try {
			conn = DBManager.getConnection();  //connectionPull에 연결된 하나를 가져오는 것 녹32 44분
			pstmt = conn.prepareStatement(sql.toString()); //?가 포함된 쿼리에 대해서는 prepareStatement에 저장해놓음
			
			//?에 값대입
			pstmt.setNString(1, userId);//매개변수로 받은 userId값을 대입   /녹41, 26:

			//쿼리에서 온 값을 rs에 담음
			rs = pstmt.executeQuery(); //ResultSet을 리턴해줌  ,메서드 예외처리 때문에 try catch 로 묶은 이유임
			
			
			//if로 값을 가져왔다는 것은 값이 하나라는 뜻
			if(rs.next()) { //rs = pstmt.executeQuery();에서 가져온 값이 있으면 /rs.next() 는 값이 있으면 있어 바라봐~~ 함
				//객체생성
				user = new User(); //위에서 User user = null;로 생성했었기 때문에 값을 담아주기 위해 객체 생성함
				
				user.setUserId(rs.getString("USER_ID")); //USER_ID 쿼리에 있는 별칭임, 문자열로 가져오기 떄문에 getString을 사용
				//resultset에서 가져오기 위해 get을 쓰는데 USER_ID의 데이터 타입은 String이기 때문에 getString을 사용
				//거기서 USER_ID이라는 별칭을 가진 애를 가져오겠다
				user.setUserPwd(rs.getString("USER_PWD"));
				user.setUserName(rs.getString("USER_NAME"));
				user.setUserEmail(rs.getString("USER_EMAIL"));
				user.setStatus(rs.getString("STATUS"));
				user.setRegDate(rs.getNString("REG_DATE"));  //이거는 별칭이기 때문에 getString이던 getnt던 타입에 상관없이 무조건""써줘야한다
				
				
			}
		}
		catch(Exception e) {
			
			logger.error("[UserDao]userSelect Exception", e);  //어디서 오류가 났는지 알기위한용도
		}
		finally {
			
			DBManager.close(rs, pstmt, conn);  //반납함(ConnectionPUll에 돌려줌)
			//데이터 보내주겠다
		}
		
		return user;   //유저 객체를 리턴함,  user 안의주소값을 던져줌
		//던져짐과 동시에 
	}
	
	//아이디 존재 확인
	public int userIdSelectCount(String userId)
	{
		int count = 0; //여기서 꼭 0으로 초기화 해줘야함 
		//왜?? -> 밑에 try에서 if(rs.next()) {count = rs.getInt("CNT");} 타지 않으면 0으로 넣어 줘야하니까
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sql = new StringBuilder();
		
		sql.append("SELECT COUNT(USER_ID) AS CNT ");  
		sql.append("	FROM TBL_USER ");
		sql.append(" 	WHERE USER_ID = ? ");
	    //이거는 리턴타입이 resultSet임 
		
		try
		{
			//이거 순서를 알아야함
			//먼저 connection객체 가져오고 connection객체안에 있는 preparestatement가져옴 그리고 toSTring으로 변환해줌
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();  //데이터 형이 ResultSet인 값을 rs에 담음
			
			if(rs.next()) {
				
				count = rs.getInt("CNT");
			}
					
		}
		catch(Exception e)
		{
			logger.error("[UserDao]userIdSelectCount Execption", e);  //에러가 나면 이 문구를 로그에 찍도록함
			
		}
		finally 
		{
			
			DBManager.close(rs, pstmt, conn);
		}
		return count;
	}
	
	//사용자 등록
	public int userInsert(User user)
	{
		int count = 0;
		
		return count;
	}
	
	//사용자 정보 수정
	public int userUpdate(User user)
	{
		int count = 0;
		
		return count;
	}
	
	
	
	
	
	//user2로 만들기
	public User2 userSelect2(String userId)
	{
		User2 user2 = null;  //user객체 선언함
		
		
		Connection conn = null;  //Connection객체 얻어오기
		PreparedStatement pstmt = null; //쿼리 날리기 위해
		ResultSet rs = null; //결과 받을거  ,, 퀴리문이 select 일떄 무조건 와야함
		StringBuilder sql = new StringBuilder(); //오라클 쿼리 작성해놓은거 스트링빌더로 만들어놓을거임

	
		sql.append("SELECT USER_ID, ");
		sql.append("   		NVL(USER_PWD,'') AS USER_PWD, ");  //이런쿼리 뒤에 , "); 처럼 컴마뒤에 공백을 안넣으면 오류남!! 꼭 공백넣어!!
		sql.append("		NVL(USER_NAME, '') AS USER_NAME, ");
		sql.append("		NVL(USER_EMAIL,'') AS USER_EMAIL, ");
		sql.append("		NVL(STATUS,'N') AS STATUS, ");
		sql.append("		NVL(TO_CHAR(REG_DATE, 'YYYY.MM.DD HH24:MI:SS'), '') AS REG_DATE ");
		sql.append("    FROM TBL_USER ");
		sql.append("  WHERE USER_ID = ? "); //물음표(?)에 값을 하나씩 저장해 줄거임,, 물음표로 대입함
		
		try {
			conn = DBManager.getConnection();  //connectionPull에 연결된 하나를 가져오는 것 녹32 44분
			pstmt = conn.prepareStatement(sql.toString());
			
			//?에 값대입
			pstmt.setString(1, userId);//매개변수로 받은 userId값을 대입

			
			rs = pstmt.executeQuery(); //ResultSet을 리턴해줌  ,메서드 예외처리 때문에 try catch 로 묶은 이유임
			
			
			//if로 값을 가져왔다는 것은 값이 하나라는 뜻
			if(rs.next()) { //rs = pstmt.executeQuery();에서 가져온 값이 있으면 /rs.next() 는 값이 있으면 있어 바라봐~~ 함
				//객체생성
				user2 = new User2(); //위에서 User user = null;로 생성했었기 때문에 값을 담아주기 위해 객체 생성함
				
				user2.setUserId(rs.getString("USER_ID")); //USER_ID 쿼리에 있는 별칭임, 문자열로 가져오기 떄문에 getString을 사용
				//resultset에서 가져오기 위해 get을 쓰는데 USER_ID의 데이터 타입은 String이기 때문에 getString을 사용
				//거기서 USER_ID이라는 별칭을 가진 애를 가져오겠다
				user2.setUserPwd(rs.getString("USER_PWD"));
				user2.setUserName(rs.getString("USER_NAME"));
				user2.setUserEmail(rs.getString("USER_EMAIL"));
				user2.setStatus(rs.getString("STATUS"));
				user2.setRegDate(rs.getNString("REG_DATE"));
				
				
			}
		}
		catch(Exception e) { //executeQuery뿐만아니라 다른 여러가지 예외를 처리 하기 위해서 모든 예외처리의 조상인 Exception을 사용한것임
			
			logger.error("[UserDao]userSelect Exception", e);  //어디서 오류가 났는지 알기위한용도
		}
		finally {
			
			DBManager.close(rs, pstmt, conn);  //반납함(ConnectionPUll에 돌려줌)
		}
		
		return user2;   //유저 객체를 리턴함,  user 안의주소값을 던져줌
		//던져짐과 동시에 
	}
	
	//아이디 존재 확인
	public int userIdSelectCount2(String userId)
	{
		int count = 0;
		
		return count;
	}
	
	//사용자 등록
	public int userInsert2(User user2)
	{
		int count = 0;
		
		return count;
	}
	
	//사용자 정보 수정
	public int userUpdate2(User user2)
	{
		int count = 0;
		
		return count;
	}
	
}







