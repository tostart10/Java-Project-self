package nado_array;

public class _04_MultiArrayLoop {

	public static void main(String[] args) {
		// 다차원 배열 순회
		String[][] seats = new String[][] {
			{"A1","A2","A3","A4","A5"},
			{"B1","B2","B3","B4","B5"},
			{"C1","C2","C3","C4","C5"}
		};
		
		//만약 3차원 배열을 만든다면 3중 for문을 작성하면 된다-가장 안쪽 for가 높이
		for (int i = 0; i < 3; i++) { //바깥쪽 for는 세로
			for (int j = 0; j < 5; j++) {//가로
				System.out.print(seats[i][j] + " "); // 출력된 각 값들이 한칸씩 띄어져 출력되게끔 공백
			}
			System.out.println();
		}
		
		System.out.println("-----------------");
		
		
		String[][] seats2 = {
				{"A1","A2","A3"},
				{"B1","B2","B3","B4"},
				{"C1","C2","C3","C4","C5"}
		};
		
		
		
		for (int i = 0; i < seats2.length; i++) { //바깥쪽 for는 세로
			for (int j = 0; j < seats2[i].length; j++) {//가로
				System.out.print(seats2[i][j] + " "); // 출력된 각 값들이 한칸씩 띄어져 출력되게끔 공백
			}
			System.out.println();
		}
		
		
		System.out.println(" ------------");
		//세로 크기 10 * 가로 크기 15 에 해당하는 영화관 좌석
		String[][] seats3 = new String[10][15]; //선언만 할 때에는 크기를 [][]에 써줘야함
		String[] eng = {"A","B","C","D","E","F","G","H","I","J"};
		for (int i =0; i< seats3.length; i++) { //세로
			for (int j =0; j< seats3[i].length; j++) {
				seats3[i][j] = eng[i] + (j + 1);
			}
		}
		
		// 표 구매
		seats3[7][8] ="=="; // H9 자리를 누가 예매해서 못고르게 표시
		seats3[7][9] ="==="; // H10
		
		// 영화관 좌석 번호 확인
		for (int i = 0; i < seats3.length; i++) { //바깥쪽 for는 세로
			for (int j = 0; j < seats3[i].length; j++) {//가로
				System.out.print(seats3[i][j] + " "); // 출력된 각 값들이 한칸씩 띄어져 출력되게끔 공백
			}
			System.out.println();
		}
		
		
	}
	

}
