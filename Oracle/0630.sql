--서브쿼리
--1.단일행 서브쿼리
--이 예제는 조인으로 해도 되고 서브쿼리로 해도 됨
SELECT *
    FROM EMP
    WHERE DEPTNO =(SELECT DEPTNO
                    FROM DEPT
                    WHERE DNAME = '전산팀');
--WHERE DEPTNO =(SELECT DEPTNO 의 뜻은 DEPT의 테이블에서 DNAE이 전산팀인 DEPTNO를 가져오는데,
--이 가져온 것(서브쿼리)과 바깥쿼리의 DEPTNO랑 같은 데이터만 출력해줘


--위에 쿼리를 참고 하여 전산팀에 팀원 정보와 부서정보를 조회하는 쿼리
--조회항목 : 사원번호, 사원명, 직급, 부서코드, 부서명(서브쿼리사용)
SELECT E.EMPNO AS 사원번호, E.ENAME AS 사원명, E.JOB AS 직급, E.DEPTNO AS 부서코드, D.DNAME AS 부서명
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = (SELECT DEPTNO
                        FROM DEPT
                        WHERE DNAME = '전산팀')
    AND E.DEPTNO = D.DEPTNO;
    
--직원중 급여액이 가장적은 직원의 정보를 조회하는 쿼리작성(서브쿼리)
--조회항목 : 직원번호, 직원명, 직급, 급여액, 보너스
--단, 급여는 2323년 6월 기준으로 쿼리 작성
SELECT E.EMPNO AS 직원번호, E.ENAME AS 직원명, E.JOB AS 직급, S.SAL AS 급여액, S.COMM AS 보너스
    FROM EMP E, SALARY S
    WHERE S.SAL= (SELECT MIN(SAL)        --서브쿼리에서 가져온 것이 SAL이기 때문에 WHERE 절에서도 SAL 끼리 비교해야하므로 S.SAL =SAL 이 맞음
                        FROM SALARY
                        WHERE S.SALMONTH = '202306') --서브쿼리는 1건만 나옴!!!  서브쿼리에서 나온 1건을 비교하는 것임
    AND E.EMPNO = S.EMPNO
    AND S.SALMONTH ='202306'; --같은 급액인것이 5월꺼 6월꺼가 같이 있을 수 있으므로 6월 인것만 나오게 해줘야함
                        
--그룹함수는 무조건 SELECT 절에 와야함!!!
--GROUP BY는  SELECT 절에 집계함수가 오고 다른 컬럼이 또 왔을 떄 사용!!


--검증 : 구지 왜S.SALMONTH = '202306'을 두번 넣어야하는지 알기 위해
SELECT E.EMPNO AS 직원번호, E.ENAME AS 직원명, E.JOB AS 직급, S.SAL AS 급여액, S.COMM AS 보너스
    FROM EMP E, SALARY S
    WHERE S.SAL= (SELECT MIN(SAL)        --서브쿼리에서 가져온 것이 SAL이기 때문에 WHERE 절에서도 SAL 끼리 비교해야하므로 S.SAL =SAL 이 맞음
                        FROM SALARY
                        WHERE SALMONTH = '202306') --서브쿼리는 1건만 나옴!!!  서브쿼리에서 나온 1건을 비교하는 것임
                        --이 안에 S.SALMONTH로 하면 안됨!!! -> S.을하면 서브쿼리 바깥에 있는 테이블을 가져오게 되므로 WHERE 절이 적용되지 않음!!
                        --같은 테이블이라고 생각하지 마셈!! 서브쿼리 안에서만 생각하셈!!
    AND E.EMPNO = S.EMPNO;
--서브쿼리 밖에서도 SALMONTH = '202306'을 하는 이유
-->서브쿼리 안의 WHERE은 서브쿼리 안에서만 조건이 적용되는 것임!! 서브쿼리에서 202306인것 중 MIN(SAL)인것을 가져온거에다가
--서브쿼리 밖으로 나와서 한번더 조건들을 적용해 줘야함
--서브쿼리의 결과값 1개는 WHERE절에 조건으로 쓰이는 것임 => 즉, 그냥 하나의 조건이 되는 것뿐임


--상사중에 급여액이 가장 높은 직원의 정보 조회
--조회항목(상사) : 직원번호, 직원명, 직급, 급여액
--단, 급여는 2023년, 6월 기준
--서브쿼리에서 셀프조인해야함
--서브쿼리에서 상사에 들어갈 급여액을 먼저 조회
SELECT DISTINCT A.EMPNO AS 직원번호, A.ENAME AS 직원명, A.JOB AS 직급, S.SAL AS 급여액
    FROM EMP A, EMP B, SALARY S
    WHERE A.EMPNO = B.MGR   --이것을 해야 둘다 같은 상사코드라는 것이 되는 것
    AND A.EMPNO = S.EMPNO  --A.EMPNO를 B.MGR로 적용가능(두개다 상사) 단, 위에서 A.EMPNO = B.MGR이 실행되었다는 것이 전제임, A.EMPNO = B.MGR가 위에 없으면 B.MGR =S.EMPNO여야함
    AND S.SALMONTH = '202306'
    AND S.SAL = (SELECT MAX(SAL)
                         FROM EMP E1, EMP E2, SALARY S1  --WHERE 절에 E1.EMPNO = E2.MGR이 없다면 FROM 절에서 EMP E1을 생략해도 된다.
                        WHERE E1.EMPNO = E2.MGR  --이건 상사를 구하기 위한 SELF JOIN
                        AND E2.MGR = S1.EMPNO --E2.MGR대신 E1.EMPNO 해도 됨 : 둘다 상사이기 때문 단, E1.EMPNO = E2.MGR이 먼저 왔다는 전재하에 만약 위에 안온다면 E2.MGR=S2.EMPNO로 해줘야함
                       --하지만 E2.EMPNO =SQ.EMPNO는 안됨!!
                       AND S1.SALMONTH = '202306');
--FROM으로 테이블을 가져오면 가져오기만 하는게 아니라 내부시스템으로 인해서 자동으로 1 : N 해서 결합해버림
--EMP E1, EMP E2, SALARY S1 으로 가져왔을 때, E1 에 1 ,E2에 3, S1에 5가 있다면  
--내가 조인으로 조건을 걸어주지 않으면 1 * 3 * 5 이런식으로 전부 결합이 되서 데이터 건수가 엄청 많이 나오게 됨
--그래서 WHERE절에 '=' 으로 JOIN을 걸어줘서 어떤 특정컬럼만 연결해서 가져올 수 있도록 해줘야한다.

--다 이해 됬으면 블핑 애들꺼도 급여 9800으로 바꾸고 직원번호가 없으면 0으로 표시 이런거 해보기



--다중행 서브쿼리
SELECT DISTINCT E.DEPTNO, D.DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND E.DEPTNO IN (SELECT DEPTNO
                        FROM DEPT
                        WHERE DEPTNO > '20');

    
--부서코드가 20번 이상에 해당하는 직원들의 인원수를 조회 쿼리 작성 (부서코드 20번 포함)
--조회 항목 : 부서코드, 부서명, 인원수(다중행 서브쿼리 이용)
SELECT NVL(E.DEPTNO, ' '), D.DNAME, COUNT(E.DEPTNO)   --어떤 특정 컬럼이 있고 집계함수가 있으면 무조건 GROUP BY,, 집계함수 없으면 그냥 DISTINCT
    FROM DEPT D, EMP E
    WHERE D.DEPTNO = E.DEPTNO
    AND E.DEPTNO IN (SELECT DEPTNO
                        FROM DEPT
                        WHERE DEPTNO >= '20')
    GROUP BY NVL(E.DEPTNO, ' '), D.DNAME;
    

--까먹지마!!! 다중서브쿼리는 WHERE 절에 '=' 이 아니라 IN 임!!!!!!

--문제)다중 서브쿼리, OUTER JOIN
--직원 정보를 기준으로 부서정보를 조회하는 쿼리 작성
--조회항목 : 부서코드, 부서명, 인원수(부서별인원수)
--단, 부서명이 없는 경우는 ' '(공백한자리)로 처리함
--혼자해보기 -> 내가한거는 다중 서브쿼리 의미가 없음ㅠㅠ
SELECT NVL(E.DEPTNO, ' '), NVL(D.DNAME, ' '), COUNT(*)
    FROM EMP E, DEPT D 
    WHERE E.DEPTNO = D.DEPTNO(+)  --OUTER JOIN
    AND E.DEPTNO IN (SELECT DEPTNO
                        FROM EMP
                        WHERE DEPTNO IS NOT NULL)  --이거 대신 WHERE E.DEPTNO = D.DEPTNO(+)해도 똑같이 나오는데 이거는 IS NOT NULL과 결국 같은 말??
    GROUP BY NVL(E.DEPTNO, ' '), NVL(D.DNAME, ' ');
  

