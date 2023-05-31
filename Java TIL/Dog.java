package abs2;

public class Dog extends Animal{
	
	//cry : 멍멍, move : 촐랑촐랑 , food : 사료
	
	private String cry;
	private String move;
	private String food;
	
	//생성자
	Dog(String name){
		this(name, "멍멍", "촐랑촐랑 뛴다." ,"사료");
	}
	
	Dog(String name, String cry, String move, String food){
		setName(name);  //protected이기 때문에 this.name = name; 으로도 쓸수 있다
		setCry(cry);
		setMove(move);
		setFood(food);
		
	}
	
	
	//메서드
	public void setCry(String cry) {
		this.cry =cry;
	}
	
	public String getCry() {
		
		return this.cry =cry; //this. 이 빠져도 괜찮다??
	}
	public void setMove(String move) {
		this.move =move;
	}
	
	public String getMove() {
		
		return this.move;
	}
	
	public void setFood(String food) {
		this.food =food;
	}
	
	public String getFood() {
		
		return this.food;
	}
	
	public void print() {
		System.out.println("Dog [ name : " + getName() + ", cry : " + 
				getCry() + ", move : " + getMove() + ", food : " + getFood() + "]");
	}
	
}
