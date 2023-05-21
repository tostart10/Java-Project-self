package sstStudy;
import java.util.*;


public class Study0519 {
		public static void main(String[] args) {
			Scanner scn = new Scanner(System.in);
			
			//String 클래스
		/*	String str = "java programing"; //java programing이라는 글자 하나하나는 내부적으로 char배열이다. 그 배열은 str변수에 들어있는것임
			char c = str.charAt(0);         //java programing의 공백도 자리를 차지하는 거기 때문에 인덱스에 포함됨
			char[] ch = {'j', 'a','v','a'};
			
			System.out.println("str.charAt(0) : " + c);
			System.out.println("str.charAt(5) : "+ str.charAt(5));
			
			System.out.println("str.length() : "+ str.length()); //15
			System.out.println("str.substring : "+ str.substring(3)); //매개변수가 한개필요한substring(), 인덱스3 부터 끝까지 출력해라
			System.out.println("str.substring : "+ str.substring(1,8));//매개변수가 한개필요한substring(), 인덱스 1부터 8이전까지만 출력해라(8포함 안함)
			
			
			System.out.println("str.equals(1) : " + str.equals("java programing")); //
			System.out.println("str.eauals(2) : " + str.equals("java")); //
		
			
			int num =10;
			String str1 = String.valueOf(num);
			System.out.println(str1 +", length: "+ str1.length());
			
			
			
			//String배열
			String[] names = {"kim", "park","lee"};
			String name = "kimparklee";
	 		int i;
	 		
	 		for(i=0; i<names.length; i++) {
	 			System.out.println("names[" + i+ "]" + names[i]);
	 		}
			
	 		String tmp = names[2];
	 		System.out.println("tmp : "+tmp);
	 		names[0] ="yu";
	 		
	 		for(i=0; i<names.length; i++) {
	 			System.out.println("names[" + i+ "]" + names[i]);
	 		}
		*/

		
			
			//char 배열과 String 클래스 변환
			String str ="ABCDE";
			int i;
			char ch;
			
			for(i=0; i<str.length(); i++) {
				ch = str.charAt(i); //문자열의 글자 하나씩가져와서 읽을 수 있다
				System.out.println("str.charAt(" + i + ") : "+ ch);
			}
			
			
			//String을 char[]로 변환
			char[] chArr = str.toCharArray();
			System.out.println(chArr); 
			System.out.println(chArr + "length : "+ chArr.length); //chArr에for문으로 돌려서 넣어준거 확인, length 도 확인
			//chArr의 시작 주소값이 출력된다(chArr 은 참조형 변수 : 변수명이므로 변수명은 변수의 시작 주소를 가르킨다)
			
			
			/*2차원 배열
			 * 실행결과)
			 *      [행][열]
			 * score[0][0] = 100
			 * score[0][1] = 100
			 * score[0][2] = 100
			 * score[1][0] = 20
			 * score[1][1] = 20
			 * score[1][2] = 20
			 * score[2][0] = 30
			 * score[2][1] = 30
			 * score[2][2] = 30
			 * score[3][0] = 40
			 * score[3][1] = 40
			 * score[3][2] = 40
			 * sum =570
			 */
			
			//중괄호는 행의 개수
		/*	int[][] score = new int[][] {{100,100,100}, {20,20,20}, {30,30,30}, {40, 40, 40}}; //4행3열
			
			
			int i, j, sum=0;
			
			for(i=0; i<score.length; i++) { //score.length 를 하면 행의 개수인 4가 나온다
				for(j=0; j<score[i].length; j++) {
					System.out.printf("socre[%d][%d} = %d \n", i, j, score[i][j] );
					sum+= score[i][j];
				}
			}
			System.out.println("sum = "+ sum);
		*/	
			
			/*문제)String 배열을 이용한 단어 맞추기
			 * 배열에 chair, 의자
			 * computer, 컴퓨터
			 * integer, 정수
			 * 로 선언함
			 * 
			 * 입,출력예)
			 * chair의 뜻은? 책상
			 * 틀렸습니다. 정답은 의자입니다.
			 * 
			 * computer의 뜻은? 컴퓨터
			 * 정답입니다.
			 * 
			 * integer의 뜻은? 정수
			 * 정답입니다.
			 * 
			 * 단, 문자열 비교는  equals 메서드 사용.
			 * 
			 */
			
			
		/*	String[][] words = { {"chair", "의자"}, {"computer","컴퓨터"}, {"integer", "정수"}};
			
			int i; //for문 용 변수
			String str;
			
			for(i=0; i<words.length; i++) {
				
				System.out.println(words[i][0] + "의 뜻은?");
				str =scn.next();
				
				if(words[i][1].equals(str)) {  //words.equals(str)만쓰면 안됨!! 
					        //words.equals(str)에서 words는 배열명 -> 배열명은 그배열의 시작 주소이기 때문에 주소과 str을 비교하게되는 것이므로 비교할수없으니 당연히 에러
					System.out.println("정답입니다.");
				}
				else {
					System.out.println("틀렸습니다. 정답은 "+ words[i][1] + "입니다.");
				}
		    }	
//			if(words.equals(str) == true) {//words.equals(str)만쓰면 안됨!! 
//			words.equals(str)에서 words는 배열명 -> 배열명은 그배열의 시작 주소이기 때문에 print(words)를 해주면 @~ 주소값이 출력됨
	// 즉, word. equals 는 words배열의 시작주소와 str을 비교하게되는 것이므로 , 주소와 문자열은 비교할수없으니 당연히 에러

			
			//모범코드
			int i;
			String str;
			for(i=0; i<words.length; i++) {
				
				System.out.printf("%s의 뜻은?", words[i][0]);
				str =scn.next();
				
				if(str.equals(words[i][1]){
					System.out.println("정답입니다.");
					
				}
				else {
					System.out.printf("틀렸습니다. 정답은 %s입니다. \n", words[i][1]);
				}
			}
		*/	
			/*문제)5명의 학생의 3과목 점수를 더해서 각 학생의 총점과 평균을 계산하고, 과목별 총점을 계산하는 프로그램 작성
			 * 단, 점수는 score 2차원배열에 저장하고 출력시 번호는 %3d, 각 점수는 %5d, 평균은 %5.1f 적용
			 * 실행결과)
			 * 번호  국어  영어  수학  총점  평균
			 * =========================
			 * 1  100 100 100 300 100.0
			 * 2  20  20  20  60  20.0
			 * 3  30  30 30  90   30.0
			 * 4  40  40  40  120  40.0
			 * 5  50  50  50  150  50.0
			 * =======================
			 *총점:240 240 240 
			 */
			
			//i는 학생, j는 과목
	/*		int i, j, sum=0;
			int totalKor =0, totalEng =0, totalMath =0;
			double avg;
			int[][] score = { {100,100,100}, {20,20,20}, {30,30,30}, {40,40,40}, {50,50,50}}; 
			
			
			System.out.println("번호   국어  영어  수학  총점  평균");
			System.out.println("===========================");
			
			for(i=0; i<score.length; i++) {//i는 행, 학생
				System.out.printf("%3d", i+1);// 번호 출력
				
				for(j=0; j<score[i].length; j++) { //j는 각 과목
					sum += score[i][j];
					System.out.printf("%5d ",  score[i][j]);	
				}
				
				totalKor += score[i][0];
				totalEng += score[i][1];
				totalMath += score[i][2];
				avg= (double)sum/score[i].length;
				System.out.printf("%5d %5.1f \n", sum, avg);
				
				sum =0; //초기화
			}
			
			
			
			System.out.println("===============================");
			System.out.printf("총점: %5d %5d %5d \n",totalKor, totalEng, totalMath);
			
			
			
			
		/*	//선생님 코드
			int i, j, sum=0;
			int totalKor =0, totalEng =0, totalMath =0;
			double avg;
			int[][] score = { {100,100,100}, {20,20,20}, {30,30,30}, {40,40,40}, {50,50,50}}; 
			
			System.out.println("번호   국어  영어  수학  총점  평균");
			System.out.println("===========================");
			
			for(i=0; i<score.length; i++) {
				sum =0;//초기화
				System.out.printf("%3d", i+1);// 번호 출력
				
				totalKor += score[i][0];
				totalEng += score[i][1];
				totalMath += score[i][2];
				
				for(j=0; j<score[i].length; j++) {
					System.out.printf(" %5d",  score[i][j]);
					sum += score[i][j];
				}
				
				avg= (double)sum/score[i].length;
				System.out.printf("%5d %5.1f \n", sum, avg);
			}
			
			System.out.println("===============================");
			System.out.printf("총점: %5d %5d %5d \n",totalKor, totalEng, totalMath);
		*/
		

	}

}
