package sstStudy;
import java.util.*;

public class Study0515 {
		public static void main(String[] args) {
			Scanner scn =new Scanner(System.in);
			//문법
	/*		int a =1;
			do (){
				
			}while{
				
			}
			*/
			
			
		/*	//while 반복문
			int a = 1;
			while (a <=10) {
				System.out.println(a);
				a++;    //증감식 안써주면 계속 true여서 무한루프됨!
			}
			System.out.println();
			
			//위의 while문을 for로
			for(a=1; a<=10; a++) {
				System.out.println(a);
			}
		*/	
			
			
			/*문제) 알파벳 'A'부터 'Z'까지 출력하는 프로그램 작성, while 문 사용
			 * 출력예)ABCDEFGHIJKLMNOPQRSTUVWXYZ
			 * 단, 변수는 alpha = 'A' 초기 대입 후 사용
			 */
			
	/*		char alpha = 'A';
			while(alpha<='Z') {  //아스키 값이 있어서 비교가 가능
				System.out.print(alpha);
				alpha ++;
			}
			
			/*문제) 1이상 100이하의 정수를 입력받아 while문을 이용하여 1부터 입력받은 정수까지의 합을 구하는 프로그램
			 * 입력예)10
			 * 출력예)5
			 */
			
		/*	System.out.print("숫자를 입력하세요.>");
			int inputNum = scn.nextInt();
			int sum = 0;
			int a =1;
			
			while( a<=inputNum ) {
				sum+= a;
				a++;     //증감식 꼭 써줘!! 무한루프 됨!!
			}
			System.out.println(sum);
			
			
			
			//모범답안
			int num, sum = 0, i =1;
			num =scn.nextInt();
			
			while(i<num) {
				sum+=i;
				i++;
			}
			System.out.println(sum);
		*/	
			
			/*점수를 입력받아 80점 이상이면 합격메세지를 그렇지 않으면 불합격 메세지를 출력하는 작업을 반복하다가 0~100 이외의 점수가 입력되면 종료하는 프로그램(break 사용안함)
			 *단, while 조건식에 비교와 논리연산자 사용.
			 * 입,출력예)점수를 입력하세요.>50
			 * 			죄송합니다. 불합격입니다.
			 * 			점수를 입력하세요.>95
			 * 			축하합니다. 힙격입니다.
			 * 			점수를 입력하세요.>101
			 */
			
		/*	System.out.print("점수를 입력하세요.>");
			int a =scn.nextInt();
			
			
			while(a>=0 && a<=100) {
				
				if (a>=80) {
					System.out.print("축하합니다. 합격입니다. \n");
				}		
				else {
					System.out.print("죄송합니다. 불합격입니다.\n");
				}
		
				System.out.print("점수를 입력하세요.>");
				a = scn.nextInt();
				
			}
				
			/*위의 문제를 while 무한루프를 이용하여 작성
			 * 단, while(true) 
			 * 		(break, continue)	
			 */
			
		/*	int score;
			
			while(true) {
				System.out.print("점수를 입력하세요.>");
				score = scn.nextInt();
				
				if(score <0 || score>100 ) {
					System.out.println("while 끝");
					break;
				}
					
				if(score>=80) {
					System.out.println("축하합니다. 합격입니다");
				}
				else {
					System.out.println("죄송합니다. 불합격입니다");
				}
			}
		*/	
			
			/*continue문
			 * 1부터 10까지 반복하면서 홀수만 출력하는 프로그램
			 * 단,  continue문 사용
			 */
		/*	int num =0;
			while(num<10) {
				num++;
				if(num % 2 ==0) {
					continue;
				}
				System.out.println(num); //홀수 일때만 출력
				
			}
			
			//위의 로직을 for문으로 바꾸기
			int i;
			for(i=1; i<=10; i++) {
				if(  i%2 ==0) {
					continue;
				}
				System.out.println(i);
			}
		*/	
		/*문제)정수를 계속 입력받다가 0이 입력되면 0을 제외하고 이전에 입력된 자료의 수와 합계, 평균을 출력하는 프로그램
		 * (평균은 소수 둘째자리 출력)
		 * 단, while 무한루프 사용
		 * 입력예)15 88 97 0
		 * 출력예)입력된 자료의 개수는 = 3
		 * 		입력된 자료의 합계 = 200
		 * 		입력된 자료의 평균 = 66.67
		 */
		
			
		/*	int sum= 0;
			int count = 0;
			
			
			while(true) {
				num = scn.nextInt();
				
				if(num ==0) {
					break;
				}
				count ++;
				sum += num;
				
			}
			//while문이 실행되지 않는 상황이 있을 수도 있다는 것을 고려해서 while문 밖에 avg를  선언해야한다.
			double  avg = (double)sum / count;  //sum, count 둘중 하나만  형변환 해주면 된다.
			System.out.printf("입력된 자료의 개수 = %d \n", count);
			System.out.printf("입력된 자료의 합계 = %d \n",sum);
			System.out.printf("입력된 자료의 평균 = %.2f \n", avg);
			
			
			/*문제)정수를 계속 입력 받다가 0이 입력되면 입력된 수 중 홀수의 합과 평균을 출력하는 프로그램 작성
			 * continue, break 문 사용
			 * 입력예)5 8 17 6 31 0
			 * 출력예)홀수의 합 : 53
			 * 		홀수의 평균 : 17		
			 */
			
			
			//혼자해보기
			//sum과 count 같이 누적되는 변수들은 0으로 초기화해주기
		/*	int num, sum =0, count = 0, avg;
			
			while(true) {
				num = scn.nextInt();
				
				if(num ==0) {
					break;
				}
				if(num %2 !=0) {
				count++;
				sum += num;
				}
				
			}
			
			avg = sum / count ;
			System.out.println("홀수의 합 : " + sum);
			System.out.println("홀수의 평균 : "+ avg);
			
			
			
			//짧게 쓴 코드
			while(true) {
				num = scn.nextInt();
				
				if(num ==0)break;
				if(num %2 !=0) continue;
				count++;
				sum += num;
			}
			
			avg = sum / count ;
			System.out.println("홀수의 합 : " + sum);
			System.out.println("홀수의 평균 : "+ avg);
			
			
			/*do~while
			do {
				반복 실행될 문장;
			}whlie(조건식);
			반복문에서 유일하세 조건식 뒤에 세미콜론(;)이 쓰이는 반복문 : do-while
			do-while문은 while 문으로도 가능
			while과 do-while의 차이점
			while문 : 조건이 참이면 실행
			do-while : 일단 실행문을 실행하고 조건을 판별 -> 조건 부합여부와 상관없이 최소 한번은 실행한다.
		*/	
			
			
		/*	int a =1;
			
			do {
				System.out.println(a + "번째 출력.");
				a++;
			}while(a<=10); //세미콜론 꼭 써주기!!
			
			
			문제)위 문제를 while 무한루프를 사용하여 프로그램(do-while문을 while 문으로 전환)
		*/
			
		/*	int a = 1;
			
			while(true){
				if(a>10) {
					break;
				}
				System.out.println(a+"번째 출력.");
				a++;
			}
			
			//방법2
			int a = 1;
			
			while(true){
				
				System.out.println(a+"번째 출력.");
				a++;
				if(a>10) break;
			}
		*/
			
		/*문제)정수를 게속 입력 받다가 0이 입력되면 수 중 홀수의 합과 평균을 출력하는 프로그램
		 * do~while문 사용, break.continue는 사용안함.
		 * 입력예)5  17 6 31 0
		 * 출력예)홀수의 합 : 53
		 * 		홀수의 평균 : 17
		 */
		
			
		//num = scn.nextInt(); 이 꼭 반복문 안에 있어야 계속 숫자를 입력받을 수 있다.
			
		/*	int num,count=0, avg, sum=0 ;
			
			do {
				num = scn.nextInt();
				if(num %2 !=0) {
					count ++;
					sum += num;
				}
			}while(num!=0);
			
			avg = sum /count;
			System.out.println("홀수의 합 : " + sum);
			System.out.println("홀수의 평균 : "+ avg);
		*/
		
			/*문제)아래와 같이 메시지를 출력하고 숫자를 입력받아 선택한 번호에 해당하는 메시지를 출려하는 작업을 반복하다가 4가 입력되면 메시지 출력 후 종료하는 프로그램
			 * 단, do-while문을 사용, 1~4번 이외의 수가 입력되면 "잘못 입력하셨습니다."라고 출력.
			 * 입출력예)1.입력하기
			 * 		2. 출력하기
			 * 		3.삭제하기
			 * 		4.끝내기
			 * 		작업할 번호를 선택하세요.>2
			 * 		출력하기를 선택하셨습니다.
			 * 
			 * 1~3번 과 잘못입력 시에는 계속 반복실행
			 * 끝내기를 선택하면 "끝내기를 선택하셨습니다" 출력 후 즉시 반복 종료
			 */
			
			int num ;
			
			do {
				num =scn.nextInt();
				if(num==1) {
					System.out.println("입력하기를 선택하셨습니다.");
				}
				else if(num==2) {
					System.out.println("출력하기를 선택하셨습니다.");
				}
				else if(num==3){
					System.out.println("삭제하기를 선택하셨습니다.");
				}
				else if(num==4) { System.out.println("잘못입력하셨습니다.");
					//do-while은 한번은 실행되기 떄문에 여기서 출력하고 while에서 프로그램 종료되게하면됨 
				}
			}while(num!=4); //do 실행문을 계속 돌리는 조건을 써줘야함
			
			System.out.println("끝내기를 선택하셨습니다.");
			
			
			//모범코드
			
			do {
				
				System.out.println("1.입력하기");
				System.out.println("2. 출력하기");
				System.out.println("입력하기를 선택하셨습니다.");
				System.out.println("입력하기를 선택하셨습니다.");
				System.out.print("작업할 번호를 선택하세요.>");
				num =scn.nextInt();
				
				if(num==1) {
					System.out.println("/n입력하기를 선택하셨습니다./n");
				}
				else if(num==2) {
					System.out.println("/n출력하기를 선택하셨습니다./n");
				}
				else if(num==3){
					System.out.println("/n삭제하기를 선택하셨습니다./n");
				}
				else if(num==4) {
					System.out.println("/n끝내기를 선택하셨습니다./n");
				}
				else {
					System.out.println("\n잘못입력하셨습니다.\n");
				}
			}while(num!=4);
			
			
			
			
			//swich-case 문으로 바꾸기, break꼭 써줘야함
			switch(num) {
			case 1: 
				System.out.println("\n입력하기를 선택하셨습니다.\n");
				break;
			case 2:
				System.out.println("\n출력하기를 선택하셨습니다.\n");
				break;
			case 3:
				System.out.println("\n삭제하기를 선택하셨습니다.\n");
				break;
			case 4:
				System.out.println("\n끝내기를 선택하셨습니다.\n");
				break;
			default:
				System.out.println("\n잘못입력하셨습니다.\n");
			}
			
			
			
		}
			

	}


