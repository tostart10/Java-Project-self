import java.util.*;

public class MySample0510 {

	public static void main(String[] args) {
		Scanner scn = new Scanner(System.in);
		/*
		 *  제어문(조건문 - if)
		 *  <문제> 정수를 입력받아 그 수가 10보다 큰경우 출력하는 프로그램
		 *  입력예) 정수입력 >5
		 *  출력예) 10
		 *  	10보다 큰수를 입력하셨습니다.
		 *  	if 끝.
		 *  단, 10보다 작은수인 경우는 출력을 if 끝. 만 출력함
		 *  
		 */
	/*	int a;
		
		System.out.print("정수입력>");
		a= scn.nextInt();
		
		if(a > 10) { //조건이 true 일때만 실행된다
			System.out.println("10 보다 큰 수를 입력하셨습니다.");
		}
		
		System.out.println("if 끝");
	*/	
		
		/* 문제 2) if문 2개로 구현
		 * 입력예) 숫자를 입력하세요.> 3
		 * 출력예) 입력하신 숫자는 0이 아닙니다.
		 * 		입력하신 숫자는 3입니다.
		 * 
		 * 입력예) 숫자를 입력하세요.>0
		 * 출력예)입력하신 숫자는 0입니다.
		 */

		
		
		//이렇게 if문 만 두개 쓰면 첫번째 if문이 ture 여도 두번째 if문까지 모두 실행된다.
	/*	int a;
		
		System.out.print("숫자를 입력하세요.>");
		a = scn.nextInt();
		
		if(a != 0) {
			System.out.println("입력하신 숫자는 0이 아닙니다.");
			System.out.printf("입력하신 숫자는 %d입니다.\n", a);
		}
		
		
		if(a == 0) {
			System.out.printf("입력하신 숫자는 0입니다.");
		}
	*/	
		
		/* 문제 3
		 * 정수를 입력받아 입력받은 숫자를 출력하고 음수이면 'minus'라고 출력하는 프로그램
		 * 입력예)-5
		 * 출력예)-5
		 * 		
		 * 입력예)7
		 * 출력예)7
		 */
		
/*		int a = scn.nextInt();
		System.out.println("숫자를 입력하세요.>");
		
		System.out.println(a); 
		
		if(a < 0) {
			System.out.println("minus");
		}
	*/	//if(a < 0); 처럼 뒤에 ; 을 쓰는 실수가 많이 발생함 -이렇게 되면 각각 다른문장이 되기때문에 System.out구문이 계속 실행된다.
		//if(a < 0); 로 쓰게된다면 참일 때 아무것도 실행하지마 라는 뜻이됨
		//if안에 들어가는 문장이 1문장이면 {}을 안써도 되지만 2줄 이상이면 {}생략불가!!
		//{}는 생략하지마라
		
		
		
		/*문제 4
		 * 정수를 하나 입력받아서 0보다 큰 경우. 0인경우, 음수인경우를 체크하여 출력하는 프로그램(단, if문 3번사용)
		 * 입력예)숫자를 입력하세요.>5
		 * 출력예)입력하신 값은 5이며, 0보다 큽니다.
		 * 
		 * 입력예2)숫자를 입력하세요.>0
		 * 출력예2)입력하신 값은 0이며, 0과 같습니다.
		 * 
		 * 입력예3)숫자를 입력하세요.>-1
		 * 출력예3)입력하신 값은 -1 이며, 음수입니다.
		 */
		
		
/*		System.out.println("숫자를 입력하세요.>");
		int a = scn.nextInt();
		int b = 10;
		
		System.out.printf("입력하신 값은 %d이며, ", a);
		
//		if(a > 0) {
//			System.out.println("0보다 큽니다.");
//		}
		
		//위에와 동일한 것으로 &&, || 테스트
		System.out.println("b before: " + b);
		
		 //조건식에는 ++ --식 쓰지 마셈!  조건에 맞지 않는 값이라면 ++ --가 되지 않는다.(=조건이 false라면 값변화 없다)
		//조건중 ||의 경우 앞에가 true면 뒤에는 연산하지 않기 때문에 만약 뒤쪽에 증감연산자가 있다면 값이 증감되지 않는다.
		//if(a >0 && ++b > a)의 경우 &&보다 ++이 먼저연산되기 때문에b의 값이 증가된 후  &&로 비교되는거임
//		if(a >0 && ++b > a) {
//			System.out.println( "0과 같습니다.");
//		}
		
		
		// ||는 앞이 true면 뒤에는 연사자체를 안하므로 b의 값이 증가가되지 않는다
		if(a >0 || ++b > a) { 
			System.out.println( "0과 같습니다.");
		}
		
		System.out.println("b after: " + b);
		
		if(a < 0) {
			System.out.println("음수 입니다.");
			
			
			
		/*문제 5
		 * 정수 2개를 입력 받아서 큰수와 작은수를 차례로 출력하는 프로그램
		 * 입력예)2 9
		 * 출력예) 입력받은 수 중 큰 수는 9이고 작은수는 2입니다.
		 * 단, 큰수는 항상 a변수, 작은수는 항상 b변수에 사용
		 */
		
		//이 예가 정렬알고리즘에서 쓰이는 대표적 예
		
/*		System.out.println("숫자를 입력하세요.>");
		int a = scn.nextInt();  // 이렇게 a와 b를 입력받는 코드는 따로 써줘야하지만 nextInt()를 사용했으므로, 
		int b = scn.nextInt();  //콘솔에서는 2 10 으로 입력하면 프로그램이 2는 a로, 10은 b로 자동으로 값을 넣어준다.
		int temp;
		
		
		
		if (a < b) {
			temp = a;
			a = b;
			b = temp;
			
		}
		System.out.println("입력받은 수 중 큰수는 " + a + "작은수는 " + b + "입니다.");
	*/	
		
		
		/*문제) if~else
		 * 정수를 입력바다 10보다 큰수를 입력받은 경우와 10보다 작은 값을  입력받은 경우를 구분하기 위한 프로그램
		 * 입력예)15
		 * 출력ㅇㅖ)10보다 큰 수를 입력하셨습니다
		 * 
		 * 입력예)9
		 * 출력예)10보다 작은 값을 입력하셨습니다.
		 */
		
	/*	int a = scn.nextInt();
		
		if(a > 10) {
			System.out.println("10보다 큰 수를 입력하셨습니다.");
		}
		
		else {
			System.out.println("10보다 작은 값을 입력하셨습니다.");
		}
*/		
		
		
		/*
		 * 문제) 점수를 입력받아80점 이상이면 합격 아닌면 불합격 출력
		 * 입력예)점수를 입력하세요.>
		 * 출력예)축하합니다. 합격입니다.
		 * 
		 * 입력예)점수를 입력하세요>76
		 * 출력예)죄송합니다. 불합격입니다.
		 */
		
		
	/*	System.out.println("점수를 입력하세요.");
		int a = scn.nextInt();
		
		if(a >= 80) {
			System.out.println("축하합니다. 합격입니다.");
		}
		
		else {
			System.out.println("죄송합니다. 불합격입니다.");
		}
	*/	
		
		
		
		/* 문제 2) if else로 구현
		 * 입력예) 숫자를 입력하세요.> 3
		 * 출력예) 입력하신 숫자는 0이 아닙니다.
		 * 		입력하신 숫자는 3입니다.
		 * 
		 * 입력예) 숫자를 입력하세요.>0
		 * 출력예)입력하신 숫자는 0입니다.
		 */
		
	/*	System.out.println("숫자를 입력하세요.>");
		int a = scn.nextInt();
		
		if(a != 0) {
			System.out.println("입력하신 숫자는 0이 아닙니다.");
			System.out.printf("입력하신 숫자는 %d입니다.", a);
		}
		
		else {
			System.out.printf("입력하신 숫자는 %d입니다.", a);
		}
		
		
		//두번째 방법
		if(a != 0) {
			//System.out.println("입력하신 숫자는 0입니다.");
			System.out.printf("입력하신 숫자는" + a + "입니다.");
		}
		
		else {
			System.out.println("입력하신 숫자는 0이 아닙니다.");
			System.out.printf("입력하신 숫자는" + a + "입니다.");
		}
	*/	
		
		/* if- else if - else
		 * else를 생략하는 경우는 조건외의 경우에는 아무것도 하지 않게 하고싶을떄 생략함
		 * esle에 대한 조건을 써주는것 자체만으로도 용량을 차지하기 때문, 시스템에 부하가 가장많이가는것이 연산이기때문
		 * 
		 * 문제 ) 정수를 입력받아 값이 10보다 큰 경우와 0인경우 음수인경우를 체크하는 프로그램
		 * 입력예)정수를 입력하세요.>11
		 * 출력예)10보다 큰 수를 입력하셨습니다.
		 * 
		 * 입력예)정수를 입력하세요>0
		 * 출력예)0을 입력하셨습니다.
		 * 
		 * 입력예)정수를 입력하세요>-1
		 * 출력예)음수를 입력하셨습니다.
		 * 
		 * 입력예4)정수를 입력하세요>9
		 * 출력예4)1에서 10사이 정수를 입력하셨습니다.
		 */
		
		
		//빠지는 숫자가 없게 조건범위 잘 정하기!!
	/*	System.out.println("숫자를 입력하세요.>");
		int a = scn.nextInt();
		
		if(a>=1 && a <=10) {
			System.out.println("1에서 10사이 정수를 입력하셨습니다.");
		}
		
		else if(a >10){
			System.out.println("10보다 큰수를 입력하셨습니다.");
		}
		
		else if(a < 0){
			System.out.println("음수를 입력하셨습니다.");
		}
		
		else {
			System.out.println("0을 입력하셨습니다.");
		}
		
		
		//두번째 방법
		System.out.println("숫자를 입력하세요.>");
		int a = scn.nextInt();

		if(a >10){
			System.out.println("10보다 큰수를 입력하셨습니다.");
		}
		else if(a > 0){
			System.out.println("1에서 10사이 정수를 입력하셨습니다.");
		}
		else if(a == 0){
			System.out.println("0을 입력하셨습니다.");
		}
		else {
			System.out.println("음수를 입력하셨습니다.");
		}
		
		
		//중첩을 이용하지 않고 조건정하기
		
		if(a >89) {
			System.out.println("수");
		}
		else if(a > 79) {
			System.out.println("우");
		}
		else if(a > 69) {
			System.out.println("미");
		}
		else if(a >= 60) {

			System.out.println("양");
		}
		else if(a < 60 && a >= 0) {

			System.out.println("가");
		}
		else {
			0~100점 사이 입력이 가능합니다.
		}
	}
		
	*/	
		
		/* 문제) 점수를 입력받아 "수우미양가" 를 출력하는 프로그램
		 * if- else if - else
		 * 입력예) 점수를 입력하세요.>9
		 * 출력예)우
		 * 단, 90~100:수,  80~90:우, 70~79:미,  60~69양, 60미만:가
		 * 
		 */
		
		
	/*	System.out.println("숫자를 입력하세요.>");
		int a = scn.nextInt();
		
		
		//중첩 if를 통한 예외처리
		if(a >= 0 && a <= 100) { 
			if(a >89) {
				System.out.println("수");
			}
			else if(a > 79) {
				System.out.println("우");
			}
			else if(a > 69) {
				System.out.println("미");
			}
			else if(a >= 60) {
	
				System.out.println("양");
			}
			else {
				System.out.println("가");
			}
		}
		else {
			System.out.println("0~100점 사이 입력이 가능합니다.");
		}
	*/	
		
		/*문제) 주사위를 두번 던져서 나온 수를 입력받아 두수가 모두 4이상이면 "이겼습니다", 한개만 4이상이면 "비겼습니다", 모두 4미만이면 "졌습니다"라고 출력
		 * 입력예)주사위 던진 결과를 입력하세요.>3 4
		 * 출력예)비겼습니다
		 * 단, 주사위 입력값은 1~6 사이 값이어야함
		 * 
		 */
		
		//스스로 풀어보기
/*		System.out.println("주사위 던진 결과를 입력하세요.>");
		int a = scn.nextInt();  //scn.nextInt()에 2 3 5 처럼 세개를 넣어도 2개만 입력받는다
		int b = scn.nextInt();  //2개만 입력받고 그 이상은 받지 않으려면 다른조건을 써줘야함
		
		
		if( a >= 1 && a <= 6) {
			if( b >= 1 && b <= 6) {       // 두번째 if 이므로 이if에 대한 else문도 첫 번째 if안에 있어야 한다.
				if(a >= 4 && b >= 4) {
					System.out.println("이겼습니다.");
				}
				else if(a >= 4 && b <= 3){
					System.out.println("비겼습니다.");
				}
				else if(b >= 4 && a <= 3){
					System.out.println("비겼습니다.");
				}
				else if(a <= 3 && b <= 3){
					System.out.println("졌습니다.");
				}
			}
			else if(b < 1 || b >6) {
				System.out.println("1~6사이의 숫자를 입력하세요.");
			}
		}
		else if(a < 1 || a >6) {
			System.out.println("1~6사이의 숫자를 입력하세요.");
		}
		
		
		
		//다른방법1 중첩이 아닌 if -else if
		System.out.println("주사위 던진 결과를 입력하세요.>");
		int a = scn.nextInt();
		int b = scn.nextInt();
		
		if((a < 1 || a > 6) || (b < 1 || b > 6) ) {
			System.out.println("입력값은 1~6사이로 하세요.");
		}
		
		else if(a >= 4 && b >= 4) {
			System.out.println("이겼습니다.");  //&&가 ||보다 넒은 범위이기 때문에 ||코드 위쪽에써주는 것이 좋다.
		}
		else if(a >= 4 || b >= 4) {
			System.out.println("비겼습니다.");
		}
		else {                                //(a < 4 || b < 4)
			System.out.println("졌습니다.");
		}
	*/	
		
		
		
		
		/* 중첩 if 문제 ) 위와 동일한 주사위문제
		 * 단, if/ else 만 사용
		 
		
		if(정상적일떄) {
		//이겼는지, 비겼나, 졌나
		}
		else {
			//입력값 오류시
			//두 값이 모두 오류인, 첫번째 입력값이 오류
			//두번째 입력값이 오류인지 체크
		}
		*/
		
		System.out.println("숫자를 입력하세요.");
		int a = scn.nextInt();
		int b = scn.nextInt();
		
		if((a>=1 && a <=6) && (b >=1 && b <= 6)) {
			if(a >=4 && b >= 4) {
			System.out.println("이겼습니다.");
			}
			else if(a >= 4 || b >= 4) {
				System.out.println("비겼습니다.");
			}
			else {                                //(a < 4 || b < 4)
				System.out.println("졌습니다.");
			}
		}
		else {
			if((a < 1 || a>6) && (b < 1|| b >6)) {
				System.out.println("입력값 오류");
			}
			else if(a < 1 || a> 6) {
				System.out.println("첫번째 입력 오류");
			}
			else if(b < 1 || b> 6) {
				System.out.println("두번째 입력 오류");
			}
		}
		
		
		
	}	
}


