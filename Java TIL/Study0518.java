package sstStudy;

import java.util.*;
public class Study0518 {


		public static void main(String[] args) {
			Scanner scn = new Scanner(System.in);
			
			/*배열
			 * 문제)최대 100개 정수를 입력받다가 0이 입력되면 종료하고 그때까지 입력된 수 중 5의 배수의 개수와 합계, 평균을 출력하는 프로그램
			 * 입력예)35 10 23 100 64 51 5 0
			 * 출력예)5의 배수 : 4개
			 * 합계 : 150
			 * 평균 : 37.5
			 */
			
		/*	int[] a = new int[100];
			int i, sum=0, count=0;
			double avg;
			
			for(i=0; i<a.length; i++) {
				a[i]= scn.nextInt();
				
				if(a[i]==0) {
					break;
				}
				else if(a[i] %5 ==0) {
					count++;
					sum += a[i];
				}
			}
			avg = (double)sum/count;
			System.out.printf("5의 배수 : %d개 \n", count);
			System.out.println("합계 : "+sum);
			System.out.printf("평균 : %.1f", avg);
			
			
			/*문제)100개 이하의 정수를 입력받다가 0이 입력되면 0을 제외하고 그때까지 입력받은 개수를 출력한 후
			 * 입력받은 정수를 출력하되 그 수가 홀수이면 2배한 값을, 짝수이면 2로 나눈 몫을 출력하는 프로그램.
			 * 단, 값 출력은 배열을 이용하지 않음(배열의 입력 값은 변경 없음 =배열 원본은 변경하지 않는다)
			 * 입력예)8 10 5 15 100 0
			 * 출력예)5
			 * 		4 5 10 30 50
			 */
			
			
			//방법1 : 경우에 대한 변수를 사용하지 않은 방법
		/*	int[] a = new int[100];
			int i, cnt=0;
			
			for(i=0; i<a.length; i++) {
				a[i] =scn.nextInt();
				if(a[i]==0) {
					break;
				}
				cnt++;
			}
			
			System.out.println(cnt);
			
			for(i=0; i<cnt; i++) {
				
				if(a[i]%2==0) {
					System.out.print(a[i] / 2 + " ");
					
				}
				else {
					System.out.print(a[i] * 2 + " ");
				}
			}
			
			
			//방법2 ->각 상황에 따라 변수를 사용함 : 방법1보다 선호되는 방법
			//배열에서는 원본 데이터를 변경하지 않는 것을 원칙으로하기 때문 
			
			int[] a = new int[100];
			int i, cnt=0, odd, even;
			
			for(i=0; i<a.length; i++) {
				a[i] =scn.nextInt();
				if(a[i]==0) {
					break;
				}
				cnt++;
			}
			
			System.out.println(cnt);
			
			for(i=0; i<cnt; i++) {
				
				if(a[i]%2==0) {
					even = a[i] / 2;
					System.out.print(even + " ");
					
				}
				else {
					odd = a[i] * 2;
					System.out.print(odd + " ");
				}
			}
			
			//방법3) if 문에서 둘중에 하나만 나오기 떄문에 변수를 하나만 사용해줘도 된다
			int[] a = new int[100];
			int i, cnt=0, val;
			
			for(i=0; i<a.length; i++) {
				a[i] =scn.nextInt();
				if(a[i]==0) {
					break;
				}
				cnt++;
			}
			
			System.out.println(cnt);
			
			for(i=0; i<cnt; i++) {
				
				if(a[i]%2==0) {
					val = a[i] / 2;	
				}
				else {
					val = a[i] * 2;
				}
				System.out.print(val);
			}
		*/	
			
			/*문제)정수 10개를 입력받아 최대 값을 출력하는 프로그램 작성
			 * 단, 변수는 배열변수 score와 출력용 max, for문용 i 만을 선언함
			 * 정수는 0~100사이 값만 입력 받으며 나머지 값 입력시 
			 * "숫자의 범위가 초과 되었습니다."
			 * "0~100까지의 숫자를 다시 입력하세요.>"
			 * 입력예)110
			 *      숫자의 범위가 초과 되었습니다.
			 *      0~100까지의 숫자를 다시 입력하세요.
			 * 입력예)95 67 88 65 76 89 58 93 77 99 (이 예처럼 나오게 하지 말고 println을 사용하시오)(입력 시 하나의 값 입력 후 엔터)
			 * 출력예)가장 큰 값은 99입니다.
			 *      
			 */
			
			
			//방법1
		/*	int i, max = 0; 
			int[] score = new int[10];
			
			for(i=0; i<score.length;i++) {
				score[i] =scn.nextInt();
				
				if(score[i]<0 || score[i]>100) {
					System.out.println("숫자의 범위가 초과 되었습니다.");
					System.out.println("0~100까지의 숫자를 다시 입력하세요.>");
					i--;   //잘못 입력된 배열 인덱스 부터 다시 입력받도록 하기위함
					continue;
				}
			}
				
				max =score[0];
				
			for(i=0; i<score.length; i++) {
				if(score[i]>max) {
					max = score[i];
				}
			}
				
			
			System.out.println("가장 큰 값은 " + max +" 입니다.");
			
			
			
			//방법2) 
			int i, max = 0; 
			int[] score = new int[10];
			
			for(i=0; i<score.length;i++) {
				score[i] =scn.nextInt();
				if(score[i]<0 || score[i]>100) {
					System.out.println("숫자의 범위가 초과 되었씁니다.");
					System.out.println("0~100까지의 숫자를 다시 입력하세요.>");
					//잘못 받았을 때는 그 인덱스에 다시 입력받을 수 있도록 한다   
				}
			
		//for문에서 증감식을 안써주고 이렇게 써줘도 된다.
//				else
//					i++;
			}	
			max = score[0];
			
			for(i = 1; i<score.length; i++) {
				if(max < score[i]) {
					max = score[i];
				}
			}
			System.out.println("가장 큰 값은 " + max +" 입니다.");
			
			
			
			//방법3
			for(i=0; i<score.length;i++) {
				score[i] =scn.nextInt();
				while(score[i]<0 || score[i]>100) {
					System.out.println("숫자의 범위가 초과 되었씁니다.");
					System.out.println("0~100까지의 숫자를 다시 입력하세요.>");
					score[i] =scn.nextInt();
				}
			}
			
			
			/*문제)20이하의 정수 n을 입력받고 n명의 점수를 입력받아 높은 점수부터 차례로 출력하는 프로그램
			 * 입력예)5
			 *      35 10 35 100 64
			 *출력예)100 (내림차순)
			 *     64
			 *     35
			 *     35
			 *     10
			 */
		/*	int n, i, j, tmp;
			
			n = scn.nextInt();
			
			int[] a= new int[n];
			
			for(i=0; i<a.length ; i++) {
				a[i] =scn.nextInt();
			}
			
			for(i=0; i<a.length-1; i++) {	
				for(j=i+1; j<a.length; j++) {
					if(a[i] < a[j]) {
						tmp = a[i];
						a[i] = a[j];
						a[j] = tmp;
					}
				}
			}
			
			for(i=0; i<a.length; i++) { //출력
				System.out.println(a[i]);
			}
			
			

			//선택정렬
			//val은 가장 큰 값을 담는곳
			//idx는 가장 큰 값의 인덱스번호 담는거
		/*	int i ,j ,tmp, val, idx=0;
			
			n = scn.nextInt();
			int[] a = new int[n];
			
			for(i=0; i<a.length; i++) {
				a[i] = scn.nextInt();	
				
			}
			
			a[i] =a[0];
			
			for(i=0; i<a.length-1; i++) {
				for(j=i+1; j<a.length; j++) {
					
					if(a[i]<a[j]) {
						
					}
				}
			idx =0;
			}
			
			*/
			
		
			
			/*배열 복사
			 * 정수 크기가 5개인 배열을 선언하고 각 10,20,30,40,50을 저장한 후 2배 크기의 배열을 선언하여 새로 선언한
			 * 배열에 복사한 후 출력하는 프로그램
			 * 출력예)[변경전]
			 *      arr.length : 5
			 *      arr[0] : 10
			 *      arr[1] : 20
			 *      arr[2] : 30
			 *      arr[3] : 40
			 *      arr[4] : 50
			 *      [변경후]
			 *      arr.length : 10
			 *      arr[1] : 10 
			 *      arr[2] : 20
			 *      arr[3] : 30
			 *      arr[4] : 40
			 *      arr[5] : 50 
			 *      arr[6] : 0
			 *      arr[7] : 0
			 *      arr[8] : 0
			 *      arr[9] : 0
			 */
			
		/*	int[] arr = new int[5];
			int i, num =10;
			
			for(i=0; i<arr.length; i++) {
				arr[i] = num * (i+1);
			}
			System.out.println("[변경전]");
			System.out.printf("arr.length : %d \n", arr.length);
				
			for(i=0; i<arr.length; i++) {
				System.out.printf("arr[%d] : %d \n", i, arr[i]);
			}
			
			int[] tmp = new int[arr.length * 2];
			
			System.out.println("배열 복사 전 주소...");
			System.out.println("arr : "+arr);
			System.out.println("tmp : "+tmp);
			
			//배열 값 복사
			for(i=0; i<arr.length; i++) {
				tmp[i] = arr[i]; //tmp에 arr[i]값을 복사해준다 
			}
			
			arr = tmp;
			
			System.out.println("배열 복사 후 주소");
			System.out.println("arr : "+arr); //이 주소와
			System.out.println("tmp : "+tmp); //이 주소가 같게 출력된다. 
			
			
			System.out.println("[변경후]");
			System.out.println("arr.length : "+arr.length);
			
			for(i=0; i<arr.length; i++) {
				System.out.printf("arr[%d] : %d \n", i, arr[i]);
			}
			
			//여기서부터는 같은 주소를 바라보는지 확인하기
			System.out.println("tmp[0] : "+ tmp[0] + ", arr[0] : " + arr[0]);
			System.out.println("tmp[1] : "+ tmp[1] + ", arr[1] : " + arr[1]);
			
			tmp[1] =99;
			System.out.println("값 변경후...");
			System.out.println("tmp[1] : "+ tmp[1] + ", arr[1] : " + arr[1]);
			
			/*문제)정수 5개를 입력받을 배열을 선언한 후 정수 5개를 입력받아 배열에 저장한 후 배열복사를 통해 크기가 2배인 배열에 복사하고 원래
			 * 배열크기 뒤부터 다시 입력 5개를 받아 출력하는 프로그램 작성
			 * 단, 추가입력까지 모두 한 후 배열 복사 진행( arr = tmp;)
			 * 입력예)10 20 30 40 50
			 * 출력예)arr.length : 5
			 *     10 20 30 40 50
			 * 입력예)1 2 3 4 5
			 * 배열복사 후 (출력 아님)
			 * 최종출력예)10 20 30 40 50 1 2 3 4 5  //복사를 먼저 하고 나중에 입력받음
			 */
			
			//(추가입력은 tmp에서 받아야한다), ( arr = tmp;)는 변수를 이용하지 않고 arr을 쓰겠다는 뜻
		/*	int[] arr = new int[5];
			int i, n;
			
			int[] tmp = new int[arr.length * 2];
			
			n =arr.length;
			
			for(i=0; i<arr.length;i++) {
				arr[i] = scn.nextInt();
			}
			
			System.out.println("arr.length : "+ arr.length );
			for(i=0; i<arr.length; i++) {
				System.out.print(arr[i]+ " ");
			}
			
			
			for(i=0; i<arr.length; i++ ) { //배열 복사
				tmp[i] = arr[i]; //값을 복사해서 넣어줌   tmp = arr이랑은 달라!! tmp = arr은 arr의 주소값을 넣어주는것임(주소를 복사하는것임)
			}  
			
			for(i=n; i<tmp.length; i++) {//입력
				tmp[i] = scn.nextInt();
			}
			
			arr = tmp; //tmp의 주소값을 arr에 넣어서 갱신 (주소를 넣어주는 것임!!! 값아님)
			
			System.out.println("arr.length : " + arr.length); //10
			
			for(i =0; i<arr.length; i++) {
				System.out.print(arr[i]+" ");
			}
		*/	
			
			/*랜덤 Math.random()
			 * 실행결과)0123456789
			 *       5827164930
			 */
			
			//렌덤 발생할 수 있는 인덱스값이 0~9인 것들중 하나
			
		/*	int[] arr= new int[10];
			int i, n = 0, tmp;
			
			for(i=0; i<arr.length; i++) {
				arr[i]=i;
				System.out.print(arr[i]);
			}
			
			System.out.println();//출력용 엔터
			
			for(i=0; i<10; i++) {
				//.random()메서드는 반환타입이 double이기 때문에 강제 형변환 해주기
				//Math.random() 에 10을 먼저 곱해준 후 int로 강제 형변환해줘
				//0~9사이의 하나의 값을 반환함	
				n = (int)(Math.random() * 10); 
				
				System.out.printf("%d ", n);
				//제일 첫번째 입력받은 숫자 arr[0]를 기준값으로 고정!! random()메서드로 랜덤숫자를 뽑아 변수에 넣어준다
				//[n]으로 해주면 그게 인덱스가 됨
				//비교할 값의 인덱스로 [n]으로 해서 기준값과 바꿔준다.
				tmp= arr[0];   
				arr[0] = arr[n];
				arr[n] = tmp;
			}
			
			
			for(i=0; i<arr.length; i++) {
				System.out.printf("%d", arr[i]);
			}
			
			
			/*문제)로또번호 발생기
			 * 단, Math.random() * 45   //0~44 중 한 값 생성   //인덱스로 사용할 숫자임
			 * 0번째와 random 배열의 값을 바꾸는데 횟수를 100번 실행,
			 * 최종 로또번호는 앞에서 부터 6개 출력 (로또번호는 배열에 0~5번째 값으로 사용.) 
			 */
			
			int i, n=0, tmp;
			int[] a = new int[45];
			
			for(i=0; i<a.length; i++) {  //배열에 값 넣어주기
				a[i] = i;
				//System.out.print(a[i] +" "); //1~44까지 들어가는 것을 확인
			}
			
			System.out.println("숫자를 섞기 전");
			
			
			for(i=0; i<100; i++) { //랜덤값 생성후 랜덤값을 인덱스로 지정해줘서 그 인덱스를 가진 값과 [0]과의 값을 바꿔준다
						
				n= (int)(Math.random() * 45); //랜덤 숫자 0~44중 한 값 생성
				
				//랜덤값으로 나온 숫자와 같은 숫자를 인덱스로 쓰는 값과 [0]과 값을 바꿔준다
				tmp = a[0];
				a[0] = a[n];
				a[n] = tmp;
				
			}
			
			for(i=0; i<6; i++) { //랜덤으로 선정된 값 6개 출력
				System.out.print(a[i]+ " ");
			}
			
			
			
			//모범코드
		/*	int[] b =new int[45];
			int i, tmp, n;
			
			for(i =0; i<b.length; i++) {
				b[i] =i+1;
			}
			
			for(i=0; i<100; i++) { //i<100 에서 숫자가 커질수록 숫자들이 더 많이 섞일 가능성이 높아진다.
				n= (int)(Math.random() * 45);
				
				tmp =b[0];
				b[0] = b[n];
				b[n] = tmp;
			}
			
			for(i=0; i<6; i++) {
				System.out.printf("%d ", b[i]);
			}
		*/	
			
			
			
			
		}
	}
