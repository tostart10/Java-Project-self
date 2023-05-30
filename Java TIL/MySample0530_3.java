package sstStudy;

class Car4{
	String color;
	int door;
	
	void drive() {
		System.out.println("drive)9 ....Car4");
	}
	void stop() {
		System.out.println("stop()... Car4");
	}
}

class FireEngine extends Car4{
	void water() {
		System.out.println("water()... FireEngine");
	}
}


public class MySample0530_3 {

	public static void main(String[] args) {
		//다형성
	/*	Car4 c = null;
		FireEngine f =new FireEngine();
		FireEngine f2 = null;
		
		f.water();
		c= f; //이게 다형성임  Car4 c =new FireEngine(); 인것을 줄여서 쓴거임(같은거임)  //시작 주소값은 가질 수 있다
		//내부적으로 형변환이 자동으로 발생함 : Up-casting(큰거로 갈때는 형변환 꼭 해주지 않아도 자동으로 일어난다)
		
		// c.water(); //불가능 (부모형 참조변수로 자식객체를 바라볼 수 있으나 자식객체의 메서드는 사용할 수 없다)
		//f2.water(); 

	//이 두줄을 이해해야함
		f2 =(FireEngine)c ; //강제형변환 해서 사용하는 것은 가능하다 // down-casting이므로 강제 형변환
		f2.water();
	*/	
		//불가능한 예제
		Car4 c = new Car4();
		Car4 c2 = null;
		FireEngine f =null;
		Car4 c3 = new FireEngine();
		
		//중요포인트 : 객체생성을 부모의 것으로 했느냐, 자식의 것으로 했느냐를 잘 봐야함
		c.drive();
		f = (FireEngine)c ; //f = c 는 불가능하나 형변환을 통해서 가능
		//컴파일은 가능하나 실행시 오류발생
		//상속관계이므로 다형성을 적용가능해서 문법적으로는 문제가 없음 -> 컴파일은 가능
		//하지만 Car4로 객체를 생성해서 .water()메서드는 없는상태인데 FireEngine으로 형변화을 해서 집의 크기만 늘려놨을뿐 없던 .water()메서드가 생기지는 않기 때문에
		//실행했을때 없는 .water()메서드를 바라보려고해서 오류남
		//형변환만 된것 뿐이지 객체생성은new Car4(); 로 Car4의 객체가 생성된것임
		//부모 참조형변수로 자식객체를 바라볼수 없다
		//이게 되게 하고 싶으면 Car4 c =new FireEngine();로 객체생성하면 됨
		
		f =(FireEngine)c3;  //이거는 가능하다
		//이거는 Car4 c3 = new FireEngine(); ->FireEngine()로 객체를 생성했기 때문에 이미 큰집 , 참조변수 f도 FireEngine형 참조변수이기 때문에 서로 일치해서 문제가 없다
		
		f.drive(); 
		f.water();//현재 Car4의 객체가 생성된거기 때문에 .water()메서드 사용할 수 없다
		c2 =f;
		//객체생성은 부모인 Car4로 으로 했고,  참조변수 f는 FireEngine인 자식의 타입이기 때문에 큰집에서 작은집을 바라보는 것은 자동형변환이 되면서 가능하다
		//c2.water() //불가능
		c2.drive();
		
	}

}
