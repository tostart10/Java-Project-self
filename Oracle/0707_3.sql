UPDATE SALARY
    SET SALMONTH = '202202'
    WHERE SALMONTH = '202306';

COMMIT;

--프로시저 커서 활용
CREATE OR REPLACE PROCEDURE PC_CURSOR


IS

BEGIN
    --CURSOR정의
    DECLARE
        CURSOR cursor_Salary
        IS
            SELECT SALMONTH, EMPNO, SAL, COMM
                FROM SALARY
                WHERE SALMONTH = (SELECT MAX(SALMONTH)
                                    FROM SALARY);
            
        --변수정의
        V_PRODUCT SALARY%ROWTYPE;  --SALARY%ROWTYPE은 SALARY 컬럼의 타입과 같은것으로 가져온다?
        --전체 다 받아올 때는%ROWTYPE이 편함
        --몇개 만가져올때는 변수 선언해서 가져오셈
    BEGIN
        DBMS_OUTPUT.PUT_LINE('프로시저 커서 시작..');
        OPEN cursor_Salary;  --위의 BEGIN문에 있는 쿼리를 가져오기 위해서 해줘야함 --메모리에 올려줌
        
        --반복실행
        LOOP
            FETCH cursor_Salary INTO V_PRODUCT; --쿼리 하나씩 날려서 가져옴
            --SELECT SALMONTH, EMPNO, SAL, COMM 항목들을 하나씩 가져와서 V_PRODUCT에 대입
            --cursor_Salary의 항목들을 가져올것, V_PRODUCT에 대입할거임
            EXIT WHEN cursor_Salary%NOTFOUND;
            
            DBMS_OUTPUT.PUT_LINE('SALMONTH : ' || V_PRODUCT.SALMONTH);
            DBMS_OUTPUT.PUT_LINE('EMPNO : ' || V_PRODUCT.EMPNO);
            
            --여기에서는 V_PRODUCT.SALMONTH V_PRODUCT.~~이렇게 되야함
            INSERT INTO SALARY
            VALUES (TO_CHAR(ADD_MONTHS(TO_DATE(V_PRODUCT.SALMONTH, 'YYYYMM'),1), 'YYYYMM'),
                    V_PRODUCT.EMPNO, V_PRODUCT.SAL + 10, V_PRODUCT.COMM + 5);
            --모든 컬럼에 다 집어넣기 위해VALUES로 해준다
            
        END LOOP;
        
        COMMIT; --일괄적으로 커밋하기 위해 LOOP끝난다음에 써주기!
        CLOSE cursor_Salary; --오라클메모리에서 메모리 반납하도록 닫아줌
        
    END;

END;
/

--커서 플시저 모범코드
--프로시저 커서 활용
CREATE OR REPLACE PROCEDURE PC_CURSOR

IS

BEGIN
    --CURSOR 정의
    DECLARE
        CURSOR cursor_Salary
        IS
            SELECT SALMONTH, EMPNO, SAL, COMM
              FROM SALARY
             WHERE SALMONTH = (SELECT MAX(SALMONTH)
                                 FROM SALARY); 
             
        --변수정의
        V_PRODUCT SALARY%ROWTYPE;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('프로시저 커서 시작...');
        OPEN cursor_Salary;
        
        --반복실행
        LOOP
            FETCH cursor_Salary INTO V_PRODUCT;
            EXIT WHEN cursor_Salary%NOTFOUND;
            
            DBMS_OUTPUT.PUT_LINE('SALMONTH : ' || V_PRODUCT.SALMONTH);
            DBMS_OUTPUT.PUT_LINE('EMPNO : ' || V_PRODUCT.EMPNO);
            
            INSERT INTO SALARY 
            VALUES(TO_CHAR(ADD_MONTHS(TO_DATE(V_PRODUCT.SALMONTH, 'YYYYMM'), 1), 'YYYYMM'),
                   V_PRODUCT.EMPNO, V_PRODUCT.SAL + 10, V_PRODUCT.COMM + 5);
            
        END LOOP;
        
        COMMIT;
        CLOSE cursor_Salary;
    END;

END;
/


