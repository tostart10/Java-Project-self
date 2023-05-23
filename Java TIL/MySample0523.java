package sstStudy;

import java.util.*;

class Data{
	int x;
    int y;
}

public class MySample0523 {
/*

	public static void main(String[] args) {
		//객체지향프로그램 - 기본형 매개변수
		Data d =new Data();
		d.x =10;
		
		System.out.println("main() : " +d.x);
		
		change(d.x);
		System.out.println("main() after x : " + d.x);
		//기본형 매개변수 끝
	}
	
	//기본형 매개변수
	//change(d.x); 이렇게 호출되는순간 메서드 영역이 생성되고 메서드의 int x 변수의 방이 생성되어 메서드 호출될떄 매개변수로 들어온d.x의 값인 10이 변수방에
	//저장된다. 그후 x=1000;으로 값이 덮어씌어 지면서 x는 1000이 된다
	static void change(int x) { 
		x =1000;
		System.out.println("change() x : + x");
	}


	*/
/*	//참조형 매개변수
	//참조형은 주소값을 가지고 가기 때문에 한곳을 바라본다
	//돌고돌아서 결국 main에 있는 객체를 바라보고 있는것
	public static void main(String[] args) {
		Data d = new Data();//참조형 객체생성
		d.x = 10;
		
		System.out.println("main() x : " + d.x);
		
		change(d);//Data d = new Data();로 생성된 메모리에 주소값을 넣음
		System.out.println("main() change after x : "+ d.x);
		
	}
	//change(d); 에서 매개변수로 d가 오는데 d안에는 주소값이 들어있고 이 주소값이(Data d)로 들어가는 것임
	//(Data d)는 메서드에 던져주는 값을 선언해주는것?
	static void change(Data d) {//매개변수를 받기 위해 꼭 변수 선언 해줘야한다//Data d 에서 d는 참조형 변수가 된다 -> Data라는 클래스가 데이터 타입으로 쓰였기 떄문에
		d.x =1000;
		
		System.out.println("change() x : " +d.x);
	}
	//참조형은 호출을 여려번 겹쳐서 해도 결국 하나를 바라보기 때문에 최종적으로 1000으로 출력된다 
	//참조형은 주소값을 가지고 가기 때문에 한곳을 바라본다
	//(Data d)는 d는 데이터타입이 Data라는 클래스이기 때문에 d에는 주소값만 들어올 수 있다(객체 시작주소값만 담을 수 있다)
	//그래서 change(Data d)을  호출하기전에 무조건 객체를 생성해줘야한다.
*/	
	
	
	
	//참조형 매개변수
/*	public static void main(String[] args) {
		Data d =new Data();
		d.x = 10;
		
		Data d2 =change(d); //data type이 Data
		
		System.out.println("d.x = " + d.x); //d.x와  d2.x는 다른 객체, 다른값임
		System.out.println("d2.x = " + d2.x);
	}
	
	//(Data d)을 쓴다는 것은 메서드를 호출하는 곳엥서 객체가 이미 생성되어있다는 것을 전재하 임
	static Data change(Data d) {//클래스라서 static Data데이터 타입  //매개변수도 참조형
		Data tmp = new Data();
		tmp.x = d.x;
		
		return tmp;
	}
	//참조형 반환타입(리턴타입) 끝
	
	
	
	/*Data 객체생성을 change 메서드에 한 후 결과값을 main 전달해서 출력
	 * 매개변수는 기본형 반환타입만 참조형
	 * 출력예)main() a : 10
	 * change() a + d :
	 */
	//이 예제는 객체생성을 change가 한다.
/*	public static void main(String[] args) {
		int a =5;
		Data d;
		
		System.out.println("main() a : " +a);
		
		d = change(a);
		System.out.println("change() after d.x : " + d.x);
	}
	
	static Data change(int a) {
		Data tmp = new Data();
		tmp.x = a +10;
		
		return tmp;
		//이 메서드 실행이 끝나면 int a 변수와  tmp객체는 사라짐
	}
	*/
	
	
	/*문제)Data객체에 y변수 추가하고 main에서 2개 정수를 입력받아 Data 객체 각 변수에 대입하고, main에서 각 값을 출력한 후 copy메서드를 통해 
	 * 값에 2를 곱한 결과를 출력하는 프로그램
	 * 입력예)정수 2개를 입력하세요.>10 20
	 * 출력예)main 입력값 d.x : 10, d.y : 20
	 * copy메서드 d.x : 10, d.y : 20
	 * copy메서드 tmp.x : 20, tmp.y : 40
	 * main 마지막 d.x : 10, d.y : 20
	 * main 마지막 d2.x : 20, d2.y : 40
	 */
	//Data객체에 y변수 추가하고 라는 말이 뜻하는 것은 클래스에 y변수를 추가하라는 뜻임
/*	public static void main(String[] args) {
		Scanner scn = new Scanner(System.in);
		System.out.println("정수 2개를 입력하세요.>");

		Data d =new Data();
		d.x = scn.nextInt(); //d변수를 통해 ??클래스안에 잇는 x클래스 변수에 값을 대입해주는것
		d.y = scn.nextInt(); //맨위 클래스에서 변수 y를 추가해줘야함 (y는 static안붙었으니까 인스턴스 변수)
		
		System.out.println("main 입력값 d.x : " + d.x + ", d.y : "+ d.y );
		
		
		Data d2 ;//copy()메서드에서 객체생성하기 떄문에 주고 담을 메모리만 생성하면 된다
		
		d2 = copy(d); //객체의 주소를 가진 변수 d만 보내주면 된다 
		//위의 두줄을 Data d2 =copy(d); 로 간단하게 쓸수있다.
		
		System.out.println("main 마지막 d.x : "+ d.x +", d.y : "+ d.y);
		
		System.out.println("main 마지막 d2.x : "+ d2.x +", d2.y : "+ d2.y);
		
		
	}
	
	
	static Data copy(Data d) { //d는 위에서 생성한 객체의 주소를 가지고 있다.  매개변수(Data d)로 d가 들어오면 주소가 들어오는거기 때문에 
		Data tmp = new Data(); //새로 생성된 tmp에 d의 주소가 대입됨으로써 tmp는 d와 같은 객체를 바라보게 된다
		tmp.x = d.x;   //즉, tmp와 d는 같은 객체를 바라보게 된다.
		tmp.y = d.y;
		System.out.println("copy메서드 d.x : " + tmp.x + ", d.y : " + tmp.y);
		
		tmp.x = d.x * 2;  //d.x는 d객체의 x 변수에 접근해 x변수 안의 값에 접근하는 것 -> 그래서 값이기 때문에 *2 를 해줄수 있는 것임
		tmp.y = d.y * 2;
		System.out.println("copy메서드 tmp.x : " + tmp.x + ", tmp.y : " + tmp.y);
		
		return tmp;  //주소값을 가지고 있는 tmp만 보내주면 된다
		//return을 하고 로직이 완전히 끝나면 tmp는 사라진다
		//tmp.x ,  tmp.y 는 tmp객체 안의 변수를(+변수안의 값)을 뜻하는 것이기 떄문에 주소만 전달해주면 클래스에 있는 x, y 변수를
		//.x .y 를 해줘서 접근할 수 있다.
		//return 문은 로직가장 마지막에 와야한다. return 다음에 로직을 쓰려고 하면 오류남
		
	}
	
	//더 깔끔한 코드
/*	static Data copy(Data d) { 
		System.out.println("copy메서드 d.x : " + tmp.x + ", d.y : " + tmp.y);
		tmp.x = d.x * 2;
		tmp.y = d.y * 2;
		System.out.println("copy메서드 tmp.x : " + tmp.x + ", tmp.y : " + tmp.y);
		return tmp;
	}
	*/
	
	

