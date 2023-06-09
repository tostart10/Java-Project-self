package etc;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class MySample0609_3 {

	public static void main(String[] args) {
		//ArrayList 와 LinkedList비교 (성능테스트)
		ArrayList a = new ArrayList(2000000);
		LinkedList t =new LinkedList();
		
		//자바에서 지원해주는 LinkedList는 단방향이다
		
		//ArrayList는 순서가 있기 때문에 순차적으로
		//LinkedList는 주소값만 가지고 있어서 찾아가는데 시간이 걸린다
		System.out.println("순차적으로 추가...");
		System.out.println("ArrayList : " + add1(a));
		System.out.println("LinkedList : " + add1(t));
		System.out.println(); //출력창 엔터용
		
		//LinkedList는 방만 만들어 놓고 주소값만 추가하면되서 빠름
		//ArrayList 요소들이 모두 옮겨가야하고 배열 복사해야해서 느림
		System.out.println("중간에 추가...");
		System.out.println("ArrayList : " + add2(a));
		System.out.println("LinkedList : " + add2(t));
		System.out.println();
		
		//LinkedList는 만들어 놓고 주소값만 옮기면 되서 빠름
		//ArrayList 요소들이 모두 옮겨가야해서 느림
		System.out.println("중간에 삭제...");
		System.out.println("ArrayList : " + remove2(a));  //remove1을 먼저하면 다 삭제되어서 remove2가 실행 안됨
		System.out.println("LinkedList : " + remove2(t));
		System.out.println();
		
		
		System.out.println("순차적으로 삭제...");
		System.out.println("ArrayList : " + remove1(a));
		System.out.println("LinkedList : " + remove1(t));
		
		
		//ArrayList -> 순차적으로 추가/삭제 하는 것이 빠름
		//LinkedList -> 중간에 삭제/추가 등의 중간에 하는 작업이 빠르다
		
		//LinkedList연속적이지 않아서 주소값이 필요하다
	}
	
	public static long add1(List list) { //다형성
		
		long start = System.currentTimeMillis(); //현재 시간을 미리세컨드 단위
		
		for(int i = 0; i<1000000; i++) {
			
			list.add(i + "");  //1000000번 돌면서 ""를 넣어줌 
			//add(i + "")는  매개변수 list에 ArrayList가 들어왔다면 list.add는 ArrayList안의 add의 메서드를 사용하는것
			//list에 LinkedList가 들어오면 list.add는  LinkedList의 add메서드를 사용하는 것이다
			
		}
		long end = System.currentTimeMillis();
		
		return end - start;
		
	}
	
	public static long add2(List list) { //다형성
		
		long start = System.currentTimeMillis(); //현재 시간을 미리세컨드 단위
		
		for(int i = 0; i<1000; i++) {
			
			list.add(500, "x"); //500번쨰에 x를 추가, 계속500번째에만 바꿈
		}
		long end = System.currentTimeMillis();
		
		return end - start;
	}
	
	
	//뒤에서부터 와앞에서 부터 삭제하는 것의 속도차이를 보기 위함
	
	public static long remove1(List list) { // 뒤에서 부터 삭제
		
		long start = System.currentTimeMillis();
		
		for(int i = list.size() -1 ; i>=0 ; i--) {
			list.remove(i);
		}
		
		long end = System.currentTimeMillis();
		
		return end -start;
	}

	
	public static long remove2(List list) { //앞에서 부터 삭제
			
			long start = System.currentTimeMillis();
			
			for(int i =0 ; i< 10000; i++) {  //0부터 1000번만 돌림
				list.remove(i);
			}
			
			long end = System.currentTimeMillis();
			
			return end -start;
		}
}
