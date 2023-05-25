package sstStudy;


/*상속
 * 친구정보를 기록할 MYFriendInfo클래스를 상세정보를 기록할 MYFriendDetailInfo 클래스에 상속하고 
 * 이름, 나이는 MYFriendInfo클래스에서 주소와 전화번호는 MYFriendDetailInfo에 입력할 수 있도록 구성함
 * 출력)
 * 이름 : 이순신
 * 나이 : 100
 * 주소 : 성균관
 * 전화 : 010-1111-2222
 */

class MyFriendInfo{
	String name;
	int age;
	
	MyFriendInfo(String name, int age){
		this.name = name;
		this.age = age;
	}
	
	void showMyFriendInfo() {  //출력위한 메서드
		
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age);
	}
}

class MyFriendDetailInfo extends MyFriendInfo{
	
	String addr;
	String phone;
	
	//생성자
	MyFriendDetailInfo(String name, int age, String addr, String phone){
		super(name, age);//부모생성자인 MyFriendInfo클래스에서 매개변수가 없는 생성자가 없기 때문에 꼭 super(매개변수)가 필요함
		this.addr =addr;
		this.phone = phone;
	}
	
	void showMyFriendDetailInfo() {
		
		showMyFriendInfo(); //super.showFriendDetailInfo();이 맞지만 showFriendDetailInfo 는 하나밖에 없으므로 알아서 호출해주기 떄문에 이렇게 써도 된다
		System.out.println("주소 : "+ addr);
		System.out.println("번호 : "+ phone );
	}
	
}

public class MySample0525_7 { 

	public static void main(String[] args) {
		//상속
		MyFriendDetailInfo friend = new MyFriendDetailInfo("이순신", 100, "성균관", "010-1111-2222");
		
		//인스턴스명.메서드명
		friend.showMyFriendDetailInfo();
		friend.showMyFriendInfo(); //이렇게 해도 같은 결과가 나옴 -> 자식에게 없어서 부모의 것을 가져다가 써서 //이순신, 나이가 출력됨
	}

}
