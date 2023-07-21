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
		User user = null;  //user객체 선언함,  user객체를 리턴하기 위해 user 객체 생성함
		
		//select을 할때는 이 4개가 필수임!
		Connection conn = null;  //Connection객체 얻어오기
		PreparedStatement pstmt = null; //쿼리 날리기 위해 쿼리문 올려줌
		//PreparedStatement,Connection는 쿼리문 날리기 위해 꼭 필요
		
		ResultSet rs = null; //결과 받을거  ,, 퀴리문이 select 일떄 무조건 와야함
		//select의 리턴타입이ResultSet이기 때문에 그 값을 담기 위해서 필요
		
		StringBuilder sql = new StringBuilder(); //오라클 쿼리 작성해놓은거 스트링빌더로 만들어놓을거임
		//StringBuilder -> 문자열을 조합하기 위해서 사용, 문자열을 만들기 위해서 필요
		//Stirng타입의 문제점 : 메모리할당을 계속받아서 느림
		//밑에서 pstmt = conn.prepareStatement(sql.toString()) sql.toString()가 String 이여서 StringBuilder사용
		
		
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
		//?는 매번 값이 바뀜
		
		try {
			conn = DBManager.getConnection();  //connectionPull에 연결된 하나를 가져오는 것 녹32 44분
			//지금 try문 안에 써있는 것들 중 conn = DBManager.getConnection();만 try문 밖에서 쓸 수 있음
			//왜?=> 다른 것들의 .메서드()위에 마우스 올려놔 보면 throw SQLExcption이라고 예외처리를 해주도록되어있기 때문
			//애초에 try-catch를 쓰는 이유가 어찌됬든 오류가 발생할 수 있는 것이기 때문
			
			pstmt = conn.prepareStatement(sql.toString()); //?가 포함된 쿼리에 대해서는 prepareStatement에 저장해놓음
			//메서드 예외처리 나를 처리하는 쪽에서try-catch문으로 감싸야하기 떄문에
			//밑에서 try-catch한거임
			//쿼리 날리기 위해 쿼리문 올려줌
			//conn.prepareStatement(sql.toString()); 는 Connection객체안의 prepareStatement영역안의 값을 가져온다
			
			//?에 값대입
			pstmt.setString(1, userId);//매개변수로 받은 userId값을 대입   /41_26:

			//쿼리에서 온 값을 rs에 담음
			//53_17:0
			rs = pstmt.executeQuery(); //ResultSet을 리턴해줌  ,메서드 예외처리 때문에 try catch 로 묶은 이유임
			//메서드 예외처리 나를 처리하는 쪽에서try-catch문으로 감싸야하기 떄문에
			//밑에서 try-catch한거임
			//오라클한테 쿼리를 실행시켜 라는 의미
			//pstmt.executeQuery(); => SQL쿼리를 실행하고 결과를 ResultSet 객체로 반환함
			//반환된 ResultSet 객체를 변수 rs에 대입함
			
			
			//if로 값을 가져왔다는 것은 값이 하나라는 뜻
			//rs는 내가가저온 값의 하나 전을 뜻함
			//next가 true/false를 반환함
			if(rs.next()) { //rs = pstmt.executeQuery();에서 가져온 값이 있으면 /rs.next() 는 값이 있으면 있어 바라봐~~ 함
				
				//객체생성
				//객체생성을 하면 그 객체 안에 메서드, getter/setter방, 변수 등의 방이 전부 생성됨 + 시작주소값  생성됨
				user = new User(); //위에서 User user = null;로 생성했었기 때문에 값을 담아주기 위해 객체 생성함
				
				user.setUserId(rs.getString("USER_ID")); //USER_ID 쿼리에 있는 별칭임, 문자열로 가져오기 떄문에 getString을 사용
				//resultset에서 가져오기 위해 get을 쓰는데 USER_ID의 데이터 타입은 String이기 때문에 getString을 사용
				//거기서 USER_ID이라는 별칭을 가진 애를 가져오겠다
				//.set~~()는 setter임!!
				//.get~~()는 getter임
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
			//메모리 반납
		}
		
		return user;   //유저 객체를 리턴함,  user 안의주소값을 던져줌
		//던져짐과 동시에  if문 안에서 생성된 user객체의 시작 주소를 담은 변수상자(공간?)는 사라짐 , 주소값만 던져줌!! (주소값과 생성된 아파트객체는 사라지지 않음)
		//생성한 객체 User의 주소값을 던짐
		//user 시작 주소 값을 가지는 user상자?단독주택?에서 
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
		sql.append("	FROM TBL_USER ");
		sql.append(" 	WHERE USER_ID = ? ");
	    //이거는 리턴타입이 resultSet임 
		
		try
		{
			//이거 순서를 알아야함
			//먼저 connection객체 가져오고 connection객체안에 있는 preparestatement가져옴 그리고 toSTring으로 변환해줌
			conn = DBManager.getConnection();  //connection객체 가져옴
			pstmt = conn.prepareStatement(sql.toString()); //conn객체 안에prepareStatement이용해서 문자열가져와서 넣어놓음
			
			pstmt.setString(1, userId); //?에 값 세팅
			
			rs = pstmt.executeQuery();  //데이터 형이 ResultSet인 값을 rs에 담음
			//executeQuery가 쿼리문을날리고 resultSet형태의 값을 반환받아서 rs에 담음
			
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
		//해당하는 아이디가 DB에 존재하나 안하냐
		//결과 건수를 가져오겠다
	}
	
	//사용자 등록
	public int userInsert(User user)
	{//user는 넘어올떄 값을 다 세팅해서 넘어옴
		
		int count = 0;
		//리턴타입이 INT이기 떄문에 COUNT 변수가 이미 있어서ResultSet rs = null;이거는 없어도 됨
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		//select이 아니기 때문에 resultSet이 필요없어서 선언안해줌
		
		sql.append("INSERT INTO TBL_USER ");
		sql.append("(USER_ID, USER_PWD, USER_NAME, USER_EMAIL, STATUS, REG_DATE) ");
		sql.append("VALUES ( ? , ?, ?, ?, ?, SYSDATE) ");  
		
		try 
		{
			
			//중간에 컬럼명이 추가되거나 변경될 수 있기 떄문에 idx 변수를 사용한다
			// 전치 연산자 ++을 붙여주면 원래 내값에 +1을 하여 값을 나타내게되니까
			int idx = 0;
			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(++idx, user.getUserId());
			pstmt.setString(++idx, user.getUserPwd());
			pstmt.setString(++idx, user.getUserName());
			pstmt.setString(++idx, user.getUserEmail());
			pstmt.setString(++idx, user.getStatus());
			
			count = pstmt.executeUpdate();  //매개변수만 맞으면 받던말던,  count 처리 건수를 받을 거임!!
			//count없이 pstmt.executeUpdate();만 쓰면 userProc.jsp에서 if(userDao.userInsert(user) > 0) user에 들어오는 값이 계속 0임
			//executeUpdate()의 반환 타입이 int임 -> 처리 건수   count
		}
		catch(Exception e)
		{
			logger.error("[UserDao]userInsert", e);  //userDao클래스에서 userIsert가 오류났다~ 라는 뜻
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







