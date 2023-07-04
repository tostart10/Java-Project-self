--인라인뷰 와 다른테이블과 조인할 때 사용할 컬럼과
--select 절에 와야함??

--문제)급여액이 6500이상이면서 20230101 이전 입사자중 팀장을 제외한 팀원들만 조회하는 쿼리
--조회항목 : 직원번호, 직원명, 직급, 급여액, 입사일(YYYY-MM-DD)
SELECT E.EMPNO, E.ENAME, E.JOB, S.SAL, TO_CHAR(E.HIREDATE, 'YYYY-MM-DD')
  FROM EMP E, SALARY S
 WHERE S.SALMONTH = '202306'
   AND S.EMPNO = E.EMPNO
   AND S.SAL >= 6500
   AND E.HIREDATE < TO_DATE('20230101','YYYYMMDD')
MINUS
SELECT DISTINCT A.EMPNO, A.ENAME, A.JOB, C.SAL, TO_CHAR(A.HIREDATE, 'YYYY-MM-DD')
  FROM EMP A, EMP B, SALARY C 
 WHERE A.EMPNO = B.MGR
   AND A.EMPNO = C.EMPNO
   AND C.SALMONTH = '202306'; 
   
   
--위의 문제를 인라인뷰로
--혼자해보기..틀리뮤ㅠ
--인라인뷰에 SALARY JOIN을 해줄 필요 없음
SELECT EE.EMPNO, EE.ENAME, EE.JOB, S.SAL, TO_CHAR(EE.HIREDATE, 'YYYY-MM-DD')
    FROM  SALARY S
        ,(SELECT E1.EMPNO
                FROM EMP E1, SALARY S1
                WHERE S1.EMPNO = E1.EMPNO
                AND S1.SAL  >= 6500
                AND S1.SALMONTH = '202306'
                AND E1.HIREDATE < '20230101'
                MINUS
                SELECT A.EMPNO
                FROM EMP A, EMP B, SALARY S2
                WHERE A.EMPNO = B.MGR
                AND S2.EMPNO = A.EMPNO
                AND S2.SAL  >= 6500
                AND S2.SALMONTH = '202306'
                AND A.HIREDATE < '20230101') EE
    WHERE S.EMPNO = EE.EMPNO;
   
--요즘은 퇴사한 직원도 정보 삭제하지 않고 스테터스로 해서 남겨놓는다

--모범코드
SELECT C1.EMPNO, C1.ENAME, C1.JOB, S1.SAL, C1.HIREDATE  --서브쿼리 안에서 TO_CHAR를 해줬기 때문에 밖에서 안해줘도 된다
    FROM SALARY S1,
        (SELECT E.EMPNO, E.ENAME AS ENAME, E.JOB AS JOB, TO_CHAR(E.HIREDATE, 'YYYY-MM-DD') AS HIREDATE
                  FROM EMP E
                 WHERE  E.HIREDATE < TO_DATE('20230101','YYYYMMDD')
                MINUS
                SELECT DISTINCT A.EMPNO, A.ENAME AS ENAME, A.JOB AS JOB, TO_CHAR(A.HIREDATE, 'YYYY-MM-DD') AS HIREDATE
                  FROM EMP A, EMP B
                 WHERE A.EMPNO = B.MGR) C1
    WHERE S1.SALMONTH = '202306'
    AND S1.EMPNO = C1.EMPNO
    AND S1.SAL >= 6500;
--인라인뷰에서 유념할것!
--> 별칭을 괜히 써주는 것이 아님!!
--인라인뷰의 SELECT 절 칼럼들에 별칭을 주었다면 밖의 SELECT 절에서 별칭 그대로를 써줘야하고
--만약 별칭이 없다면 인라인뷰의 SELECT절 칼럼명을 그대로 써줘야한다!!!!
--뷰는 실행할때만 생기는 테이블
--뷰는 테이블이기 때뮨에 우리가 쿼리를 작성할 때 SELECT 절에 테이블 칼럼을 쓰듯이
--뷰의 컬럼값을 가지고 바깥 쿼리의 SELECT 절에 인라인뷰의 칼럼을 써줘야한다
--인라인뷰에서 별칭을 주지 않으면 TO_CHAR(E.HIREDATE, 'YYYY-MM-DD')경우에는
--E.HIREDATE을 TO_CHAR로 변환(변형)해버렸기 때문에 바깥쿼리의 SELECT 절에도 TO_CHAR(E.HIREDATE, 'YYYY-MM-DD')라고 그대로 써야되게 된다
--하지만 AS HIREDATE로 별칭을 주면 인라인뷰명.별칭 형태인 C1.HIREDATE을 쓸수 있다
--자바에서 읽어올떄 별칭을 사용할 거기 때문에 칼럼에 꼭 별칭을 붙여줘야한다
--즉, 별칭은 DB랑 연동을 했을때 가져오는 컬럼명이 됨



