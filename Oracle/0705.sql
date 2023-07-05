--문제)부서별 6월 총급여(급여+보너스)가 20000이상인 팀을 조회하고, 조회된 부서에 속하는 직원들 중에,
--전월대비 총급여액이 오른 직원을 조회하는 쿼리 작성  (202305월 - 전월대비)
--조회항목 : 직원번호, 부서코드, 총급여액(SAL + COMM)
--단, 조회는 총급여액이 높은 순으로 정렬함
SELECT A.EMPNO, A.DEPTNO, (B.SAL + B.COMM) AS 총급여액
    FROM EMP A, SALARY B,
        (SELECT DEPTNO, SUM(SAL + COMM) AS SAL1
            FROM EMP E, SALARY S
            WHERE S.SALMONTH = '202306'
            AND S.EMPNO = E.EMPNO
            GROUP BY DEPTNO
            HAVING SUM(SAL + COMM) >= 25000) C
    WHERE A.DEPTNO = C.DEPTNO
    AND A.EMPNO = B.EMPNO
    AND B.SALMONTH = '202306'
    ORDER BY (B.SAL + B.COMM) DESC;  --ORDER BY 는 맨 마지막에 실행되기 때문에 별칭인 총급여액 대신 (B.SAL + B.COMM)을 쓸 수 있음
    
--원래 전월대비라는 조건을 쿼리로 작성하는 것이 맞지만 여기서는 하드코딩함
--정렬(ORDER BY)을 할때는이미 SELECT까지 된 것들을 데이터를 DBMS에 올려놓고 정렬하기 때문에 별칭을 사용할 수 있는 것임
SELECT T1.EMPNO, T1.DEPTNO, T1.SAL2
    FROM SALARY S2,
        (SELECT A.EMPNO, A.DEPTNO, (SS.SAL + SS.COMM) SAL2 --SAL2는 직원별 총급여액
            FROM EMP A, SALARY SS,
                (SELECT DEPTNO, SUM(SAL+ COMM) AS SAL1  --SAL1은 부서별 총 급여액
                    FROM EMP E, SALARY S
                    WHERE S.SALMONTH = '202306'
                    AND S.EMPNO = E.EMPNO
                    GROUP BY DEPTNO
                    HAVING SUM(SAL+ COMM)>=20000) C
            WHERE SS.SALMONTH = '202306'
            AND A.EMPNO = SS.EMPNO
            AND A.DEPTNO = C.DEPTNO) T1
    WHERE S2.SALMONTH = '202305'
    AND S2.EMPNO = T1.EMPNO
    AND (S2.SAL+ S2.COMM) <= T1.SAL2;  --S2는 5월꺼, T1은 6월꺼

--인라인뷰 쓰는 경우
--1.FROM절에 오는 테이블 들이 서로 조인을 할 수 없을때
--2.데이터 건수가 너무 커서 특정값을 뽑아서 그것을 가지고 비교하려할 때 

--from절에 오는 테이블들은 무조건 조인을 해야함
--똑같은 테이블을 가지고 조인을 해야하는데

--WHERE절에 서브쿼리가 오는 경우 (이게 맞나?? 1번2번 같은뜻인데 말만 다르게한거?
--1.FROM절과 관련이 없는 데 특정값을 비교해야할때
--2.현재 쿼리에 FROM절에 오는 테이블을 사용하지 않거나 WHERE절과 상관없을때

--물류시스템 ERD가 제일 복잡함


--이지완씨 문제
--문제) 부서별로 6월의 총급여(보너스포함)가 25000 이상인 팀을 조회하고,
--조회된 부서중에 가장 높은 총급여를 가진 부서의 직원들중, 전월대비 급여가 오른 직원들을 조회.
--조회항목 : 사원번호, 급여액, 부서명
--(1006 윤예서씨 보너스 COMM를 1700 로 수정후)
SELECT A1.EMPNO, B2.SAL + B2.COMM, A2.DNAME
  FROM EMP A1, DEPT A2, SALARY B2, 
       (SELECT DEPTNO, MAX(AA.SAL2) AS KK
          FROM (SELECT A.EMPNO, A.DEPTNO, (SS.SAL + SS.COMM) SAL2 --직원별 총금액 구한것
                  FROM EMP A, SALARY SS, 
                       (SELECT DEPTNO, SUM(SAL + COMM) AS SAL1  --부서만 뽑은것, 사람은 모름! (부서별 총금액을 구한것)
                          FROM EMP E, SALARY S
                         WHERE S.SALMONTH = '202306'
                           AND S.EMPNO = E.EMPNO
                         GROUP BY DEPTNO
                        HAVING SUM(SAL + COMM) >= 20000) C
                 WHERE SS.SALMONTH = '202306'
                   AND A.EMPNO = SS.EMPNO
                   AND A.DEPTNO = C.DEPTNO) AA
        GROUP BY AA.DEPTNO )  B3,
        SALARY C1
