package sstStudy;

class Point2{
	int x;
	int y;
	
	//생성자가 하나도 없으면 jdk가 컴파일 과정에서 매개변수없는 Point2(){}생성자를 만들어줌 -> 생략가능
	
	String getLocation() {
		return "x : "+ x + ", y : " + y;
	}

}

class Point3D extends Point2{
	int z;
	
	String getLocation() {
		//return "x : "+ x + ", y : " + y + ", z : " + z;
		
		return super.getLocation() + ", z : " + z; //x,y 는 부모의 것을 호출해서 출력하도록 함 -> 코드의 중복 줄이기
	}
}


public class MySample0526_2 {

	public static void main(String[] args) {
		//오버라이딩
		Point3D p3 = new Point3D();
		
		p3.x =10;
		p3.y = 20;
		p3.z = 30;
		
		System.out.println(p3.getLocation());
		
	}

}