--문제) 다중행 연산자 ALL
--상사중에서 보너스를 800이상 받는 상사만 조회하는 쿼리 작성
--조회항목 : 직원번호, 직원명, 직급
--ALL -> 서브쿼리에 나오는 결과가 모두 참인 데이터만 가져옴
SELECT EMPNO, ENAME, JOB
    FROM EMP
    WHERE EMPNO IN(SELECT A1.EMPNO
                    FROM EMP A1, EMP B1, SALARY S1
                    WHERE A1.EMPNO =B1.MGR
                    AND A1.EMPNO = S1.EMPNO
                    AND S1.COMM >= ALL(SELECT DISTINCT S.COMM    --결과적으로 950과 같거나 큰거가 나옴
                                        FROM SALARY S, EMP A, EMP B
                                        WHERE S.COMM >= 800
                                        AND A.EMPNO  = B.MGR
                                        AND S.EMPNO = A.EMPNO
                                        AND S.SALMONTH = '202306'));

-- >=ALL을 하면 800 AND 850 AND 950 이 되서 최종적으로 950보다 크냐 가 됨
--하지만  >을 없애고 =만 하면 컬럼하나에 대해서 여러값이 대입되서 비교하게 되기 떄문에 말도 안되서 아무것도 출력안됨

--ALL과 ANY가 있으므로 서 다중행이 되는 것

--검증으로 ALL을 ANY로 바꾸면 여러건 나옴
--ANY는 OR개념, ALL은 AND 개념

--모범코드
SELECT E.EMPNO, E.ENAME, E.JOB
    FROM EMP E
    WHERE E.EMPNO IN(SELECT DISTINCT A1.EMPNO
                    FROM EMP A1, EMP B1, SALARY S1
                    WHERE A1.EMPNO =B1.MGR
                    AND A1.EMPNO = S1.EMPNO
                    AND S1.SALLMONTH = '202306'
                    AND S1.COMM >=ALL(SELECT DISTINCT S.COMM    --결과적으로 950과 같거나 큰거가 나옴
                                        FROM SALARY S, EMP A, EMP B
                                        WHERE S.COMM >= 800
                                        AND A.EMPNO  = B.MGR
                                        AND S.EMPNO = A.EMPNO
                                        AND S.SALMONTH = '202306'));


--MGR로 셀프조인안하고 상사구하기
SELECT E.EMPNO, E.ENAME, E.JOB
    FROM EMP E
    WHERE E.EMPNO IN(SELECT A1.EMPNO
                    FROM EMP A1, EMP B1, SALARY S1
                    WHERE A1.EMPNO =B1.MGR
                    AND A1.EMPNO = S1.EMPNO
                    AND S1.SALMONTH = '202306'
                    AND S1.COMM >=ALL(SELECT DISTINCT S.COMM    --DISTINCT를 해줬기 떄문에 가능
                                        FROM SALARY S, EMP A  
                                        WHERE S.COMM >= 800
                                        AND S.EMPNO =A.MGR   --여기서 셀프조인 안하고 MGR로 바로 상사코드를 넣어서 상사찾기
                                        AND S.SALMONTH = '202306'));

--처음 쿼리를 보면 FROM, WHERE절을 보고 -> ERD보고 PK,FK 관계확인 -> 다시 FROM,WHERE절 분석하셈


