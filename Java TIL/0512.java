import java.util.*;

public class MySample0512 {
	public static void main(String[] args) {
		Scanner scn = new Scanner(System.in);
		//반복제어문 (for문)
		//for문을 사용한다 -> i변수 필요하다
		//
		/*
		 * 문제) 10개의 정수를 입력 받아 그 수들 중 짝수의 개수가 몇개인지 출력하는 프로그램
		 * 입력예)10 22 3 129 66 81 35 1 46 88
		 * 출력예)입력 받은 짝수는 4개입니다.
		 */
		
		
	/*	//10번 입력 받으려면 for문 안에 scn.nextInt()있어야함 주의!!
		int a, i;
		int even = 0;
		
		System.out.print("정수 10개를 입력하세요.>");
		for(i=1 ; i<11 ; i++) {
			a = scn.nextInt();
			if(a%2 ==0) {
				even +=1; //cnt = cnt+1;  cnt +=1; 을 컴파일 속도가 빨라지도록 짧게 줄여서 쓴것.
			}
		}
		System.out.printf("입력 받은 짝수는 %d개입니다.", even);

		
		System.out.print("정수 10개를 입력하세요.>");
		for(i=1 ; i<11 ; i++) {
			a = scn.nextInt();          ////10번 입력 받으려면 for문 안에 scn.nextInt()있어야함 주의!!
			if(a%2 ==0) {
				even ++ ;
			}
		}
		System.out.printf("입력 받은 짝수는 %d개입니다.", even);

		
		/*  int a += ++i;
		 *  int a += i++;
		 *  이 두 개는 다름 주의!!!!! 
		 * 
		 *  문제)10개의 정수를 입력받아 3의 배수와 5의 배수의 개수를 각각 출력하는 프로그램
		 *  입력예)10 15 36 99 100 19 46 88 87 13
		 *  출력예)3의 배수 : 4
		 *  	5의 배수 : 2
		 *  단, 3의 배수이면서 5의 배수인 경우는 3의 배수에만 포함.
		 */
		
//		System.out.printf("%d의 배수 : %d \n", cnt1);
//		System.out.printf("%d의 배수 : %d \n", cnt2);
		
	/*	int i ,  num;
		int cnt1 = 0;
		int cnt2 = 0;
		
		System.out.print("정수를 입력하세요. >");
		
		for(i=1 ; i<11 ; i++) {	
			num = scn.nextInt();
			if(num %3 == 0) {  //여기서 3의 배수가 걸리므로 3의 배수 if문을 먼저 써주면 5의 배수 조건문에는 가지 않음
				cnt1 ++;	
			}
			else if(num % 5== 0) {
				cnt2 ++;
			}
		}
		System.out.printf("3의 배수 : %d \n", cnt1);
		System.out.printf("5의 배수 : %d \n", cnt2);
		
		
		문제)5명의 성적을 입력받아서 총점과 평균을 출력하는 프로그램
		입력예)90 58 100 66 88
		출력예)총점 : 429
			평균: 85.8   -> %.1f
		단, 총점은 sum(int), 평균은 avg(double)변수로 사용
		평균은 계산시 '총점/5.0'
	*/
		
	/*	int score, i, sum=0 ; //누적변수(sum)은 꼭 초기화 해줘야한다!!
		Double avg ;
		
		System.out.print("점수를 입력하세요.>");
		for(i=1 ; i<5 ; i++) {
			score = scn.nextInt();
			sum += score;
		}
		avg = (double)sum / 5 ;   //강제 형변환  //총점같은 통계자료들은 모두 for문 밖에서 작성해줘야한다.
		
		System.out.printf("총점 : %d \n",sum);
		System.out.printf("평균 : %.1f \n",avg);
		
	
		/*
		 * 행, 세로  : i
		 *  열, 가로 : j
		 * 줄바꿈 문자는 꼭 j가 끝난다음에 넣어줘야한다.
		 *
		 * 별찍는 문제
		 * 세로가 5, 가로가 5인 직사각형모양 모양으로 별 찍기
		 */
		
		
	/*	int i, j;
		
		for( i=1 ; i<6 ; i++) {
			for(j=1 ; j<6 ; j++) {
				System.out.print("*");
			}
			System.out.println(); //Enter역할
		}
	*/	
		
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
		
		
	/*	int i,j;
		
		for(i=1 ; i<6 ; i++){
			for(j=1 ; j<6 ; j++) {
				System.out.print(i);
			}
			System.out.println();
		}
		
		System.out.println();
		
		
		
		for(i=1 ; i<6 ; i++){
			for(j=1 ; j<6 ; j++) {
				System.out.print(j);
			}
			System.out.println();
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
		
		for(i=1 ; i <= num ; i++) {
			for(j=1 ; j<=i ; j++) {    //i값은 입력받은 값으로 행이고 바뀌면 안되는 값, 열은 점점 늘어나서 i값 개수만큼 되므로 조건을 i의 값을 기준으로 정해줘야한다.
				System.out.print("*");
				
			}
			System.out.println();
		}
	*/	
		
	/*	//입력받은 숫자만큼 역삼각형 별출력
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
		
		
		/*구구단
		 * 문제)구구단에서 2단부터 4단까지 구구단 출력하는 프로그램
		 * 단, 결과는 2자리로 %2d 로 단과 단 사이는 탭(\t)을 사용
		 * 	  변수는 i, j 만 이용함.
		 * 출력예)2 * 1 = 2	3 * 1 = 3	4 * 1 = 4
		 * 		....
		 * 		2 * 9 = 18	3 * 9 = 27	4 * 9 =36
		 */
		
		//어떤것이 행에서 고정되어 출력되는지
		//어떤것이 
	/*	int i, j;
		for(i=1 ; i<10 ; i++) {  //곱해지는 값
			for(j=2 ; j<=4 ; j++) { //단
				System.out.printf("%d * %d = %2d \t", j, i, i*j);
			}
			System.out.println();
		}
				
		
		
		
	/*	int i, j;
		for(i=2 ; i<5 ; i++) {
			for(j=1 ; j<=10 ; j++) {
				System.out.printf("%2d * %2d = %d \t", i, j, i*j);
			}
			System.out.println();
		}
	*/	
		
		/*문제)2부터 9까지의 정수를 a,b로 입력받아 a단부터 b단까지의 구구단을 차례로 출력하는 프로그램 작성.
		 * 단, 단과 단사이는 탭(\t)으로 적용, 출력은 큰단에서 작은 단으로 출력하되 변수는 a, b로 사용함(a가 큰단, b가 작은단)
		 * 입력예)3 5
		 * 출력예)5 * 1 = 5	4 * 1 = 4	3 * 1 = 3
		 * 		5 * 2 = 10	4 * 2 = 8	3 * 2 = 6
		 * 		...
		 * 		5 * 9 = 45	4 * 9 = 36	3 * 9 = 27
		 */
		
	/*	int i, j, a, b, temp;
		
		System.out.print("숫자를 입력하세요.>");
		a = scn.nextInt();
		b = scn.nextInt();
		
		if(a<b) {
			temp = a;
			a = b;
			b = temp;
		}
		
		for(i=1 ; i <= 9 ; i++ ) {  //곱하는 값은 증가
			for(j=a ; j>=b ; j--) {  //단은 감소
				System.out.printf("%d * %d = %2d \t", j, i, j*i );
			}
			System.out.println();
		}
		
		
		/*정수를 입력받아 다음과 같이 순서쌍을 출력하는 프로그램
		 * 입력예)4
		 * 출력예)[1,1][1,2][1,3][1,4]
		 * 		[2,1][2,2][2,3][2,4]
		 * 		[3,1][3,2][3,3][3,4]
		 * 		[4,1][4,2][4,3][4,4]
		 */
		
	/*	int i, j, a;
		
		System.out.print("정수를 입력하세요.>");
		a = scn.nextInt();
		
		for(i=1 ; i<=a ; i++ ) {
			for(j=1 ; j<=a ; j++) {
				System.out.printf("[%d,%d]", i, j);
			}
			System.out.println();
		}
		
		
		/*문제)위 문제를 참고하여 작성하고 아래 출력예와 같이 출력하도록 작성하는 프로그램
		 * 입력예)[1,1]
		 * 			[2,2]
		 * 	`			 [3,3]
		 * 					  [4,4]
		 * 단, 공백은 printf("%5c", ' ')
		 */
		
	/*	int i, j, a;
		
		System.out.print("숫자를 입력하세요.>");
		a = scn.nextInt();
		
		for(i=1 ; i<=a ; i++) {
			for(j=1 ; j<=a ; j++) {
				if(i == j) {
					System.out.printf("[%d,%d]", i,j);
				}
				else {
					System.out.printf("%5c",' '); //' ' 이렇게 공백을 꼭 넣어줘야한다.
				}
			}
			System.out.println();
		}
	/*	
		
	/*	문제)구구단을 입력 받아 해당 단 일부를 출력하는 프로그램
		입력예)2 5
		단, 입력변수는 a, b를 사용, a는 작은단, b는 큰단으로 해서 a부터 b까지 작은단에서 큰단으로 출력.
			공간은 공백 3개로 출력(%d * %d = %2d   ")
			1부터 5까지만 곱하는 출력으로 하시오.(하드코딩)
			(단만 입력받는 것임)
		입력예)2 4
		출력예)2 * 1 =2   2 * 2 = 4   2 * 3 =6   2 * 4 = 8   2 * 5 = 10
			 3 * 1 =2   3 * 2 = 4   3 * 3 =6   3 * 4 = 12  3 * 5 = 15
			 .....
			 5 * 1 =2   5 * 2 = 4   5 * 3 =6   5 * 4 = 20  5 * 5 = 25
	*/		 
		
		int i, j, a, b , temp;
		
		System.out.print("숫자 2개를 입력하세요.>");
		a = scn.nextInt();
		b = scn.nextInt();
		
		if(a>b) {
			temp =a;
			a = b;
			b = temp;
		}
		
		for(i=a ; i<=b ; i++){
			for(j=1 ; j<=5 ; j++) {
				System.out.printf("%d * %d = %2d   ", i, j, i*j);
			}
			System.out.println();
		}
		
		
		
		
		
		
		
		
	}
}
