package sstStudy;

/*접근제어자
 * 이름, 나이, 직업을 입력받아 입력받은 값을 화면에 출력하며, 이름에 "끝"이 입력되면 종료되는 프로그램 작성
 * 단, 이름/나이/직업과 관련된 정보는 메서드를 사용하여 작성(private) -> 객체에 선언해서 객체를 이용해 출력하라는 뜻
 * 문자열 비교 : 변수명.equals("끝")
 * 입력예)이름은>홍길동
 * 나이는>23
 * 직업은>프로그래머
 * 출력예)홍길동님의 나이는 23살이며, 직업은 프로그래머 입니다.
 * 
 * 입력예)이름은>끝
 * 나이는>2
 * 직업은>백수
 * 출력예)프로그램을 종료합니다
 */

import java.util.*;

class Person3{
	private String name;
	private int age;
	private String job;
	
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getAge() {
		return this.age;
	}
	
	public void setAge(int age) {
		this.age =age;
		
	}
	
	public String getJob() {
		return this.job;
	}
	
	public void setJob(String job) {
		this.job = job;
	}
	
	//프로그램 종료여부 판단과 정보 출력
	public boolean msgPrint() {
		if(getName().equals("끝")) {//메서드를 이용
			System.out.println("프로그램을 종료합니다.");
			return true;
		}
		else {
			System.out.println(getName() + "의 나이는 "+ getAge() + "살이며, 직업은 "+ getJob() +"입니다.");
			return false; //false 를 넘겨줌으로써 무한 루프가 되도록한다.  메서드의 반환타입이 boolean이므로
		}
	}
	
}



public class MySample0526_5 {

	public static void main(String[] args) {
		Scanner scn =new Scanner(System.in);
		
		//접근제어자
		//trim() : 맨앞과 맨뒤 공백만 제거
		//replace(" ","") : 문자열에서 첫번쨰 인수를 찾아 두번째 인수로 변경
		//replaceAll(" ",""):문자열에서 첫번쨰 인수를 찾아 두번째 인수로 변경
		Person3 p =new Person3();
		
		//만약 입력받은 문자열에 공백이 있다면 홍 길동 처럼 공백을 제거하는것을 하기 -> next()는 공백을 기준으로 잘라서 입력받기 때문에 오류를 없애주기 위해
		String tmp ="  홍 길동   ";
		
		
	/*	//trim() : 맨앞과 맨뒤 공백만 제거
		System.out.println("1 : [" + tmp.trim() + "]" );
		System.out.println("2 : [" + tmp.replace("홍", "강") + "]" );
		//replace(" ","")는 공백을 ""로 바꾸겠다 뜻 꼭 " "처럼 공백을 넣어줘야함 , 문자열에 있는 모든 공백을 제거
		System.out.println("3 : [" + tmp.replaceAll(" ","") + "]" );
*/		
		
		while(true) {
			
			System.out.print("이름은>");
			p.setName(scn.next());
//			String a =scn.next();
//			p.setName(a); 이렇게하면 a라는 불필요한 인스턴스 변수가 발생하기 떄문에 아래와 같이 써주변 변수 생성없이 사용할 수 있다
			//p.setName(scn.nextLine().replace(" ","")); //setName()메서드의 매개변수의 데이터 타입은 String 만 들어오면 되므로 string 입력값이 그대로 들어가게 할 수 있다
			//scn.nextLine().replace(" ","")); 를 쓰면 nextLine()이 엔터키를 인식해서 다음입력에 문제가생김
			
			System.out.print("나이는 >");
			p.setAge(scn.nextInt());
		
			System.out.print("직업은 >");
			p.setJob(scn.next());
			
			//scn.nextLine();을 해주면 된다
			
			//이 부분이 중복됨 -> msgPrint()메서드안에 이미 구현되어 있음
		/*	if(p.getName().equals("끝")) {
				System.out.println("프로그램을 종료합니다.");
				break; //무한루프기 때문에 break꼭 필요함
			}
			else {
				System.out.println(p.getName() + "님의 나이는 " + p.getAge()+"살이며, 직업은 "+ p.getJob() + "입니다.");
			}
			*/
			
			if(p.msgPrint()) {//msgPrint()메서드안에 이미 구현되어 있기 때문에 멈추는 것만 구현해주면 됨
				break;
			}
		}
		
		
	}
}
