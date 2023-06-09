package etc;

import java.io.File;
import java.io.IOException;

public class MySample0609_4 {

	public static void main(String[] args) throws IOException {
		//File 클래스
		File directory = new File("./temp"); //절대/상대
		directory.mkdir();  //디렉토리 생성
		
		//temp디렉토리에 temp.file.txt 파일 생ㅅ어
		File file = new File(directory, "temp_file.txt");
		file.createNewFile();  //파일을 새로 만드는데 오류가 발생하기 때문에 메인에서 예외처리 해준것
		
		//생성file 객체가 디렉토리인지 파일인지 확인
		if(directory.isDirectory()) {  //isDirectory()-> 이거 디렉토리 맞니?
			
			System.out.println(directory.getName() + "인 디렉토리입니다.");
		}
		if(file.isFile()) {
			System.out.println(file.getName() + "은 파일입니다.");
			System.out.println("파일 경로 : " + file.getPath());
			System.out.println("파일 크기 : " + file.length() + "(byte)");
			
			System.out.println("쓰기 가능여부 : " + file.canWrite());
			System.out.println("읽기 가능여부 : " + file.canRead());
			
		}
		
		//파일 삭제
		if(file.delete()) {
			System.out.println(file.getName() + "이 삭제 되었습니다.");
		}
		
		//디렉토리 삭제
		if(directory.delete()) {
			System.out.println(directory.getName() + "디렉터리 삭제.");
			
		}
		
	}

}
