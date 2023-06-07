package etc;

import java.util.Calendar;

public class MySample0607_6 {

	public static void main(String[] args) {
		//Calendar 클래스
		Calendar today = Calendar.getInstance();  //현재 날짜와 시간 설정
		
		//YEAR 같이 뒤에 () 가 없음 -> 변수명, 변수명인데 풀로 대문자 -> 상수
		//Calendar.YEAR에서 YEAR은 배열의 인덱스값을 말함
		//배열의 인덱스값을 가져오기 위해 상수가 정의된것
		//내부적으로 배열에 값을 다 넣는것임 
		//Calendar.YEAR은 값을 꺼내오는 용도임
		//.getInstance() 때문에 배열에 값이 다 들어가 있음
		System.out.println("년도 : " + today.get(Calendar.YEAR));
		System.out.println("월, 1월(0) : " + today.get(Calendar.MONTH));
		System.out.println("올해의 몇째주 : " + today.get(Calendar.WEEK_OF_YEAR));
		System.out.println("이번달의 몇째주 : " + today.get(Calendar.WEEK_OF_MONTH));
		
		System.out.println("이달의 몇일 : " + today.get(Calendar.DATE));
		System.out.println("이달의 몇일 : " + today.get(Calendar.DAY_OF_MONTH)); //현재 월의 날짜
		
		System.out.println("올해의 몇일 : " + today.get(Calendar.DAY_OF_YEAR));//올해의 몇일
		
		
		System.out.println("요일1(일요일) : " + today.get(Calendar.DAY_OF_WEEK));
		System.out.println("이달의 몇째 요일 : " + today.get(Calendar.DAY_OF_WEEK_IN_MONTH));
		//오늘이 수요일인데 이번달 중 몇번째 수요일인지를 알아보는 것
		
		System.out.println("오전/오후 (0:오전, 1:오후) : "+ today.get(Calendar.AM_PM));
		System.out.println("시간(0~11) : " + today.get(Calendar.HOUR));  //12시 기준
		System.out.println("시간(0~23) : " + today.get(Calendar.HOUR_OF_DAY));
		System.out.println("분(0~59) : " + today.get(Calendar.MINUTE));
		System.out.println("초(0~59) : " + today.get(Calendar.SECOND));
		System.out.println("이달의 마지막 날 : " + today.getActualMaximum(Calendar.DATE));
		
		final String[] DAY_OF_WEEK = {"", "일", "월", "화", "수", "목", "금", "토"};
		
		Calendar date1 = Calendar.getInstance();
		Calendar date2 = Calendar.getInstance();
		
		date1.set(2001, 3, 8); //년, 월, 일 로 값을 세팅해줬음
		
		
		//Calender의 tostring 대신 내가 구현한 toString 2를 사용
		//System.out.println("date1은 " + toString2(date1) + DAY_OF_WEEK[date1.get(Calendar.DAY_OF_WEEK)] + "요일 입니다.");
		//여기서 DAY_OF_WEEK는 우리가 정의해준 상수 배열 final String[] DAY_OF_WEEK 을 말함
		
		System.out.println("date2은 " + toString2(date2) + DAY_OF_WEEK[date2.get(Calendar.DAY_OF_WEEK)] + "요일 입니다.");
		//DAY_OF_WEEK[date2.get(Calendar.DAY_OF_WEEK)]  = date2.get(7)
		//DAY_OF_WEEK[date2.get(Calendar.DAY_OF_WEEK)] 는 오늘은 수요일이라 4여서 DAY_OF_WEEK[4]여서
		//우리가 선언한 배열 DAY_OF_WEEK의 인덱스값 4인 요소를 가져오는데 "수"이므로 수요일로 출력됨 
		
	}
	
//이거는 메서드 오버라이딩이 아니라 새로운 메서드를 구현한것임!!
public static String toString2(Calendar date) {
	
	return date.get(Calendar.YEAR) + "년 " + (date.get(Calendar.MONTH) 
			+ 1 + "월 " + date.get(Calendar.DATE) + "일 ");
}//date1.set(2001, 3, 8);  으로 세팅한 값을 기준으로 출력한다
//월에 +1을 해야지만 정상적으로 출력됨

}
