package sstStudy;

class Car1{
	String color;
	String gearType;
	int door;
	
	//중복 없애기
	Car1(){
		this("white","auto" ,  6);  //여기에서 this 는 c1의 객체를 말함 그래서 c1이 가리키는 객체에 "white","auto", 6이 들어감
//		this.color = "white";
//		this.gearType = "auto";
//		this.door = 6;
		
	}
	
	Car1(Car1 c){//c가 main c1주소받음
		this(c.color,c.gearType,c.door );
//			this.color = c.color;
//			this.gearType = c.gearType;
//			this.door = c.door;
	}
	Car1(String color, String gearType, int door){
		this.color = color;
		this.gearType = gearType;
		this.door = door;
	}
}


public class MySample0524_5 {

	public static void main(String[] args) {
		//생성자 - 생성자를 이용한 인스턴스 복사
		
		
		Car1 c1 =new Car1();
		
		Car1 c2 = new Car1(c1);  // Car1 c1 = new Car1(인스턴스명); 객체생성할 때는 인스턴스 명을 넘긴다
		//위의Car1 c1 =new Car1(); 에서 이미 c1이 가르키는 객체에 값이 저장된 상태인것을, 값이 있는 상태의 객체를 c2가 바라보게 되는 것
		
		
		System.out.println("c1 color= " + c1.color + ", gearType = " + c1.gearType + ", door = "+ c1.door);
		System.out.println("c2 color= " + c2.color + ", gearType = " + c2.gearType + ", door = "+ c2.door);
		
		c1.door = 50;
		
		Car1 c3 = new Car1(c1);
		System.out.println("c1.door = 50 으로 변경후..");
		
		System.out.println("c1 color= " + c1.color + ", gearType = " + c1.gearType + ", door = "+ c1.door);
		System.out.println("c2 color= " + c2.color + ", gearType = " + c2.gearType + ", door = "+ c2.door);
		
		System.out.println("c3 door = "+ c3.door);//50
	}

}
