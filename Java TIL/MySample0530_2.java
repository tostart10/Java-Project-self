package sstStudy;


class A{
	//메서드
	void methodA() {
		System.out.println("methodA()..");
	}
}

class B extends A{
	void methodB() {
		System.out.println("methodB()...");
	}
	
}

public class MySample0530_2 {

	public static void main(String[] args) {
		//다형성
		A obj = new B();  //B(자식)로 객체 생성해서 A(부모)형 인스턴스변수(참조형변수)가 B객체를 바라봄
		obj.methodA();  
		//obj.methodB();  //불가능
		//자식클래스로 객체생성하고 부모의 참조형변수로 자식클래스의 객체를 바라보는 것은 불가능 (자식클래스가 부모보다 큰 개념이기 때문)
		
		B obj2 = new B();  //B로 객체 생성해서 B를 바라봄
		obj2.methodB();
		obj2.methodA();
	}
}