--문제)인사팀의 6월 급여와 직원코드를 조회하는 쿼리작성
--단, 서브쿼리로만 사용함(WHERE절에서만 사용)
--인사팀이 부서코드는 모르므로 인사팀명으로 검색
--조회 항목 : 사원번호, 급여액
--서브쿼리안에 서브쿼리가 또 올 수 있다.
SELECT S2.EMPNO, S2.SAL
    FROM  SALARY S2  --SALARY에도 EMPNO가 있기떄문에 가장 바깥쿼리에서 EMP 테이블을 쓸 필요가 없음
    WHERE S2.EMPNO IN (SELECT E.EMPNO 
                    FROM EMP E, DEPT D1
                    WHERE E.DEPTNO = D1.DEPTNO
                    AND E.DEPTNO IN (SELECT D.DEPTNO  --ANY로 해도 되고 IN으로 해도됨(한건이기때문에)
                                         FROM DEPT D
                                        WHERE D.DNAME = '인사팀'))
    AND S2.SALMONTH = '202306';

--모범코드
SELECT EMPNO, SAL
    FROM  SALARY 
    WHERE SALMONTH = '202306'
    AND EMPNO  IN (SELECT EMPNO 
                        FROM EMP 
                        WHERE DEPTNO IN (SELECT DEPTNO
                                         FROM DEPT 
                                         WHERE DNAME = '인사팀'))

--ALL, ANY 사용한 다른코드
SELECT EMPNO, SAL
    FROM  SALARY 
    WHERE SALMONTH = '202306'
    AND EMPNO  IN (SELECT EMPNO 
                        FROM EMP 
                        WHERE DEPTNO IN (SELECT DEPTNO --IN 대신 ANY를 써도 괜찮음,  ALL은 안됨!!
                                         FROM DEPT 
                                         WHERE DNAME = '인사팀'));

--위 문제를 인라인뷰방식으로
--인사팀의 6월 급여와 직원코드를 조회하는 쿼리작성
SELECT DISTINCT S.EMPNO, S.SAL
    FROM SALARY S
        ,(SELECT  E.EMPNO
            FROM DEPT D, SALARY S1, EMP E
            WHERE S1.SALMONTH = '202306'
            AND E.DEPTNO = D.DEPTNO
            AND S1.EMPNO = E.EMPNO
            AND D.DNAME = '인사팀') EE
    WHERE S.SALMONTH = '202306'
    AND S.EMPNO = EE.EMPNO;

--모범코드
SELECT S.EMPNO, S.SAL
    FROM  SALARY S
        ,(SELECT EMPNO 
                FROM EMP 
                WHERE DEPTNO = (SELECT DEPTNO 
                                     FROM DEPT 
                                     WHERE DNAME = '인사팀')) A
    WHERE S.EMPNO = A.EMPNO
    AND S.SALMONTH = '202306';


--문제)인사팀의 6월 최고 급여자의 직원코드와 급여를 조회하는 쿼리작성
--단, 서브쿼리로만 사용함(WHERE 절에서)( 서브쿼리로만사용 = JOIN사용하지 않음)
--조회항목 : 직원번호, 급여액
--인사팀 코드는 알 수 없음
--처음했을 때
SELECT EMPNO, SAL
    FROM SALARY   
    WHERE  SAL =(SELECT  MAX(SAL)
                FROM SALARY
                WHERE SALMONTH = '202306'
                AND EMPNO IN (SELECT EMPNO
                                    FROM EMP
                                    WHERE DEPTNO IN (SELECT DEPTNO
                                                        FROM DEPT 
                                                        WHERE DNAME = '인사팀')));

--다시 생각해봤을 때
SELECT EMPNO, SAL
    FROM SALARY
    WHERE EMPNO IN (SELECT EMPNO
                        FROM EMP
                        WHERE DEPTNO IN (SELECT DEPTNO
                                            FROM DEPT 
                                            WHERE DNAME = '인사팀'))
    AND SAL =(SELECT MAX(SAL)
                FROM SALARY
                WHERE SALMONTH = '202306'
                AND EMPNO IN (SELECT EMPNO
                                FROM EMP
                                WHERE DEPTNO IN (SELECT DEPTNO
                                                    FROM DEPT 
                                                    WHERE DNAME = '인사팀')));
                
