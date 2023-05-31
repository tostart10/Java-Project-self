package abs;

abstract class Pokemon{
	//접근제어자 ->캡슐화
	private String name;
	
	abstract void attack();  //공격
	abstract void sound();  //소리
	
	//get/set메서드는 이 클래스안에 있어야함
	//꼭 public으로 해야 접근 가능
	public String getName() {
		return this.name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
}

class Pikachu extends Pokemon{
	
	Pikachu(){
		setName("피카츄"); //Pokemon 클래스의 인스턴스 변수 name이 private가 아니라면 name = "피카츄"
	}

	
	void attack() {
		System.out.println("전기공격");
	}
	
	void sound() {
		System.out.println("피카피카...");
	}
}

class Squirtle extends Pokemon{
	
	Squirtle(){
		setName("꼬부기"); // name = "꼬부기"
	}
	
	void attack() {
		System.out.println("물뿌리기 공격");
	}
	
	void sound() {
		System.out.println("꼬북꼬북");
	}
	
}

public class MySample0531_3 {

	public static void main(String[] args) {
		//추상클래스
		
		Pikachu p1 = new Pikachu();
		//System.out.println("포켓몬 이름은 " + p1.getName);  //p1.name
		p1.attack();
		p1.sound();
		
		Squirtle s1 =new Squirtle();
		//System.out.println("포켓몬 이름은 " + s1.getName); //s1.name
		s1.attack();
		s1.sound();
		
	}
}
