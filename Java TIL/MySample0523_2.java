package sstStudy;

import java.util.*;

class Add{
	int a;
	int b;
	int c;
}

public class MySample0523_2 {

	public static void main(String[] args) {
		//객체지향프로그램 - 참조형 매개변수
		/*문제)두 정수를 Add클래스 a,b 변수에 입력받은후 더하기, 빼기, 곱하기, 나누기 메서드를 이용하여 결과를 main에서 출력하는 프로그램
		 * 입력예)더하기 : 8 //add메서드
		 * 빼기 : 2 //sub
		 * 곱하기 : 15//mul
		 * 나누기 : 1// div
		 */
		
		
		/*Add.a -> 클래스변수 a를 쓰는방법(클래스명.변수명)
		인스턴스 변수 쓰는법 (객체명.변수명)
		Add calc =new Add();
		calc.a = scn.nextInt();
		*/
		Scanner scn = new Scanner(System.in);
		
		Add calc =new Add();
		calc.a = scn.nextInt();
		calc.b = scn.nextInt();
		
		add(calc);//매개변수로 넘길떄는 데이터타입을 쓰지 않는다(위에서 객체생성 할 때 데이터타입도 선언되었기 때문에)
		System.out.println("더하기 : "+ calc.c); //Add.c는 쓸수없다-> class안의 c는 인스턴스 변수기 때문에 객체 생성해줘야해서
		sub(calc);
		System.out.println("빼기 : "+ calc.c);
		
		div(calc);
		System.out.println("나누기 : "+ calc.c);
		mul(calc);
		System.out.println("나누기 : "+ calc.c);

	}
	
	//앞에 클래스명이 없다는 것은 클래스 메서드라는 뜻
	
	static void add(Add calc){//매개변수를 받을 때는 매개변수도 일종의 변수이기 때문에 데이터타입을 꼭 명시해야한다.(문법으로 정해져있음)
		calc.c = calc.a + calc.b; 
		
	}
	
	static void sub(Add calc){
		if(calc.a < calc.b) {
			calc.c = calc.b - calc.a;
		}
		calc.c = calc.a - calc.b;
	}
	static void mul(Add calc){
		calc.c = calc.a * calc.b;
		
	}
	static void div(Add calc){
		calc.c = calc.a / calc.b;	
	}
}
