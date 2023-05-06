package nado_method;

public class _02_parameter {
	//전달값이 있는 메소드
	public static void power(int number) {//number는 parameter,매개변수
		int result =number * number;
		System.out.println(number + "의 2 승은 "+ result);
	}

	public static void powerByExp(int number, int exponent) {
	int result = 1;
	for (int i = 0; i< exponent; i++) {
		result *= number;  //result = result * number
	}
	System.out.println(number + " 의 " + exponent + " 승은 " + result );
	
	}
	
	
	public static void main(String[] args) {
		//전달값, parameter
		
		//argument 인수
		power(2);
		power(3);
		
		powerByExp(2, 3); //2*2*2 =8
	

	}

}