WHERE A1.EMPNO = B2.EMPNO
  AND B2.SALMONTH = '202306'
  AND B2.SAL+B2.COMM = B3.KK
  AND A1.DEPTNO = B3.DEPTNO
  AND A1.DEPTNO = A2.DEPTNO
  AND C1.SALMONTH = '202305'
  AND C1.EMPNO = A1.EMPNO
  AND C1.SAL + C1.COMM <= B2.SAL + B2.COMM;  --B2  6월,   C1  5월
  
  
--검증용쿼리  
SELECT A.EMPNO, ENAME, B.SAL, B.COMM, B.SAL +B.COMM
  FROM EMP A, SALARY B
 WHERE DEPTNO = 60  --부서코드 각각 대입
   AND SALMONTH = '202306'
   AND A.EMPNO = B.EMPNO;
   
   
--DDL를 활용한 테이블 복사
CREATE TABLE EMP_20230705 AS
SELECT * FROM EMP;
--운영DB보다는 개발 DB에서 사용되는 방법임
--제약사항은 하나도 복사가 되지 않음( 스키마구조, 데이터는 전부 복사되지만 제약사항은 복사되지 않음)
DROP TABLE EMP_20230705;

--테이블을 EMP_20230705로 생성하고, 데이터는 직원 정보테이블에서 상사 정보만 조회하여 생성하는 DDL쿼리 작성
CREATE TABLE EMP_20230705 AS
SELECT A.*   --나는 그냥 이렇세 해버렸음... A.EMPNO, A.ENAME , A.JOB,A.MGR, A.HIREDATE, A.DEPTNO
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR;

--테이블을 EMP_20230705로 생성하고, 데이터는 직원정보테이블에서 상사정보만 조회하여 생성하는 DDL쿼리작성
--컬럼은 EMP 상사정보와 부서명을 적용하여 생성함
CREATE TABLE EMP_20230705 AS
SELECT DISTINCT A.* , D.DNAME
    FROM EMP A, EMP B, DEPT D
    WHERE A.EMPNO = B.MGR
    AND A.DEPTNO = D.DEPTNO;

--사장도 나오게 할려면?
SELECT DISTINCT A.* , D.DNAME
    FROM EMP A, EMP B, DEPT D
    WHERE A.EMPNO = B.MGR  --왜 여기에는 (+)쓰면 안되는지? -> EQUI JOIN은 NULL인 값은 애초에 제외를 하고 데이터를 가져와 비교를 하기 떄문에 (+)할게 없어져서 안붙여도 됨 
    AND A.DEPTNO = D.DEPTNO(+);

SELECT * FROM EMP_20230705;

TRUNCATE TABLE EMP_20230705; --DELETE FROM EMP_20230705랑 같음 DELETE는 COMMIT 꼭 해줘야함

INSERT INTO EMP_20230705
SELECT * FROM EMP;

CREATE TABLE EMP_20230705 AS  --AS는 CREATE에서만 사용
SELECT * FROM EMP WHERE EMPNO = '3000';  --SELECT 할떄 없는데이터를 가져오게끔 일부러 넣어줌

--DELETE시 WHERE조건 안해주면 그 테이블 데이터 모두 날림주의!!
DELETE FROM EMP_20230705;

COMMIT;

--현재 이 문제를 하기전 리사, 로제, 제니의 MGR코드를 2001로 바꿔서 지수를 팀장으로 바꿈
--문제)EMP 테이블에 직원(상사제외) 정보를 조회하여 EMP_20230705테이블에 INSERT 하는 쿼리
INSERT INTO EMP_20230705 
SELECT *
    FROM EMP
    WHERE EMPNO NOT IN(SELECT DISTINCT A.EMPNO
                            FROM EMP A, EMP B
                            WHERE A.EMPNO = B.MGR);
--꼼수로 WHERE MGR != '1001' 로 상사가 아닌거를 이렇게 구함
--MINUS로 상사인것만 빼주는 방법도 있음
--위와 같은 결과를 다른 방법으로
INSERT INTO EMP_20230705
SELECT *
    FROM EMP
MINUS
SELECT A.*
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR;


--UPDATE
CREATE TABLE SALARY_202307 AS
SELECT * FROM SALARY WHERE EMPNO = '30000';

INSERT INTO SALARY_202307
SELECT '202307' ,EMPNO,SAL,COMM
FROM SALARY WHERE SALMONTH='202306';
COMMIT;

