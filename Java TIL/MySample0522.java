package sstStudy;

public class MySample0522 {

class Tv{
	
	//인스턴스 변수
	String color;//색상
	boolean power; //전원상태(on/off)
	int channel; //채널
	
	//메서드
	void power() {
		power = !power;  //꺼져있을 대는 켜지고 꺼져있으면 킴
	}
	
	void channelUp() {
		channel++;
	}
	
	void channelDown() {
		channel--;
	}
}


	public static void main(String[] args) {
	/*	//클래스
		Tv t =new Tv();
		t.channel =11;
		t.channelDown();
		t.channelUp();
		System.out.println("현재 채널은 " + t.channel + " 입니다.");
		
		//현재 채널 11에서 7번으로 변경 설정
		t.power();
		t.color ="검정"; //인스턴스 변수에 직접 접근하는 방식
		
		
		for(int i= t.channel; i>7 ; i--) {//채널이 반드시 7보다 커야함
			t.channelDown();
		}
		System.out.printf("tv 전원은 %b이고, 색상은 %s, 채널은 %d입니다. \n", t.power,t.color,t.channel);
		//fstring 에서 boolean은 %b 이다
		*/
		
	
	/*실행결과)t1의 channel 값은 0입니다.
	 * t2의 channel 값은 0입니다.
	 * t1의 channel 값을 7로 변경했습니다.
	 * t1의 channel 값은 7입니다.
	 * t2의 channel값은 7입니다. //참조형 대입으로 처리
	 */
		
		
	/*	Tv t1, t2 ;
		t1 =new Tv();
		t2 =new Tv();
		
		System.out.println("t1의 channel 값은 "+ t1.channel + "입니다.");
		System.out.println("t1의 channel 값은 "+ t1.channel + "입니다.");
		t1.channel =7;
		System.out.println("t1의 channel 값은 " + t1.channel + "로 변경했습니다.");
		
		
		
		t2= t1;
		System.out.println("t1의 channel 값은 "+ t1.channel + "입니다.");
		System.out.println("t1의 channel 값은 "+ t1.channel + "입니다.");
		
		/*실행결과)t1의 channel값은 0입니다.
		t2의 channel값은 0입니다.
		 *t1의channel값을 5로 변경했습니다.    //변수에 값대입 적용
		 *t2의 channel값을 11로 변경했습니다.  //변수에 값대입 적용
		 *t1의 channel값은 11입니다.
		 * t2의channel값은 11입니다.
		 */
		
		
	/*	Tv t1, t2 ;
		t1 =new Tv();
		t2 =new Tv();
		
		System.out.println("t1의 channel값은 "+ t1.channel + "입니다.");
		System.out.println("t2의 channel값은 "+ t2.channel + "입니다.");
		
		t1.channel = 5;
		System.out.println("t1의 channel의 값을 "+ t1.channel+ "로 변경했습니다.");
		
		t2.channel =11;
		System.out.println("t2의 channel의 값을 "+ t2.channel+ "로 변경했습니다.");
		
		t1 =t2;
		System.out.println("t1의 channel값은 "+ t1.channel + "입니다.");
		System.out.println("t2의 channel값은 "+ t2.channel + "입니다.");
	*/	
		
		
		//객체배열   String배열과 똑같은 구조
		Tv[] t1 = new Tv[3]; //데이터 타입이 클래스인 배열을 선언,초기화
		int i;
		
		for(i=0; i<t1.length; i++) {
			t1[i] =new Tv(); //객체생성  //위의 Tv[] t1 = new Tv[3]; 과는 다른 객체 생성, 2차원 배열처럼 메모리가 생성됨
			t1[i].channel = i+10; //바로 위의 코드애서 생성한 객체에 값 넣어주기
			
			System.out.printf("전 t1[%d].chennel = %d \n", i, t1[i].channel);
		}
		
		System.out.println();
		
		for(i=0; i<t1.length; i++) {
			t1[i].channelUp();
			System.out.printf("후 t1[%d].channel = %d \n", i, t1[i].channel);
		}
		
		//객체배열 복사응용
		System.out.println("t1 : " + t1);
		System.out.println("t1[0] : " + t1[0]);
		System.out.println("t1[1] : " + t1[1]);
		System.out.println("t1[2] : " + t1[2]);
		
		Tv a= new Tv();
		
		System.out.println("a : "+a);
		a = t1[1]; //객체배열복사
		
		System.out.println("후 a : " + a);
		System.out.println("a.channel : " + a.channel + ", t1[1].channel : " + t1[1].channel);
		
		a.channel =20;
		System.out.println("후 a.channel : " + a.channel + ", t1[1].channel : " + t1[1].channel);
		
		//위 문제와 동일하며 입력받는 변수 a, b를 인스턴스 변수로 선언 후 사용.
		
		
		
	}

}
