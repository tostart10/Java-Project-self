package sstStudy;


class MyMath2{
	
	int cnt; //클래스가 변수를 초기화해줘서 이렇게 선언만 해도 자동으로 cnt=0;이된다
	
	int add(int a, int b) { //여기 맨앞의 int가 return으로 반환값을 보낼때 리턴값의 형을 이거를 따라감
		System.out.println(++cnt);
		return a+b;//메서드 앞의 리턴값의 형을 잘보셈!!
	}
	
	int add(int a, double b) {//만약 맨앞의 리턴값 데이터형을 double 로 지정해놨다면  return  a + (int)b; 를 했을때 아무리 int로
		//return값을 형변환 해줘도 double로 값이 전달됨!!
		System.out.println(++cnt);
		return  (int)(a + b);
	}
	
	int add(double a, int b) {
		System.out.println(++cnt);
		return (int)a + b;
	}
	
	double add(double a, double b) {
		System.out.println(++cnt);
		return a +b;
	}
	int add(int[] a) {
		int sum = 0;
		for(int i=0; i<a.length; i++) {
			 sum += a[i];
		}
		System.out.println(++cnt);
		return sum ;
	}
	
}



public class MySample0524 {

	public static void main(String[] args) {
		//메서드 오버로딩

		/*출력에)
		 * 1  // 인스턴스 변수 cnt 사용
		 * 13 //(5, 8)를 넘긴값의 결과라는 뜻
		 * 2
		 * 12 //(5, 7.1)
		 * 3
		 * 12 //(7.1, 5)
		 * 4
		 * 12.3 //(7.1, 2.5)
		 * 5
		 * 210
		 */
		
		
		int[] a =new int[] {10,20,30,40,50,60};
		MyMath2 m = new MyMath2();
		
		System.out.println(m.add(5, 8));  //메서드의 로직결과가 여기서 출력되는 것임
		System.out.println(m.add(5, 7.1));
		System.out.println(m.add(7.1, 5));
		System.out.println(m.add(7.1, 5.2));
		System.out.println(m.add(a)); //타입이 배열임 -> 배열의 배열명은 시작주소를 가리킨다 그러므로 참조형 매개변수 
		
		
	}

}