--다중행 서브쿼리에서 어떤것을 조인해주느냐에 따라서 결과가 달라짐
--EMP 테이블이 기준임
--위의 문제를 다중쿼리를 EMP의 EMPNO 인것에 다중서브쿼리를 하는 방법
--혼자해보기
SELECT NVL(E.DEPTNO, ' '), NVL(D.DNAME, ' '), COUNT(E.DEPTNO)
    FROM EMP E, DEPT D 
    WHERE E.DEPTNO = D.DEPTNO(+)
    AND E.EMPNO IN (SELECT A.EMPNO     --EMP, DEPT 참고해서 서브쿼리안에서 OUTER JOIN 해줘야함, DEPTNO IS NOT NULL을 포함하셈
                        FROM EMP A, DEPT B
                        WHERE A.DEPTNO = B.DEPTNO(+)
                        AND A.DEPTNO IS NOT NULL) --나는 이거를 빼먹었음
    GROUP BY E.DEPTNO, D.DNAME;


--모범코드
SELECT A.DEPTNO AS 부서코드, NVL(B.DNAME, ' ') AS 부서명, COUNT(A.DEPTNO) AS 인원수
    FROM EMP A, DEPT B
    WHERE A.EMPNO IN(SELECT EMPNO
                        FROM EMP E, DEPT D
                        WHERE E.DEPTNO IS NOT NULL
                        AND E.DEPTNO = D.DEPTNO(+))
    AND A.DEPTNO = B.DEPTNO(+)
    GROUP BY A.DEPTNO , NVL(B.DNAME, ' ');


