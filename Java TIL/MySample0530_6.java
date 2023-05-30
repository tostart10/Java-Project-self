package sstStudy;

class Parent4{
	int x =100;
	
	void method() {
		System.out.println("Parent4 method()...");
	}
}


class Child4 extends Parent4{
	int x =200;
	
	void method() {
		System.out.println("x =" + x);
		System.out.println("super.x = "+ super.x);
		System.out.println("this.x = "+ this.x);
	}
}

public class MySample0530_6 {

	public static void main(String[] args) {
		//참조형변수와 인스턴스 연결
		Parent4 p = new Child4();
		Child4 c = new Child4();
		
		System.out.println("p.x = "+ p.x); //참조변수가 부모타입이므로 부모의 인스턴스 변수 x=100을 출력
		p.method();// 객체생성을new Child4();로 해서 자식클래스에 대한 객체를 생성했기 때문에 자식에게 있는 method() 메서드를 호출해서 출력함

		
		//부모도 있고 자식에도 잇으면 객체 생성을 자식걸로 했으면 자식에게 있는 메서드를 사용함
		System.out.println("c.x = "+ c.x);
		c.method(); // 자식클래스의 메서드로 출력됨	
	}

}
