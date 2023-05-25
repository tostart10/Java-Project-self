package sstStudy;

class Tv2{
	//여기 변수들은 모두 인스턴스 변수
	//공통된 기능을 클래스에서 구현하고 상속으로 가져다 사용한다.
	boolean power; //전원상태(on/off)
	int channel;  //채널
	
	Tv2(){  //생성자
		channel = 10;
		System.out.println("TV2() 생성자...");
		
	}
	
	void power() {//메서드
		power = !power;//켜져있으면 끄고 꺼져있으면 켜기
	}
	
	void channelUp() {
		++channel;
	}
	void channelDown() {
		--channel;
	}
	
}



//글자색 자주색 - 예약어
class CaptionTv extends Tv2{//상속으로 Tv2를 받음 -상속받는CaptionTv는 부모클래스Tv2 보다 크다
	boolean caption;// 자막상태(on/off)
	int channel;  //자식클래스의 인스턴스 변수
	
	CaptionTv(){
		channel =20; // 만약 자식 클래스 CaptionTv에 자식클래스의 인스턴스변수인 channel이 없다면 지금 이 channel은 부모의 것을 가져다 쓴거임 super.channel인데 생략된거임
		System.out.println("CaptionTv() 생성자...");
	}
	
	void displayCaption(String text) {
		int channel = 30; //지역변수 :메서드 안에서 선언한 변수
		
		if(caption) { //caption기본값이 false여서 실행 안되지만 main에서 caption값을true로 넣어줌으로서 실행됨 
			System.out.println("자막내용 : "+ text);
		}
		
		System.out.println("부모 channel : "+ super.channel);  //super. 으로 부모클래스의 channel인스턴스 변수를 가져옴
		System.out.println("인스턴스 channel : "+ this.channel);// 인스턴스 변수를 가리킬때는 this. 임 (this는 오버로딩되어있는메서드에서 가져다쓸려면
		System.out.println("지역 channel : "+ channel);
		//자식클래스에서 부모것을 가져다 쓸려면 super
		//인스턴스변수 :현재클래스에 선언된 변수
	}

	int getChannel() {
		return super.channel; //지역변수 channel는 사용할 수 없음,  인스턴스(this)와 부모(super)의 channel변수만 사용가능
	}

}


public class MySample0525_2 {

	public static void main(String[] args) {
		//상속
		CaptionTv ctv = new CaptionTv(); //자식의 객체를 생성, 객체생성은 자식것을 생성하지만 자식이 부모의 것을 내부적으로 가지고 있으므로 부모의 것도 사용할 수 있는 것
		System.out.println("before : "+ ctv.channel);  //자식클래스에 있는거가 출력됨  (부모의 것과 자식의 것을모두 가지고 있으면 자식클래스의 것을 우선으로 사용함)
		ctv.channel = 10; //자식의 channel변수 값이 바뀜
		ctv.channelUp(); //부모의 메서드  부모의 channel을 올린거지 자식의  channel을 올린게 아님 ->부모클래스의channel만 11로 올라감
		System.out.println("after : " + ctv.channel);
		
		ctv.displayCaption("Hello JAVA"); //displayCaption()메서드 호출
		ctv.caption = true;
		ctv.displayCaption("Hello JAVA"); //displayCaption()메서드 호출
		System.out.println("ctv.getChannel()" + ctv.getChannel()); //super.channel;로 되어 있기 때문에 부모거가 출력됨
		
	}
}
