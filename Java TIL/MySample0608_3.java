package etc;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MySample0608_3 {

	public static void main(String[] args) {
		/* y : 년, M : 월, d: 일, E: 요일, a : 오전/오후
		 * H : 시간, m:분, s : 초
		 */
		
		
		Date date = new Date();
		String patternKorea = "yyyy-MM-dd";
		String patternUSA = "MM-dd-yyyy";
		String patternUK = "dd-MM-yyyy";
		String pattern1 = "E요일 HH시 mm분 ss초";
		
		SimpleDateFormat p1 = new SimpleDateFormat(patternKorea);
		SimpleDateFormat p2 = new SimpleDateFormat(patternUSA);
		SimpleDateFormat p3 = new SimpleDateFormat(patternUK);
		SimpleDateFormat p4 = new SimpleDateFormat(pattern1);
		
		
		System.out.println("현재 날짜 : " + date);
		System.out.println( "한국형(년월일) : "+ p1.format(date));
		System.out.println("미국형(년월일) : " + p2.format(date));
		System.out.println("영국형(년월일) : " + p3.format(date));
		System.out.println( p4.format(date));
		
	}

}