--제대로 들어갔는지 검증
SELECT * FROM SALARY_202307;

UPDATE SALARY_202307
    SET COMM = 50;
    
--부서코드가60번인 직원들에 대해서 기존 보너스에 50을 추가하여 적용
SELECT * FROM EMP WHERE DEPTNO = '60';

UPDATE SALARY_202307
    SET COMM = COMM + 50
    WHERE SALMONTH = '202307'
    AND EMPNO = ANY(SELECT EMPNO
                        FROM EMP E
                        WHERE E.DEPTNO ='60');
                        
DELETE FROM SALARY_202307;

--문제)상사를 제외한 일반사원들의 보너스를 기존보너스+150 으로 하여 UPDATE쿼리 작성
--문제를 위해 4개를 NULL로 만듦
UPDATE SALARY_202307
    SET COMM = NULL
    WHERE COMM IN(0, 50);  --WHERE 조건에 NULL체크는 반드시 IS NULL이라고 해야함
    --여기서WHERE COMM IN(NULL, 50)이렇게 하면 안됨!!
    --WHERE COMM IS NULL로 해야함
COMMIT;

--상사를 제외한 일반사원들의 보너스를 기존보너스+150 으로 하여 UPDATE쿼리 작성
UPDATE SALARY_202307
    SET COMM = NVL(COMM, 0) + 150  --값이 NULL인 경우 +150을 할 수 없기 때문에 NULL을 숫자0으로 바꿔주고 +150을 해줘야한다.
    WHERE EMPNO IN (SELECT EMPNO
                        FROM EMP
                        WHERE EMPNO NOT IN (SELECT DISTINCT A.EMPNO -- A.ENAME, A.JOB
                                                FROM EMP A, EMP B
                                                WHERE A.EMPNO = B.MGR));
--NVL(COMM, 0) 이거 꼭 기억하셈!!!!
--WHERE EMPNO =( SELECT 0
--으로 할 수 있다 -> 쿼리의 결과가 NULL일 경우 
--만약 널인 값일떄인것을 서브쿼리에 했다면 또 다른 서브쿼리나 조건절에 널이 아닐때의 경우도 넣어줘야한다.

--****중요**UPDATE를 할려면 데이터가 모두 일치해야하므로 조건절과 테이블의 데이터가 정확히 일치해야함
-->그래서 조건절에 NULL일때 인것에 대한것만 써주면안되고 값이 NULL일때와 NULL이 아닐때 모두 조건을 써줘야하는 것!!

----상사를 제외한 일반사원들의 보너스를 기존보너스+150 으로 하여 UPDATE쿼리 작성 -> NOT IN 사용
UPDATE SALARY_202307
    SET COMM = NVL(COMM, 0) + 150  --값이 NULL인 경우 +150을 할 수 없기 때문에 NULL을 숫자0으로 바꿔주고 +150을 해줘야한다.
    WHERE EMPNO NOT IN (SELECT DISTINCT A.EMPNO --여기에 DISTINCT를 써주는게 결과갯수가 줄어들기 때문에 바깥쿼리랑 비교할게 줄어들어서 속도가 빨라짐!!
                            FROM EMP A, EMP B   --따라서 DISTINCT를 써주는게 좋음!!
                            WHERE A.EMPNO = B.MGR);

--이렇게 하면NULL 인게 150으로 반환됨
--해석 : COMM이 널이면 150을 반환한다
SELECT 150
    FROM SALARY_202307
    WHERE COMM IS NULL;

--해석 : COMM이 널이면 0을 반환한다
--하지만 이걸 UPDATE문에 넣으면 NULL값인게 0으로 UPDATE된다.
SELECT 0
    FROM SALARY_202307
    WHERE COMM IS NULL;
 
 --이 코드는 COMM 이 NULL이면 오류 발생함 ->NULL과 숫자는 +를 할 수 없어서  
SELECT COMM + 150
    FROM SALARY_202307
    WHERE COMM IS NULL;


ROLLBACK;

--유일하게 NULL을 객체로 사용하는 것은 자바스크립트 밖에 없음


--DELETE 는 특정레코드 자체가 삭제삭제되는 것

--서브쿼리를 이용한 DML - DELETE
--팀명이 '총무팀'인 부서에 속하는 직원을 삭제
DELETE FROM EMP_20230705
    WHERE DEPTNO IN(SELECT DEPTNO
                        FROM DEPT
                        WHERE DNAME = '총무팀');
COMMIT;

--문제)부서명이 존재하지 않는 직원에 대한 레코드 삭제
--EMP_20230705 테이블 기준(서브쿼리를 이용하여 삭제)
--문제를 위해 일부러 변경함
UPDATE EMP_20230705
    SET DEPTNO = NULL
    WHERE DEPTNO = '20';

