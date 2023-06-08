package etc;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MySample0608_2 {

	public static void main(String[] args) {
		//SimpleDateFormat(날자 데이터를 원하는 형태로 다양하게 출력)
		//의외로 많이 쓰임
		
		Date today = new Date();
		
		SimpleDateFormat s1, s2, s3, s4;
		SimpleDateFormat s5, s6, s7, s8, s9;
		
		s1 = new SimpleDateFormat("yyyy-MM--dd");
		s2 = new SimpleDateFormat("yy년 MMM dd일 E요일");
		s3 = new SimpleDateFormat("yyyy-MM--dd HH:mm:ss.sss"); //HH는 24시 표시
		s4 = new SimpleDateFormat("yyyy-MM--dd hh:mm:ss a"); //hh는 12시 표시 a는 오전,오휴
		
		s5 = new SimpleDateFormat("오늘은 올해의 D번째 날입니다.");
		s6 = new SimpleDateFormat("오늘은 이달의 d번째 날입니다.");
		s7 = new SimpleDateFormat("오늘은 올해의 w번째 날입니다."); //소문자 w
		s8 = new SimpleDateFormat("오늘은 올해의 W번째 날입니다.");  //대문자 W
		s9 = new SimpleDateFormat("오늘은 올해의 F번째 E요일 날입니다.");
		
		System.out.println(s1.format(today));
		System.out.println(s2.format(today));
		System.out.println(s3.format(today));
		System.out.println(s4.format(today));
		System.out.println(s5.format(today));
		System.out.println(s6.format(today));
		System.out.println(s7.format(today));
		System.out.println(s8.format(today));
		System.out.println(s9.format(today));
		
	}

}
