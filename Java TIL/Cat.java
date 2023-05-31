package abs2;

public class Cat extends Animal{
	//추상클래스 Animal을 상속받았으므로 메서드를 구현해줘야한다
	
	private String cry;
	private String move;
	private String food;
	
	
	//생성자
	Cat(String name){
		
		this(name, "야옹", "사뿐사뿐 걸어다녀요.", "생선");
	}
	
	Cat(String name, String cry, String move, String food){
		
		setName(name);  ///this.name = name; protected이기 때문에 가능
		setCry(cry);
		setMove(move);
		setFood(food);
	}
	
	public void setMove(String move) {
		this.move =move;
	}
	public void setCry(String cry) {
		this.cry =cry;
	}
	public void setFood(String food) {
		this.food =food;
	}
	
	public String getCry() {
		return this.cry;
	}
	//어떻게 움직이는지
	public String getMove() {
		
		return this.move;
	}
	
	//무엇을 먹는지
	public String getFood(){
	
		return this.food;
	}
	//출력
	public void print() {
		
		System.out.println("Cat [name : " + getName() + ", cry : " 
		+ getCry() + ", move : "+ getMove() + ", food : " + getFood() + "]");
	}
}
