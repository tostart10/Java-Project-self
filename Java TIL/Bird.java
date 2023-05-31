package abs2;

public class Bird extends Animal{
	
	//이름 : 매개변수, 울음 : 짹짹, 움직임 : 날아다닌다, 음식:애벌레
	//생성자는 이름(name)을 매개변수로 하는 것과 매개변수가 4개로 생성자를 정의
	private String cry;  //private를 하면 Bird클래스안에서만 접근할 수 있게함
	private String move;
	private String food;
	
	Bird(String name){
		this(name, "짹짹", "날아다닌다", "애벌레");
	}
	
	Bird(String name, String cry, String move, String food){
		//super(); 가 생략되어 있음 -> 부모클래스인 Animal에 생성자가 없기 때문
		this.name = name; //setName(name);
		//코드의 중복을 배제
		setCry(cry);   //같은 클래스여서this.cry=cry();도 할수있다. 하지만 입력받은 값을 검증하고 변형해야할 경우가 있기 떄문에 set메서드를 사용하는 것이 좋음 그래서
		//코드 중복성 배베가 코드의 중복만을 의미하는 것이 아닌것임!
		//그래서 유지보수가 편해지는 것임
		setMove(move);
		setFood(food);
	}
	
	public void setCry(String cry) {
		this.cry =cry;
	}
	//어떻게 움직이는지
	public void setMove(String move) {
		this.move =move;
	}
	
	//무엇을 먹는지
	public void setFood(String food) {
		this.food =food;
	}
	
	
	//어떻게 우는지
	public String getCry() {
		return this.cry;
	}
	//어떻게 움직이는지
	public String getMove() {
		return this.move;
	}
	
	//무엇을 먹는지
	public String getFood() {
		return this.food;
	}
	//출력
	public void print() {
		System.out.println("Bird [name : " + getName() + ", cry : " + getCry() + ", move : " + getMove() +
				", food : " + getFood() + "]");  //getName() 을 this.name으로도 할 수 잇다
	}
}
