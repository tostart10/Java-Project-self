package sstStudy;

class Product2{
	int price; //제품가격
	int bonusPoint; //제품 구매시 제공 보너스 점수
	
	Product2(int price){
		
		this.price = price;  //이걸 안해주면 금액이 안빠지고 money가 1000만원으로 출력됨
		bonusPoint = (int)(price/10.0);  //제품가격의 10퍼센트 적용
	}
	
}

class Tv3 extends Product2{
	Tv3(){
		super(900);  //부모클래스인 Product2클래스에 매개변수가 없는 기본 생성자가 없기 때문에 꼭 super(매개변수)를 써줘야한다
	}
	
	public String toString() {
		return "Tv";
	}
}

class Computer2 extends Product2{
	Computer2(){
		super(500); //부모클래스인 Product2클래스에 매개변수가 없는 기본 생성자가 없기 때문에 꼭 super(매개변수)를 써줘야한다
	}
	
	public String toString() {
		return "Computer";
	}
}


class Buyer{
	int money = 1000;   //보유금액
	int bonusPoint = 0;  //보유보너스
	
	//다형성 사용으로 코드 중복 줄임
	void buy(Product2 p) { //new Product,Tv, Computer 모두 받을 수 있다 ,주소값을 매개변수로 받음 //이코드는 이걸 사용하기 전에 객체가 생성되어 있을거라고 가정한것임
		if(money < p.price) {//물건 살수 없는 예외처리
			System.out.println("잔액 부족으로 물건을 살 수 없습니다.");
			return;
		}
		
		money -= p.price;
		bonusPoint += p.bonusPoint;
		System.out.println(p + "을(를) 구매하셨습니다.");  // Tv3클래스의 객체이므로  Tv3클래스의 toString()메서드 호출
	}
	
}


public class MySample0530_7 {

	public static void main(String[] args) {
		//다형성 (매개변수의 다형성)
		Buyer b =new Buyer();  //객체 생성으로 생성자 호출
		
		//Product2 p =new Tv3(); 이렇게 해도 되지만 인스턴스변수 p가 후에 쓰이지 않기 때문에 굳이 생성할 필요 없음
		//b.buy(p);
		b.buy(new Tv3());   //객체생성으로 Tv3 생성자 호출//객체의 시작주소값만 필요하기 떄문에 변수는 필요없음, 객체생성으로 생긴 주소값을 매개변수로 넘김
		b.buy(new Computer2()); 
		//1. Computer2 객체생성으로 Computer2생성자호출로 값 대입되도록함
		//2. Computer2 객체생성으로 생긴 참조 주소값을 b인스턴스가 가르키고 있는 Buyer클래스의 buy()메서드에게 매개변수값으로 전달한다.
		
		System.out.println("현재 남은 돈은 "+ b.money + "만원 입니다.");
		System.out.println("보너스 점수는 "+ b.bonusPoint + "점 입니다.");
		
	}

}
