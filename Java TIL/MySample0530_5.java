package sstStudy;

//간단히 상속관계만 파악하기 위한 코드
class Parent3{
	
}

class Child3 extends Parent3{
	
}

class Brother extends Parent3{
	
}

public class MySample0530_5 {

	public static void main(String[] args) {
		//다형성 (instanceof 연산자)
		//instanceof 연산자는 앞에있는 객체로 instanceof 뒤에 있는 클래스를 참조할 수 있는지를  true/false로 나타냄
		//참조변수가 가르키는 인스턴스의 타입이 무엇인지를 알아보기 위해 사용
		
		//Q참조변수가 참조하는 인스턴스의 실제 타입을 체크하는데 사용
		//객체 = 인스턴스 =   는 다 같은말 
		Parent3 p =new Parent3();
		
		//인스턴스 p가 instanceof 뒤의 객체인 Object,Parent3,Child3 를 참조하는지를 알아보는 것
		System.out.println(p instanceof Object);  //true   인스턴스 변수:p, 객체 : Object
		System.out.println(p instanceof Parent3); //true  인스턴스 변수:p, 객체 : Parent3
		System.out.println(p instanceof Child3);   //false  인스턴스 변수:p, 객체 : Child3
		
		Parent3 p2 = new Child3();
		
		System.out.println(p2 instanceof Object);  //true
		System.out.println(p2 instanceof Parent3); //true
		System.out.println(p2 instanceof Child3);   //true
	}
}

