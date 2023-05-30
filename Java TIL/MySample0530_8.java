package sstStudy;

class Product3{
	int price;
	int bonusPoint;
	
	Product3(int price){
		this.price =price;
		this.bonusPoint = (int)(price/10.0);
	}
}

class Tv4 extends Product3{
	
	Tv4(){
		super(100);
	}
	
	public String toString() {
		return "Tv";
	}
}

class Computer3 extends Product3{
	
	Computer3(){
		super(300);
	}
	
	public String toString() {
		return "Computer";
	}
}

class Audio extends Product3{
	
	Audio(){
		super(50);
	}
	
	public String toString() {
		return "Audio";
	}
}

class Buyer2{
	int money = 1000;
	int bonusPoint = 0;
	Product3[] item = new Product3[10]; //배열사이즈:10  Product3[] 배열은 다형성 떄문에 Product를 상속받은 모든것을 받을 수 있다
	int cnt = 0;  //배열에 사용될 카운트, 0번째부터 차례대로 넣어주기 위함
	
	void buy(Product3 p) { //코드의 중복을 줄이기 위해 참조형 객체를 매개변수로 받음. 단,Product3에 있는 것만을 가지고 쓸수 있다
		if(money < p.price) {
			System.out.println("잔액부족으로 물건 못사..");
			return;
		}
		
		money -= p.price;
		bonusPoint += p.bonusPoint;
		item[cnt++] = p; //cnt변수값을 item[]배열의 인덱스 값으로 사용
		System.out.println(p + "을(를) 구매하셨습니다.");  //각 클래스에 toString 오버라이딩 메서드 호출
		//각 참조변수 타입에 맞춰서 받음
		
		int i;
		for(i=0; i<item.length; i++) {
			System.out.println("item[" + i + "] "+ item[i]);  //item[i]는 해당하는 인덱스 안의 값이 출력됨 
		}	
	}
	
	void summery() { //구매한것들 보여줌
		int sum = 0; //구입 물품 가격 합계
		String itemList = ""; //구입 물품 목록
		int i ;
		
		//구입한 물품 총 가격과 목록
		for(i =0; i<item.length ; i++) {
			if(item[i] == null) {
				break;
			}
			
			sum += item[i].price;
			itemList += item[i] + ", ";  //item[i].toString인데 생략되어 있는 것임
			//Q.왜 pritnln 도 아닌데 item[i]을 하면toString()메서드가 호출됨?
			//itemList += item[i].toSring + ", ";
		}
		
		System.out.println("구입하신 물품의 금액은 " + sum + "만원 입니다.");
		System.out.println("구입하신 제품은" + itemList + " 입니다.");
		System.out.println("구입하신 제품의 총 보너스 점수는 " + bonusPoint + "점 입니다.");
	}
	
}

public class MySample0530_8 {

	public static void main(String[] args) {
		//다형성 - 객체를 배열로
		Buyer2 b =new Buyer2();
		
		b.buy(new Tv4());
		b.buy(new Computer3());
		b.buy(new Audio());
		b.summery();
		
	}
}
