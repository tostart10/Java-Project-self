package sstStudy;

class Document{
	static int count=0;
	String name;
	
	Document(){
		this("제목없음" + (++count));
		//this. 는 현재 시점에서의 생성자
		//this() 현재 있는 메서드와 다른 메서드를 가리킴
	}
	Document(String name){
		this.name = name;
		System.out.println("문서 " + name + "이 생성되었습니다.");
	}
}

public class MySample0525 {

	public static void main(String[] args) {
		//생성자
		Document d1 =new Document();
		Document d2 =new Document("자바.txt");
		Document d3 =new Document();
		Document d4 =new Document();
		//Document클래스안에 선언된 count 변수는 클래스 변수이기 때문에 d1,3,4 모두 count 를 사용할 수 있다
	}
}
