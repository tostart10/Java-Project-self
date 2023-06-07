package etc;

import java.util.StringJoiner;

public class MySample0607_5 {

	public static void main(String[] args) {
		String str1 = "abc";
		String str2 = "abc";
		
		System.out.println("String str1 : \"abc\" "); //이스케이프 문자로 "" 출력하기
		System.out.println("String str2 : \"abc\" "); 
		
		System.out.println(str1);
		System.out.println(str2);
		
		//==과 equal
		System.out.println("str == str2 : " + (str1 == str2)); //true가 출력됨
		//why?? => 기본적으로 String 타입은 == 으로 비교를 할 수 없는다
		//위에서 변수 선언시  = "abc"; 이 str1 과 str2 모두  "abc"로 같기 떄문에 자바에서 같은 값으로 간주함
		//그래서 같은 값을 가진 String 타입의 변수는 같은것이 된다
		//하지만 String str1 = "abc" 이고 String str2 = "dgf" 로 값이 다르면 false로 다른것이됨
		// ==은 주소값을 비교하는것
		
		//equals는 오버라이딩한것임
		//String클래스 안에있는 equals() 메서드를 사용한 것임
		System.out.println("str1.equals(str2) : " + str1.equals(str2)); //true
		//equals로 값을 비해서 str1의 값과 str2의 값을 비교함
		//equals는 시작주소 안에 있는 값 자체를 비교
		
		System.out.println();
		
		String str3 =new String("\"abc\"");
		String str4 =new String("\"abc\"");
		
		System.out.println(str3);
		System.out.println(str4);
		
		System.out.println("str3 == str4 : " + (str3 ==str4));  
		//false-> 각각 다른 객체를 생성해서 다른 주소값을 가지고 있기 때문
		
		System.out.println("str3.equals(str4) : " + str3.equals(str4));
		//true=> str3과 str4의 주소값은 다르지만 그 안에 들어있는 값 자체는 같기 때문 (str3이 가르키고 있는 집안에 있는 값과 str4가 가르키고 있는 집안에 있는 값이 같아서)
		
		//join(). StringJoiner()
		String animals = "dog, cat, bear";
		String[] arr = animals.split(",");  //이렇게 하면 컴마를 기준으로 나뉘어서 출력된다
		
		//확장 for문
		for(String s : arr) { //자기가 알아서 배열의 처음부터 끝까지 돌려줌
			
			System.out.print(s + " ");
		}
		
		
		System.out.println();
		System.out.println(String.join("-", arr));
		
		
		StringJoiner sj = new StringJoiner("/","[","]"); //이거는 import해줘야한다.
		
		for(String s : arr ) {
			sj.add(s);
		}
		System.out.println(sj.toString());
		
		
		
	}

}
