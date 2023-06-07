package etc;

public class MySample0607_4 {

	public static void main(String[] args) {
		Card c1 = new Card();
		Card c2 = new Card("heart", 10);
		
		System.out.println("c1.toString : " + c1.toString());
		System.out.println("c2.toString : " + c2.toString());
		
		String str = new String("Korea");
		//String str1 = "Korea"; 와는 다른것임
		//new로 객체를 생성하는 String과 일반 String 변수는 구조가 다르다( 같은 참조형이랄지도 객체를 따로 생성하는것과 그냥 값이 들어가는 배열을 가지고 있는 것과는 다름)
		
		
		java.util.Date today = new java.util.Date();  //import안하고 경로를 직접 넣어준거임
		
		System.out.println("str : " + str);
		System.out.println("str.toString : " + str.toString());
		System.out.println("today : " + today);
		System.out.println("today.toString : " + today.toString());
		
		
	}

}

class Card{
	
	String kind;
	int number;
	
	Card(){
		this("spade", 1);
	}
	
	Card(String kind, int number){
		
		this.kind = kind;
		this.number =number;
	}
	
	public String toString() {
		
		return "kind : " + this.kind + ", number : " + this.number;
	}
	
}
