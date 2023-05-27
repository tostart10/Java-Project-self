package sstStudy;

/*  복습용 : 지역변수와 인스턴스 변수의 우선순위, this. super. 에 대한 개념
class Parent{
	int x=10;
}

class Child extends Parent{
	
	int x = 20;//인스턴스 변수
	
	void methodA() {
		int x= 30;
		
		System.out.println("x : " + x); //30  지역변수가 우선순위여서 void methodA()안의 x가 출력됨
		System.out.println("this.x : " + this.x);  //20
		System.out.println("super.x : " + super.x); //30
		
	}
}

public class MySample0526_3 {

	public static void main(String[] args) {
		//오버라이딩
		
		Child c = new Child();
		c.methodA();	
	}
}
*/


/*
class Point3{
	int x,y;
	
	Point3(){
		this(0, 0);
	}
	
	Point3(int x, int y){
		this.x =x;
		this.y = y;
	}
	
	String getLocation() {
		return "x : "+x + ", y:"+y;
	}
}


class Point3D2 extends Point3{
	int z;
	
	Point3D2(){
		this(0, 0, 0);
	
	}
	
	Point3D2(int x, int y, int z){
		
		super(x,y);
		//상속이기 때문에  super()
		//super()가 여기에서 생략되어 있음-> 생략가능한 이유는 부모 클래스Point3에 매개변수가 없는 생성자가 있기 때문
		//super()역할은 x,y를 =0으로 초기화
//		this.x = x;
//		this.y = y;
//		this.z = z;  //코드의 중복과 같은 기능의 로직이 실행되기 때문에 불필요한 단계가 많음 -> 맨위에 super(x,y)로 간단하게 해결
		
	}
	
	String getLocation() {
		return "x : "+ x + ", y:"+ y + ", z" + z;
	}
}

public class MySample0526_3 {

	public static void main(String[] args) {
		//오버라이딩
		
		Point3D2 p3 = new Point3D2(1,2,3);
		System.out.println(p3.getLocation()); //sysout안에 써주지 않으면 호출이 안되서 결과 출력안됨 주의!
		
	}

}*/



class Clothes{
	//method
	void cutHeight() {
		System.out.println("높이 수선하였습니다.");
	}
	
	void cutWidth() {
		System.out.println("너비 수선하였습니다.");
	}
	void showPrice() {
		System.out.println("수선비용은 : 5000원");
	}
}

class Reform extends Clothes{
	
	void cutHeight() {
		System.out.println("높이를 다시 맞춰 수선하였습니다.");
	}
	
	void cutWidth() {
		System.out.println("너비를 다시 맞춰 수선하였습니다.");
	}
}

public class MySample0526_3 {

	public static void main(String[] args) {
		//오버라이딩
		Clothes ct = new Clothes();
		Reform re = new Reform();
		
		ct.cutHeight();
		ct.cutWidth();
		ct.showPrice();
		
		re.cutHeight(); //오버라이딩
		re.cutWidth();  //오버라이딩
		re.showPrice(); //부모꺼 가져다 씀
		
	}
}