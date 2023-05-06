package nado_method;

public class _04_parameterAndReturn {
	public static int getPower(int number) {
		int result = number * number;
		return result;
		// return number * number;
		
	}
	
	// 반환값, 매개변수 모두 있는 메서드
	public static int getPowerByExp(int number, int exponent) {
		int result = 1;
		for (int i = 0; i< exponent; i++) {
			result *= number;  //result = result * number
		}
		return result;
	}
	

	public static void main(String[] args) {
		// 전달값과 반환값이 있는 메소드
		int retVal = getPower(2); 
		System.out.println(retVal);  // 2 * 2 = 4

		retVal = getPower(3);
		System.out.println(retVal); // 3 * 3 =9
		
		retVal = getPowerByExp(3, 3); //3 * 3 * 3= 27
		System.out.println(retVal);
		
		System.out.println(getPowerByExp(2, 4)); //2*2*2*2 = 16
	}

}
