package sstStudy;

import java.util.*;

class Math{//Math클래스
	//인스턴스 메서드
	int add(int a, int b) {
		System.out.println("add 메서드 시작 : a = " + a + ", b = "+ b);
		a = a +10;
		b= b + 10;
		int result = a + b;
		
		System.out.println("add 메서드 끝 : a = " + a + ", b = "+ b);
		return result;
		
	}
}

/*
//혼자해보기 -> 필요없는 변수를 많이 생성했다... 메소드안의 연산로직이 간단하다면 변수사용할 필요없다.
class Math2{
	int add(int a, int b) {
		int add = a + b;
		return add;
	}
	
	int subtract(int a, int b) {
		int subtract;
		if(a < b) {
			subtract = b - a;
			return subtract;
		}
		else {
			subtract = a -b;
			return subtract;
		}
		
	}
	
	int multipiy(int a, int b) {
		int multipiy = a * b;
		return multipiy;
	}
	
	double divide(int a, int b){
		double divide;
		
		if(a < b) {
			divide = (double)b / a;
			return divide;
		}
		else {
			divide = (double)a /b;
		}
		
		return divide;
	}
}
*/

/*
//모범코드
class Math2{
	int add( int a, int b) {
		return a +b ;
	}
	
	int subtract(int a, int b) {
		if(a>b) 
			return a -b;
		else
			return b -a;
	}
	
	int multipiy(int a, int b) {
		return a * b;
	}
	double divide(int a, int b) {
		if(a>b) {
			return (double)a / b;
		}
		else {
			return (double)b/a;
		}
	}
	
}

*/

class Math2{

	//int a,b;   //인스턴스 변수
	
	static int a, b; //클래스 변수 -> 객체생성 안해도 사용가능
	
	static int add( ) { //static이 붙었기 때문에 클래스메소드
		return a +b ;  //만약 a, b가 int a,b; 처럼 인스턴스 변수로
	}
	
	int subtract() {
		if(a>b) 
			return a -b;
		else
			return b -a;
	}
	
	int multipiy() {
		return a * b;
	}
	double divide() {
		if(a>b) {
			return (double)a / b;
		}
		else {
			return (double)b/a;
		}
	}
	
}







public class MySample0522_3 {

	public static void main(String[] args) {
		Scanner scn = new Scanner(System.in);
		//클래스
	/*	System.out.println("정수 2개를 입력하세요.>");
		int a =scn.nextInt();
		int b =scn.nextInt();
		
		System.out.println("main 메서드 시작 : a = " + a + ", b = "+ b);
		
		Math m =new Math();
		int c = m.add(a, b); //메서드에 리턴값이 있더라도 호출한곳에서 안써도 된다.
		System.out.println( "a : "+a+ ", b : " + ", c : "+ c);  //5 7
		System.out.println("main 메서드 끝 : a = " + a + ", b = "+ b);
		
		
		/*문제)두 정수를 입력받아 더하기, 빼기, 곱하기, 나누기 연산결과 출력
		 * 입력예) 두 정수를 입력하세요. >5 3
		 * 출력예) add(a, b) = 8  //이건 메소드명들임
		 * subtarct(a, b)= 2 
		 * multipiy(a,b) =15
		 * divide(a,b) = 1.666667
		 * 단. divide메서드는 result 타입을 double
		 * 빼기와 나눈기는 큰 수에서 작은수를 빼거나 나누게 처리함
		 * 계산기 클래스는 Math2, 결과 출력은 main에서 처리.
		 */
		
	/*	int a =scn.nextInt();
		int b =scn.nextInt();
		
		Math2 m = new Math2();
		int add = m.add(a, b);
		int subtract = m.subtract(a, b);
		double divide = m.divide(a, b);
		int multipiy = m.multipiy(a, b);
		
		
		System.out.println("add(" + a + ","+ b + ") = " + add);
		System.out.println("subtract(" +  + a + ","+ b + ") = " + subtract);
		System.out.println("divide("  + a + ","+ b + ") = " + divide );
		System.out.println("multipiy("+ a + ","+ b + ") = " + multipiy);
	*/	
		
		
		//클래스 변수인 경우 -> 객체 생성없이 사용가능
				Math2.a = scn.nextInt();
				Math2.b =scn.nextInt();
				
				
		
		//인스턴스 변수 이용하는 문제
		//위 문제와 동일한 문제, 입력받는 변수 a, b를 인스턴스 변수로 선언 후 사용
		
		Math2 m2 = new Math2();//인스턴스 변수는 객체를 반드시 생성해야 사용할 수 있으므로 객체를 먼저 생성해준다.
		
		/*인스턴스 변수일 경우
		m2.a = scn.nextInt();
		m2.b = scn.nextInt();
		
		m2.add(m2.a, m2.b);
		m2.subtract(m2.a, m2.b);
		m2.divide(m2.a, m2.b);
		m2.multipiy(m2.a, m2.b);
		
		
		System.out.println(m2.add(m2.a, m2.b));
		System.out.println(m2.subtract(m2.a, m2.b));
		System.out.println(m2.divide(m2.a, m2.b));
		System.out.println(m2.multipiy(m2.a, m2.b));
		
		System.out.println(m2.add());
		System.out.println(m2.subtract());
		System.out.println(m2.divide());
		System.out.println(m2.multipiy)());
		*/

	}

}
