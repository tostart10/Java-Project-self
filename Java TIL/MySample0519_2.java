package sstStudy;

import java.util.*;

public class MySample0519_2 {
		//클래스
		int iv; //인스턴스 변수 - 짱구 유리
		static int cv;  // 클래스 변수 -사람(인간)
		
		void methodA() {
			int lv =0; //지역변수
			System.out.println("methodA() lv : "+ lv);
		}

		public static void main(String[] args) {
			//MySample0519_2 클래스를   
			// a 인스턴스는 생성된 객체를 바라본다(시작주소 인스턴스 변수)
			//new MySample0519_2() 를 통해서 객체생성
			MySample0519_2 a =new MySample0519_2(); //이 클래스명은 맨위의 클래스 명과 같아야함, 아니면 적어도 어딘가의 클래스 명과 같아야함
			MySample0519_2 b =new MySample0519_2();
			MySample0519_2 c =new MySample0519_2();
			
			a.methodA(); //a,c,b 다 다른 집, 다른 메소드이다. 값은 미리 지정해줘서 같지만 집은 각각 다르다
			b.methodA(); //위에서 new로 각각 선언해서 객체를 생성해줬기 때문에각각 다른객체(다른집)임
			c.methodA();
			
			a.iv=10;//인스턴스 변수
			b.iv=20;
			c.iv=30;
			System.out.println("a.iv : "+a.iv+"b.iv : "+ b.iv+ "c.iv : "+ c.iv);
			
			
//			MySample0519_2 클래스를
//			 new MySample0519_2 로 객체를생성함
//			이 객체를 바라보는 것이 a 인스턴스 변수이다
//			
//			a 인스턴스 변수로 만 접근 가능하다
//			a.methodA(); 로 접근할 수 있다
			
			//cv는 클래스변수
			a.cv =11;//인스턴스 단위로 방이 생김
			b.cv =22;
			c.cv =33;//입력값 33으로 출력이 된다. cv는 a,b,c 모두 같은 집이라는 뜻
			//클래스 변수는 마지막에 대입된 값으로 덮어씌어지면서 마지막값이 출력된다
			//이렇게 해도 되지만 정식문법은 아니기때문에 경고가 뜬다
			
			System.out.println("1 a.cv : "+a.cv +"b.iv : "+ b.cv+ "c.iv : "+ c.cv);
			System.out.println("1 MySample0519_2 a.cv"+a.cv +"b.iv : "+ b.cv+ "c.iv : "+ c.cv);
			
			
			MySample0519_2.cv =55; //클래스변수로 접근해도
			//클래스변수이기 때문에 노란 줄 안뜸, 한 곳을 바라봄.
			
			System.out.println("2 a.cv : "+a.cv +"b.iv : "+ b.cv+ "c.iv : "+ c.cv);
			System.out.println("1 MySample0519_2 a.cv"+ MySample0519_2.cv);
			
			//a.cv b.cv c.cv 모두 같은 집
			
		

	}

}
