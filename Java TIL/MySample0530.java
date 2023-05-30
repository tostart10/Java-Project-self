package sstStudy;


class Car3{
	private int door;
	private String gearType;
	private String color;
	
	//생성자
	Car3(String color, String gearType){
		//문의 개수는 4개로 고정
		setColor(color);
		setGearType(gearType);
		setDoor(4);
	}
	
	//getter/setter는 무조건 public으로 해야함
	public int getDoor() {
		return this.door;
	}
	public void setDoor(int door) {
		this.door =door;
		
	}
	public String getGearType() {
		return this.gearType;
	}
	public void setGearType(String gearType) {
		this.gearType = gearType;
	}
	public String getColor() {
		return this.color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
}

class SportsCar extends Car3{ //상속받은 부모 클래스의 생성자 때문에 이렇게 까지만쓰면 오류남 매개변수 떄문에??
	int speedLimit; //제한 속도
	
	SportsCar(String color){
		this(color, 200,"auto");
	}
	SportsCar(String color, int speedLimit){
		this(color, speedLimit, "auto");
	}
	SportsCar(String color, int speedLimit, String gearType){
		//보통 super(); 가 생략 근데 지금 부모 생성자에서 매개변수 없는 생성자가 없어서 생략하면 오류!!,매개변수 개수도 맞춰줘야함
//		setColor(color);
//		setGeartype(gearType);  이걸 super(color,gearType); 로 중복을 제거하고 작성할 수 있다
		super(color,gearType);
		this.speedLimit = speedLimit;
	}
	public String toString() {
		return "차량의 색은"+ getColor() + "이고, "+ getGearType() + "이며, 문의 개수는 "+ getDoor() + "개이며, 제한속도는 "+ speedLimit + "입니다.";
	}
}

public class MySample0530 {

	public static void main(String[] args) {
		//실행결과) 차량의 색은 red이고, auto이며, 문의 개수는 4개 이며, 제한속도는 330입니다.
		SportsCar cs = new SportsCar("red", 330);
		System.out.println(cs);  //cs.toString 인데 cs로 써서 생략된거임!!
		//println안의 stringOfvalue()가  toString()을 호출
	}

}
