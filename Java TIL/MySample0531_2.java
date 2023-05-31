package abs; //default 패키지가 아니기 때문에 자동으로뜬다

abstract class Animal{
	abstract void cry();  //추상메서드이기 때문에 선언부만 정의한다.
}

class Cat extends Animal{  //추상클래스를 상속받으면 반드시 추상메서드를 메서드 오버라이딩으로 구현해야함
	//추상메서드 오버라이딩
	void cry(){
		System.out.println("야옹야옹...");
	}
}

class Dog extends Animal{
	//추상메서드 오버라이딩
	void cry() {
		System.out.println("멍멍멍멍....");
	}
}


public class MySample0531_2 {

	public static void main(String[] args) {
		//추상클래스
		//Animal a =new Animal(); //추상클래스는 인스턴스를 생성할 수 없다
		//Animal a =; 처럼 추상클래스형 변수를 선언할 수 는 있으나 new로 추상클래스형 객체를 생성할 수 는 없다.
		Cat c = new Cat();  //Animal c = new Cat(); 도 가능
		Dog d = new Dog();  //Animal d = new Dog(); 도 가능
		
		c.cry();
		d.cry();
	}
}
