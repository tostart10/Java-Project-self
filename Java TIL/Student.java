package etc;

//table 하나당 .java 하나가 생길것이다

//new Student  각 19개가 되는것, 학생하나당 객체 하나
//우리반 19명의 데이터를 ArrayList에 넣어줄것임
public class Student {

	//private니까 get.set으로 접근
	private int grade;   //학년
	private int ban;     //반
	private int num;     //번호
	private String name;  //이름
	private int korean;   //국어
	private int english; //영어
	private int math;     //수학
	private int totalScore; //총점
	private double avg;	  //평균
	private int ranking;  //등수  //생성자에서 default를 0으로 설정해놨음
	
	
	//생성자
	public Student() {
		
		this(0, 0, 0, "", 0, 0, 0);
	}
	
	public Student(int grade, int ban, int num, String name, int korean, 
			int english, int math) {
		
		setGrade(grade);
		setBan(ban);
		setNum(num);
		setName(name);
		setKorean(korean);
		setEnglish(english);
		setMath(math);
		setTotalScore(getKorean() + getEnglish() + getMath()); //생성자에서는 setTotalScore랑setAvg 는 이미 계산이 끝남
		setAvg((double)getTotalScore() /3);
		setRanking(0);  //학생이 입력되는 순간에는 순위를 알수 없다. 모두 입력되고 나서 순위를 매길 수 있다
		
		//생성자에서 값이 들어오고 변경되지 않는 다는 것이 전제조건
		
		//setkorea(90);
	}
	
	
	//메서드
	
	public int getGrade() {
		return grade;
	}
	
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public int getBan(){
		return ban;
	}
	
	public void setBan(int ban) {
		this.ban =ban;
	}
	
	public int getNum() {
		return num;
	}
	
	public void setNum(int num) {
		this.num =num;
	}
	
	public String getName() {
		return name;
		
	}
	
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getKorean() {
		return korean;
	}
	
	public void setKorean(int korean) {
		this.korean = korean;
		
		totalScore = this.korean + english +math; //여기의 ko,en,m 은 지역변수 아닌 인스턴스 변수
		avg = totalScore/ (double)3;  //avg는 double이기 때문에 형변환해주기
	
		//만약 국어만 입력했다면 다시 계산
		//
	}
	
	public int getEnglish() {
		return english;
	}
	
	public void setEnglish(int english) {
		this.english = english;
		
		totalScore = korean + this.english + math;
		avg = totalScore/ (double)3;
		
	}
	
	public int getMath() {
		return math;
	}
	
	public void setMath(int math) {
		this.math = math;
		
		totalScore = korean + english + this.math;
		avg = totalScore / (double) 3;
		
	}
	
	public int getTotalScore() {
		return totalScore;
		
	}
	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}
	
	public double getAvg() {
		return avg;
	}
	
	public void setAvg(double avg) {
		this.avg =avg;
	}
	
	public int getRanking() {
		return ranking;
	}
	
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}
	
	
	//toString() 메서드 오버라이딩 -> 구현부 무조건 일치해야함!
	//main에서 new Student를 하면 이게 호출되서 출력된다
	//value += 는 이미 있던거에 더해서 쓴다는 것
	public String toString() {  
		String value = "등수 : " + getRanking() + "\n";
		value += getGrade() + "학년" + getBan() + "반 " + 
		getNum() + "번 " + getName() + "\n";
		
		
		value += "국어 : " + getKorean() + ", 영어 : " + getEnglish() + ", 수학 : " +
		getMath() + "\n";
		
		value += "총점 : " + getTotalScore() + "\n"; 
		value += "평균 : " + String.format("%.1f", getAvg()) + "\n";
		
		return value;
		/* 등수 :10
		 * 1학년 3반 10번 홍길동
		 * 국어 : 100, 영어 : 59, 수학: 80
		 * 총점 : 230
		 * 평균 : 73.2
		 */
		
	}
	
	
	
}
