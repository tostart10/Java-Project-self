package sstStudy;

class Card2{
	//클래스 변수 이면서 상수
	//상수에대한 이름은 전부 대문자로 한다.
	static final int KIND_MAX = 4; //카드 무늬수
	static final int NUM_MAX = 13; //무늬별 카드수
	
	static final int SPADE =4;
	static final int DIAMOND =3;
	static final int HEART =2;
	static final int CLOVER =1;
	
	int kind;
	int number;
	
	//생성자
	Card2(){
		this(SPADE,1);  //위의 상수 SPADE를 말함 즉, 4임
	}
	
	Card2(int kind, int number){
		this.kind = kind;
		this.number =number;
	}
	
	
	
	//오버라이딩으로 toString()메서드 구현
	//오버라이딩은 선언부가 무조건 일치해야하기 떄문 +구현부에서 내가 바꿔줬기떄문
	//이 메서드를 주석처리하면 cardArr[0] : Card2@2a139a55 이렇게 출력된다=> kinds[this.kind] 로 배열의 각 인덱스 안에 값넣어주기 떄문
	public String toString() {
		 //배열에 0번쨰는 쓰지 않기위해 공백입력 
		//위에서는 인스턴스 변수지만 배열안의 요소들은 문자열임
		String[] kinds = {"", "CLOVER", "HEART", "DIAMOND","SPADE"};
		String numbers = "0123456789XJQK";  //숫자 10은 X로 사용
		
		//문자열 조합
		return "kind : " + kinds[this.kind] + ", number : " + numbers.charAt(this.number);
		//kind : SPADE, number : 1이 출력되는 것은 이 리턴값이 출력되는 것임
		//문자열에서 charAt(this.number)에서 number는 인스턴스 변수 넘버
		//kinds는 String 배열인데 kinds[this.kind]을 하면 
		//Card클래스의 인스턴스변수 int kind 변수를 kinds[]배열의 인덱스로 그대로 사용하기 위해 int 인것임
		//numbers.charAt(this.number)은 0이 아닌 1부터출력된다
		
		//this.kind에서this는 card2클래스
//String numbers = "0123456789XJQK";의 문자의 순서를 인덱스로 사용하게
		//numbers.charAt(this.number)에서 this.number는 인덱스로 사용되기 
	}

}


class Deck{
	//상수 인스턴스 변수
	//final인스턴스마다 똑같이 사용하겠다는 뚯
	final int CARD_NUM = 52;  //카드의 개수
	Card2[] cardArr = new Card2[CARD_NUM];  //배열 선언, CARD_NUM(카드의개수)만큼의 크기로 선언함
	
	
	//for문을 돌리면서 Card2[]배열의 객체를 생성하고 각 인덱스안에 값을 넣어줌
	//Deck()생성자에서 클래스를 포함하고 있는 것이 됨  클래스입장에서 보면 Deck()이 자식임
	Deck() { 
		int i =0, k, n;
		for(k = Card2.KIND_MAX; k > 0; k--) { //i는52번 돌림
			//KIND_MAX 4부터 시작(4~1까지 돌림)
			for(n=0; n<Card2.NUM_MAX; n++) {//i가 1일때 n은 52번 돈다
				//NUM_MAX 13(0~12까지 돌림)
				System.out.println("Deck() 생성자 : i=" + i + ", k=" + k + ", n="+n);
				cardArr[i++] =new Card2(k, n+1);  //0~51번쨰까지 배열을 생성
				//(k, n+1);에서 n은 +1을 해줬기 때문에 최종적으로 n은 0~13번까지 도는것
				//cardArr[i++] =new Card2(k, n+1); 으로 Card2 객체를 생성하고 그안에 매개변수를 담은후  그 객체의 주소를
				//cardArr[i++]의 각 인덱스안에 주소을 담아주게 되어 배열의 각 인덱스안에 값이 모두 채워지게 된다
			}
		}
	}
	
	//지정된 위치(index)에 있는 카드 하나를 꺼내 반환
	//메서드 오버로딩
	Card2 pick(int index)
	{
		return cardArr[index]; //배열이 바라보는 주소값을 던저줌  
		//return이 있다는것은 데이터타입이 있다는 것
		// cardArr[index]의 데이터 타입은 Card2 로 cardArr[index]는 참조형    cardArr[index]는 carddArr의 객체 하나이기떄문에 가능한것임
		//cardArr[index]는 주소만 가지고 있음
		//return으로 호출했던 Card2 pick(){} 메서드로 주소를 던져줌
	}
	