--모범코드
SELECT EMPNO, SAL
    FROM SALARY
    WHERE SALMONTH = '202306'
    AND SAL IN (SELECT MAX(SAL)
                FROM SALARY
                WHERE SALMONTH = '202306'
                AND EMPNO IN (SELECT EMPNO
                                FROM EMP
                                WHERE DEPTNO = (SELECT DEPTNO
                                                FROM DEPT
                                                WHERE DNAME = '인사팀')))
    AND EMPNO IN(SELECT EMPNO
                    FROM EMP
                    WHERE DEPTNO = (SELECT DEPTNO
                                    FROM DEPT
                                    WHERE DNAME = '인사팀'));

--직원명을 가지고 오기
--FROM절에 서브쿼리 없이하기
--SELECT 절에 서브쿼리는 아무데나 올 수 있음
SELECT EMPNO, (SELECT ENAME FROM EMP WHERE EMPNO = S.EMPNO) AS 직원명,SAL  --SELECT절은  FROM을 하고 그에 딸린 조건인 WHERE을 적용하고 걸러진데이터들 중에서
    FROM SALARY S   --SELECT 으로 가져오는 거기 때문에 SELECT 은 맨 마지막에 실행된다.
    WHERE SALMONTH = '202306'  --그래서 (SELECT ENAME FROM EMP WHERE EMPNO = S.EMPNO)처럼 S.EMPNO의 밑에오는 FROM 절 테이블의 별칭 S를 쓸수 있는것
    AND SAL IN (SELECT MAX(SAL)
                FROM SALARY
                WHERE SALMONTH = '202306'
                AND EMPNO IN (SELECT EMPNO
                                FROM EMP
                                WHERE DEPTNO = (SELECT DEPTNO
                                                FROM DEPT
                                                WHERE DNAME = '인사팀')))
    AND EMPNO IN(SELECT EMPNO
                    FROM EMP
                    WHERE DEPTNO = (SELECT DEPTNO
                                    FROM DEPT
                                    WHERE DNAME = '인사팀'));

--부서별 6월 총급여(급여+보너스)가 25000이상인 팀을 조회하고, 조회된 부서에 속하는 직원들의 정보를 조회하는 쿼리 작성
--조회항목 : 직원번호, 부서코드, 총급여액(SAL + COMM)
--단 조회는 총 급여액이 높은 순으로 정렬함
--혼자해보기
SELECT E.EMPNO AS 직원번호, E.DEPTNO AS 부서코드, (S.SAL + S.COMM) AS 총급여액
    FROM E.EMP, S.SALARY
    WHERE E.EMPNO IN(SELECT EE.EMPNO
                        FROM DEPT D, SALARY S1, EMP EE
                        WHERE SUM(S1.SAL + S1.COMM) >= 25000
                        AND EE.DEPTNO = D.DEPTNO
                        AND S1.EMPNO = EE.EMPNO
                        AND S1.SALMONTH = '202306')
    AND E.EMPNO = S.EMPNO
    AND S.SALMONTH = '202306'
    AND (S.SAL + S.COMM) >= 25000
    OREDER BY (S.SAL + S.COMM) DESC;
    
--모범코드
--부서별이라고 했기 때문에 GROUB BY로 묶어줌
--WHERE에서 SUM(SAL + COMM) >= 25000을 하면 개개인 당의 SUM(SAL + COMM) >= 25000을 구하는 것이고
--HAVING 에서 SUM(SAL + COMM) >= 25000을 하면 GROUP BY로 묶은 것에 대해 조건을 적용해주는 거기 떄문에
--GROUP BYFH 부서단위로 묶은것 중에서  SUM(SAL + COMM) >= 25000 이 적용되는 것이다
--인라인뷰를 사용함
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
    AND B.SALMONTH = '202306';

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
            HAVING SUM(SAL + COMM) >= 20000) C
    WHERE A.DEPTNO = C.DEPTNO
    AND A.EMPNO = B.EMPNO
    AND B.SALMONTH = '202306'
    AND SUM(B.SAL + B.COMM) >(SELECT SUM(S1.SAL + S1.COMM)
                                FROM SALARY S1 , EMP EE
                                WHERE S1.SALMONTH = '202305'
                                AND S1.EMPNO = EE.EMPNO);
    
    