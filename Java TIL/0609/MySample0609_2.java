package etc;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

public class MySample0609_2 {

	public static void main(String[] args) {
		//Stack /Queue
		Stack st = new Stack();
		Queue q =new LinkedList();   //Queue 인터페이스의 구현체인 LinkedList 사용 //이거 자체가 다형성
		//LinkedList가 구현체
		
		st.push("0");
		st.push("1");
		st.push("2");
		
		q.offer("3");
		q.offer("4");
		q.offer("5");
		
		System.out.println("Stack()===============");
		
		while(!st.empty()) {//비어있지 않을 동안만 돌린다
			System.out.println(st.pop());
		}
		//나중에 들어온것이 먼저 빠짐
		//스택은 문이 하나밖에 없기 떄문에 위치 하나만 알면됨
		
		
		System.out.println("Queue()===========");
		while(!q.isEmpty()) { //비어있지 않을 동안만 돌린다
			System.out.println(q.poll());
		}
		//먼저들어온것이 먼저 빠짐
		//큐는 시작위치 나오는 위치 모두 필요
		
	}

}
