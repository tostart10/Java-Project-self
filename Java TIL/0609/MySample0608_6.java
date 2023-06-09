package etc;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class MySample0608_6 {

	public static int randomRange(int min, int max, Random random) {
		//Random random을 하기전에 new 로 Random 객체 생성되어 있어야함 -> new 로 생성한 주소값을 여기에 매개변수로 던져줘야하기 때문
		
		
		//점수를 일일이 입력하기 힘드니까
		//학생들의 점수를 랜덤으로 뽑아냄 (40~100사이의 값)
		if(min > max) {
			return min;
		}
		
		//Q이 코드가 왜있는지 모르겠음.....
		//난수발생 - min 부터 max값 사이에 난수 발생
		return random.nextInt((max + 1) -min) + min;
		//(max + 1) -min) + min이 난수의 범위임
		//40~100점 사이의 값을 넘기란뜻
		//(max + 1) -min으로 값을발생시킴
		
	}
	
	
	
	public static void main(String[] args) {
		//Student 클래스에서 정의된 생성자과 메서드들을 잘 참고해서 작성하셈
		
		Random random = new Random();
		
		//만약 생성자에서만 total과 avg를 계산하는 로직이 있고 메서드에는 없다면 객체가 생성할 때 딱한번만 실행되면서 기본값 0만 들어간 채로 계속
		//실행되어서 아무리 값을 add를 해도 유일하게 접근할 수 있는 방법이 메서드인데 메서드에서 처리하지 않아주면 결국 변수값에는 접근할 수 없어서 계속 0이다
		
		//Student a =new Student();
		//get.getTotalScore() //0
		//a.setkorea(100)
		//getTotalScore() //이거도0 -> 왜?? 메서드안에서 값계산을 안해주고 생성자에서만 해줘서 객체생성할 때 딱한번만 실행되서 0인채로 계속있는것임
		//이런식으로 코드를 짜면 new Student()할떄 매개변수 없는 기본 생성자만 호출되서 모두 0값만들어가게되고 그 후로는 set으로만 접근가능하게되는데
		//a.setkorea(100)을 하면 get.getTotalScore()도 다시 계산해서 값을 갱신헤줘야하기 때문에 set메서드에서 TotalScore을 다시계산하는로직을 구현해줘야하는 것이다
		
		
		//학생 리스트 생성
		//이거로 값을 담아주는 것임
		//객체를 생성하고 그 주소값을 ArrayList안에 그 주소값을 담아주는 것
		List<Student> list = new ArrayList<Student>();  //다형성  객체
		//리스트 전체에 객체를 담기 위함, 데이터 타입이 <Student>
		//자식객체로 생성해서 부모 참조변수로 바라봄
		//List<Student> list -> 데이터 타입이 List 사이즈가 10인 리스트안에들어가는 데이터 타입은 object 객체 Student
		//new ArrayList<Student>()의 데이터타입
		//List라는 데이터타입이라는 집에 들어올수 있는 데이터 타입은 student 객체다
		//ArrayList = 자료형 안에 들어갈 수 있는 데이터타입은 Student이다
		
		//랜덤점수 입력
		int i;
		
		
		//Q 객체생성은ArrayList로 하긴했지만 참조변수는 부모인 list 인데 , add로 해주는 것은 숫자,문자,주소 다 들어 있는데 들어갈 수 있나?
		//그럼 list안에 들어가는 것이 아닌 ArrayList 안에 들어가는 거??
		for(i = 1; i<=20; i++) { 
			//홍길동1 ...홍길동20
			list.add(new Student(  //객체생성으로 생성자호출
					//new Student하면 객체의 시작주소를 반환  -> list.add(new Student의 주소값)인것임
					//이거는 20번 돌게되고 이 안의 것은 3개씩이므로 60번 돌게된다
					//매개변수 7개
					1, 1, i, "홍길동"+i,
					//만약 위에서 new Random을 안했으면 밑에서 계속 new를 해줘야해서 엄청많은 객체가 생성됨.
					//위에서 생성한 객체의 시작 주소값을random에 매개값으로 넘김
					//이거는 총 60번 돌게된다??
					randomRange(40, 100, random), //국어 //객체샹성하고 매개변수로 random으로 나온 수를 넘김
					randomRange(40, 100, random), //영어 //40~100점 사이의 값을 받아올거임
					randomRange(40, 100, random) //수학 //여기의 random은 값이 아닌 주소 -> 즉 주소를 넘겨주는 것
								)
					);
			//new student의 경우는 계속 반복문안에서 new로 객체를 생성을 해줘야한다 -> 각 객체에 해당하는 데이터가 다 다르고 그 데이터를 저장하고 가져다 사용해야하기 떄문
			//random의 객체를 생성해서 그 객체에 데이터를 담아두고 데이터를 계속 옮겨야한다면 계속 객체를 생성해야하는 게 맞음
			//하지만 직금 random은 인수값을 던져서 그 값을 전달시키기만 하면되는 코드이기 떄문에 일일이 new로 객체를 생성하지 않고 한번만 생성해서사용함
			//같은 기능을 가진 것을 여러번 사용하니까 
			//같은 구조의 객체에 들어가는 값만 다른거기 때문
			
			
			
			//여기까지가 ArrayList에 20개의 객체(주소값)를 담은것 -> 20명의 정보를 넘긴것
			
		//이거 주석처리하면 등수 메기는 것만 출력가능	
			//등수 선정 전 출력
//			System.out.println("##############");
//			System.out.println("# 등수 산정 전 출력");
//			System.out.println("##############");
//			for(i = 0; i< list.size(); i++) {  //20명이므로 size()는 20
//				Student student = list.get(i);
//				System.out.println(student); //내부적으로 toString()메서드를 호출함
//				//만약 toString()메서드를 오버라이딩 안해 놨다면 Object클래스의 toSring을 호출해서 @~~가 찍히게 될거임 
//				//student는  student클래스안에서 오버라이딩 해준 toString()
//				//메서드를 호출해서 return value로 줘서 출력하는 것임
//			}
			
			
//			for(i = 0; i< list.size(); i++) {  //20명이므로 size()는 20
//				student = list.get(i);
//				System.out.println(student);
//				student = null;
//			위의 코드를	이런식으로 해도 됨
				
			
			int j;
			Student tmp;
			
			//등수를 적용하기 위해 내림차순 - 정렬
			for(i =0; i<(list.size() -1); i++) {
				
				for(j = i + 1; j< list.size(); j++) {
					if(list.get(i).getTotalScore() < list.get(j).getTotalScore()) {
						
						//주소값을 서로 바꿔주기 위한코드
						tmp = list.get(i);// list.get(i)는 객체의 시작 주소
						//변수가 아닌 ArrayLIst이기 떄문에 값이 아닌 주소값이 들어있음
						list.set(i, list.get(j));  //i=j;  i위치에 list.get(j)을 넣어라 //시작주소 값을 바꿈
						list.set(j, tmp); //j에 주소값 대입
						
						
					}
				}
			}
			
			System.out.println();
			
			//등수 산정 후 출력
			System.out.println("##############");
			System.out.println("# 등수 산정 후 출력");
			System.out.println("##############");
			int ranking = 0;   //등수
			int order = 0;     //동일 등수 증가 ㄱ밧
			
			//등수 산정 및 출력
			for(i=0; i<list.size(); i++) {
				
				Student student = list.get(i); //주소값을 student에 넣은것
				if(i ==0) {
					
					//음수 초기 값으로 1로 지정
					ranking++;
					//동일 등수 증가 값도 1로 설정
					order++;
				}
				else {
					//총점이 같다면
					if(list.get(i-1).getTotalScore() == list.get(i).getTotalScore()) { //내꺼를 기준으로 내 앞에있는 것과 비교
						//Student student와  list.get(i)가 같은 집을 바라보는거기 때문에 student.getTotalScore()으로 해도됨
						//내거와 앞에거가 같으면 등수가 같아야해서  ranking 은 안변함 order만 증가시킴
						//
						
						//동일 등수시 증가값 적용(등수  ranking 바로 앞과 동일)
						order++;	
					}
					else {
						//총점이 틀리면(이전에 등수에 동일 등수 증가 값을 더함)
						ranking += order;  //ranking은 내 앞에거, 내 등수가 앞사람보다 낮으면 등수가 앞사람보다 숫자가 크기 때문에 그만큼 더해줘야함
						//동일 등수 증가 값 초기화
						order = 1;
					}
					//동점자가 있는 등수의 다음에 오는 등수는 앞의 동점자 수만큼을 더해준 등수를 가지게 된다
				}
				
				//등수 부여
				student.setRanking(ranking);
				
				
				//출력
				System.out.println(student); //toString() 호출로 출력
			}
			
			
		}
		
	}

}
