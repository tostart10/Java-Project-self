package etc;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class MySample0609_5 {

	public static void main(String[] args) throws IOException {
		//File객체를 이용하여 Scanner 생성
		
		//C:\project\JAVA\MyProject\temp 에 source_data.txt파일
		//단, MyProject밑에 temp 파일 안에 source_data.txt파일만들고 안에 내용 쓰기
		
/*		File file = new File("./temp/source_data.txt");
		
		Scanner scanner = new Scanner(file);
		
		//파일의 내용을 라인 단위로 출력
		System.out.println(file.getName() + " 파일의 데이터 내용.");
		
		while(scanner.hasNextLine()) {//엔터키 있을때까지 한라인씩 읽으면서 찍음
			
			System.out.println(scanner.nextLine());
		}
		scanner.close();
*/		
		
		//BufferedReader 이용
		File file = new File("./temp/source_data.txt");
		FileReader reader = new FileReader(file);
		BufferedReader buffReader = new BufferedReader(reader);
		
		//파일 내용을 라인 단위로 출력
		System.out.println(file.getName() + "파일 데이터 내용.");
		String data = null;
		while((data = buffReader.readLine()) != null){
			System.out.println(data.toString());
		}
		
		
		//입력스트림 종료
		reader.close();
		buffReader.close();
		
	}

}
