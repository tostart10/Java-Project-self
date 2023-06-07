package exec;

public class MySample0607 {

	public static void main(String[] args) {
		//예외처리 (연결된 예외처리)
		
		try {
			install();
		}
		catch(InstallException e) {
			
			System.out.println("1111111111");
			//e.printStackTrace();  //로그보기 힘들면 출력메시지 깔끔하게 보이게 이거 주석처리하셈
		}
		catch(Exception e) {
			System.out.println("222222222");
			e.printStackTrace(); //throwable에 있는 detail message가 출력되는 것임
		}
		finally {
			System.out.println("aaaaaaa");
		}
		
	}	
	
	static void install() throws InstallException{
		
		try {
			startInstall();
			copyFiles(); //밑에서  startInstall()의 if(!enoughSpace())에서 예외발생으로 이 구문은 실행이 안됨
			
		}
		catch(SpaceException e){
			InstallException ie = new InstallException("설치중 예외발생11");
			ie.initCause(e);  //InstallException의 원인 예외를 SpaceException으로 지정(지정된 예외를 예외로 등록)
			//InstallException안에다가 이 예외값을 추가할거야, ie가 e(SpaceException) 예외를 데리고 다닐게
			throw ie; //throw로 던지기 전에 밑에있는 finally문을 먼저 실행하고 throw 해준다
		}
		catch(MemoryException e) {
			
			InstallException ie = new InstallException("설치중 예외발생22");
			ie.initCause(e); 
			throw ie;
		}
		finally {
			
			deleteTempFiles();
		}
		
	}
	
	static void  startInstall() throws SpaceException, MemoryException{ //클래스 예외처리하겠다
		
		if(!enoughSpace()) { //static boolean enoughSpace()에서 return 받은 false의 반대니까 true  ,true가 되기떄문에 예외가 던져서서catch문이 실행됨
			throw new SpaceException("설치 공간이 부족함."); //객체생성하고 매개값 던짐, 메서드 호출했던곳으로 돌아가고, 그곳에서 다시 돌아가서 SpaceException에 해당하는 catch로 간다
		}
		
		if(!enoughMemory()) { //static boolean enoughMemory()에서 true를 return 해주는데 !이 붙어있으니까 false가 되서 실행안됨!
			throw new MemoryException("메모리가 부족함.");
		}
		
		
	}
		static void copyFiles() {
			System.out.println("설치에 필요한 파일들을 복사.");
		}
		
		static void deleteTempFiles() {
			System.out.println("설치 후 설치시 사용한 임시파일 삭제.");
		}
		
		
		static boolean enoughSpace() {
			System.out.println("설치시 필요한 공간이 충분한지 확인.");
			return false; //강제로 공간이 충분하지 않을떄 false를 넘김
			//return true;로 하면 모든 코드를 다 타게 된다.
		}
		
		static boolean enoughMemory() {
			System.out.println("설치시 필요한 메모리 확인.");
			return true;
		}
	

}

//클래스 예외처리 3개
//이 3개의 super()는 Exception의 생성자임

class InstallException extends Exception{
	
	InstallException(String msg){
		super(msg);
	}		
}

class SpaceException extends Exception{
	SpaceException(String msg){
		super(msg);
	}
}

class MemoryException extends Exception{
	
	//메세지만 관리하겠다
	MemoryException(String msg){
		super(msg);
	}
}
