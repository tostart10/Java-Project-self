package nado_array;

public class _02_ArrayLoop {

	public static void main(String[] args) {
		//배열의 순회
		String[] coffees =  {"아메리카노","카페모카","라떼","카푸치노"};	
		
		// for 반복문 순회
		for (int i = 0; i <4; i++) {
			System.out.println(coffees[i] + "하나");
		}
		System.out.println("주세요");
		
		
		System.out.println("--------------");
		
		//배열의 길이를 이용한 순회 - 배열의 인덱스 값을 이용해야할 때
		for (int i = 0; i <coffees.length; i++) {
			System.out.println(coffees[i] + "하나");
		}
		System.out.println("주세요");
		
		
		// enhanced for (for-each) 반복문 - 배열의 모든 요소를 순회해서 사용
		//coffees 라는 배열에 있는 값들을 순회하는데 순회되는 값을 coffee라는 이름으로 받아서사용하겠다
		for (String coffee : coffees) {
			System.out.println(coffee + " 하나");
		}
		System.out.println("주세요");
		
	}

}