--직원정보를 기준으로 부서정보와 부서별 급여총액과 보너스 총액을 조회하는 쿼리작성
--조회항목 : 부서코드, 부서명, 급여총액, 보너스총액
--단, 부서명이 없는 경우는 ' '(공백한자리)로 처리함. (다중서브쿼리 사용)
--급여총액과 보너스총액이 NULL일때 0으로 처리
--2023년 6월 기준
--WHERE A.EMPNO IN() 으로 하셈
SELECT A.DEPTNO AS 부서코드, NVL(B.DNAME, ' ') AS, NVL(SUM(S.SAL), 0), NVL(SUM(S.COMM), 0)
    FROM EMP A, DEPT B, SALARY S
    WHERE A.DEPTNO = B.DEPTNO(+)
    AND A.EMPNO = S.EMPNO(+)    --여기서 S에 OUTER JOIN걸었기 떄문에 이 코드 밑으로나오는 S 에는 모두 (+) 걸어줘야함
    AND S.SALMONTH(+) = '202306'  --여기에 OUTER JOIN안걸면 블랙핑크꺼 안나옴!!
    AND A.EMPNO IN (SELECT E.EMPNO
                        FROM EMP E, DEPT D
                        WHERE E.DEPTNO = D.DEPTNO(+)
                        AND E.DEPTNO IS NOT NULL)
    GROUP BY A.DEPTNO, NVL(B.DNAME, ' ');
--NVL(SUM(S.SAL), ' ')에서 SUM(S.SAL)는 숫자인데 문자인' '로 바꾸려고 하면 오류남!!! 숫자니까 NVL(SUM(S.SAL), 0)처럼 숫자는 0으로 해줘야함!!!

--모범코드
SELECT A.DEPTNO AS 부서코드, NVL(B.DNAME, ' ') AS 부서명, 
       NVL(SUM(S.SAL), 0) AS 급여총액, NVL(SUM(S.COMM), 0) AS 보너스총액
  FROM EMP A, DEPT B, SALARY S
 WHERE A.EMPNO IN (--EMP, DEPT 참고해서 처리:DEPTNO IS NOT NULL
                   SELECT EMPNO
                     FROM EMP E, DEPT D
                    WHERE E.DEPTNO IS NOT NULL
                      AND E.DEPTNO = D.DEPTNO(+)
                   )
   AND A.DEPTNO = B.DEPTNO(+)
   AND S.EMPNO(+) = A.EMPNO
   AND S.SALMONTH(+) = '202306'
 GROUP BY A.DEPTNO, NVL(B.DNAME, ' ');

                
