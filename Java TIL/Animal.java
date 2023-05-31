package abs2;

public abstract class Animal {

	//동물이름
	protected String name; //private String name;
	
	public String getName() {
		return this.name;
	}
	
	public void setName(String name) {
		this.name =name;
	}
	
	//어떻게 우는지
	public abstract String getCry();
	//어떻게 움직이는지
	public abstract String getMove();
	
	//무엇을 먹는지
	public abstract String getFood();
	//출력
	public abstract void print();
}
