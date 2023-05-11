import java.util.*;

public class MySample0511 {

	public static void main(String[] args) {
		Scanner scn = new Scanner(System.in);
		
		
		/* 중첩 if 
		 * 문제) 정수 3개를 입력받아 그 중 가장 큰수를 출력하는 프로그램
		  입력예) 세개의 정수를 입력하세요>1  5  4
		  출력예)입력받은 수중 가장 큰 수는 5입니다.
		  단, 출력은 max 변수를 사용함.
		  a, b, c, max;
		 */
		
/*		int a, b, c, max;
		
		a =scn.nextInt();
		b= scn.nextInt();
		c = scn.nextInt();
		max = scn.nextInt();
		
		
		if(a >b ) {      
			if(a > c) {   //a가 c보다 크다면 c는 당연히 b보다 큼 -> a >c >b
				max = a;
			}
			else {
				max = c;  //c기 a보다 크다면  -> c>a>b
			}
		}
		
		else {
			if(b>c) {
				max = b;  // b > a > c
			}
			else {
				max = c;  // c > b > a
			}
			
		}
		
		System.out.printf("입력받은 수 중 가장 큰 수는 %d입니다. \n", max);
	*/	
		
		/* 문제2
		 * 점수를 입력받아 90~100사이는 'A'이면서 98~100 점은 'A+'로 나타내고 90~93점은 'A-'로 나타내고 94~97점은 'A'로 나타내는 프로그램
		 * 단, 80~83점은 'B-,  84~87점은 'B', 88~89점은 'B+' 표시로 하고 A, B를 제외한 나머지는 'C'학점으로 표시함.
		 * 입력예)점수를 입력하세요 >100
		 * 출력예1)당신의 점수는 100점입니다.
		 * 		당신의 학점은 A+입니다.
		 * 
		 * 입력예2)점수를 입력하세요 >81
		 * 출력예2)당신의 점수는 181점입니다.
		 * 		당신의 학점은 B-입니다.
		 * 
		 * 입력예3)점수를 입력하세요 >85
		 * 출력예3)당신의 점수는 85점입니다.
		 * 		당신의 학점은 B입니다.
		 * 단, 점수는 0~100 사이만 입력하세요. (이 문제에서는 0~100이 아닌 숫자에대한 예외처리는 다루지 않음)
		 */
		
	/*	//스스로 해보기
		int score; //점수
		char grade, opt ; //학점 , 부호
		
		System.out.println("점수를 입력하세요.>");
		score = scn.nextInt();
		grade = (char)scn.nextInt();
		opt = (char)scn.nextInt();
		
		if(score >= 90) { 
			if(score <= 98) { //98~100점
				grade = 'A';
				opt = '+';
				if(score >=94) {  //94~97
					grade = 'A';
					opt = ' ';
				}
					else {
						grade = 'A';    //90-93
						opt = '-';
					}
			}
		}
		else if(score >= 80){
			if(score >= 88) {   
				grade = 'B';  //88-89점
				opt = '+';
				if(score >= 84 ) {
					grade = 'B'; //84-87
					opt = ' ';
				}
					else {
						grade = 'B';  //80-83
						opt = '-';
					}
			}
		}
		else {
			grade = 'C';
			opt = ' ';
		}
		
		//출력
		System.out.printf("당신의 점수는 %d 입니다.\n", score);
		System.out.printf("당신의 학점은 %c%c 입니다. \n", grade, opt);
	*/	
		
		
		
	/*	//모범답안
		System.out.println("점수를 입력하세요.>");
		score = scn.nextInt();
		grade = (char)scn.nextInt();
		opt = (char)scn.nextInt();
		
		if(score >= 90) {
			grade = 'A'; //이 if안에서 반복되는 구문이므로 여기에 써주면 안에 있는 if에 써주지 않아도 됨. (하위if에서는90점 이상인 숫자에대해서만 다루기때문)
			
			if(score >= 98) {
				opt = '+';
			}
			else if(score <=93) {
				opt = '-';
			}
			else {			//변수 opt를 공백으로 초기화했다면,
				opt = ' ';   //프로그램을 한번만 실행할 때는 필요 없지만 반복해서 실행한다면 꼭 변수opt 값을 덮어쓰기 해줘야하므로 꼭 필요함
			}
		}
		else if(score >=80){
				grade = 'B'; 
			
			if(score >= 88) {
				opt = '+';
			}
			else if(score <= 83) {
				opt = '-';
			}
			else {			
				opt = ' ';   
				
			}
		}
		else {
			grade = 'C';
			opt = ' ';
		}
		
		
		
		System.out.printf("당신의 점수는 %d 입니다.\n", score);
		
		//opt가 공백일 경우 출력문이 매끄럽지 않은점을 보안하기 위한 if
		//char타입은 == 으로 비교 (char 안에는 아스키코드가 있어서 유일하게 int표현으로 비교가능)
		//(정수와 똑같이==을 사용)(char 타입은 ==사용가능,  String타입은 안됨 주의!)
		if(opt == ' ') {    									
			System.out.printf("당신의 학점은 %c 입니다. \n", grade);  
		}
		else {
			System.out.printf("당신의 학점은 %c%c 입니다. \n", grade, opt);
		}
	*/	
		
	/*	//switch~case 문 기본문법
        //break 뒤에 꼭 ; 써주기
        //default는 마지막에 사용하는 것이 좋다
        //만약 case 중간에 default를 넣게 된다면 꼭 break;를 써줘야한다.
		int a = 5;
		
		switch(a) {
		case 3:
			System.out.println("3월");
			break;
		default:
			System.out.println("default");
		}
	*/
		
		/*
		 * 현재월을 입력받아 계절을 출력하는 프로그램
		 * 3,4,5월 봄 /  6,7,8월 여름 / 9,10,11 월 가을  /  12,1,2얼
		 * 단, 입력값은 1~12사이의 값만 입력 받을 수 있음 (예외처리는 안하겠다는 뜻)
		 */
		
	/*	System.out.println("현재 월을 입력하세요.>");
		int month  =scn.nextInt();
		
		switch(month){
		case 3 :
			System.out.println("현재 계절은 봄입니다.");	
			break;
		case 4 :
			System.out.println("현재 계절은 봄입니다.");	
			break;
		case 5 :
			System.out.println("현재 계절은 봄입니다.");	
			break;
		case 6 :
			System.out.println("현재 계절은 여름입니다.");	
		  break;
		case 7 :
			System.out.println("현재 계절은 여름입니다.");	
			break;
		case 8 :
			System.out.println("현재 계절은 여름입니다.");	
			break;

		case 9 :
			System.out.println("현재 계절은 가을입니다.");	
			break;
		case 10 :
			System.out.println("현재 계절은 가을입니다.");	
			break;
		case 11 :
			System.out.println("현재 계절은 가을입니다.");	
			break;
		case 12 :
			System.out.println("현재 계절은 겨울입니다.");	
			break;
		case 1 :
			System.out.println("현재 계절은 겨울입니다.");	
			break;
		case 2 :
			System.out.println("현재 계절은 겨울입니다.");	
			break;
		}
	*/	
		
		
	/*	//위의 switch 문 줄이기
        //switch는 break가 없으면 값이 참인것 뿐만 아니라 다른것들도 모두 출력되기 때문에 겹치는 문구가 있다면
        //구문과 break를생략해서 코드를 간결하게 할 수 있다.
		
		System.out.println("현재 월을 입력하세요.>");
		int month  =scn.nextInt();
		
		switch(month){
		case 3 :
		case 4 :
		case 5 :
			System.out.println("현재 계절은 봄입니다.");	
			break;
		case 6 :
		case 7 :
		case 8 :
			System.out.println("현재 계절은 여름입니다.");	
			break;
		case 9 :
		case 10 :
			
		case 11 :
			System.out.println("현재 계절은 가을입니다.");	
			break;
		case 12 :
		case 1 :
		case 2 :
			System.out.println("현재 계절은 겨울입니다.");	
			break;
		default:
			System.out.println("월을 잘못입력하셨습니다.");
		}
	*/	
		
	/*	// 위의 문장을 if 문으로 바꿔보기
		// 혼자해보기
		int month = scn.nextInt();
		
		if(month >=1 ) {
			if(month <= 2) {
				System.out.println("현재 계절은 겨울입니다.");
			}
			else if(month < 6) {
				System.out.println("현재 봄은 입니다.");
			}
			else if(month < 9) {
				System.out.println("현재 계절은 여름입니다.");
			}
            else if(month < 12) {
				System.out.println("현재 계절은 가을입니다.");
			}
			else {
				System.out.println("현재 계절은 입니다.");
			}
		}
		else if(month =12){
			System.out.println("현재 계절은 겨울입니다.");
		}
		else {
			System.out.println("월을 잘못입력하셨습니다.");
		}
		
		
		//방법2
		System.out.println("월을 입력하세요.");
		int month = scn.nextInt();
		
		if(month == 3 || month == 4 || month ==5 ) {
				System.out.println("현재 계절은 봄입니다.");
			}
		else if(month == 6 || month == 7 || month ==8 ) {
			System.out.println("현재 계절은 여름입니다.");
		}
		else if(month == 9 || month == 10 || month ==11 ) {
			System.out.println("현재 계절은 가을입니다.");
		}
		else if(month == 12 || month == 4 || month ==5 ) {
			System.out.println("현재 계절은 겨울입니다.");
		}
		else {
			System.out.println("월을 잘못입력하셨습니다.");
		}
	*/	
		
		
		
		/*switch -case문
		 * 문제) 아래의 메뉴에서 선택한 메뉴를 알려주는 프로그램
		 * 단, 해당 숫자 이외에 갑을 입력받을 겨우"잘못 입력하셨습니다." 메시지 출력
		 * 
		 * 입력예)1.추가
		 * 		2.수정
		 * 		3.삭제
		 * 		메뉴번호를 선택하세요.>2
		 * 출력예)수정을 선택하셨습니다.
		 * 단, switch case문에서는 추가를, 수정을, 삭제를, 잘못 에 해당하는 것만 출력하고 선택하셨습니다 를 한번만 출력하게 프로그램
		 * 
		 */
/*		System.out.println("1.추가");
		System.out.println("2.수정");
		System.out.println("3.삭제");
		System.out.print("메뉴번호를 선택하세요.>");
		int num = scn.nextInt();
		
		switch(num){
		case 1 :
			System.out.print("추가를");
			break;

		case 2 :
			System.out.print("수정을");
			break;
		case 3 :
			System.out.print("삭제를");
			break;

		default:
			System.out.print("잘못");
		}
		
		System.out.println(" 선택하셨습니다.");
		
			
		/*switch- case문
		 * 점수를 입력받아 학점을 출력하는 프로그램
		 * 점수가 90~100:'A' 80~98:'B'  70~9:'C'   나머지는 'F'로 정의(char변수 memo사용)
		 * 입력예)당신의 점수를 입력하세요(1~100)>82
		 * 출력예)당신의 학점은 B입니다.
		 */
			
	/*	//switch 문에서는 비교 연산이 안됨 -> 대신 산술연산자 이용
		//혼자 해보기
		char memo = ' ';
		System.out.print("당신의 점수를 입력하세요.(1~100)  >");
		int num = scn.nextInt();
		num = num / 10;    //되도록이면 원본 변수의 값을 변경하는 이런 코드는 좋지 않다.
		
		switch(num) {
			case 10:  //10은 9와 같은 결과를 출력하기 때문에 내용생략하고 9까지 흐름을 흘려보내서 출력되도록 간결하게 작성하는게 좋다.
			case 9:
				memo = 'A';
				break;      //break; 는 현재 코드를 감싸고 있는 { }를 빠져나간다. 충접문에서 빠져나갈때 어디로 빠져나가는지 잘 파악하기!!! 
			case 8:
				memo = 'B';
				break;
			case 7:
				memo = 'C';
				break;
			default:
				memo = 'F';
			break;
		}
		
		System.out.println("당신의 학점은 " + memo + "입니다.");
			
		
		
		//모범코드
		char memo = ' ';
		System.out.print("당신의 점수를 입력하세요.(1~100)  >");
		int score = scn.nextInt();
		
		switch(score/10) {
			case 10:
				memo = 'A';
				break;
		
			case 9:
				memo = 'A';
				break;
			case 8:
				memo = 'B';
				break;
			case 7:
				memo = 'C';
				break;
			default:
				memo = 'F';
			break;
		}
		
		System.out.println("당신의 학점은 " + memo + "입니다.");
	*/	
	
		
		
	/*	//반복제어문 for
	
		int i, sum=0;
		
		for( i = 1; i <= 5 ; i++) {
			sum += i;
			System.out.printf("i=%d, sum=%d\n", i, sum);
		}
		
		System.out.printf("sum : %d \n", sum);
		System.out.printf("i : %d \n", i);
		
		
		
	   /*for문
		 * 문제) 1부터 10까지의 합을 출력하는 프로그램
		 */
	/*	int i, sum=0;
		
		for( i=1 ; i < 11; i++) {
			 sum += i;
		}

		System.out.println(sum);
		
		/*문제 1이상 10이하의 정수를 압력받아 입력받은 정수만큼 반복하며 'JAVA프로그래밍'이라고 출력하는 프로그램
		 * 입력예)3
		 * 출력예)JAVA프로그래밍
		 * 		JAVA프로그래밍
		 * 		JAVA프로그래밍
		 */
		
	/*	System.out.print("숫자를 입력하세요. >");
		int num = scn.nextInt();  //끝나는 시점을 정해주는 값
		int i;    //시작하는 값을 정해줌
		
		for(i=1 ; i <= num ; i++) {
			System.out.println("JAVA프로그래밍");
		}
	*/
		
		
		
		/*
		 * 문제)문자를 입력받아서 입력받은 문자를 20번 반복하여 출력하는 프로그램
		 * 단, 입력받을 때 char a = scn.nextLine().charAt(0);
		 * 입력예)A
		 * 출력예)AAAAAAAAAAAAAAAAAAAA
		 * 
		 * scn.nextLine().charAt(0); -> nextLin()으로입력받은 string 중에서 첫번째클자를 가져와라,  그리고 변수에 넣어라
		 * next() -> 문자를 입력받음, 공백과 엔터로 구분
		 * nextLine() -> 한글자만 쳐도 String으로 받아옴
		 * charAt(0) -> 입력한 글자에서 첫번째입력된 문자 하나만 가져와라
		 */
		
	/*	System.out.println("문자를 입력하세요.");
		char a = scn.nextLine().charAt(0);
		
		int i;
		
		for(i=1 ; i <= 20 ; i++) { //1부터20까지 20개     //for(i=0 ; i < 20 ; i++) 0부터 19까지 20개
			
			System.out.print(a);
		}
		
		
		
		System.out.println("문자를 입력하세요.");
		String b = scn.nextLine(); //charAt(0)를 안쓰려면  string 타입으로 바꿔줘야됨
		
		int i;
		
		for(i=0 ; i < 19 ; i++) {
			
			System.out.print(b);
		}
	
		
		
		/*
		 * for를 2번 사용하여 1부터 5까지 변수 i를 출력하는 프로그램
		 * 단, 출력할때도 변수 i 사용
		 * 출력예)1
		 * 		2
		 * 		3
		 * 		4
		 * 		5 
		 * 		12345 
		 */
		
		
	/*		int i;
			
			for(i=1 ; i<= 5 ; i++) {
				System.out.println(i);
			}
			
			for(i=1 ; i<=5 ; i++) {
				System.out.print(i);
			}
		
		
			
		/*
		 * 문제) 변수 i, j를 이용하여 출력하는 프로그램
		 * 단, 중간에 공백은 탭 '\t' 을 사용하여 %d \t %d \n", i ,j
		 * 출력예) 1 10
		 * 	    2 9
		 * 		3 8
		 * 		4 7
		 * 		5 6
		 * 		6 5
		 * 		7 4
		 * 		8 3
		 * 		9 2
		 * 		10 1
		 */
		
		//for의 초기값은 한번에 여러개 선언 가능하지만 조건식에는 반드시 하나의 조건만 들어가야 한다.
	/*	for (int i = 1, j = 10; i <= 10 ; i++, j--) {  
			System.out.printf("%d\t\t%d \n", i ,j);
		}
		
		for (int i = 1, j = 10; j > 0 ; i++, j--) {   
			System.out.printf("%d\t\t%d \n", i ,j);
		}
		
		
		
		문제)대문자를 'A'부터 'Z'까지 차례로 출력하는 프로그램
		단, char i 만 사용
		출력예)ABCDEFGHIJKLMNOPQRSTUVWXYZ
	*/	
		
	/*	//char 타입이 이렇게도 쓰인다는 예
		//'A' =65
		for(char i= 'A' ; i <= 'Z' ; i++) {
			System.out.print(i);
		}
		
		//아스키코드 값이 있어서 int로 변경해도 출력 가능함
		//타입중 char 타입만 유일하게 가능함
		for(int i= 'A' ; i <= 'Z' ; i++) {
			System.out.print(i);
		}
		
		
		//이렇게도 가능
		//char 타입의 값은 아스키코드값(=정수값)이 있어서 int 변수에 담을 수있다
		//단 변수에 담지안고 print %d로는 출력 불가능(오류)!
		for(char i= 'A' ; i <= 'Z' ; i++) {
			int num = i;
			System.out.printf("%c \t %d \n", i, num);
		}
	*/	
		
		/*문제)1부터 20까지의 홀수를 차럐댜로 출력하는 프로그램
		 * 출력예)1 3 5 7 9 11 13 15  17 19
		 * 단, 변수는 i 만 사용
		 */
		
	/*	
		int i;
		for( i=1 ; i<20 ; i++) {
			if(i%2==1) {
			System.out.print(i + " ");
			}
		}
		
		
		//방법2
		int i;
		for( i=1 ; i<20 ; i++) {
			if(i%2 != 0) {
			System.out.prinf("%d",i);	
			}
		}
		
		
		//증감식이용
		int i;
		for( i=1 ; i<=20 ; i+=2) {
			
			System.out.print(i + " ");
		}
		
		
	
		/*문제) 정수를 입력받아 1부터 입력받은 수까지의 합을 출력하는 프로그램
		 * 입력예)10
		 * 출력예)55
		 */
		
		System.out.print("숫자를 입력하세요.>");
		int num = scn.nextInt();
		int i;
		int total=0;
		
		for( i =1 ; i <= num ; i++) {
			total += i;
		}
		
		System.out.println(total);


		//방법2
		System.out.print("숫자를 입력하세요.>");
		int num = scn.nextInt();
		int i,sum=0, num;
		
		for( i =1 ; i <= num ; i++) {
			sum += i;
		}
		
		System.out.println(sum);
		
		
	}
	

	
}



