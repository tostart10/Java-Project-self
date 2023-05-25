package sstStudy;


class Person2{
	String name;
	String job;
	int age;
	
	Person2(String name, String job, int age){  //Person클래스의 메서드를 쓸려면 꼭 메개변수가 있어야함 , 매개변수 없는 매서드 선언 안했기떄문
		this.name = name; //인스턴스 변수 =지역변수
		this.job = job;
		this.age = age;
		
	}
}


class Student2 extends Person2{
	int score;
	
	Student2(String name, String job, int score, int age){ //생성자도 부모에있는 것을 호출한다  ,매개변수 없는 생성자에 대한 super()을 자동으로 자바에서 생성해준다/?그래서 생략가능한것?/
		
		super(name, job, age); //super()부모에 있는 생성자를 가리킨다 , 여기서는 매개변수가 없는 생성자가 없으므로 super(매개변수) 로 해줘야한다.
		//부모 생성자를 호출하는 super()는 생성자의 맨 첫번째 줄에 와야한다
		//여기서 super는 person클래스를 가리킴
		//super.name =name;  //여기서 this 안됨 //부모에 있는거기 떄문에 super
		//super.job = job;
		this.score =score;
		//this. 은 현재 클래스의 인스턴스 변수를 가리킴 , 그래서 int score;를 가리킴
		
//		super(name, job, score); 
//		this.score =score;
		//이렇게 써도 자바에서는 배개변수의 데이터 타입과 개수로만 판단하기 때문에  super(name, job, age)를 했을 떄와 같은 생성자를 호출한다
		//super(name, job, age) 괄호안에 들어
		//this.name = name; //이 경우에는 자식클래스에 name이라는 인스턴스 변수가 없기 때문에 this.name은 부모클래스의 인스턴스 변수인 name을 말한다
		//하지만 이렇게 되면 했갈리므로 정식명칭인 super.name으로 써주는 것이 바람직하다.
	}
	
	void print() {
		System.out.println("이름 :  "+ name + ", 직업 : "+job + ", 나이 : "+ age + ", 점수 : "+ score);
		//score만 내꺼 name,job,age는 부모꺼
	}
}


class Teacher2 extends Person2{
	int pay;
	
	Teacher2(String name,String job, int age, int pay){
		super(name, job, age); //그동안  super를 안썼던 이유는 매개변수가 없는 생성자가 있었기 때문에 안썻던것 , 여기서는 매개변수가 있는 생성자만 있기 때문에 꼭 super(매개변수)해줘야한다
		//여기서 super는 Person2 클래스인데 Person2 클래스의 생성자에는 매개변수 3개를 받는 메서드만 있어서 매개변수 3개만 넘겨준것임
		//내 부모의 생성자를 호출해줘라는 뜻
		//생성자를 만들지 않으면 자바jdk에서 자동으로 매개변수 없는 생성자를 생성해주기 때문에 안만들어도 괜찮았던것
		this.pay =pay; //this.으로 나는 인스턴스 변수를 쓸거다 라고 하는것
		//this.pay는 Teacher2클래스의 인스턴스 변수인 int pay;을 말함
		
		//super(),this()는 무조건 첫번째줄에 와야하므로 같이 쓸수 없다
		//super()는 생성자들중 마지막 생성자에서 부모의 생성자를 호출해줄때 사용한다 
		//this()를 쓰지 않는 맨 마지막 생성자에서 super()를 쓴다
	}
	
	void print() {
		System.out.println("이름 : "+ name + ", 직업 : "+job + ", 나이 : "+ age + ", 급여 : "+ pay);
		//pay만 Teacher2의 것, 나머지 3개는 상속받은 person2 클래스의 것이 출력됨
	}
	
}

public class MySample0525_5 {

	public static void main(String[] args) {
		//상속
		Student2 s1 = new Student2("홍길동","학생회장",19,100);//매개변수 꼭 있어야함  //Student2 클래스의 생성자를 호출
		s1.print(); //Student2 클래스의  print() 메서드가 호출됨
		
		Teacher2 t1 = new Teacher2("팽수","본부장",40, 1000);//매개변수 꼭 있어야함  Teacher2 클래스에 매개변수 없는 생성자 없어서 객체 생성할 때도 매개변수 꼭 넣어줘야한다
		//매개변수는 데이터 타입과 개수를 맞줘주기만 하면됨
		t1.print();
		
	}

}

//super. 부모에 있는 인스턴스 변수나 메서드를 호출
//super() 부모에 있는 생성자를 호출