SELECT EMPNO, DEPTNO
    FROM EMP_20230705
    WHERE DEPTNO NOT IN (SELECT DISTINCT D.DEPTNO
                        FROM DEPT D, EMP_20230705 E
                        WHERE D.DEPTNO = E.DEPTNO);
--이문제는 역으로 생각하도록 의도한 문제 : 없는것을 찾는것 보다 있는것을 찾는게 답일때도 있다~~~
--존재하는 것들을 찾아 전체에서 빼면 존재하지 않는 것들을 찾을 수 있으니까 그걸 DELETE하면 됨

--1.MINUS 사용
DELETE FROM EMP_20230705
    WHERE EMPNO IN (SELECT EMPNO    --이거는 전체 데이터
                        FROM EMP_20230705
                    MINUS
                        SELECT E.EMPNO     --부서에 존재하는 데이터
                            FROM DEPT D, EMP_20230705 E
                            WHERE D.DEPTNO = E.DEPTNO);
--> 즉, 전체데이터에서 부서에 존재하는 데이터를 뺴면 존재하지 않는 데이터만 남음
--이 없는데이터를 DELETE문으로 삭제함

--방법2 : 서브쿼리 이용
DELETE FROM EMP_20230705
    WHERE EMPNO IN (SELECT EMPNO
                        FROM EMP_20230705
                        WHERE EMPNO NOT IN (SELECT EMPNO
                                                FROM EMP E, DEPT D
                                                WHERE E.DEPTNO = D.DEPTNO));
                                                
--방법 3
DELETE FROM EMP_20230705
        WHERE NOT EMPNO = ANY (SELECT EMPNO
                                FROM EMP E, DEPT D
                                WHERE E.DEPTNO = D.DEPTNO));


--문제)일반직원(상사제외)중에 급여액(SAL)이 5000미만인 직원을 삭제하는 쿼리
--삭제는EMP_20230705 테이블로 하고, 급여참조는 SALARY 테이블 6월 기준.
TRUNCATE TABLE EMP_20230705;
SELECT * FROM EMP_20230705;--TRUNCATE한거 검증 -> 아무것도 안나와야함

INSERT INTO EMP_20230705
SELECT * FROM EMP;
COMMIT; --여기까지가 문제를 위한 데이터 만들어준거임

--혼자해보기 -> 정답!
DELETE FROM EMP_20230705
    WHERE EMPNO IN(SELECT E.EMPNO --E.JOB, E.ENAME
                        FROM EMP_20230705 E, SALARY S
                        WHERE E.EMPNO = S.EMPNO
                        AND S.SALMONTH = '202306'
                        AND S.SAL <5000
                        AND E.EMPNO NOT IN (SELECT A.EMPNO
                                            FROM EMP_20230705 A, EMP_20230705 B
                                            WHERE A.EMPNO = B.MGR));

--모범코드
DELTE FROM EMP_20230705
    WHERE EMPNO IN(SELECT A.EMPNO
                    FROM EMP_20230705 A, SALARY S
                    WHERE A.EMPNO =B.EMPNO
                    AND B.SALMONTH = '202306'
                    AND B.SAL < 5000
                    AND A.EMPNO NOT IN(SELECT E1.EMPNO
                                        FROM EMP_20230705 E1, EMP_20230705 E2
                                        WHERE E1.EMPNO = E2.MGR));
                                        
--방법2 : 중간 쿼리에서 조인을 안써도 되는 방법
DELTE FROM EMP_20230705
    WHERE EMPNO IN(SELECT A.EMPNO
                    FROM  SALARY A    --여기서 EMP 테이블을 구지 안써도 됨
                    WHERE A.SALMONTH = '202306'
                    AND A.SAL < 5000
                    AND A.EMPNO NOT IN(SELECT E1.EMPNO
                                        FROM EMP_20230705 E1, EMP_20230705 E2
                                        WHERE E1.EMPNO = E2.MGR)
                                        
  --방법3
  DELETE FROM EMP_20230705
    WHERE EMPNO IN(SELECT A.EMPNO
                    FROM EMP_20230705 A, SALARY S --SALARY에도 EMPNO가 있기 때문에 서브쿼리에서 셀프조인 할 필요가 없음
                    WHERE A.EMPNO =B.EMPNO
                    AND B.SALMONTH = '202306'
                    AND B.SAL < 5000
                    AND A.MGR != B.EMPNO;
                                   
--검증쿼리
SELECT *
    FROM SALARY
    WHERE SALMONTH = '202306'
    AND SAL < 5000;
    
DROP TABLE EMP_20230705;
DROP TABLE SALARY_20230705;

