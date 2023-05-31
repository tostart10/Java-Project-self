import java.util.Vector;

//MySample0530_8에 있는 Product3클래스 등의 클래스들을 가져다 쓰는 것임

//<배열의 단점>
//배열은 선언하는 순간 크기가 정해진다
//배열은 앞의 인덱스값이 없어지면 뒤에있는 값들이 자동으로 한칸씩 앞으로 땡겨져서 자리를 매꾼다
//이런 배열의 단점을 보안하기 위해 ﻿Vector클래스 사용

class Buyer3{ //default 클래스임, default의 특징 : 같은 패키지 내에서는 접근가능
	int money = 1000;
	int bonusPoint = 0;   //사람당 가지고 있는 bonusPoint임
	Vector item =new Vector(); //매개변수 없는거, 매개변수 한개, 매개변수 2개 
	//지금은 백터 내브 생성자를 생각하지 말고 new Vector() 해서 10크기의 Vector를 만들었다만 생각하자
	//Vector의 특징
	//증감이 가능하다
	//종류 : 매개변수 없는거, 매개변수 한개, 매개변수 2개 
	
	
	void buy(Product3 p) {//다형성으로 Product3 클래스를 상속받은 모든클래스의 데이터타입이 올수 있다
		if(money < p.price) {   //p.price는 p를 통해서 0530_8파일의 인스턴스변수 price에 접근하는 것
			System.out.println("잔액이 부족하여 물건을 살 수 없습니다.");
			return;
		}
		
		//물건을 살수 있을때 실행
		money -= p.price;
		bonusPoint += p.bonusPoint;  //물건을 살때마다 내 포인트 적립
		//벡터에 추가
		item.add(p); //백터형 item인스턴스 변수가 가르키고 있는 백터객체에 넣음
		//백터는 알아서 앞에서부터 채워준다
		//백터는 참조변수를 가지고 있으므로 객체가 들어오는 것임
		//add할때 add를 해줄려면 Product3이거나 Product3을 상속받은 애들의 데이터 타입이여야함
		
		System.out.println(p + "을(를) 구매하셨습니다.");
		//p 객체를 썻으므로 toString() 메서드를 호출
	}
	
	void summary() {
		int sum =0; //물건 총합
		String itemList = "";  //물품의 목록 담기위함
		int i;
		//vector에있는 것을 하나씩읽어올때마다 product3로 형변환해줄것임
		//백터의 get메서드를 사용하기 위함
		//반환타입이 Object타입 이므로
		//백터안에 값을 넣을 건데 데이터 타입이 Product3클래스이거나 Product3클래스를 상속받은 클래스형인것들만 담을수 있도록 밑에서 형변환해주고 넣는다 
		Product3 p =null;
		//p는 인스턴스명, 참조형이여서 주소만 받을 수 있고, 참조형이 Product3타입이어야함
		
		if(item.isEmpty()) {
			System.out.println("구입한 물건이 없습니다.");
			return;
		}
		
		//만약 for문으로 왔다는 것은 비어있지 않다는 것
		for(i=0; i < item.size(); i++) {  //item.size()로 인해 물건을 3개만 샀다면 3까지만 함 -> 생성된 배열의 크기가 아닌 벡터에 들어온 값들의 개수만큼만 돌린다
			
			//다형성을 사용해서 각 클래스형마다 형변환하는 번거로움을 없애기 위해
			//가장 높은 클래스인 Product3으로 형변환을 해준다
			//그러면 Product3클래스를 상속받은 클래스들의 데이터형을 가진 것들은 모두 들어갈 수 있다
			p = (Product3)item.get(i); //강제 형변환 해줌, 형변환해주고 담아줌
			//Q
			//get()메서드의 반환타입은 Object이다 
			//하지만 p는 Product3클래스형 데이터 타입이므로 Product3클래스형 데이터 타입을 가진 주소값들만 들어올수 있기때문에 형변환 해줘야한다.
			//형변환이 가능한것은 item.get(i) 안에 들어있는 product3를 상속받은 모든 것들은 들어올수 있음
			//.add()를 한다고 다 들어갈수 있는 게 아님 Product3를 상속받은 애들만 데이터타입이 맞으므로 들어갈 수 있다
			//강제 형변환 한다고 아무거나 형변환할 수 있는 것이 아님
			//item.size()는 백터의 크기이다. 
			//add를 통해서 넣어준 객체주소의 개수가 item.size()가 된다
			
			
			
			//값을 누적, 상품리스트에 넣어주기
			sum += p.price;
			
			//삼항연산자 -> 조건 ? 참 : 거짓 ;
			//삼항연산자를 이용해서 물건을 샀을 때 조건 (i==0)으로 첫번쨰돌릴 때만 물건이름만 출력하고
			//그 뒤로 부터는 물건이름과,이 출력되도록 함(끝에는 ,이 찍히지 않도록하기 위함) 
			//조건 (i==0)은 물건이 처음인지를 판별
			//산 물품을 itemList에 추가해주기
			itemList += (i==0) ? (""+ p) : ("," + p);     // p + ",";
			
		}
		System.out.println("구입한 총금액 "+ sum + "만원 입니다.");
		System.out.println("구입한 물품은 " + itemList + " 입니다.");	
	}
	
	//백터는 참조 주소를 가지고 있다
	
	//환불
	void refund(Product3 p) {
		if(item.remove(p)) {   //벡터에서 삭제할려면 remove사용, 리턴타입이 boolean으로 true/false가 나옴
			money += p.price;  //내가가지고 잇는 돈에 돈 더해주기
			bonusPoint -= p.bonusPoint;
			System.out.println(p + "을(를) 반품 했습니다.");
			//p는 객체 객체를 쓰면 내부적으로 toString()메서드를 호출하게 되어 있다
			//이거는 println 을 통해서 객체p의 toString()메서드를 호출하는 것이지만 
			//그냥  ~ = 객체  만 써도 자동적으로 toString()메서드를 호출한다
		}
		else { //산 물품이 아니면 물품이 없으므로 환불 안됨
			System.out.println("해당 제품이 없습니다.");
		}
	}
}

public class MySample0531 {

	public static void main(String[] args) {
		//﻿Vector클래스
		Buyer3 b = new Buyer3();
		
		//MySample0530_8에 있는 Product3클래스 등의 클래스들을 가져다 쓰는 것임
		Tv4 t = new Tv4();  //Product3 t = new Tv4();으로 해도 되지만 지금은 구지 다형성 할 필요없어서 안함
		Computer3 com = new Computer3();
		Audio audio = new Audio();
		
		b.buy(t);     //buy() 안에 매개변수로 new를 안한이유 : 밑에 b.refund(com);를 하기 위해서
		b.buy(com);
		b.buy(audio);
		b.summary();
		
		System.out.println();
		
		
		//환불
		b.refund(com);
		b.summary();
		
		b.refund(com);
	}

}
