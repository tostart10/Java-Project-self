package sstStudy;

class Person{
	void breath() {
		System.out.println("숨쉬기");
	}
	void eat() {
		System.out.println("밥먹기");
	}
	void say() {
		System.out.println("말하기");
	}
		
}


class Student extends Person{
	void learn() {
		System.out.println("배우기");
	}
}


class Teacher extends Person{
	void teach() {
		System.out.println("가르치기");
	}
}

public class MySample0525_3 {

	public static void main(String[] args) {
		//상속
		Student s1 = new Student(); //자식객체가 생성되면서 자식이내부적으로 부모것도 가지고 있다
		s1.breath();
		s1.learn();
		
		Teacher t1 =new Teacher();
		t1.eat();
		t1.breath();
		t1.teach();
				
	}

}
