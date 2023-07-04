--상사들의 부서정보를 조회하는 쿼리를 다중 서브쿼리를 이용하여 쿼리 작성
--조회항목(상사) : 직원번호, 직원명, 직급, 부서코드, 부서명
--단, 상사의 급여가 8500(제외)이상인 상사만 조회
--2023년 6월 기준
--WHERE DEPTNO IN()  으로 하기
--이 문제는 OUTER JOIN 없음!!
--혼자해보기
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


--모범코드
SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, E.DNAME
    FROM EMP E, EMP EE, DEPT D
    WHERE D.DEPTNO IN(SELECT DISTINCT A.DEPTNO
                         FROM EMP A, EMP B ,SALARY C
                         WHERE A.EMPNO = B.MGR
                         AND A.EMPNO =C.EMPNO
                         AND C.SALMONTH = '202306'
                         AND C.SAL > 8500)
    AND E.EMPNO = EE.MGR
    AND E.DEPTNO = D.DEPTNO;
--AND E.DEPTNO = D.DEPTNO이 있어서 WHERE D.DEPTNO IN(SELECT DISTINCT A.DEPTNO 에서 WHERE절에  E.DEPTNO 보다  D.DEPTNO 해주는게 나음
-- E.DEPTNO은 모든 건수에 조인되는것이고  D.DEPTNO는  E.DEPTNO = D.DEPTNO이 있어서 이거에 해당하는거만 조인됨
--지금은 데이터가 적어서 상관없지만 많아지면 속도 차이가 남



--단일행 서브쿼리
--부서코드가 30번인 직원 중 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는 사람의 이름과 급여를 출력하는 쿼리 작성
--2023년 6월 기준
--조회항목 : 직원명, 급여
SELECT E.ENAME AS 직원명, S.SAL AS 급여
    FROM EMP E, SALARY S
    WHERE S.SAL > (SELECT MAX(SS.SAL)
                        FROM EMP EE, SALARY SS
                        WHERE EE.DEPTNO = '30'
                        AND SS.EMPNO = EE.EMPNO)
    AND S.SALMONTH = '202306'
    AND E.EMPNO = S.EMPNO;


--왜 2개가 출력되지? -> S.EMPNO는 유일할 값이므로 모두 조인되서  S.EMPNO가 30번인 데이터 모두 나오는 것임
--그래서 MAX(S.SAL) 인 1개의 S.EMPNO 만을 출력할 수 없다 -> 집계함수 쓰면 GROUP BY로 묶어야하기 떄문에...
--S.EMPNO는 유일한 값으로 하나의 EMPNO가 하나씩 밖에 없기 떄문에 GROUP BY할 수 없음
-->S.SALMONTH = '202306'에 해당하는 각 EMPNO값은 하나밖에 없기 때문
--만약 S.SALMONTH = '202306'이 없다면 가능
SELECT S.EMPNO,E.DEPTNO, MAX(S.SAL)
    FROM EMP E, SALARY S
    WHERE E.DEPTNO = '30'
    AND S.EMPNO = E.EMPNO
    AND S.SALMONTH = '202306'
    GROUP BY S.EMPNO, E.DEPTNO;

--구지 이렇게 안해도 되지만 이런방법도 있다
--테이블 전체를 가져와서 GROUP BY하는거라 좋은 쿼리는 아님
SELECT MAX(S.SAL)
    FROM EMP E, SALARY S
    WHERE E.DEPTNO = '30'
    AND S.EMPNO = E.EMPNO
    AND S.SALMONTH = '202306'
    GROUP BY DEPTNO
    HAVING DEPTNO ='30';

--서브쿼리에서 ORDER BY가 안됨!! ORDER BY만 안됨!!!!


-- 모범코드
SELECT E1.ENAME, S1.SAL
    FROM EMP E1 , SALARY S1
    WHERE S1.SAL > (SELECT MAX(S.SAL)
                        FROM EMP E, SALARY S
                        WHERE S.SALMONTH = '202306'  --이 조건으로 다른 월 데이터 걸러져서 줄어듦
                        AND S.EMPNO = E.EMPNO  --퇴사를 했다면 이 조건에서 걸러져서 데이터 건수가 줄어듦
                        AND E.DEPTNO = '30')
    AND E1.EMPNO = S1.EMPNO
    AND S1.SALMONTH = '202306';


--팀장 중 평균급여액 이상을 받는 팀장에 대해 조회하는 쿼리작성
--조회항목 : 직원번호, 직원명, 급여액(2023년 6월 기준)
SELECT DISTINCT A.EMPNO, A.ENAME, S1.SAL
    FROM EMP A, EMP B, SALARY S1
    WHERE S1.SAL > (SELECT AVG(S.SAL)
                    FROM EMP E, EMP EE, SALARY S
                    WHERE E.EMPNO = EE.MGR
                    AND E.EMPNO = S.EMPNO
                    AND S.SALMONTH = '202306')
    AND S1.SALMONTH = '202306'
    AND A.EMPNO = B.MGR;





--모범코드
SELECT DISTINCT A.EMPNO , A.ENAME, S.SAL
    FROM EMP A, EMP B, SALARY S
    WHERE A.EMPNO =B.MGR
    AND A.EMPNO = S.EMPNO
    AND S.SALMONTH = '202306'
    AND S.SAL > (SELECT AVG(SAL)
                    FROM EMP E1, EMP E2, SALARY S1
                    WHERE E1.EMPNO = E2.MGR
                    AND S1.EMPNO = E1.EMPNO
                    AND S1.SALMONTH = '202306');
 
 --조회해 보기
SELECT * FROM SALARY
    WHERE SALMONTH = '202306'
    ORDER BY SAL DESC;



--다중행 서브쿼리(ALL 연산자 사용)
--부서코드가 30번인 직원의 급여액 이상으로 받는 모든 직원을 조회하는 쿼리
--기준은 202306
--조회항목 : 직원명, 급여액
SELECT ENAME, SAL
    FROM EMP E1, SALARY S1
    WHERE E1.EMPNO = S1.EMPNO
    AND S1.SALMONTH = '202306'
    AND SAL > ALL (SELECT SAL  --8400, 5900
                        FROM EMP E, SALARY S
                        WHERE S.SALMONTH = '202306'
                        AND S.EMPNO = E.EMPNO
                        AND E.DEPTNO = '30');
--위 서브쿼리 뜻 -> 8400과 5900보다 큰 것  => 즉, 8400보다 큰 것 이 된다.
--ALL은 서브쿼리에 해당하는게 모두 참일 때
--서브쿼리의 검색결과와 모두 일치해야 참


--ANY 연산자 사용
--단일행 : 부서코드가 30번인 직원급여 중 가장 낮은 값(5900)보다 높은 급여를 받는 직원들의 이름, 급여를 출력하는 쿼리
--조회항목 : 직원명, 급여액

--서브쿼리 먼저 완성하기
SELECT MIN(SAL)
    FROM EMP E, SALARY S
    WHERE S.SALMONTH = '202306'
    AND S.EMPNO =E.EMPNO
    AND E.DEPTNO = '30';

--위의 것을 GRUOP BY , HAVING을 이용해 똑같이 출력하기
SELECT MIN(SAL)
    FROM EMP E, SALARY S
    WHERE S.SALMONTH = '202306'
    AND S.EMPNO =E.EMPNO
    GROUP BY DEPTNO
    HAVING DEPTNO = '30';

SELECT ENAME, SAL   --결과 : 15건
    FROM EMP E1, SALARY S1
    WHERE S1.SALMONTH = '202306'
    AND S1.EMPNO = E1.EMPNO
    AND S1.SAL > (SELECT MIN(SAL)
                    FROM EMP E, SALARY S
                    WHERE S.SALMONTH = '202306'
                    AND S.EMPNO =E.EMPNO
                    AND E.DEPTNO = '30');
                    --서브쿼리에서는 금액 뽑기 위해서 DEPTNO를 사용하지만 바깥쿼리에서는 필요없다
    -- 왼쪽 테이블 = 오른쪽 테이블    -> 왼쪽 테이블이 기준임!!! 기준테이블이 어떤것이 되냐에 따라서 데이터의 건수가 달라짐!!
    
    --옵티마이저가 어떻게 흘러갈건지 PLAN을 짜는게 SQL 튜닝임

--위의 것 검증 -> 결과가 15개로 나오는게 맞는지 검증
SELECT COUNT(*) FROM SALARY WHERE SALMONTH = '202306' AND SAL > 5900; --이렇게 하면 원래는 안되지만 지금은 일단 되서


--다중행 서브쿼리(ANY 연산자 사용)
--ANY : OR의개념이라고 생각하면 됨 서브쿼리의 결과값 중 하나라도 일치하면 참
--ALL : AND의 개념
SELECT ENAME, SAL
    FROM EMP E1, SALARY S1
    WHERE S1.SALMONTH = '202306'
    AND S1.EMPNO = E1.EMPNO
    AND S1.SAL > ANY(SELECT SAL   --서브쿼리 결과 : 8400, 5900   ANY는 8400과 5900중 하나 이상이면 되는거니까 결과적으로 5900이상인것 이 된다.
                        FROM EMP E, SALARY S
                        WHERE S.SALMONTH = '202306'
                        AND S.EMPNO =E.EMPNO
                        AND E.DEPTNO = '30');

SELECT SAL
    FROM EMP E, SALARY S
    WHERE S.SALMONTH = '202306'
    AND S.EMPNO =E.EMPNO
    AND E.DEPTNO = '30';
    
--ALL과 EXIST는 배치프로그램 에서 많이 쓰인다 (배치프로그램 : 일괄프로그램)

--EXISTS / NOT EXISTS
SELECT A.EMPNO  --서브쿼리
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR
    AND A.DEPTNO = '20';


--DEPT -> EMP ->SALARY
SELECT EMPNO, ENAME
    FROM EMP
    WHERE EXISTS (SELECT A.EMPNO    -- EXISTS는 서브쿼리에 있는 결과가 있으면 TRUE,  NOT EXISTS는 서브커리 결과가 아무것도 없어야 TRUE
                    FROM EMP A, EMP B  --서브쿼리 안에 SELECT 1을 해줘도 상관없다 -> 칼럼을 가져오는 것이아닌 데이터가 존재하는지 안하는지만
                    WHERE A.EMPNO = B.MGR --판단하는 것이기 때문에 구지 칼럼을 가져오지 않아도 된다.
                    AND A.DEPTNO = '20');

--NOT EXISTS
SELECT EMPNO, ENAME
    FROM EMP
    WHERE NOT EXISTS (SELECT A.EMPNO    -- EXISTS는 서브쿼리에 있는 결과가 있으면 TRUE,  NOT EXISTS는 서브커리 결과가 아무것도 없어야 TRUE
                    FROM EMP A, EMP B
                    WHERE A.EMPNO = B.MGR
                    AND A.DEPTNO = '80');


--선생님 추천책 : 대용량 데이터베이스 솔루션 (저자:이화식)- SQL튜닝 공부할때 좋음


--인라인뷰(FROM절에 서브쿼리 사용) 
--인라인뷰 많이 사용됨!! 꼭 제대로 알아야됨!!
--인라인뷰에서 상사코드를 가져오고 밖깥에서 조인
--테이블이 엮이지 않는 경우가 있을 수 있다 -> 엮어주기 위해서 일부를 따로 떼어서 엮어쥬기 위해 사용함
--인라인뷰를 이용해 상사에 접근하는 쿼리
SELECT E.EMPNO, E.ENAME, E.JOB
    FROM EMP E,
            (SELECT DISTINCT A.EMPNO  --한명의 팀장이 여러명의 사원을 관리하니까 여러건나와서 DISTICT 해야함 , EE롤 접근할 것은 SELECT 절에 있는 것인데 지금은 A.EMPNO밖에 없어서 A.EMPNO만 접근함 
                FROM EMP A, EMP B
                WHERE A.EMPNO = B.MGR
            ) EE --임시적으로 만들어지는 뷰, 뷰의 별칭을 EE로 해줌
    WHERE E.EMPNO = EE.EMPNO;

--인라인뷰 서브쿼리를 이용하여 
--관리자 급여가 8000이상인 관리자 정보를 조회하는 쿼리 작성
--조회 항목 : 직원번호, 직원명, 직급, 급여액
--단, 인라인뷰 서브쿼리에서는 관리자번호(직원번호)만 조회하고 금액체크도 포함하여 쿼리 작성
--혼자 해보기
SELECT A.EMPNO, A.ENAME, A.JOB, S.SAL
    FROM EMP A, SALARY S,
        (SELECT DISTINCT A.EMPNO
            FROM EMP A, EMP B, SALARY S1
            WHERE A.EMPNO = B.MGR
            AND S1.EMPNO = A.EMPNO
            AND S1.SALMONTH = 202306 
            AND S1.SAL >= 8000
        ) EE
    WHERE A.EMPNO = EE.EMPNO
    AND A.EMPNO = S.EMPNO
    AND S.SAL >=8000
    AND S.SALMONTH = 202306 ;

--모범쿼리
--서브쿼리 먼저 작성
SELECT DISTINCT E.EMPNO
    FROM EMP E, SALARY S, EMP E2
    WHERE E.EMPNO = E2.EMPNO
    AND E.EMPNO = S.EMPNO
    AND S.SALMONTH = '202306'
    AND S.SAL > 8000;

--최종으로 합치기
SELECT EE.EMPNO, EE.ENAME, EE.JOB, SS.SAL
    FROM EMP EE, SALARY SS
        ,(SELECT DISTINCT E.EMPNO
            FROM EMP E, SALARY S, EMP E2
            WHERE E.EMPNO = E2.EMPNO
            AND E.EMPNO = S.EMPNO
            AND S.SALMONTH = '202306'
            AND S.SAL > 8000) A
    WHERE EE.EMPNO = SS.EMPNO
    AND SS.SALMONTH = '202306'
    AND A.EMPNO = EE.EMPNO;
    
    
    
SELECT EE.EMPNO, EE.ENAME, EE.JOB, A.SAL
    FROM EMP EE,
        (SELECT DISTINCT E.EMPNO, S.SAL
            FROM EMP E, SALARY S, EMP E2
            WHERE E.EMPNO = E2.EMPNO
            AND E.EMPNO = S.EMPNO
            AND S.SALMONTH = '202306'
            AND S.SAL > 8000) A
    WHERE  1=1      --1=1은 참이므로 아무 문제 없음
    AND A.EMPNO = EE.EMPNO;

--MINUS 차집합
--앞에이쓴 SELECT문을 기준으로해서 뒤에오는 SELECT 문을 뺌
--상사를 뺸 사원들만 뽑고 싶다 = EMP 테이블에서 상사코드만 뺀다
SELECT EMPNO, ENAME
    FROM EMP
MINUS 

SELECT DISTINCT A.EMPNO, A.ENAME
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR;


--입사일이 2022년 01월 01일 이후 입사자 중 팀장을 제외한 팀원들만 조회하는 쿼리
--조회항목 : 직원번호, 직원명, 직급, 입사일(YYYY-MM-DD)
--혼자했지만 틀린거
SELECT EE.EMPNO, EE.ENAME, EE.JOB, TO_CHAR(EE.HIREDATE , 'YYYY-MM-DD')
    FROM EMP E , EMP EE
    WHERE EE.MGR IN (SELECT B.MGR
                        FROM EMP A, EMP B
                        WHERE A.EMPNO = B.MGR(+)
                        AND B.HIREDATE(+) > '220101')
    AND EE.MGR(+) = E.EMPNO
    AND EE.HIREDATE(+) > '220101';


SELECT E.EMPNO, E.ENAME, E.JOB, TO_CHAR(E.HIREDATE , 'YYYY-MM-DD')
    FROM EMP E , EMP EE
    WHERE E.EMPNO IN (SELECT A.EMPNO
                        FROM EMP A, EMP B
                        WHERE A.EMPNO = B.MGR
                        AND A.HIREDATE(+) > '220101')
    AND E.EMPNO(+) = EE.MGR
    AND E.HIREDATE(+) > '220101';


--MINUS 사용
SELECT EMPNO, ENAME, E.JOB, TO_CHAR(E.HIREDATE , 'YYYY-MM-DD')
    FROM EMP 
    WHERE E.HIREDATE > '220101'
    
MINUS

--팀장만 구하기 이거를 MINUS로 전체에서 빼면 팀장을 제외한 직원들만 나오는것
SELECT A.EMPNO --서브쿼리
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR
    AND A.HIREDATE > '220101';


--잔머리
SELECT EMPNO, ENAME, JOB, TO_CHAR(HIREDATE , 'YYYY-MM-DD')
    FROM EMP
    WHERE JOB NOT IN('사장', '팀장')
    AND HIREDATE >= '20220101';
    
    
--모범코드
SELECT EMPNO, ENAME, JOB, TO_CHAR(HIREDATE,'YYYY-MM-DD')
    FROM EMP
    WHERE HIREDATE >= '20220101'
--HIREDATE >= '20220101' 이렇게 하면 HIREDATE을 자동형변환 해줌, 하지만 좋은코드 아님 (왼쪽에 있는 건 건드리지 말자)
--FULL SCAN 테이블을 처음부터 끝까지 스캔하는것
--WHERE  TO_CHAR(HIREDATE,'YYYY-MM-DD') >= '20220101'  로 하면 EMP 테이블의 데이터를 전부 메모리에 올리고 칼럼값을 하나하나 바꿔서 부하 많음
--HIREDATE >=TO_DATE('20220101','YYYY-MM-DD') 이렇게 하면 내부적으로 정보를 가지고  있다가 변경해주는거라서 위의 방법보다 부하 적다

MINUS

SELECT A.EMPNO, A.ENAME, A.JOB,  TO_CHAR(A.HIREDATE,'YYYY-MM-DD')
FROM EMP A, EMP B
WHERE A.EMPNO = B.MGR;


--인라인 뷰로 적용시
SELECT E1.EMPNO, E1.ENAME, E1.JOB,  TO_CHAR(E1.HIREDATE,'YYYY-MM-DD')
FROM EMP E1,
        (SELECT EMPNO
            FROM EMP
            WHERE  HIREDATE >= TO_DATE('20220101','YYYY-MM-DD')
            MINUS
            SELECT A.EMPNO
            FROM EMP A, EMP B
            WHERE A.EMPNO = B.MGR
            ) E2
    WHERE E1.EMPNO =E2.EMPNO;


--문제)급여액이 6500이상이면서 20230101 이전 입사자중 팀장을 제외한 팀원들만 조회하는 쿼리
--조회 항목 : 직원번호, 직원명, 직급, 급여액, 입사일(YYYY-MM-DD)
--202306 기준
SELECT E.EMPNO, E.ENAME, E.JOB, S.SAL, TO_CHAR(E.HIREDATE, 'YYYY-MM-DD')
    FROM EMP E, SALARY S
    WHERE E.EMPNO = S.EMPNO
    AND E.HIREDATE < '20230101'
    AND S.SAL >= 6500
    AND S.SALMONTH = '202306'
    AND E.EMPNO IN (SELECT A.EMPNO
                            FROM EMP A, SALARY S1
                            WHERE A.EMPNO = S1.EMPNO
                            AND S1.SAL >= 6500
                            AND S1.SALMONTH = '202306'
                            AND HIREDATE < '20230101')
                            
