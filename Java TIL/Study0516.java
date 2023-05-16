package sstStudy;
import java.util.*;

public class Study0516 {

		public static void main(String[] args) {
			Scanner scn = new Scanner(System.in);
			
			/*반복문
			 * 문제)정수 n을 입력받아 n줄만큼 다음과 같이 출력하는 프로그램(for문 사용)
			 * printf("%2d ", 변수)
			 * 입력에)5
			 * 출력예)1
			 * 		2 3
			 * 		4 5 6
			 * 		7 8 9 10
			 * 		11 12 13 14 15
			 */
			
			//반복문에서 변수를i,j만 사용해야한다는 사고버리기!!
			//혼자해보기
		/*	int n = scn.nextInt();
			int i, j, num=0;
			for(i=1; i<=n; i++) {
				for(j=1; j<=i ; j++) {
					System.out.printf("%2d ", num);
					num++;
				}
				System.out.println();
			}
			
			
			
			//모범코드
			int n = scn.nextInt();
			int i, j, cnt=0 ;
			for(i=1; i<=n; i++) {
				for(j=1; j<=i ; j++) {
					cnt++;
					System.out.printf("%2d ", cnt);
				}
				System.out.println();
			}
		*/	
			
			/*문제)정수 n을 입력받아 다음과 같이 영문자를 출력하는 프로그램.
			 * 입력예)3
			 * 출력예)ABC
			 * 		DE
			 * 		F
			 */
			
			
		/*	int i, j; 
			char alphabet='A';
			int k =scn.nextInt();
			
			for(i=k; i>=0; i--) {
				for(j=1; j<=i; j++) {
					System.out.print(alphabet);
					alphabet++;
				}
				System.out.println();
			}
			
			//방법2
			int i, j, n;
			char a ='A';
			n =scn.nextInt();
			
			for(i=n; i>=1; i--) {
				for(j=1; j<=i; j++) {
					System.out.printf("%c",a);
					a++;
				}
				System.out.println();
			*/
			
			
			/*문제)for문을 이용하여 다음과 같이 출력하는 프로그램
			 * 출력예)a 1 2 3 4
			 * 		b c 5 6 7
			 * 		d e f 8 9
			 *		g h i j 10
			 *4행 5열
			 */
			//숫자피라미드와 알파벳 피라미드를 각각 따로 생각해주면 쉽다.
			
			
		/*	int i, j, num =1;
			char alpha ='a';
			
			for(i=1; i<=4; i++ ) {
				for(j=1; j<=i ; j++) {
					System.out.printf("%c ", alpha);
					alpha++;
				}
				for(j=1; j>=5-i; j++) {
					System.out.printf("%d ", num);
					num++;
				}
				System.out.println();
			}
			
			/*문제)while문의 무한루프를 이용하여 아래와 같이 실행되는 프로그램 작성 (continue, break 사용)
			 * 입출력예)현재가진 돈은 10000원 입니다.
			 * 		얼마를 사용하시겠습니다>1000
			 * 		이제 9000원 남았습니다.
			 * 
			 * 		얼마를 사용하시겠습까?5000
			 * 		다시 입력하세요.(사용범위 오류)
			 * 
			 * 		얼마를 사용하시겠습니까?4000
			 * 		이제 0원 남았습니다.
			 * 		모든 돈을 사용했습니다.끝
			 */
			
		/*	int money =10000, n;
			while(true) {
				System.out.printf("현재가진 돈은 %d입니다. \n", money);
				System.out.print("얼마를 사용하시겠습니까?");
				n = scn.nextInt();
				
				if(n>money || n<0) {	//&& 쓸지 ||쓸지 범위 잘 생각해!!!   범위가 한덩이로 모여있으면 &&,  범위가 떨어져있다면 ||
					System.out.println("다시 입력.(사용범위 오류)");
					continue;
				}
				//위의 if에서 걸리면 continue에서 걸려서 다시 위로 가므로 money가 증가하지 않음
				money -= n;
				System.out.printf("이제 %d원 남았습니다.", money);
				
				if(money <=0) {
					System.out.printf("모든 돈을 사용했습니다. 끝");
					break;
				}

			}
			
			//방법2
			int money =10000, n;
			System.out.printf("현재가진 돈은 %d입니다. \n", money);
			while(true){
				System.out.print("얼마를 사용하시겠습니까?");
				n = scn.nextInt();
				
				if(! (n>=0 && n<=money)) {//연산자 우선순위 떄문에 ()로 식먼저 해주고 부정!해줘야함
					System.out.println("다시 입력.(사용범위 오류)");
					continue;	
				}
				money -= n;
				System.out.printf("이제 %d원 남았습니다.", money);
				
				if(money==0)break;  //위의 if에서 money의 범위가 걸리기 때문에 0인 경우 밖에 남지않아서 ==0 해줘도 된다.
			}
			
			
			
			/*배열
			 * ﻿배열의 배열명은 그 배열의 시작 주소를 가리킨다.
			 * <많이 물어보는 질문>
			 * 배열은 언제쓰나 -> 같은 타입의 변수를 여러개 사용할때 사용 
			 * 배열과 리스트의 차이점?
			 * 
			 * 배열은 참조형 변수
			 * 참조형은 default값이 null 이다. 선언 후 초기화를 안해주면 null을 자동으로 넣어준다.
			 * 값은 반드시 주소가 온다. -> 배열의 안에에는 주소값만 들어간다.
			 * 배열의 인덱스마다 각각 다른 주소를 가지고 있다.
			 * 주소는 jvm이 os에 메모리 할당을 요청해서 os에서 각 배열과 배열의 인덱스에 해당하는 주소값을 할당해준다.
			 * 
			 * 문제) 5개의 정수를 입력받은 후 차례대로 출력하는 프로그램
			 */
		/*	int a, b, c, d, e;
			
			a = scn.nextInt();
			b = scn.nextInt();
			c = scn.nextInt();
			d = scn.nextInt();
			e =  scn.nextInt();
			
			System.out.printf( "%d %d %d %d %d %d \n", a, b, c, d, e);
			
			
			//위 문제와 같은것으로 배열을 사용하되 반복문은 사용하지 않음
			int[] a = new int[5];
			
			a[0] = scn.nextInt();
			a[1] = scn.nextInt();
			a[2] = scn.nextInt();
			a[3] = scn.nextInt();
			a[4] = scn.nextInt();
			
			System.out.printf("%d %d %d %d %d \n", a[0], a[1], a[2], a[3],a[4]);
		*/
			
			//위 문제와 같은 것으로 배열을 반복문에 적용
		/*	int[ ] a = new int[5];
			int i;
			for(i=0; i<a.length; i++) { //인덱스값은 0부터 이기때문에 a.length 을 포함하면 안되서 미만으로 해줘야함
				a[i]=scn.nextInt();   //입력
			}
			for(i=0; i<a.length; i++) { //출력
				System.out.printf("%d ", a[i]);
			}
			
			/*문제)정수 5개를 입력 받은 후 합계를 출력하는 프로그램
			 * 입력예)10 20 30 40 50
			 * 출력예)150
			 */
			
		/*	int[] arr = new int[5];
			int i, sum=0;
			
			
			for(i=0; i<arr.length; i++) {
				arr[i] = scn.nextInt();
				sum += arr[i];
			}
			System.out.println(sum);
		*/	
			
			/*문제)문자 10개를 저장할 수 있는 배열을 선언하고 10개의 문자를 입력받아 입력받은 문자를 이어서 출력하는 프로그램
			 * scn.next().charAt(0);
			 * 입력예)A B C D E F G H I J
			 * 출력예)aABCDEFGHIJ
			 */
			//next()는 공백, Enter 모두 구분
			
			//입력, 출력 따로
		/*	int i;
			char[] a= new char[10];
			
			for(i=0; i<a.length; i++) {
				a[i] = scn.next().charAt(0);  
				//charAt(0)는 입력받은것의 첫번째것를 가져와라 라는 것
				//next()는 공백을 기준으로 나누기 때문에 
				System.out.print(a[i]); //공백없이 출력되도록 한다.
			}
			
			
			/*문제)정수 10개를 입력받은 후 세번째, 다섯번째, 마지막으로 입력 받은 정수를 차례로 출력하는 프로그램
			 *   마지막 입력값은 배열의 길이를 이용하여 출력
			 * 입력예)5 3 9 6 8 4 2 8 10 1
			 * 출력)9 8 1
			 */
			
			//참조변수는 크기가 같지만 그 안에 들어가는 주소의 크기는 데이터타입에 따라 다름
			//a[0]에서 인덱스갑은  1+2처럼 연산식 이어도 된다 -> 인덱스 값만 나온다면 상관없음
		/*	int i , sum =0;
			int[] arr = new int[10];
			for(i=0; i<arr.length; i++) {
				arr[i] = scn.nextInt();
				sum++;
				if(sum ==3) {
					System.out.print(arr[i]);
				}
				else if(sum ==5){
					System.out.print(arr[i]);
				}
				else if(sum ==10){
					System.out.print(arr[i]);
				}
			}
		*/	
		/*	//모범코드`
			int i , sum =0;
			int[] arr = new int[10];
			for(i=0; i<arr.length; i++) {
				arr[i] = scn.nextInt();
			}
			System.out.printf("%d %d %d \n", arr[2], arr[4], arr[arr.length -1]);
			//배열의 마지막 인덱스 값을 구하는 식 : a[a.length -1]
			
			
			
			
			/*배열의 시작주소는프로그램 돌릴때마다 매번 바뀐다
			 * 배열의 각 인덱스마다의 메모리값은 타입의 각 크기를 더해서 할당해준다 -> int타입은 인덱스 한칸당 4인데 a[2]이면 [0]부터 [2]까지 3칸이니까 4*3=12라고 
			 * 컴퓨터가 자동으로 할당해준다
			 */
			
			/*문제)최대 100개까지의 정수를 차례로 입력받다가 0이 입력되면 입력을 중단하고 짝수번째에 입력된 정수를 모두 출력하는 프로그램 작성
			 * 단, for문은 입력용1개, 출력용1개 사용
			 * 입력예)11 25 3 9 15 6 8 7 12 0
			 * 출력예)25 9 6 7
			 */
			
		/*	int i , cnt=0;
			int[] arr = new int[100]; 
			
			for(i=0; i<arr.length; i++) {

				arr[i] = scn.nextInt();
				if(arr[i]==0)break;
				cnt ++;  //0이 입력되기 전까지의 개수를 카운트
			}
			
			
			for(i=1; i<cnt ; i+=2) {//인덱스는 0부터, cnt는1부터 시작 , i를 1로 시작해야 arr[1]이되서 25부터 출력가능
				System.out.printf("%d ",arr[i] );
			}
		*/	
			
		//배열은 층마다 평수(메모리크기)가 다르다
			

			
		}

	}


