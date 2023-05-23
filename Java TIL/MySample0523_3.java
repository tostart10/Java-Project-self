package sstStudy;


class Add2{
	//같은 패키지 안에서 같은 이름의 클래스를 한개 이상 선언하면 접근제어자 때문에 에러남!!
	//인스턴스 메서드
	void add(int a, int b) {
		System.out.println("a + b = "+ (a+b));
	}
	
	void add(int a, int b, int c) {
		System.out.println("a+b+c = " + (a+b+c));
	}
	void add(int a, int b, int c, int d) {
		System.out.println("a+b+c+d = " + (a+b+c +d));
	}
	
}

public class MySample0523_3 {

	public static void main(String[] args) {
		//메서드 오버로딩
	/*	MySample0523_3 m = new MySample0523_3();
		System.out.println("sum() 메서드 2개 : " + m.sum(5, 8));
		System.out.println("sum() 메서드 3개 : "+ m.sum(1, 2,3));
		m.sum(2);
		*/
		
		//Add2클래스 안의 인스턴스 메서드 사용하기 위해 객체생성
		Add2 a2 = new Add2();
		
		a2.add(1, 2);
		a2.add(1, 2, 3);
		a2.add(1, 2, 3, 4);
		
	}
	
	//같은 클래스에 하나이상의 같은 이름의 메서드가 온다
	//매개변수읙 개수가 달라야한다
	int sum(int a, int b) {
		return a + b;
	}
	
	void sum(int a) {
	System.out.println("sum()메서드 1개 a : "+ a);
	}
	
	int sum(int a, int b, int c) {
		return a +b+c;
	}
}
