package sstStudy;

import java.util.*;

public class MySample0522_4 {

	public static void main(String[] args) {
		Scanner scn = new Scanner(System.in);
		//클래스(메서드 호출 순서 =스택
		
	/*	System.out.println("main start ...");
		firstMethod();  //원래는 클래스명인 MySample0522_4을 앞에 붙여야 맞지만 같은 클래스내에있는 메서드를 호출할 때에는 생략가능
		//정식문법은 MySample0522_4.secondtMethod(); 이 맞음
		//같은 클래스 내의 메서드를 호출할 떄에는 클래스명 인스턴스명 생략가능
		//단, 인스턴스는 인스턴스, 클래스는 클래스형 으로 형이 맞아야한다.
		System.out.println("main end ...");
	

	static void firstMethod() {
		System.out.println("firstMethod start...");
		secondtMethod(); //호출
		System.out.println("firstMethod end...");
	}
	
	static void secondtMethod() {
		System.out.println("secondMethod start...");
		thirdtMethod();//호출
		System.out.println("secondMethod end...");
	}
	
	
	static void thirdtMethod() {
		System.out.println("thirdMethod start...");
		System.out.println("thirdMethod end...");
	}
	
	/*정수 2개를 입력받아 메서드 호출 전과 후에 대한 결과를 출력하는 프로그램
	 * 입력예)정수 2개를 입력하세요. > 5 10
	 * 출력예)호출 전 a: 5, b : 10
	 * add 메서드 a: 10, b:20
	 * 결과 : 10
	 * 호출 후 a: 5, b :10
	 */
	
	System.out.println("정수 2개를 입력하세요.>");
	int a =scn.nextInt();
	int b =scn.nextInt();
	
	System.out.printf("호출 전 a : %d, b : %d \n", a, b);
	
	//인스턴스 메소드기 때문에 객체 생성해줘야함
	Math4 m4 =new Math4();
	
	//이안에서 결과값 출력하고 싶다면
	//System.out.println("결과 : " + m4.add(a, b));
	//이렇게 쓴다 대신 밑의 m4.add(a, b);와  add메서드의 출력을 없애줘야 한다.
	
	m4.add(a, b);
	//add메서드의 a, b 와 main메서드의 a, b는 다르기 때문에 다른값 줄력됨
	
	System.out.printf("호출 전 a : %d, b : %d \n", a, b);
	
	
	
	
	
	}
	
}

class Math4{
	int add(int a, int b) {
		int result;
		a = 10;
		b =20;
		
		result = a+b;
		System.out.println("add 메서드 a : " + a + ", b" + b);
		System.out.println("결과 : " + result);
		
		return result;
		
	}
}