--위 문제를 EQUI JOIN으로도 해보기

--위 문제는 부서별로 출력했는데, 개개인별로 출력되게해보기
SELECT A.DEPTNO, A.ENAME, B.DNAME, NVL(SUM(S.SAL), 0), NVL(SUM(S.COMM), 0)
    FROM EMP A, DEPT B, SALARY S
    WHERE S.SALMONTH = '202306' 
   AND S.EMPNO = A.EMPNO
    AND A.DEPTNO = B.DEPTNO
    AND A.EMPNO IN (SELECT E.EMPNO
                        FROM EMP E, DEPT D
                        WHERE E.DEPTNO = D.DEPTNO)
    GROUP BY A.DEPTNO,A.ENAME, B.DNAME;
--A.ENAME 이거 하나로 결과가 달라지는데 왜?
--> A.ENAME컬럼을 SELECT 절에서 가져왔으므로 어쩔 수 없이 출력해야하니까? DEPTNO가 같다면 DNAME, SUM(S.SAL),SUM(S.COMM)은 어짜피 같은 값이니까 그대로 넣어주면 되서 문제 없나?
--A.ENAME이 있으면 개개인 별로 모두 나오고
--A.ENAME이 없으면 부서별로만 묶여서 출력됨
--만약 DEPTNO 10으로 같은 사람이 3명이면 3명중 1명에게만 대표로 SUM(S.SAL),SUM(S.COMM)이 출력되고 다른 사람들 거는 공백으로 출력되게 할 수도 있나?



SELECT *   
    FROM DEPT D, EMP E, SALARYS
--이렇게 *를 하면 DEPT테이블에 잇는 컬럼 순서대로 출력됨   

--OUTER JOIN , INNER조인, 서브쿼리, 다중서브쿼리 제대로 공부해!!!


--상사들의 부서정보를 조회하는 쿼리를 다중 서브쿼리를 이용하여 쿼리 작성
--조회항목(상사) : 직원번호, 직원명, 직급, 부서코드, 부서명
--단, 상사의 급여가 8500(제외)이상인 상사만 조회
--WHERE DEPTNO IN()  으로 하기
--이 문제는 OUTER JOIN 없음!!
--0630날 혼자 푼거(아직 서브쿼리에 어떤조건을 넣어야하는지 파악을 못함)
SELECT E.EMPNO AS 직원번호, E.ENAME AS 직원명, E.JOB AS 직급, NVL(D.DEPTNO, ' ') AS 부서코드, NVL(D.DNAME, ' ') AS 부서명
    FROM EMP E , DEPT D, SALARY S
    WHERE E.DEPTNO = D.DEPTNO(+)
    AND S.EMPNO(+) = E.EMPNO
    AND S.SALMONTH(+) = '202306'
    AND S.SAL > 8500
    AND A.DEPTNO IN (SELECT E.DEPTNO
                        FROM EMP A, EMP B, DEPT C 
                        WHERE A.EMPNO = B.MGR
                        AND A.DEPTNO = C.DEPTNO);
                
--상사의 -> SELF JOIN
--혼자 풀어보기
SELECT DISTINCT A.EMPNO, A.ENAME, A.JOB, A.DEPTNO, D.DNAME, S.SAL 
    FROM EMP A, EMP B, DEPT D, SALARY S
    WHERE A.EMPNO = B.MGR
    AND A.DEPTNO = D.DEPTNO
    AND S.EMPNO = A.EMPNO
    AND S.SAL > 8500
    AND S.SALMONTH = '202306'
    AND A.EMPNO IN(SELECT E1.EMPNO
                        FROM EMP E1, EMP E2 ,SALARY S1
                        WHERE E1.EMPNO = E2.MGR
                        AND E1.EMPNO = S1.EMPNO
                        AND S1.SAL > 8500);
--S.SALMONTH = '202306'을 안해주면 5월꺼 6월꺼 모두 나와서 총 4건이 출력됨