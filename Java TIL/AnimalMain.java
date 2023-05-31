package abs2;

public class AnimalMain {

	public static void main(String[] args) {
		//추상클래스 메인
		Dog dog = new Dog("바둑이");  //다형성이기 때문에 Dog dog= new Dog() 할수 있다
		Cat cat =new Cat("나비");
		Bird bird = new Bird("짹짹이");
		
		cat.print();
		System.out.println();
		dog.print();
		System.out.println();
		bird.print();
		
		cat.setCry("어흥");
		cat.print();
		
		System.out.println();
		
		
		bird.setMove("펄럭펄럭 날아다닌다.");
		bird.print();
		System.out.println();
		
		dog.setFood("닭고기 말린거");
		dog.print();
		
  }
}
