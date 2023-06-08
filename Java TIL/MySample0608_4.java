package etc;

import java.util.ArrayList;
import java.util.Collections;

public class MySample0608_4 {

	public static void main(String[] args) {
		
		ArrayList list1 = new ArrayList(10);  //<T>가 자동으로 들어가는 거? 
		list1.add("A");
		list1.add("B");
		list1.add("C");
		list1.add("D");
		
		System.out.println("초기 상태 : ");
		System.out.println(list1 + ", size() : " + list1.size());
		
		System.out.println("인덱스 1에 8 추가 : ");
		list1.add(1, "8");
		System.out.println(list1 + ", size() : " + list1.size()); 
		//ArrayList는 add를하면 덮어씌어지지 않고 추가됨 -> 그래서 크기가4 에서 5로 증가됨
		
		System.out.println("인덱스 2에 값 삭제 : ");
		list1.remove(2);
		System.out.println(list1 + ", size() : " + list1.size());
		
		
		//인덱스값 가져오기
		System.out.println("인덱스 2번째 위치 값 : " + list1.get(2));
		
		//////////////
		ArrayList list2 = new ArrayList(10);
		list2.add(new Integer(5)); //Integer라는 객체를 생성해서 그 안에 5라는 값을 가지고 있는것
		list2.add(new Integer(4));  //객체도 넣을 수 있다
		list2.add(new Integer(2));
		list2.add(new Integer(0));
		list2.add(new Integer(1));
		list2.add(new Integer(3));
		
		System.out.println("list2 : " + list2);
		
		ArrayList list3 = new ArrayList(list2.subList(1, 4)); //(1, 4)는 인덱스1부터 3까지 출력함
		print(list2, list3);
		
		
		Collections.sort(list2); //자동으로 오름차순으로 정렬해준다
		Collections.sort(list3); 
		
		print(list2, list3);
		
		//list2에 list 3 전체가 포함되어 있는지 확인(true/false)
		System.out.println("list2.containsAll(list3) : " + list2.containsAll(list3)); //true
		//list3에 list2 전체가 포함되어 있는지 확인(true/false)
		System.out.println("list3.containsAll(list2) : " + list3.containsAll(list2)); //false
		
		list3.add("B");
		list3.add("C");
		list3.add(3, "A");  //list3.add(3, "AA"); //add는 덮어쓰는것이 아닌 그 인덱스에 추가됨
		print(list2, list3);
		//출력결과 list3은 숫자와 문자열 모두 가진다
		
		//list2에서 ㅣlist3 과 겹치는 부분만 남기고 삭제
		System.out.println("list2.retainAll(list3) : " + list2.retainAll(list3));
		
		print(list2, list3);
		//retainAll은 앞에있는 list2와 3이 겹치는 부분만 삭제
		
		
		//list3 에서 list2에 포함한 객체 삭제
		int i;
		
		//삭제를 꺼구로 한 이유 :  배열과는 다름!!
		//배열은 값만없어지고 방은 계속 남아있어서 비어있는게 가능하지만
		//Arraylist 는 값이 지워지면 공간이 비워진채로 남아있는것이 아닌 자동으로 값이 없어진 만큼 공간이 줄어든다 -> 크기가 정해져있지않기떄문(크기 계속바뀜)
		//그래서 Arraylist는 뒤에서 부터 지우던가 특정 인덱스 값만 지워야한다.
		for(i = list3.size() -1; i>=0 ; i--) {
			if(list2.contains(list3.get(i))) {
				
				list3.remove(i);
			}
		}
		print(list2, list3);
		
		
		
	}
	
	static void print(ArrayList list2, ArrayList list3)
	{
		System.out.println("list2 : " + list2);
		System.out.println("list3 : " + list3);
		System.out.println();
	}

}
