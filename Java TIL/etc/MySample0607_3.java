package etc;

public class MySample0607_3 {

	public static void main(String[] args) {
		//equals 메서드 오버라이딩
		Person p1 = new Person(125215622L);
		Person p2 = new Person(125215622L);
		
		if(p1 == p2) {
			
			System.out.println("p1과 p2가 같습니다.");
			//생성한 객체가 다르기 떄문에 false가 나옴
		}
		else {
			System.out.println("p1과 p2가 다릅니다.");
		}
		
		if(p1.equals(p2)) { //true가 나오려면 new Person(); 에서 들어간 매개변수의 값이 똑같아야함
			
			System.out.println("p1과 p2가 같습니다. 2");
		}
		else {
			System.out.println("p1과 p2가 다릅니다. 2");
		}

	}
}


class Person{
	
	long id;
	
	Person(long id){
		this.id = id;
	}
	
	//메서드 오버라이딩
	//오버라이딩하려면 선언부가 완벽하게 일치해야함
	//Object의 equals메서드의 선언부를 그대로 복사해옴
	//각자 가지고 있는 값이 같은지를 확인해보기 위함
	 public boolean equals(Object obj) {//Object obj는 다형성 -> Person으로도 받을 수 있다(Object를 상속받은 모든것이 들어올수 있다)
		 
		 if(obj instanceof Person) { //형변환이 가능한지 유무를 instaceof()로 확인
			 
			 //this.id(내 인스턴스 안에 있는 id의 값과 같은지 비교
			 if(this.id == ((Person)obj).id) { //여기서는 Person클래스의 것을 비교하는 것이므로 obj를 Person으로 강제 형변환해줘야함
				 return true;
			 }
			else {
				return false;
			}
			//return this.id ==((Person)obj).id //위의 if else문을 이렇게 한줄로 표현 가능
			 
		 }
		 else 
			 return false;
	 }
}