	//메서드 오버로딩
	Card2 pick() {
		//jdk에 있는 메서드를써야됨
		//
		int index = (int)(java.lang.Math.random() * CARD_NUM); //0~51사이
		return pick(index); //호출된 위의 pick(index)의 로직이 끝나면 return으로 cardArr[index]안의 주소값이 들어오고 Card2 pick(){}메서드가 끝나게 되어
		//Card2 pick(){}메서드를 호출했던 main으로 돌아가서 남은 로직을 진행하게됨
	}
	
	//카드순서 섞기
	void shuffle() {
		int i, r;
		Card2 tmp;  //tmp변수의 데이터 타입은 Card2 -> 주소값을 가지고 있음 , 주소만 저장됨
		
		for(i=0; i<cardArr.length; i++) {
			r=(int)(java.lang.Math.random() * CARD_NUM); //0~51사이값 나옴 ,CARD_NUMrk 52이기 떄문
			tmp = cardArr[i];
			cardArr[i] = cardArr[r];
			cardArr[r] = tmp;
			//tmp는 주소값만 담으니까 각 인덱스에 값자체가 아닌 주소을 넣어주게 되는게 되는 것임
		}
	}
	
	void sortArr() {//Deck() 생성자에서 배열에 값을 다 채운다음에 어떻게 되는지 확인하기 위한 출력
		int i;
		for(i=0; i<cardArr.length; i++) {
			System.out.println("cardArr[" + i + "] : "+ cardArr[i]);
		}
	}
}



public class MySample0526 {

	public static void main(String[] args) {
		//상속
		/*실행결과)
		 * kind : SPADE, number : 1;
		 * kind : HEART, number : 7;
		 */
		
		Deck d = new Deck(); 	//객체생성 -> 객체가 생성되면 자동으로 생성자 호출됨 그래서 여기서 Deck() 생성자가 호출되어프로그램순서가 위로 올라가는 것임
		Card2 c = d.pick(0);   //카드를 섞기전에 제일 위 카드 뽑기
		// d.pick(0)의 의미 :Deck 클래스 안에 있는 pick()메서드를 사용할 건데, d객체가 가리키는 pick() 매서드이다
		//객체d가 가르키는 Deck클래스안의 pick()메서드를 호출하는데 매개변수는 int타입으로 한개 줄거다  
		//객체 안에 Deck클래스 전부가 들어가고 그 클래스 안에 pick()메서드 방이 있는 것!!  클래스가 통체로 객체에 들어가는 거임!!
		// 매개변수가 있는 pick(매개변수) 메서드이고
		//pick()메서드에 들어가는 메개변수의 타입은 int 이다.
		//인스턴스 변수 d는 Card2[] cardArr 배열의 주소를 바라보는데, d.pick()으로 인스턴스 메서드 pick()를 호출
		//Card2 c = d.pick(0);에는 new가 없기 떄문에 객체가 생성되지 않음!!
		//그래서 바로 pick()메서드로가서 실행한후에 return값 받아와서 인스턴스 변수 c에 대입함
		//c에 cardArr[0]의 주소가 대입 -> c는 cardArr[0]을 바라보게됨
		//(cardArr[0]Card2 데이터 타입의 반환값이기 떄문에 참조형 변수이다 -> 참조형 변수는 주소만 담기 때문에 인스턴스 변수 c에 주소를 넘겨주게됨
		
		System.out.println("before : " +c.toString()); //호출  섞기전 출력
		//println()안에 객체를 쓰면 메서드를 호출하도록 자바에서 설정되어 있음
		//c인스턴스 변수가 가리키는 겍체 안에는 Card2클래스가 통쨰로 들어있고 Card2클래스 안의 toString()메서드를 호출하는것임
		d.sortArr();  //프로그램돌아가는 것에 문제없음, 배열이 어떻게 돌아가는 지를 파악하기 위해 출력을 위한 메서드임
		//이거는 순서대로 나옴 아직 안섞었으니까
		
		d.shuffle(); 	 //카드 섞기
		c= d.pick(0);  	 //카드섞고 나서 제일 위 카드 뽑기
		//c= d.pick(0)에서 d.pick(0)은 값을 위에서 섞어줬기 떄문에 인덱스 0의 값이 아닐 수 있다
		//섞은 값을 다시 c에 대입해줘서 밑의 코드 c.toString()에서 출력하면 값이 바뀐것을 확인할 수 있다
		System.out.println("after : "+ c.toString());//섞은 후 출력

	}

	//k는 0~ 4
	//i : 0~51
	//n : 0~12 까지 돌면서 반복함
	
}
