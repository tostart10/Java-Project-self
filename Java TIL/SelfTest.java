package sstStudy;

import java.util.*;

public class SelfTest {

	public static void main(String[] args) {
		//문제 다시 풀어보며 복습하기
		
		
		Scanner scn = new Scanner(System.in);
	
		/* 삼항연산자 문제
		 * 정수변수 a에 나이를 입력받아 19보다 큰 값을 입력 받았으면 '성인입니다.'로 출력하고 19보다 작으며 '청쇼년입니다.' 로 출력하는 프로그램
		 * 입력예) 나이를 입력하세요. >15
		 * 출력예) 청소년입니다.
		 * 단, 삼항연산자를 이용하여 출력에 사용할 변수는
		 * String memo로 사용함
		 * 예 String memo ="";
		 * 	 memo = "청소년입니다.";
		 */
		
	/*	System.out.print("나이를 입력하세요.>");
		int a = scn.nextInt();
		
		String result = (a>19) ? "성인입니다." : "청소년입니다." ;
		System.out.println(result);
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
		
	/*	int kor, eng, math, avg;
		
		System.out.print("국어점수를 입력하세요.>");
		kor = scn.nextInt();
		System.out.print("영어점수를 입력하세요.>");
		eng = scn.nextInt();
		System.out.print("수학점수를 입력하세요.>");
		math = scn.nextInt();
		avg = (kor+eng+math) / 3;
		
		String memo = (avg > 70) ? "통과" : "미통과";
		
		System.out.printf("당신의 평균은%d점이고, %s하셨습니다. \n", avg, memo);
	*/	
		
	/*문제 5
	 * 정수 2개를 입력 받아서 큰수와 작은수를 차례로 출력하는 프로그램
	 * 입력예)2 9
	 * 출력예) 입력받은 수 중 큰 수는 9이고 작은수는 2입니다.
	 * 단, 큰수는 항상 a변수, 작은수는 항상 b변수에 사용
	 */
		
/*	int a, b, tmp;
	
	System.out.print("숫자 2개를 입력하세요.>");
	a = nextInt();
	b = nextInt();
	
	if(a<b) {
		tmp = a;
		a = b;
		b = tmp;
	}
	
	System.out.printf("큰 수는 %d이고 작은수는 %d입니다.");
		
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
/*	System.out.print("정수를 입력하세요.>");
	a = scn.nextInt();
	
	if(a>1 && a<10) {
		System.out.println("1에서 10 사이 정수를 입력하셨습니다.");
	}
	else if(a>10) {
		System.out.println("10보다 큰 수를 입력하셨습니다.");
	}
		else if(a==0) {
		System.out.println("0을 입력하셨습니다.");
	}
	else {
		System.out.println("음수를 입력하셨습니다.");
	}
	*/
	
	
	/* if - else if- else
	 * 문제) 주사위를 두번 던져서 나온 수를 입력받아 두수가 모두 4이상이면 "이겼습니다", 한개만 4이상이면 "비겼습니다", 모두 4미만이면 "졌습니다"라고 출력
	 * 입력예)주사위 던진 결과를 입력하세요.>3 4
	 * 출력예)비겼습니다
	 * 단, 주사위 입력값은 1~6 사이 값이어야함
	 */
	
	//중첩을 사용하지 않고 풀기
	/*System.out.print("주사위 던진 결과를 입력하세요.>");
	a = scn.nextInt();
	b = scn.nextInt();
	
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
	
	
	//switch- case문
	/*
	 * 현재월을 입력받아 계절을 출력하는 프로그램
	 * 3,4,5월 봄 /  6,7,8월 여름 / 9,10,11 월 가을  /  12,1,2얼
	 * 단, 입력값은 1~12사이의 값만 입력 받을 수 있음 (예외처리는 안하겠다는 뜻)
	 */
	
	/*System.out.print("현재월을 입력하세요.>");
	int a = scn.nextInt();
	
	switch (a) {
	case 3 : 
	case 4 :
	case 5 :
		System.out.println("봄입니다.");
		break; //까먹지 않기!!
	case 6 :
	case 7 :
	case 8 :
		System.out.println("여름입니다.");
	case 9 :
	case 10 :
	case 11 :
		System.out.println("가을입니다.");
		break;
	case 12 :
	case 1 :
	case 2 :
		System.out.println("겨울입니다.");
		break;
	default:
		System.out.println("월을 잘못 입력하셨습니다.");
	}
	
	*/
	
	
	/*	문제)5명의 성적을 입력받아서 총점과 평균을 출력하는 프로그램
		입력예)90 58 100 66 88
		출력예)총점 : 429
			평균: 85.8   -> %.1f
		단, 총점은 sum(int), 평균은 avg(double)변수로 사용
		평균은 계산시 '총점/5.0'
	*/
	
/*	int score, i, sum=0;
	Double avg;
	
	for(i=1 ; i<= 5 ; i++) {
		score = scn.nextInt();
		sum += score;
	}
	avg = (double)sum /5;
	System.out.println("총점" +sum);
	System.out.println("평균" +avg);
	
	*/
	
	// 중첩 for복습
	/*문제) 변수 i, j값을 이용하여 아래와 같이 출력하는 프로그램
	 * 출력예)11111
	 * 		22222
	 * 		33333
	 * 		44444
	 * 		55555
	 * 
	 * 		12345
	 * 		12345
	 * 		12345
	 * 		12345
	 * 		12345
	 */
	
/*	int i, j;
	for(i=1 ; i<=5; i++) {
		for(j=1 ; j<=5 ; j++) {
			System.out.print("i");
		}
		System.out.println(); //줄바꿈 역할
	}
	


*/	
	
	/* 다중 for 별찍기
	 *  문제)정수를 입력받아서 n줄 만큼 다음과 같이 출력하는 프로그램
	 * 입력예)5
	 * 출력예)*
	 * 		**
	 * 		***
	 * 		****
	 *		***** 
	 */
	
/*	int i, j, num;
	System.out.print("숫자를 입력하세요.>");
	num = scn.nextInt();
	
	for(i=1 ; i<=num; i++) {
		for(j=1 ; j<=i ; j++) {
			System.out.print("*");
		}
		System.out.println(); 
	}
		//입력받은 숫자만큼 역삼각형 별출력
	int i,j, num;
	System.out.print("숫자를 입력하세요.>");
	num = scn.nextInt();

	
	for(i=num ; i>0 ; i--){
		for(j=1 ; j<=i ; j++) {
			System.out.print("*");
		}
		System.out.println();
	}
*/	
	
	
	//예습
	//while문으로 1~100까지 합 구하기
	//while문은 조건식이 false일 경우 종료
/*	int i=1, sum = 0;
	
	while(i<=100) {
		sum += i;
		i++;
	}
	System.out.printf("1~100까지의 합 : %d", sum);
	
	//do-while문
	//while에 조건식을 작성하기 때문에 조건식이 false여도 do에있는 실행문들은 한번이라도 실행된다.
	//while 뒤에 꼭 ; 써줘야한다.
	//조건이 true면 계속 반복한다.
	String inputString;
	
	do {
		System.out.println("메시지를 입력하세요.>");
		inputString = scn.nextLine();
		System.out.println("inputString");
	} while(! inputString.equals("q")); //입력된 내용이 q가 아니라면 계속 반복
		
	System.out.println("프로그램 종료.");
	*/
	
	//다차원 배열
/*	int[][] scores = {
			{80, 90, 96},  //여러개의 배열요소를 넣어줄 때는 ,로 구분해줘야한다.
			{76, 88}
	}; //배열 중괄호 뒤에 꼭 ; 붙여주기!!
	
	//배열의 길이
	System.out.println("1차원 배열 길이(반의 수) : " + scores.length);
	System.out.println("2차원 배열 길이(첫 번째 반의 학생 수) : " + scores[0].length);
	System.out.println("차원 배열 길이(두 번째 반의 학생 수) : " + scores[1].length);
	
	//첫번째 반의 새 번째 학생의 점수 읽기
	System.out.println("scores[0][2]:"+ scores[0][2]);
	//두 번째 반의 두 번째 학생의 점수 읽기
	System.out.println("scores[1][1]:"+ scores[0][1]);
	//첫 번째 반의 평균 점수 구하기
	int class1Sum = 0;
	for(int i=0; i<scores[0].length; i++) {
		class1Sum += scores[0][i];
	}
	double class1Avg = (double) class1Sum / scores[0].length;
	System.out.println("첫 번째 반의 평균점수:"+ class1Avg);
	
	//전체 학생의 평균 점수 구하기
	int totalStudent = 0;
	int totalSum = 0;
	for(int i=0 ; i<scores[i].length ; i++) {  //반의 수만큼 반복
		totalStudent += scores[i].length;      //반의 학생 수 합산
		for(int k=0 ; k<scores[i].length;  ) { //해당 반의 학생 수만큼 반복
			totalSum += scores[i][k];			//학생 점수 합산	
		}
	}
	double totalAvg = (double) totalSum / totalStudent;
	System.out.println("전체 학생의 평균 점수: "+ totalAvg);
	
	
	//객체 참조배열
	//String, interface 자료형은 참조이다!!!! 값이 직접 대입되는 것이 아님!
	String[] language = new String[3];
	language[0] = "Java";  
	language[1] = "Java";
	language[2] = new String("Java");
	
	System.out.println(language[0]== language[1]);	//true: 같은 객체 참조
	System.out.println(language[0]== language[2]);	//false:다른 객체 참조
	System.out.println(language[0].equals(language[2]) );//true:문자열이 동일 (문자열 자체만 비교하는 것이기때문)
	
	//배열 복사
	//배열은 한번 정의하면 크기를 바꿀수 없기 때문에 크기에 변동이 있을 경우 새로운 배열을 만들고 이전 배열에서 항목들을 복사해온다.
	//for문을 사용할 수도 있지만 복사하는 공식이 있다.
	String[] oldArray = {"java", "array", "copy"}; //길이 3 배열
	String[] newArray = new String[5]; //길이 5배열
	System.arraycopy(oldArray, 0, newArray, 0, oldArray.length);//배열 항목 복사
	//(원본배열,원본배열 복사시작인덱스, 새 배열, 새 배열 붙여넣기 시작 인덱스, 복사 항목수 )
	for(int i=0; i<newArray.length; i++) {
		System.out.print(newArray[i]+", ");
	}
	//String타입은 참조기 때문에 복사해서 붙여넣어도 같은 객체를 참조한다(=같은 객체의 주소가 들어감
	
	
	//배열 항목 반복을 위한 향상된 for문
	/*for( 타입변수 : 배열){
	 * 	실행문;
	 * }
	 */
	
	//for문에 인덱스가 필요 없을때
	int[] scores = {95, 71, 84, 93, 87};
	int sum = 0; 
	for (int score : scores) { //배열 항목 전체 합 구하기
		sum = sum + score;
	}
	
	//for문에 인덱스가 필요한 경우
	for(int i =0; i<scores.length; i++) {
		sum+= scores[i];
	}
	System.out.println("점수 총합 = "+ sum);
	
	double avg = (double) sum /scores.length;
	System.out.println("점수 평균 = "+ avg);
	
	
	//public static void main(String[] args)에서 String[] args 의 역할
	//cmd 창에서 매개 값을 입력하면 String[] args이 배열값으로 만들어 저장함
	String strNum1 = args[0]; //String[] args가 string타입 배열이기 때문에 변수도 맞춰줘야함
	String strNum2 = args[1];
	
	int num1 = Integer.parseInt(strNum1); //String타입으로 들어왔던 값들을 int 형으로 전환
	int num2 = Integer.parseInt(strNum2);
	int result = num1+num2;
	System.out.println("result : "+result);
	
	}

}