MINUS 

SELECT A.EMPNO, A.ENAME, A.JOB, S.SAL, TO_CHAR(A.HIREDATE, 'YYYY-MM-DD')
    FROM EMP A, EMP B, SALARY S
    WHERE A.EMPNO =B.MGR;

--이거 인라인뷰로도 해보기


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
   AND C.SALMONTH = '202306'; --이거 안넣으면 많이나옴
   

--문제)급여액이 6500이상이면서 20230101 이전 입사자중 팀장을 제외한 팀원들만 조회하는 쿼리
--조회항목 : 직원번호, 직원명, 직급, 급여액, 입사일(YYYY-MM-DD)
--혼자풀어보기
SELECT E.EMPNO, E.ENAME, E.JOB, S.SAL ,TO_CHAR(E.HIREDATE, 'YYYY-MM-DD')
    FROM EMP E, SALARY S
    WHERE S.SAL > 6500
    AND E.EMPNO = S.EMPNO
    AND E.HIREDATE < '20230101'
    AND S.SALMONTH = '202306'
        
MINUS

SELECT  E1.EMPNO, E1.ENAME, E1.JOB, C.SAL ,TO_CHAR(E1.HIREDATE, 'YYYY-MM-DD')
    FROM EMP E1, EMP E2 , SALARY C
    WHERE E1.EMPNO = E2.MGR
    AND E1.EMPNO = C.EMPNO;
    --AND C.SALMONTH = '202306'; 이걸 넣어주지 않았음
    --이걸 넣어주지 않으면 이 테이블의 결과가 엄청 많이 나옴
    --물론 앞테이블을 기준으로 하기 때문에 결과에는 문제가 없지만 SALARY TABLE 에서 SALMONTH는PK로 잡혀있기 때문에
    --넣어줘야한다.
    --왜 PK이라서 써줘야하는지??
    --아직 개념이 안잡혔음

--minus는 앞 테이블의 레코드 건수에서 뒤의 테이블의 건수를 빼주는 것
--minus시 앞테이블의 select 절에 오는 컬럼의 수와 뒤의 테이블의  select 절에 오는 컬럼의 수가 같아야한다!!!
--select절에 필요한칼럼보다 많게 가져와도되지만 적게 가져오면 안된다
--서브쿼리에서는 order by 쓸수 없다
--가상의 테이블이므로 RDBMS에서 메모리를 가지고 있을 뿐 물리적으로 존재하지 않음
--
