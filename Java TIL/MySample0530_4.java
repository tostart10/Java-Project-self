package sstStudy;

class Animal2{//extends Object가 생략된거임
	void breath() {
		System.out.println("숨쉬기");
	}	
}

class Lion2 extends Animal2{
	public String toString() {
		return "사자";
	}
}

class Rabbit extends Animal2{
	public String toString() {
		return "토끼";
	}
}

class Monkey extends Animal2{
	public String toString() {
		return "원숭이";
	}
	
	public void printA() {
		System.out.println("printA()....");
	}
}


class ZooKeeper{
	//메서드 오버로딩 -하나의 클래스에 매서드명이 동일, 매개변수의 개수, 데이터 타입이 다름
	//자식 클래스의 메서드
/*	void feed(Lion2 lion) {
		System.out.println(lion + "에게 먹이주기...");
	}
	void feed(Rabbit rabbit) {
		System.out.println(rabbit + "에게 먹이주기...");
	}
	void feed(Monkey monkey) {
		System.out.println(monkey + "에게 먹이주기...");
	}
*/	
	//다형성을 위한 메서드
	void feed(Animal2 animal) {  //이 feed 메서드는 amimal, Lion2,Rabbit, Monkey 데이터형 모두 받을 수 있다
		System.out.println(animal + "에게 먹이주기..."); //toSring()메서드를 호출함
		//위의 Animal 클래스에서 toString()메서드를 오버라이딩했기 때문에 Object의 toSring()이 아닌 Animal클래스의 toSring()이 호출됨
	}
	
}

public class MySample0530_4 {

	public static void main(String[] args) {
		//다형성(polymorphism)
		ZooKeeper j =new ZooKeeper();
	/*	Lion2 lion1 = new Lion2();
		j.feed(lion1);
		
		Rabbit rabbit = new Rabbit();
		j.feed(rabbit);
		
		Monkey monkey = new Monkey();
		j.feed(monkey);
	*/	
		
		//다형성
		//toString의 최고 조상은 Object이기 떄문에
		Animal2 lion1 = new Lion2();  //참조형 데이터타입을 Animal2로 함, 얘네는 위의 메서드를 사용할 수 없다
		j.feed(lion1);    //new Lion2()자식 클래스의 메서드이기 때문에 부모클래스인 Animal2에서는 사용할 수 없다
		
		Animal2 rabbit = new Rabbit();
		j.feed(rabbit);
		
		Animal2 monkey = new Monkey();
		j.feed(monkey);
		
		//monkey.printA();  //오류: 객체는 Monkey이지만 참조변수는 Animal 이기 때문에 Monkey 클래스 안에만 있는 printA()메서드는 사용할 수 없다
	}

}

