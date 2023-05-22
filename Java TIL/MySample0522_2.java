package sstStudy;

class Card{ //인스턴스 변수는 객체를 생성해줘야지만 사용가능
	String kind;
	int number;
	
	static int width =100;
	static int height = 250;
	
	//static 이 붙어있지 않으면 인스턴스 메소드
	//static 가 붙어있으면 클래스 메서드
}


public class MySample0522_2 {

	public static void main(String[] args) {
		//클래스
		System.out.println("Card.width =" + Card.width);
		System.out.println("Card.height = "+ Card.height);
		
		//객체생성
		Card c1 = new Card();
		c1.kind ="Heart";
		c1.number = 7;
		
		Card c2 = new Card();
		c2.kind ="Spade";
		c2.number = 4;
		
		System.out.println("c1은 "+ c1.kind + ", "+ c1.number + "이며, 크기는 (" + c1.width + ", "+ c1.height + ")");
		//여기에서 노란줄 뜨는 이유 : 
		System.out.println("c2은 "+ c2.kind + ", "+ c2.number + "이며, 크기는 (" + c2.width + ", "+ c2.height + ")");
		//크기는~~ 은 클래스변수여서 1과2가 같게 출력된다
		
		c1.number =12;
		c2.number = 8;
		
		//클래스변수인 width, height 값을 변경함
		//정식 문법은 Card.width Card.height이다 하지만 인스턴스로도 접근 가능하기 때문에 아래처럼 써도 문제없다
		c1.width =50;
		c1.height =80;
		
		System.out.println("c1은 "+ c1.kind + ", "+ c1.number + "이며, 크기는 (" + c1.width + ", "+ c1.height + ")");
		System.out.println("c2은 "+ c2.kind + ", "+ c2.number + "이며, 크기는 (" + c2.width + ", "+ c2.height + ")");
		
		

	}

}