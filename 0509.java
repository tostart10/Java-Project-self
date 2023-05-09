import java.util.*;

public class MySample0509 {

	public static void main(String[] args) {
		int a = 5;  //이런 변수는  os가 만든다  메모리는 하드디스크에서 만든다
		int b = a + 2;
		
		/*
		System.out.println("a :  " + a);
		System.out.println("b :  " + b);
		
		Scanner scn = new Scanner(System.in);  //System.in 입력받은것을 사용하겠다 라는 의미
		
		System.out.print("나이를 입력하세요. >");
		int age = scn.nextInt(); // 정수로 입력  scn.nextInt()-> 스케너 안에있는 nextInt()로 입력받는 값을 정수로 받아라
		
		System.out.println("당신의 나이는 " + age +"살 입니다.");
		*/
		
		//산술연산자
		a = 7;
		b = 5;
		
		int plus = a + b;   
		int minus = a - b;
		int div = a / b;
		int multi = a * b;
		int reset = a % b;
		
		System.out.printf("%d + %d =%d \n", a,b,plus);    // 연산을 단 한번만 한다면 plus대신 a+b를 써줘도 됨 하지만
		System.out.printf("%d - %d = %d \n", a, b, minus); //연산식을 여러번 쓴다면 변수를 사용하는게 맞음
		System.out.printf("%d * %d =%d \n", a, b, multi);
		System.out.printf("%d / %d = %d \n", a, b, div);
		System.out.printf("%d %% %d = %d \n", a, b, reset); //%가 문자인것을 알려주기 위해 %% 처럼 두개 써줘야함
		
		//증감연산자(++, --)
		a =5;
		System.out.println("a = " + a); //5
		a++;  //후치증가연산자   
		System.out.println("a1 = " + a); //6
		++a;  //전치증가연산자
		System.out.println("a2 = " + a); ///7
		//위 처럼 줄을 바꿔서 전치/후치 가 의미 없어짐
		
		
		a=5;
		System.out.println("a= " + a);    //5
		System.out.println("a++ = " + a++);  //5
		System.out.println("++a = " + ++a); //7
		
		
		
		//감소연산자
				a =5;
				System.out.println("a = " + a); //5
				a--;  //후치증가연산자   
				System.out.println("a1 = " + a); //4
				--a;  //전치증가연산자
				System.out.println("a2 = " + a); ///3
				//위 처럼 줄을 바꿔서 전치/후치 가 의미 없어짐
				//하지만 현업에서 어쩔수 없이 사용해야할 경우에는 실수를 방지하기 위해 이 방식으로 쓰라고함 
				
				a=5;
				System.out.println("a= " + a);    //5
				System.out.println("a-- = " + a--);  //5
				System.out.println("--a = " + --a); //3
				
				
		/*
		* <문제>
		* 출력예) 최초값을  a =10, b=10
		* a++ =10, ++b = 11
		* 실행 후 a =11, b =11
		* a-- = 11, --b = 10
		* 실행후 a=10, b=10
		*/
				
		
				
		a = 10;
		b = 10;
		System.out.println("a++ = " +  a++ + ", ++b = " + ++b);  //a은 명령(println)이 모두 끝난후 줄바뀌기전에 1 증가, b는 1증가 후 출력됨 
		System.out.println("실행 후 : a = " + a + ", b = " + b);
		System.out.println("a-- = " + a-- +  ", --b = " + --b); //a은 명령(println)이 모두 끝난후 줄바뀌기전에 1 감소, b는 1감소 후 출력됨
		System.out.println("실행 후 : a = " + a +  ", b = " + b);
		
		
		//주석처리 : 드래그한 상태에서 ctrl + / 해준다
		//print사용
		System.out.print("a++ = " + a++ + ", ++b = " +  ++b + "\n");
		
		
		//printf 사용해서 풀기
		System.out.printf("a++ = %d, ++b = %d \n", a++, ++b);
		System.out.printf("실행 후 a = %d, b= %d \n", a--, --b);
		System.out.printf("a-- = %d, --b = %d \n", a--, --b);
		System.out.printf("실행 후 a = %d, b= %d \n", a--, --b);
				
				
		
				
		/* < 문제 >
		 * 정tn 변수 a와 b를 입력받아서 a는 전치증가연산자를 사용하고 b는 후치감소연산자를 사용하여 두 수의 합을 c에 저장
		 * 한 후 각각 출력하는 프로그램 작성
		 * 입력예)  첫번쨰 정수 >5
		 *        두번쨰 정수 > 6
		 * 출력예
		 * )
		 *       a=6, b =5, c =12
		 */
		
		
		/*
		int c;
		Scanner scn = new Scanner(System.in);  //기존에 선언된 스캐너가 있다면 변수명만 다르게 해서 선언 할 수 있다.
		System.out.print("첫 번째 정수> ");
		a = scn.nextInt();
		System.out.print("두 번째 정수> ");
		b =  scn.nextInt();
		
		c = ++a + b--;   // a는 증가, b는 감소되지 않은 상태로 c에 대입됨 ,  이미 대입이 다 끝나고 다음출로 넘어갈때 b가 증가됨
		
		System.out.println("a = " + a + ", b = " + b + ", c = " + c );
	  //System.out.printf("a = %d, b = %d, c = %d \n", a, b, c);
		*/
		
		
		//비교연산자
	/*	a =10;
		b = 20;
		int c = 20;
		
		System.out.println("a == b: "+ (a == b));  //(a == b)이 소괄호로 묶여있기 때문에 먼저 계산되서 출력됨  false
		System.out.println("b == c : " + (b == c)); //t
		System.out.println("a != b : " + (a !=b));  //t
		System.out.println("b !=c : " + (b!= c));  //f
		System.out.println("a >b : " + (a >b));   //f
		System.out.println("b >= c : " + (b>=c));  //t
		System.out.println("a <= c : " + (a <= c)); //f
		System.out.println("b < c : " + (b<c));      //f
		
	*/	
		
		/* < 문제 >
		 * 3개의 정수 a, b, c 를 입력받아서 a와 b, b와 c를 각각비교하여 같으면 true, 같지 않으면 false를 출력하는 프로그램
		 * 입력예) a값을 입력하세요. >10
		 * 		 b값을 읿력하세요. > 20
		 * 		c값을 입력하세요. >20
		 * 출력예)
		 *  a == b : false
		 * b ==c : true
		 * a != b : true
		 * b != c : false
		 */
		
	/*	Scanner scn = new Scanner(System.in);
		int c;
		System.out.print("a값을 입력하세요 >");
		a = scn.nextInt();

		System.out.print("b값을 입력하세요 >");
		b = scn.nextInt();
		System.out.print("c값을 입력하세요 >");
		c = scn.nextInt();
		
		System.out.println("a == b : " + (a==b));
		System.out.println("b == c : " + (b ==c));
		System.out.println("a != b : " + (a != b));
		System.out.println("b != c : " + (b != c));
		*/
		
		//논리연산자(&&, ||)
	/*	a = 1;
		b = 2;
		int c =3;
		
		System.out.println("(a > b && b < c) : " + (a > b && b < c)); //and 에서는 만약 앞이 false면 뒤에는 실행조차 하지 않는다.
		System.out.println("(a < b || b < c) : " + (a < b || b < c)); //or 에서는 앞이 true면 뒤에는 실행 안함  : 실행 안해도 둘중 하나만 true 면 되서
		//and는 false 가 될 확룰이 높은것을 앞쪽에 놓는것이 좋다
		//or은 true가 될 확률이 높은 것을 앞쪽에 놓는것이 좋다 
	*/	
		
		/* 논리연산자 문제
		 * 3개의 정수a,b,c 를 선언하고 각각 10,20,30으로 초기화 한후 참이면 true, 거짓이면 false 를 출력
		 * 출력예) a > b && a <= b : false
		 * 		a >b || a <= b : true
		 * 		b < c && a < c : true
		 * 		!(a > b && a <= b) : true
		 * 		
		 */
		
	/*	a = 10;
		b =20;
		int c = 30;
		
		System.out.println("a > b && a <= b : " + (a >b && a <=b ));
		System.out.println("a > b || a <= b : " + (a>b || a<=b));
		System.out.println("b < c && a < c : " + (b < c && a < c ));
		System.out.println("!(a > b && a <= b) : " + !(a > b && a <= b) );
	*/	
		
		
		
		// 삼항연산자 문제
		 int x =10, y = 5;
		 int result = (x >= y) ? x : y; // 얘네들을 값이기 때문에 변수에 대입해 줘야한다.
		 System.out.println("x와 y값 중 큰 값은 " + result + "입니다.");
		
		
		/* 삼항연산자 문제
		 * 정수변수 a에 나이를 입력받아 19보다 큰 값을 입력 받았으면 '성인입니다.'로 출력하고 19보다 작으며 '청쇼년입니다.' 로 출력하는 프로그램
		 * 입력예) 나이를 입력하세요. >15
		 * 출력예) 청소년입니다.
		 * 단, 삼항연산자를 이용하여 출력에 사용할 변수는
		 * String memo로 사용함
		 * 예 String memo ="";
		 * 	 memo = "청소년입니다.";
		 * 
		 */
		
		 
		/* 불필요한 변수 선언이 있는 코드
		 *  Scanner scn = new Scanner(System.in);
		 System.out.println("나이를 입력하세요 >");
		 a = scn.nextInt();
		 String child = "";  //String은 클래스이기 때문에 대문자로 시작함
		 child = "청소년입니다.";
		 String adult = "성인입니다.";
		
		 String result1 = (a > 19) ? adult  : child ; 
		 System.out.println(result1);
		 
		 //char abc = ' ';      char타입은 초기화할 때 무조건 공백을 넣어줘야한다 빈값으로 놔두면 오류!!
		 //String abc = "";     String타입은 초기화 할때 ="";만 해줘도 됨 꼭 공백을 안넣어도 된다는게 char 와의 차이점
		*/
		 
	/*	 Scanner scn = new Scanner(System.in);
		 System.out.println("나이를 입력하세요 >");
		 a = scn.nextInt();
		 
		 String memo = (a > 19) ? "성인입니다."  : "청소년입니다." ; 
		 System.out.println(memo);
	*/	 
		 
		/* <문제> 성적 평군내기
		 *  시험점수 3과목을 입력 받아 평균과 통과유무를 출력하는 프로그램 작성
		 *  평균점수가 70점 이상이면 통과, 미만이면 미통과로 처리하는 프로그램
		 *  입력예) 
		 *  	국어점수를 입력하세요 > 80
		 *  	영어점수를 입력하세요 >70
		 *  	수학점수를 입력하세요.> 90
		 *  출력예)
		 *  	70점이상인경우
		 *  	당신의 평균은 80점이고 통과하셨습니다.
		 *  	70점 미만인 경우
		 *  	당신의 평균은 65점이고 미통과 하셨습니다.
		 *  단, 국어 kor, 영어 eng, 수학 math, 평균 avg, 통과여부 memo
		 *  	memo변수는 통과, 미통과만 저장(삼항연산자이용)
		 *  	평균 : (국어+영어+수학)/3
		 *  	String 타입의 printf 서식 문자는 %s
		 */
		
	
	/*	 int kor;
		 int eng;
		 int math;
		 
		 
		 Scanner scn = new Scanner(System.in);
		 System.out.println("국어점수를 입력하세요. > ");
		 kor = scn.nextInt();
		 System.out.println("영어점수를 입력하세요.> ");
		 eng = scn.nextInt();
		 System.out.println("수학점수를 입력해주세요. > ");
		 math = scn.nextInt();
		 
		 int avg = (kor + eng + math) / 3 ;
		 
		 String memo = (avg >=70) ? "통과" : "미통과" ;
		 
	      System.out.printf("당신의 평균은 %d점 이고 %s하셨습니다. \n", avg, memo);
		 
	*/		
		 /*
		  * 참조형 변수(String)은 변수 선언 시 값을 대입해주기 않아도 오류나지 않는다.   String은 클래스이므로 기본 자료형들과는 다르게 자동으로 값을 초기화해준다. 
		  * int abc;  -> 바로 사용할 수 없다 => 출력을 하려고 하면 오류 (=값을 반드시 초기화 해줘야한다)(=값을 초기화 해주기 않고 system.out.print(abc)하면 오류!)
		  * String memo ; ->오류나지 않는다  프로그램이 자동으로 String memo = ""; 으로 작성해주기 때문 (=값을 초기화 해주기 않고 system.out.print(memo)해도 오류 안남)
		  */
		 
	
		 /* 모범코드
		  * int kor, eng, math, avg;
		  * String memo = "";
		  *  Scanner scn = new Scanner(System.in);
		 System.out.println("국어점수를 입력하세요. > ");
		 kor = scn.nextInt();
		 System.out.println("영어점수를 입력하세요.> ");
		 eng = scn.nextInt();
		 System.out.println("수학점수를 입력해주세요. > ");
		 math = scn.nextInt();
		 
		 avg = (kor + eng + math) / 3 ;
		 
		 memo = (avg >=70) ? "통과" : "미통과" ;
		 System.out.printf("당신의 평균은 %d점 이고 %s하셨습니다. \n", avg, memo);
		 
		  */
		 
		 
		 
		 
		 // nextLine() 이용하기
		 // nextLine()을 이용하여 문자열을 입력받은 수로 변환
		 Scanner scn = new Scanner(System.in);
		 System.out.print("정수를 입력");
		 String input = scn.nextLine();
		 int num = Integer.parseInt(input);  // Integer.parseInt()에 매개변수로 string타입을 주고  Integer.parseInt() 에서 나온 반환값을 int로 준다.
		 System.out.println("num : " + num);
		 
	}

}
