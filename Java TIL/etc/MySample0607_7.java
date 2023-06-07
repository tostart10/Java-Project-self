package etc;

import java.util.Calendar;

public class MySample0607_7 {

	public static void main(String[] args) {
		Calendar date = Calendar.getInstance();
		//date.set(2015, 7, 31);
		
		System.out.println(toString(date));
		System.out.println("== 1일 후 ==");
		date.add(Calendar.DATE, 1); //현재가지고 있는 배열(Calendar.DATE)의 값에 1을 더한다
		System.out.println(toString(date));
		
		System.out.println("== 5달 전 ==");
		date.add(Calendar.MONTH, -5);
		System.out.println(toString(date));
		
		
		System.out.println("== 31일 후 (roll) ==");
		date.roll(Calendar.DATE, 31);
		System.out.println(toString(date));
		//roll은 Calendar에 직접적인 영향을 미치지 않는다.
		//roll은 다른 필드에 영향을 미치치 않는다
		
		
		System.out.println("== 31일 후 (add) ==");
		date.add(Calendar.DATE, 31);
		System.out.println(toString(date));
		
	}
	
	public static String toString(Calendar date) { //Calendar는 import 해줘야함
		
		return date.get(Calendar.YEAR) + "년 " + (date.get(Calendar.MONTH) +1) 
				+ "월 " + date.get(Calendar.DATE) + "일";
	}
	
}
