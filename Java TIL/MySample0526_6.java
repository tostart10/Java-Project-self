package sstStudy;

/*접근제어자, 오버라이딩
 * 출력예)좋은아침입니다. 오전에는 맑음 입니다.
 * 즐거운 점심입니다. 점심에는 흐림입니다.
 * 행복한 오후되세요. 오후에는 비가 내리겠습니다.
 * 단, greeting 메서드를 이용함
 */


class Today{
	//Today클래스에 생성자 자체가 없어서 jdk 에서 default생성자를 만들어줘서 자식 클래스들의 각 생성자들 안의 맨 첫 번쨰줄에 super()가 생략될 수 있는 것 
	private String weather;
	
	public void setWeather(String weather) {
		this.weather = weather;
	}
	
	public String getWeather() {
		return this.weather;
	}
	
	void greeting() {
		System.out.println("즐거운 하루 되세요.");
	}
	
}


class Morning extends Today{
	//생성자
	Morning(String weather){
		//super() 가 생략됨
		setWeather(weather);
	}
	
	//메서드 오버라이딩
	void greeting() {
		System.out.println("좋은 아침입니다. 오전에는 "+ getWeather()+ "입니다.");
	}
}


class Lunch extends Today{
	//생성자
	Lunch(String weather){
		//super() 가 생략됨
		setWeather(weather);
	}
	
	void greeting() {
		System.out.println("즐거운 점심입니다. 점심에는 "+ getWeather()+ "입니다.");
	}
}


class Dinner extends Today{
	//생성자
	Dinner(String weather){
		//super() 가 생략됨
		setWeather(weather);
	}
	
	void greeting() {
		System.out.println("행복한 오후되세요. 오후에는 "+ getWeather()+ "가 내리겠습니다.");
	}
} 


public class MySample0526_6 {

	public static void main(String[] args) {
		Morning m = new Morning("맑음");  // m, l, d 각각 다른객체 여서 각자 다른 변수와 저장공간을 가진다
		Lunch l = new Lunch("흐림");
		Dinner d = new Dinner("비");
		
		m.greeting(); 
		l.greeting();
		d.greeting();

	}
}
