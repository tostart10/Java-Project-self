package nado_method;

public class MathodQize {
	//주어진 코드의 getHiddenData() 메소드를 완성하시오
	//힌트 
	//substring()을 이용하면 문자열의 일부를 자를 수 있음
	//length()를 이용하면 문자열의 길이를 알 수 있음
	//조건
//	개인정보를 비공개로 전환하는 메소드 작성
//	하나의 메소드에서 모든 동작 처리
//	각 정보는 아래 주어진 위치부터 비공개 적용
	
	public static String getHiddenData(String data, int index) {
		String hiddenData = data.substring(0,index);
		//결과를 저장할 변수 생성  나코딩->나
//방법2 for(int i = index; i<data.length(); i++)
		for(int i =0; i < data.length() - index; i++) {
			hiddenData += "*";
		}
		return hiddenData;
	}

	public static void main(String[] args) {
		String name = "나코딩"; // 이름
		String id = "990130-1234567";  //주민등록번호
		String phone = "010-1234-5678"; //전화번호
		
		System.out.println("이름 : " + getHiddenData(name, 1)); //개인정보, 비공개 시작 위치
		System.out.println("주민등록번호 : "+getHiddenData(id,8) );
		System.out.println("전화번호 : "+getHiddenData(phone, 9));
		
	}

}
