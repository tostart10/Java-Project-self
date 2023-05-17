package sstStudy;

import java.util.*;

public class Study0517 {
	
	public static void main(String[] args) {
			Scanner scn = new Scanner(System.in);

			/*배열
			 * 문제)100개의 정수를 저장할 수 있는 배열을 선언하고 차례대로 입력받다가 0이 되면 0을 제외하고 그때까지 입력된 정수를 가장 나중에 입력된 정수부터 차례대로
			 * 출력하는 프로그램
			 * 입력예)3 5 10 55 0
			 * 출력예)55 10 5 3
			 */
			
		/*	int i, count=0;
			int[] arr = new int[100];
			
			for(i=0; i<arr.length; i++) { //배열에 요소 하나씩 집어넣기
				arr[i] = scn.nextInt();
				if(arr[i]==0) {
					break;
				}
				count++;
				
			}
			//방법1) count변수 이용해 출력
			for(i=count; i>=1 ; i--) { //i를 큰 인덱스 숫자로 설정해 작아지면서 출력하기
				System.out.print(arr[i-1]+" ");//출력시 0은 출력하지 않기 위해 인덱스에 -1한다
			}
			
			
			//방법2) for안에 들어가는 변수만 사용해서 출력
			int j;
			for(j=i-1; j>=0; j--) {
				System.out.print(arr[j]+" ");
			}
			
			/*a=scn.nextInt();라고 하면 오류남
			 * 이유:a는 참조변수로 값이아닌 주소를 저장하는 변수이므로 데이터타입이 맞지 않기 때문에 값을 담을수 없어 오류
			 * arr[i] = scn.nextInt(); 처럼 배열공간안에 직접 값을 넣어줘야함
			 */
			
			//방법3 i변수 이용하여 반복
		/*	for(i=count-1; i>=0 ; i--) { //i가 몇인지 모르겠다면 위에 Syste.out.print(i)로 출력해본다 
				System.out.printf("%d ",arr[i]);
			}
		*/	
			
			/*문제)연도와 월을 입력받아 월의 날수를 출력하다가 월이 0이면 종료하는 프로그램(무한루프이용)
			 * 단, 윤년은 400년에 한번씩, 4번에 한번이면서 100년은 제외.
			 * 윤년인 경우 2월은 날수가 29일
			 * 입.출력예)년 = 2000
			 * 		월 = 2
			 * 		입력하신 달의 날수는 29일입니다. //days[month]
			 * 년 = 2022
			 * 월 = 13          //월이(month) 1~12가 아닌경우
			 * 잘못 입력하셨습니다.
			 * 
			 * 년 = 2023
			 * 월 = 0
			 */
			
			//입력받은 숫자를 인덱스로 그대로 쓰기 위해 인덱스[0]에 0을 넣어줬다
		/*	int[] days = {0,31,28,31,30,31,30,31,31,30,31,30,31};  
			int year, month;
			
			
			for(;;) {
				System.out.print("년 = ");
				year = scn.nextInt();
				System.out.print("월 = ");
				month = scn.nextInt();
				

				if(month ==0) {//월이 0을 입력받았을때 종료
					break;
				}
				else if(month>12 || month <1) {//월이 1~12가 아닌 경우
					System.out.println("잘못입력하셨습니다");
					continue;  //for문 맨 위로 올라가서 다시 시작하도록 하기
				}
				
				
				if(year % 400==0 ||(year %4==0 && year % 100 !=0)) { //참이면 윤년
					
					days[2] = 29;
				}
				else {
					days[2] = 28;
				}
				
				System.out.printf("입력하신 달의 날수는 %일 입니다. \n", days[month]);
			}
			
			
			//방법2

			for(;;) {
				System.out.print("년 = ");
				year = scn.nextInt();
				System.out.print("월 = ");
				month = scn.nextInt();
				

				if(month ==0) {//월이 0을 입력받았을때 종료
					break;
				}
				else if(month>12 || month <1) {//월이 1~12가 아닌 경우
					System.out.println("잘못입력하셨습니다");
					//여기서 continue를 안해주고 else로 넘기기
				}
				else {
					if(year % 400==0 ||(year %4==0 && year % 100 !=0)) { //참이면 윤년
						
						days[2] = 29;
					}
					else {
						days[2] = 28;
					}
					
					System.out.printf("입력하신 달의 날수는 %일 입니다. \n", days[month]);
				}
			
			
			/*문제)10개의 정수를 입력받아 그 중 가장 큰 수를 출력하는 프로그램
			 * 입력예)5 10 8 5 6 30 12 24 61 2
			 * 출력예)61
			 * 단, 출력은 max 변수 사용
			 */
				
			//혼자해보기 
			//방법1)for돌려서 max에 큰값 넣어주기 단 양수만 입력받는다는 가정하에서 구현
		/*	int max=0, i ;
			int[] num = new int[10];
			
			for(i=0; i< num.length; i++) {
				num[i]= scn.nextInt();
				if(max < num[i]) {
					max =num[i];
				}
			}
			System.out.println(max);
				
				
			//방법2
			int num = new int[10];
			
			for(i=0; i< num.length; i++) {
				num[i]= scn.nextInt();	
			}
			max = num[0];
			
			for(i==1; i<num.length; i++)
			{
				if(max<num[i]) {
					max =num[i];
				}
			}
			System.out.println(max);
			
			
			
			
			
				
			//문제) 위의 문제에서 max도 구하고 min도 구하기, 음수를 입력받았을 때도 생각하기
			
			int max, min,i;
			int[] num = new int[10];
			
			for(i=0; i<num.length; i++) {
				num[i] = scn.nextInt();
			}
			
			min=num[0];
			max=num[0];
			
			for(i=0; i<num.length; i++) {
				if(num[i]<min) {
					min =num[i];
				}
				if(max < num[i]) {
					max =num[i];
				}
			}
			System.out.println(min);
			System.out.println(max);
			
			
			/*문제)10개의 수를 입력받아 그중 가장 작은 수를 출력하는 프로그램
			 * 입력예)5 -10 8 55 -6 31 12 24 61 -2
			 * 출력예)-10
			 * 단, 가장 작은수 출력시 min변수를 사용함, 선언시 초기값 설정하지 않음
			 */
			
		/*	int min, i, compare;
			int[] num = new int[10];
			
			for(i=0 ; i<num.length ;i++) {
				num[i] = scn.nextInt();
			}
			
			min = num[0];
			
			for(i=1; i<num.length; i++) { //i=0 부터 해야하지만 지금  min = num[0]이기 때문에 굳이 같은 것끼리 비교할 필요없음
				if(min >num[i]) {
					min = num[i];
				}
			}
			System.out.println(min);
		*/	
			
			/*문제)4자리 이하의 10개의 정수를 입력받아 짝수 중 가장 큰 값과 홀수 중 가장 작은 값을 출력하는 프로그램
			 * 단, min, max 변수 초기값 설정 후 프로그램
			입력예)-5 10 -5 55 6 -31 12 -24 61 2
			출력예)홀수 중 가장 작은 값 : -31(min)
				짝수 중 가장 큰 값 : 12(max)
			 */
			
			
			// 4자리이하=min, max의초기값을 위한 조건임 
			//min에 입력할 수 있는 값:-9999, max에 입력할 수 있는 값:9999 이라는 뜻이 된다
			//초기값-> max은 입력될수 있는 가장 작은 값인-9999보다 더 작은 값으로 설정하면된다
			//초기값-> min은 입력될 수 있는 가장 큰 값인 9999로 설정하면 된다.
			
		/*	int max=-9999, min=9999;
			int i;
			int[] arr= new int[10];
			
			
			for(i=0; i<arr.length; i++) {
				arr[i] = scn.nextInt();
			
				if(arr[i]%2 ==0) {
					if(arr[i]>max) {
						max = arr[i];
					}
				}
				else {
					if(arr[i]<min) {
						min = arr[i];
					}
				}
			}
			System.out.printf("홀수 중 가장 작은 값 : %d \n",min);
			System.out.printf("짝수 중 가장 큰 값 : %d \n", max);
				
			//배열은 선언시 크기가 정해지기 때문에 불필요한 공간을 꼭 채워야하는 단점이 있다
			
			
			/*문제)10명의 컴퓨터 점수를 입력받아 배열에 저장하고 총점과 평균을 구하는 프로그램 작성
			 * 입력예)95 100 88 65 76 89 58 93 77 99
			 * 출력예)총첨 = 840
			 * 	    평균 = 84.0
			 */
			
		/*	int i, sum=0;
			int[] arr = new int[10];
			double avg;
			
			for(i=0; i<arr.length; i++) {
				arr[i] = scn.nextInt();
				sum += arr[i];
			}
			
			avg = (double)sum / arr.length;
			System.out.printf("총점 : %d \n", sum);
			System.out.printf("평균 : %.1f \n", avg); //소수점 자리 정해주기
		*/	
			
			/*선택정열 (쉽게 변형한 버전)
			 * 문제)5개의 정수를 {95, 75, 85, 100, 50}로 초기화 하고 오름차순으로 정렬하여 출력하는 프로그램
			 * 출력예)50 75 85 9 100 
			 */
		/*	int i,j, tmp;
			int[] arr = {95, 75, 85, 100, 50};  //new int[5]; 와 같음
			
			
			//비교기준이 되는값에 대한 for문이다.
			//입력받은 값의 첫번째것 부터 차례대로 뒤에 입력된 값과 비교한다.
			//이때 비교 대상값이 꼭 뒤에 한자리라도 있어야하므로 i<arr.length-1 까지만 돌려서 비교 대상이 하나라도 있도록 해준다
			for(i=0; i<arr.length-1; i++) {
				
				//비교대상인 a[j]는 비교 기준인 a[i]가 항상 앞에 있어야하므로 j=i+1로 해줘서 앞에 하나라도 비교 기준이
				//올 수 있도록 해야한다.
				for(j=i+1; j>arr.length; j++) { 
					if(arr[i]>arr[j]) {
						tmp =arr[i];
						arr[i] = arr[j];
						arr[j] = tmp;	
					}
				}
			}
			
			for(i=0; i<arr.length; i++) {
				System.out.printf("%d ", arr[i]);
			}
		*/	
			
			/*문제)10개의 정수를 입력받아 배열에 저장한 후 내림차순으로 정렬하는 프로그램
			 * 입력예)95 100 88 65 76 89 58 93 77 99
			 * 출력예)100 99 95 93 89 88 77 76 65 58
			 */
			
		/*	int i ,j ,tmp;
			int[] arr = new int[10];
			
			for(i=0; i<arr.length; i++) {  //i때문에 입력받는 것도 따로 해줘야함
				arr[i] = scn.nextInt();
			}
			
			
			for(i=0; i<arr.length-1; i++) {
				
				for(j=i+1; j<arr.length; j++) {
					if(arr[i]<arr[j]) {  //내림차순은 맨앞의 값이 가장 큼
						tmp = arr[i];
						arr[i] = arr[j];
						arr[j] = tmp;
					}
				}
			}
			for(i=0; i<arr.length; i++) {
				System.out.printf("%d ", arr[i]);
			}
		*/	
			
			
			//정식 선택정열
			int i ,j ,tmp, val, idx=0;
			int[] arr = new int[10];
			
			for(i=0; i<arr.length; i++) {  //i때문에 입력받는 것도 따로 해줘야함
				arr[i] = scn.nextInt();
			}
			
			
			for(i=0; i<arr.length-1; i++) {
				
				val = arr[i];  //기준값을 넣어준것
				for(j=i+1; j<arr.length; j++) {
					if(val <arr[j]) {  //내림차순은 맨앞의 값이 가장 큼

						val =arr[j]; //큰값을 만나면 val에 큰값을 넣어 val이 제일 커지도록 함
						idx =j;
					}
				}
				//최종 교환 시작(최종적으로 값을 여기서 교환해준다)
				if(idx>i) {
					tmp = arr[i];
					arr[i] = arr[idx];
					arr[idx] = tmp;
				}
				//한바퀴 돌때마다  idx 값 초기화해줘야함
				
				idx=0;
				//최종 교환 끝
			}
			for(i=0; i<arr.length; i++) {
				System.out.printf("%d ", arr[i]);
			}
			
			
		}

	}