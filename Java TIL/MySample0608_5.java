package etc;

import java.util.List;
import java.util.ArrayList;

public class MySample0608_5 {

	public static void main(String[] args) {
		//ArrayList
		
		//이 코드 이해 안가면 if문에 숫자 직접넣어서 일일이 확인해보면됨
		
		final int LIMIT = 10;
		String  source = "0123456789a";
		int length = source.length(); //11
		
		System.out.println("length : " + length);
		
		List list = new ArrayList((length/LIMIT) + 10);  //다형성 //11
		//ArrayList는 list를 상속받음
		int i;
		
		for(i =0; i<length; i++) { //10까지 돈다
			
			if(i + LIMIT<length) { //10<11
				System.out.println("1 : " + source.substring(i, i + LIMIT)); //확인용
				//위의 코드는 한번만 출력됨 즉, 나머지는 다 else라는 소리
				list.add(source.substring(i, i + LIMIT)); //list에 추가
				//(0,11)인 첫번째에만 if문이 실행되고 나머지는 다 else
			}
			else {
				list.add(source.substring(i));
				//source를 substring으로 자를건데 (i)번째까지 자름
				//i가 커질수록 자르는 부분이 커지기 때문에 ArrayList의 크기가 작아진다.
			}
		}
		System.out.println("list.size() : " + list.size() );
	
		for(i =0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
		
		
	}

}
