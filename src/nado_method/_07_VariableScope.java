package nado_method;

public class _07_VariableScope {
	public static void methodA() { //만약main 밖의 변수를 사용하고 싶으면 여기 괄호에 int number 을 써주면 됨
		System.out.println();
	}
	
	public static void methodB() {
		int result = 3;   //지역변수
	}

	public static void main(String[] args) {
		int number = 3;
		
		//System.out.println(result);
		
		for (int i = 0; i<5; i++) {
			//System.out.println(i);
		}
		
		{
			
			}

		}
	}
