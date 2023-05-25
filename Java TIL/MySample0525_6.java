package sstStudy;


/*부모 클래스는 Animal 클래스에 멤버변수는 이름, 이동수단, 울음소리, 다리수로 정의
 * 각 멤버변수를 제어하는 메서드도 포함.(set, get를 활용)
 * Animal 클래스를 상속받은 자식 클래스를 만들어서 각각의 이름, 이동수단, 울음소리, 다리수를 출력하는 프롤그램
 * 클래스는 Dog(강아지), Eagle(독수리), Lion(사자), Cat(고양이)
 * 출력은 name(이름), move(이동수단), cry(울음소리), leg(다리수)
 * 다리수만 int
 */

class Animal{
	//인스턴스 변수
	String name; //이름
	String move; //이동수단
	String cry;  //울음소리
	int leg;     //다리수
	
	//생성자
	Animal(){
		this("", "","",0);
	}
	Animal(String name, String move, String cry, int leg){
		this.name =name;
		this.move = move;
		this.cry= cry;
		this.leg =leg;
	}
	
	//인스턴스 변수 값 다루는 get,set 메서드 만들기
	String getName() {
		return name;
	}
	
	void setName(String name) {//set은 받기만하면 되므로 return필요없어서 void
		this.name = name;
	}
	
	String getMove() {
		return move;
	}
	
	void setMove(String move) {
		this.move = move;
	}
	
	String getCry() {
		return cry;
	}
	
	void setCry(String cry) {
		this.cry =cry;
	}
	
	int getLeg() {
		return leg;
	}
	void setLeg(int leg) {
		this.leg = leg;
	}
	
}


class Dog extends Animal{
	Dog(){
		this("","", "", 0);
	}
	
	Dog(String name, String move, String cry, int leg){
		//여기에 super()가 생략된거임 -> 부모클래스에 매개변수가 없는 생성자가 있어서 자바에서 알아서 내부적으로 생성해주기 때문에 우리가 안써도 문제 없는 것
		super(name, move,cry, leg);
		//super()말고 생성자 쓸거야라고 하면 매개변수 있는 super(매개변수)를 쓰면됨
	}
	
}

class Eagle extends Animal{
	Eagle(){
		this("","", "", 0);
	}
	
	Eagle(String name, String move, String cry, int leg){
		super(name, move,cry, leg);
	}
}

class Lion extends Animal{
	Lion(){
		this("","","",0);
	}
	Lion(String name, String move, String cry, int leg){
		super(name, move,cry, leg);
	}
}

class Cat extends Animal{
	Cat(){
		this("","","",0);
	}
	Cat(String name, String move, String cry, int leg){
		super(name, move, cry, leg);
	}
}


public class MySample0525_6 {

	public static void main(String[] args) {
		//상속
		Dog d =new Dog("해피", "껑충껑충", "멍멍", 4);
		System.out.println("강아지 이름은 " + d.getName() + "이고, 이동방법은 "+ d.getMove() + ",이며 울음소리는 "+ d.getCry() + ", 다리수는 "+ d.getLeg()+"입니다.");
		//여기에 d.getName()대신 d.name을 써도 접근지정자가 없는 상태여서 접근이 가능하지만 메서드를 이용하는 연습이므로 안씀
		// 메서드를 상속 받았기때문에 d.getName()이 가능??
		
		Eagle e =new Eagle("독수리", "펄럭펄럭", "구구", 2);
		System.out.println("동물 이름은 " + e.getName() + "이고, 이동방법은 "+ e.getMove() +
				",이며 울음소리는 "+ e.getCry() + ", 다리수는 "+ e.getLeg()+"입니다.");
		
		Lion l =new Lion("사자", "사박사박", "어흥", 4);
		System.out.println("동물 이름은 " + l.getName() + "이고, 이동방법은 "+ l.getMove() + 
				",이며 울음소리는 "+ l.getCry() + ", 다리수는 "+ l.getLeg()+"입니다.");
		
		Cat c =new Cat("고양이", "사뿐사뿐", "야옹", 4);
		System.out.println("동물 이름은 " + c.getName() + "이고, 이동방법은 "+ c.getMove() + 
				",이며 울음소리는 "+ c.getCry() + ", 다리수는 "+ c.getLeg()+"입니다.");
		
	}

}
