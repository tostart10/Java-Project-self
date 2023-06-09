package etc;

import java.util.Vector;

public class MySample0609 {

	public static void main(String[] args) {
		
		Vector v = new Vector(5); //Vector 선언시 크기를 5로 지정
		v.add("1");
		v.add("2");
		v.add("3");
		print(v);
		
		
		//빈공간 없애기(용량과 크기가 같게)
		v.trimToSize(); //자름
		System.out.println("v.trimToSize()....");
		print(v);
		
		//백터 용량 증가
		v.ensureCapacity(6);  //백터는 메서드를 이용해서 크기를 변경할 수 있다 //여기서 물리적 크기를 6으로 지정함
		System.out.println("v.ensureCapacity()...");
		print(v);
		
		
		v.setSize(7); //크기를 7로 바꿈  //앞에서 크기를 6으로 지정해줬기 떄문에 6을 넘으면 기본크기인 6만큼씩 늘어난다
		//ArrayList에서는 모자른 만큼만 물리적 크기가 늘어났지만 백터에서는 1이 모자라도 기본 용량만큼씩 늘어난다(기본용량이 5이면 1모자라도 5크기가 커짐)
		System.out.println("v.setSize()...");
		print(v);
		
		v.clear();  //값만 지워지고 물리적용량은 줄어들거나 지워지지 않음
		System.out.println("v.clear()...");
		print(v);
		
		
	}
	
	
	public static void print(Vector v) {
		System.out.println(v);
		System.out.println("size : " + v.size());   //백터 안에 들어있는 것들의 크기(얼마나 들어있나)
		System.out.println("capcity : " + v.capacity());  //물리적 크기 (실제물리적 크기를 뜻함) -> 백터가 선언될때 정해진 사이즈
		
	}

}

//ArrayList 도 기본크기5이면 계속 5씩 늘어난다 1이 모자라도 5씩 증가한다
//기본 물리적 크기가 늘어난다는 것은 내부적으로 배열복사가 된다는 것
//ArrayList의 요소 하나를 지우면 그 뒤의 값이 그자리를 채우며 이동하는 것이지 ㅅArrayList가 선언될 떄 정해진 물리척 크기는 줄어들지 않는다!!!
//=> 정말 요소들이 이동만 하는 것임!! 선언될떄 만들어진 물리적 크기는 줄어들지 않는다





