package sstStudy;


class Time{
	private int hour, minute, second;  //get,set으로만 접근가능
	
	//생성자
	Time(int hour, int minute, int second){
		//인스턴스 변수들에게 값을 넣을 떄는 setter 메서드를 이용해서 넣어라
		setHour(hour);   //this.hour = hour;   setHour(hour)메서드를 호출했기 때문에 setHour(hour)메서드로갔다가 다시 여기로 돌아와야함
		setMinute(minute);  //this.minute = minute;
		setSecond(second);    //this.second = second;
	}
	
	public int getHour() {//get,set은 private에 접근하기 위해서 쓰이는 유일한 방법이므로 public이어야한다
		return this.hour;  //인스턴스 변수 hour를 던짐
	}
	
	public void setHour(int hour) {
		//시간은 0~23시 사이 값만 허용
		if( hour < 0 || hour >23) {
			
			errorPrint("시간(0~23시 사이) 오류");  //오류 , 메서드 호출
			return;  //프로그램을 끝내기 위해 return 씀
		}
		
		/*else{
		 * }
		 * 만약 return을 안쓰면 else를 써줘야하지만 return으로 끝내주는게 좋음
		 */
		this.hour =hour; //Time클래스의 인스턴스변수 hour에 매개변수값 대입
	}
	
	
	public void errorPrint(String msg) {
		System.out.println("현재 오류는 "+ msg + " 입니다.");
	}
	
	public int getMinute() {
		return this.minute;
	}
	
	public void setMinute(int minute) {
		
		if(minute < 0|| minute >59)
			return;
		
		this.minute =minute; //Time클래스의 인스턴스변수 minute에 매개변수값 대입
	}
	
	public int getSecond() {
		return this.second;
	}
	
	public void setSecond(int second) {
		
		if(second < 0 || second >59)
			return;
		
		this.second = second; //Time클래스의 인스턴스변수 second에 매개변수값 대입
	}
	
	//@Override는 써줘도 되고 안써도됨 그냥 오버라이딩 했다는 것을 표시해주기 위한 용도일뿐
	//toString()메서드를 주석처리 하면 Time@2a139a55처럼 주소값만 나온다
	public String toString() { //Object클래스의 toString()을 오버라이딩 한거임
		return getHour() + ":" + getMinute() + ":" + getSecond();
	}

}



public class MySample0526_4 {

	public static void main(String[] args) {
		//접근제어자(private, (default), protected, public)
		Time t = new Time(14, 25, 31);
		
		
		System.out.println(t); //원래는 () 안에 t.toString()인건데 toString이 생략된거임
		//println의 안에 참조형 변수를 쓰면 Object클래스안의 toString()메서드를 호출하도록 자바에서 구현되어 있다.
		//그러므로 t라는 참조형 매개변수를 써줘서 println이 toString()메서드를 호출한다 
		//현재 toString()은 오버라이딩 한거라서 부모인 Object의 toString와 자식클래스인 Time클래스의 toString이 같이있다
		//이경우에는 자식클래스의 것이 우선사용되므로 지금 내가 구현한 자식클래스인 Time클래스의 toString()이 호출되어 return갑이 결과창에 출력될 수 있는 것임!
		//Time클래스의 toString을 사용한다
		
		
		t.setHour(t.getHour() + 1); //현재시간에서 +1해주겠다는 뜻
		System.out.println(t);
		//t.hour =12; //접근제어가가 private라서 클래스 내에서만 접근가능 
		//hour인스턴스 변수는 private이기 때문에 그 클래스(Time클래스)안에서만사용 가능하기 떄문에 지금 이 클래스(MySample0526_4)에서는 접근 불가능
		
	}
}