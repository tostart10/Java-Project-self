package etc;

import java.util.*;

public class Test {

	public static void main(String[] args) {
		Scanner scn = new Scanner(System.in);
		/* 문제
		 * 문제1) for문을 이용한 별찍기
		 * 입력예) 별찍을 줄수를 입력하세요>5
		 * 출력예)     *
		 * 			**
		 * 		   ***
		 * 		  ****
		 *		 *****
		 */
		
		
	/*	System.out.println("별찍을 줄 수를 입력하세요. >");
		int n = scn.nextInt();
		int i;
		for(i=0 ; i<n ; i++ ) {
			
			for(int j =i; j < n-1 ; j++) {
				System.out.print(" ");
			}
			
			for(int j =0 ; j <= i ; j++) {
				System.out.print("*");
			}	
			
			System.out.println();
		}
		
		
		System.out.println("별찍을 줄 수를 입력하세요. >");
		int n = scn.nextInt();
		int i;
		for(i=0 ; i<n ; i++ ) {
			
			for(int j =n-1; j > i ; j--) {
				System.out.print(" ");
			}
			
			for(int j =0 ; j <= i ; j++) {
				System.out.print("*");
			}	
			
			System.out.println();
		}
	*/	
		
		/*문제)두개의 주사위를 던졌을때, 합이 6이 되는 모든 경우의 수를 출력하는 프로그램 (for문사용)
		 * 출력에) 1+5 = 6;
		 * 2 + 4 =6
		 * 3 + 3 =6
		 * 4 + 2 =6
		 * 5 + 1 = 6
		 */
		
		int i, j;
		
		for(i=1 ; i<=6; i++) {
			
			for(j=1 ; j <=6; j++) {
				
				if(i+j == 6) {
					System.out.println(i + " + " + j + " = "+ (i+j));
				}
			}
		}
		
		
		
	}

}
