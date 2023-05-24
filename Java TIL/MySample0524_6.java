package sstStudy;


public class MySample0524_6 {
		static int cv =1;
		int iv =20;
		
/*		//클래스 초기화 블럭
	static {
		System.out.println("static 초기화 영역");//초기화 블럭이 생성자보다 먼저 실행됨 ->그다음 생성자실행 -> 메서드끝
		//
	}
		//인스턴스 초기화 블럭
	{
		System.out.println("인스턴스 초기화 영역");
		iv =20;
	}
	
	MySample0524_6(){
		System.out.println("MySample0524_6 생성자");
	}
	
	public static void main(String[] args) {
		//초기화 블럭
		System.out.println("main 메서드 시작");
		MySample0524_6 m1 = new MySample0524_6();
		
		System.out.println("main 메서드 두번쨰 실행");
		MySample0524_6 m2 = new MySample0524_6();
		System.out.println("main 메서드 끝");
		
		
	}
	
	
	*/
		public static void main(String[] args) {
		Product p1 =new Product();
		Product p2 =new Product();
		Product p3 =new Product();
		
		System.out.println("p1의 제품번호 (serial no) : "+ p1.serialNo);
		System.out.println("p2의 제품번호 (serial no) : "+ p2.serialNo);
		System.out.println("p3의 제품번호 (serial no) : "+ p3.serialNo);
		System.out.println("객체 생성 수는 : "+ Product.count); //count 는 클래스변수이기 떄문에 다 같은집
		
		}
}
		
class Product{
	static int count =0; //count는 클래스변수라 같은 집 serialNo은 인스턴스변수라서 다른집
	int serialNo;
	//인스턴스는 객체를 생성해야지만 사용할 수 있기 떄문에
	
	//지금은 인스턴스 초기화 블럭이 먼저 메모리에 올라가서 먼저 인스턴스 초기화 블럭이 먼저 실행됬는데 가끔씩 main먼저 실행되기 떄문에 잘 쓰지 않는다
	
	//인스턴스 초기화 블럭 인스턴스 -객체생성시 마다 실행,  main에서 new Product();로 객체를 생성하면
	{
		System.out.println("인스턴스 초기화 블럭 시작 count : " + count + ", serialNo : "+ serialNo);
		
		++count;
		serialNo = count;
		
		System.out.println("인스턴스 초기화 블럭 끝 count : " + count + ", serialNo : "+ serialNo);
	}
	
	/*왜 인스턴스 변수serialNo는 실행될때 0으로 시작 되고 , 클래스 변수count는 왜 계속 수가 올라가는가??
	 * 인스턴스 초기화 블럭은 new Product();으로 객체가 생성될 때마다 실행되기 때문에 p1, p2, p3당 serialNo변수가 각각 다 다르게 있기 때문에 0부터 시작하게 되는거임
	 * p1객체 생성해서 초기화 블럭돌리고 끝나면 p2객체을 생성하는 코드가 실행되서 p2객체가 생성되고 초기화 블럭이 실행되고 p2의 serialNo변수 사용이 시작되는 거기 떄문에 0부터 시작되는거임
	 */
	
	
	Product() {
		System.out.println("Product() 생성자");
	}
		
}
