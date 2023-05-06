package nado_method;

public class _05_Overloading {
	//오버로딩은 전달값의 타입,자료형이 다르거나 전달값의 개수가 다르면 똑같은 이름의 매소드를 얼마든지 중복해 선언가능
	
	public static int getPower(int number) {
		int result = number * number;
		return result;
		// return number * number;
		
	}
	
	// "4" 처럼 문자로 입력된 숫자를 int로 바꾸는 메소드
	public static int getPower(String strNumber) {
		int number = Integer.parseInt(strNumber);
		return number * number;
	}
	
	
	// 반환값, 매개변수 모두 있는 메서드
	public static int getPower(int number, int exponent) {
		int result = 1;
		for (int i = 0; i< exponent; i++) {
			result *= number;  //result = result * number
		}
		return result;
	}
	

	public static void main(String[] args) {
		// 매소드 오버로딩
		// 같은이름의 메소드를 여러 번 선언
		// 1. 전달값의 타입이 다르거나
		// 2. 전달값의 갯수가 다르거나
		// 반환형이 다른 메소드는 중복정의 할 수 없다
		// 매개변수가 들어오는 부분만 달라야 중복 선언 가능
		System.out.println(getPower(3)); //3*3=9
		System.out.println(getPower("4")); // 4 * 4 =16
		System.out.println(getPower(3, 3)); // 3 * 3* 3 =27
	}

}
