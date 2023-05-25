package sstStudy;

//도형그리기

//x,y좌표
class Point{
	int x;
	int y;
	
	Point(){
		this(0,0);
	}
	
	Point(int x, int y){ //xy값만 구함
		this.x =x;
		this.y =y;
		
	}
	
	//메서드 명 get 으로 시작 - 현재 내 클래스 안에 있는 인스턴스 변수 값을 던져줄떄 사용
	//set
	String getXY() {
		return"("+ x + ","+ y + ")";
	}
}



class Shape{//색깔만 구하는 클래스
	String color ="black";
	
	void draw(){
		System.out.printf("[color = %s \n", color);
	}
}



//원 그리는 클래스
//여기서 도형중 원만 그린다고 하면 Point  를 상속받아도 되지만 여러가지 도형을 구현하려면  상속받으면 안됨
//shape는 색깔만 지정해주는 클래스로 모든 도형을 검정색으로 공통으로 그릴려고 하기 떄문에 shape 클래스를 상속받아도 됨
class Circle extends Shape{ //여러개의 클래스를 상속받을 수 없기 때문에 하나만 상속받고 나머지 기능은 객체를 생성해서 사용
	Point center;//인스턴스 변수
	int r; // 반지름
	
	//생성자에서 xy좌표 받음
	Circle(){
		this(new Point(0,0), 100);  //좌표는 0,0 반지름은 100
		//new Point(0,0)는 point 객체생성하고 객체의 시작 주소를 담는것임  ,데이터 타입은 Point클래스
		//문법상 this()는 메서드 맨위에 와야하기 떄문에 객체생성 코드를 this()의 괄호 안에 넣어준것 뿐임
		//new Point(0,0)는 
		//Point p =new Point(0,0);
		//this(p, 100);  //this()는 항상 첫번쨰 라인에 적용해야함
		//생성된 객체 p는 생성자 실행이 끝나면 사라짐
	}
	
	//Point center를 써놨다는 것은 이것을 실행하기 전 미리 객체를 생성해서 그것의 주소값을 받겠다는 것
	Circle(Point center, int r){ //Point center 는 new Point(0,0)에서 생성된 객체의 주소를 담은 참조형 매개변수를 받는것임
		//Point 클래스 데이터 타입의 center변수를 매개변수로 받는다
		this.center = center;
		this.r = r;
	}
	
	//그리는 메서드
	void draw() {
		System.out.printf("[center=(%d,%d). r=%d, color=%s] \n", center.x, center.y, r, color);
	}
}



//삼각형그리는 클래스
class Triangle extends Shape{ //삼각형은 꼭짓점이 3개여서 배열필요
	Point[] p = new Point[3];  //안에서 객체 생성.  방 3개짜리 배열 생성
	//Point[] p = new Point[10];
	
	
	Triangle(Point[] p) {//Triangle쓰려면  무조건 객체생성을 해서 나한테 넘겨라  //Point 클래스 배열 데이터타입 p
		//Point[] p를 하면 새로운 p를 메모리와 p가 가르키는 객체가 새로 생성됨
		/*위에 있는  p는 new Point[10]으로 생성된 크기가 10인 주소를 가르키는 p이고
		 * Triangle(Point[] p)메서드 안에서의 p는 (Point[] p) 로 생성된 새로운 메모리와 객체이다 만약 이 새로운 p가 가르키는 객체의 크기가 3이라고 가정하면
		 * 1. p10 은 p10객체가 생성됨 
		 * 2. p3객체를 가르키는  p3이 생성됨
		 * 3. this.p = p; 를 this.p10 = p3 라고 생각해보면 새로운 객체 p3 주소값이 p10메모리에 대입되어
		 * p10 객체를 바라보던  p10메모리는 p3객체를 바라보게된다.
		 * 새로 생성된 객체의 주소값이 기존 p에 대입되서 새로운 주소값으로 덮어씌어지므로 새로운 객체를 바라보게됨 
		 */
		
		
		System.out.println("before : "+ this.p.length);
		this.p = p;  //사이즈를 알려면 this.p을 봐야함
		System.out.println("after : "+ this.p.length);  //this.p = p; 으로 인해 새로운 주소값이 대입되므로서 다른 객체를 바라보게된다
		//다른객체의 길이를 출력하게되므로 출력값이 다르다
	}
	
	//그리기
	void draw() {
		System.out.printf("[p1=%s, p2=%s, p3=%s, color=%s \n", p[0].getXY(), p[1].getXY(), p[2].getXY(), color);
		//이 코드는 for문으로도 구현가능
		//color는 상속받은 shape의 값을 출력함
	}
}



public class MySample0525_4 {

	public static void main(String[] args) {
		//상속
		Point[] p = {
				new Point(100,100),
				new Point(140,50),
				new Point(200, 100)
		};
		/*위의 것을 풀어쓴것
		 * Point[] a =new Point(100,100);
		 * Point[] b =new Point(140,50)
		 * Point[] c =new Point(200, 100)
		 * 
		 * point [] p ={a,b,c};
		 */
		
		//삼각형 객체생성
		Triangle t = new Triangle(p);//시작주소값인p를 넘김
		
		//원 객체 생성
		Circle c = new Circle(new Point(150,150), 50);// 생성자 호출 - 생성자를 호출할때 매개변수의 타입이 Point 타입의 참조 변수와 int타입
		//new Point(150,150)는 주소값임
		//그래서 Circle클래스 안의 (Point타입 참조형, int 타입) 매개변수를 받는 
		//Circle c = new Circle(p[0], 50); 이렇게도 쓸수 있다
		
	
		t.draw(); //삼각형 그리기
		c.draw(); //원 그리기
			
	}

}
