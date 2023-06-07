package etc;

class Value{
	int value;
	
	Value(int value){
		
		//super()가 생략됨 -> 여기서 super는 Object임
		this.value = value;
	}
}


public class MySample0607_2 {

	public static void main(String[] args) {
		//java.lang 패키지
		Value v1 = new Value(20);
		Value v2 = new Value(20);
		
		if(v1.equals(v2)) { //equals()는 괄호안에 객체를 넘김
			//equals는 v1과 v2의 주소값이 같은지를 확인한다  (값이 아닌 객체를 넘기기 때문에 주소값을 비교하는 것)
			
			System.out.println("v1과 v2가 같습니다.");
		}
		else {
			System.out.println("v1과 v2가 다릅니다.");
		}
		
		
		
		v2 =v1 ;  //v1= v2 
		//같은 주소값은 대입해주므로서 v1과  v2는 같은 객체를 바라보게 된다
		
		if(v1.equals(v2)) { //equals()는 괄호안에 객체를 넘김
			//equals는 v1과 v2의 주소값이 같은지를 확인한다  (값이 아닌 객체를 넘기기 때문에 주소값을 비교하는 것)
			
			System.out.println("v1과 v2가 같습니다.");
		}
		else {
			System.out.println("v1과 v2가 다릅니다.");
		}
		
	}

}
