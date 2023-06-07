package etc;

public class MySample0607_8 {
	//컴파일 : javac MySample0607_8.java
	//bin폴더 : java MySample0607_8 2023 6  (여기서 2023 과 6은 MySample0607_8클래스 안의 메인에 던져줄 요소들(값)임)
 //2023는 args[0],   6이 args[1] 번쨰임
	
	
	public static void main(String[] args) { //인자를 써주면 실행되면서 자동으로 인덱스값에 따라 값을 넣어준다
		

		System.out.println("args.length : " + args.length);
		
		if(args.length != 2) {
			
			System.out.println("args 오류 년과 월을 입력하세요.");
			return;
		}
		
		//parseInt()는 많이쓰임!! - string을 int 로 바꿔줌
		 //parseInt는 Integer클래스에서 제공해주는 메서드로 매개변수는 STring으로 받아서 int 타입의 값을 내보내준다
		int year = Integer.parseInt(args[0]);  //위에서 넣어준 값들을 인덱스로 하나씩 꺼내온다
		int month = Integer.parseInt(args[1]);
		
		System.out.println(year + "년 " + month + "월 입니다.");
		
		
	}

}