--문제)스케줄러 등록 : 잡명은 EX_SALARY, 1분에 한번씩 실행
BEGIN 
    DBMS_SCHEDULER.CREATE_JOB
    (
        JOB_NAME => 'EX_SALARY',  --잡명
        JOB_TYPE => 'STORED_PROCEDURE',
        JOB_ACTION => 'PC_CURSOR',  --프로시저 이름
        REPEAT_INTERVAL => 'FREQ=MINUTELY;INTERVAL=1',          --1분에 1번
        COMMENTS => '급여추가 객체'
    );
END;
/

--잡 객체 실행 로그 확인
SELECT * FROM USER_SCHEDULER_JOB_LOG;
SELECT * FROM USER_SCHEDULER_JOB_RUN_DETAILS;


--잡 실행/중지 (잡 스케줄러 시작)
BEGIN
    --DBMS_SCHEDULER.ENABLE('EX_SALARY');  --스케줄러 실행
    DBMS_SCHEDULER.DISABLE('EX_SALARY'); --잡 중지
END;

SELECT * FROM SALARY ORDER BY SALMONTH DESC;

--만약 202305를 넘어간 데이터 있으면 지우기
DELETE FROM SALARY WHERE SALMONTH > '202305';

SELECT COUNT(*) FROM SALARY;

--ROWNUM : HAVING 절이 끝날떄까지 DBMS에 데이터를 가져다놓음 SELECT 하는 시점에 넘버링을 매김
--SELECT 하는순서대로 순서가 매겨짐
--넘버링이 매겨지고나서 ORDER BY함
--ORDER BY하고 나서 넘버링을 매기는경우도 있음
--ROWNUM 323건

--ROWNUM에 대해서 꼭 공부하기!!! -> 왜 ORDER BY 에 따라서 순서가 바뀌는지 안바뀌는지  (바뀌면 출력시 숫자가 뒤죽박죽인 채로 출력됨)

--페이징 처리 안할경우
SELECT ROWNUM AS RUM, SALMONTH, EMPNO, SAL, COMM
        FROM( SELECT ROWNUM AS RUM ,SALMONTH, EMPNO, SAL, COMM
                FROM SALARY
                WHERE SALMONTH BETWEEN '202201' AND '202305'
                ORDER BY SAL ASC);

--순서 뒤죽박죽
SELECT ROWNUM AS RUM ,SALMONTH, EMPNO, SAL, COMM
                FROM SALARY
                WHERE SALMONTH BETWEEN '202201' AND '202305'
                ORDER BY SAL ASC;

SELECT SALMONTH, EMPNO, SAL, COMM
    FROM(SELECT ROWNUM AS RUM, SALMONTH, EMPNO, SAL, COMM
        FROM( SELECT SALMONTH, EMPNO, SAL, COMM
                FROM SALARY
                WHERE SALMONTH BETWEEN '202201' AND '202305'
                ORDER BY SAL ASC)) A
    WHERE A.RUM >=1 AND A.RUM <= 5;
            --인라인뷰는 서브쿼리가 아님
--SALMONTH 로 ORDER BY를 했음에도 ROWNUM이 변경이 없음
--> INSERT 된 순서대로 가져오기 떄문?
--인덱스로 가져와서

--해당하는 FROM 절에 있는 테이블과 WHERE절로 가져오
--SALMONTH는 PK가 있어서 내부적으로 PK를기준? 인덱스기준?으로 이미 정렬이 되어있어서 넘버링이 순서대로 됨
--그 시점에 넘버링이 매겨짐

--해당하는 메모리를 데이터를 DBMS에 가져다 놓고 ORDER BY를 함
--셀렉한거를 RDBMS영역에 가져다 놓고 ORDER BY로 정렬을 함
--정렬은 DBMS영역에서 해주는 것임!!DB영역에서 못함

--ROWID는 어떻게 해서도 변경되지 않음
--ROWNUM은 넘버링하고 어떻게 정렬되는지에 따라서 NUM의 순서가 바뀜
--ROWNUM 진짜 중요함!!! 회사에서 꼭 사용하고 많이 사용함!! 이거 꼭 공부하기!!!