	//배열을 이용한 참조형 매개변수
/*	public static void main(String[] args) {
		int[] a = {10, 20};
		System.out.println("main() a[0] : " + a[0]);
		
		change(a); //배열명은 배열의 시작주소를 가리킨다 =참조형 매개변수 a에는 배열의 시작 주소값이 있음
		System.out.println("main() change after a[0] : " + a[0]);
	}
	
	static void change(int[] x) {//참조형 변수 a(배열의 시작주소를 담고있는)가 x로 들어옴
		x[0] = 2000; //참조형 변수의 값에 접근하려면 참조형변수명.인스턴스변수 로  객체 안에 접근해줘야함
		System.out.println("change() x : "+ x[0]);
	}
	
	//언제 참조형변수 쓰고, 지역변수 쓰나?
	//변수에 저장해놓은 값을 여기저기서 변수의 값을 바꿔야하면 참조형, 한 메서드 안에서만 사용하거나 값을 변경하지 않고 다른 메서드에는 값만 전달해줄경우는 참조변수 사용
	
	
	/*문제)배열에 {3, 2, 1, 6, 5, 4}를 초기값으로 선언후에 오름차순으로 정렬하여 출력하는 프로그램
	 * 단, 각 메서드는 배열출력은 printArr, 배열의 모든 합은 sumArr, 배열 정렬은 sortArr로 선언하여 구현함.
	 * 출력예)[3,2,1,6,5,4]
	 * [1,2,3,4,5,6]
	 * sum =21
	 */
	
	//혼자해보기
	public static void main (String[] args) {
		
		int[] arr = new int[] {3, 2, 1, 6, 5,4};
		printArr(arr); // 배열 전체 출력
		sortArr(arr);  // 배열 정렬
		printArr(arr);  //정렬 후 배열 전체 출력
		
		System.out.println("sum = " + sumArr(arr));  //총합출력, 다른 메서드는 리턴이 필요없지만 sumArr(arr)은 리턴타입이 반드시 있어야함
	}
	
	//이 문제는 클래스 메서드를 사용하는 문제이다
	//메서드 안에 MySample0523 m =new MySample0523(); 처럼 객체선언을 안했기 때문
	//객체 생성을 안했기 때문에 m.printArr();처럼 인스턴스 메서드를 만들 수 없다
	static void printArr(int[] arr) {
		System.out.print("[");
		for(int i=0; i<arr.length; i++) {
			System.out.print( arr[i] + ","); 
		}
		System.out.println("]");
	}
	
	//선택정렬 사용함
	static void sortArr(int[] arr) {
		int i, j, tmp, val, idx=0;
		for(i=0; i<arr.length-1; i++) {
			val =arr[i];
			
			for(j=i+1; j<arr.length; j++) {
				if(val>arr[j]) { //오름차순이기 때문에 맨앞의 기준값인 val이 arr[j]보다 크면 (ex) 4 > 1)
					val =arr[j];
					idx = j;
				}
			}
			
			if(idx>i) {
				tmp = arr[i];
				arr[i] = arr[idx];
				arr[idx]= tmp;
			}
			
			idx =0;//idx값 초기화
		}
		
	}
	
	static int sumArr(int[] arr) {
		int sum=0;
		for(int i=0; i<arr.length; i++) {
			sum += arr[i];
		}
		return sum;
	}

	
	//선택정렬 사용안한 정렬
/*	static void sortArr(int[] arr) {
		int i, j, tmp;
		for(i=0; i<arr.length-1; i++){
			for(j=i+1; arr.length; j++) {
				if(arr[i]>arr[j]) {
					tmp=arr[i];
					arr[i]=arr[j];
					arr[j]=arr[i];
				}
			}
		}
	}
	*/
	
}
