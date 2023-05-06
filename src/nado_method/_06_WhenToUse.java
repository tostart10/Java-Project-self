package nado_method;

public class _06_WhenToUse {
	// 메소드 내에서도 또 다른 메소드를 호출할 수 있다
	public static int getPower(int number) {
		return getPower(number, 2);
	}
	
	public static int getPower(int number, int exponent) {
		int result = 1;
		for (int i = 0; i< exponent; i++) {
			result *= number; 
		}
		return result;
	}


	public static void main(String[] args) {
		// 메소드가 필요한 이유
		// 같은 동작을 하는데 값만 다른경우
		
		// 2의 2승 구하기
		System.out.println(getPower(2, 2));  // 2 * 2 =4

		// 3의 3승을 구하기
//		result = 1;
//		for (int i = 0; i< 3; i++) {
//			result *= 3; 
//		}  이 긴코드를 맨위의 메소드를 선언함으로서 아래의 한줄 코드만으로도 결과를 나타낼 수 있게됨
		System.out.println(getPower(3, 3));

		//4의 2 승 구하기
		System.out.println(getPower(4, 2));

		
	}
}
