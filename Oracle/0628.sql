--NULL 이 아닌 경우만 조회
--(NULL : IS NULL, NULL이 아닌걸 체크 : IS NOT NULL
SELECT '[' || ENAME || ']-[' || JOB || ']' AS "직원명과 직급"  --AS안써주면 자동으로 이름지정됨
    FROM EMP
    WHERE MGR IS NOT NULL;
    --이거는 실적보고할 때 많이 사용

--UPPER. LOWER, INITCAP
SELECT UPPER('manager'), LOWER('mANAger'), INITCAP('manager')
    FROM EMP
    WHERE JOB LIKE 'man%';
--WHERE UPPER(JOB) LIKE 'MAN%'
--특수 케이스가 아닌이상 왼쪽에 있는 것을 변경하지 않는 것이 원칙!!
--> ()에 들어가는 글자들은 소문자,대문자 정확하게 해주는 것이 좋다
--> 위처럼 JOB컬럼이 꼭 WHERE 절에 들어갈수밖에 없는 특수한 경우에만한다

INSERT INTO SALARY(SALMONTH,EMPNO, SAL)
VALUES('202306', '2001', 5500);

INSERT INTO SALARY(SALMONTH,EMPNO, SAL)
VALUES('202306', '2002', 6000);

INSERT INTO SALARY(SALMONTH,EMPNO, SAL)
VALUES('202306', '2003', 5800);
--지금 이거는 SALARY TABLE에 FK가 정해져있지 않아서 가능한거임

COMMIT;


--NVL은NULL 이면 연산 안한다.?  NVL처리를 하고 100을 더한다
SELECT COMM
    ,TO_CHAR(NVL(COMM, 0) + 100, '9,999,990')  
    ,NVL(COMM, 0) - 10
    ,TO_CHAR(NVL(COMM, 0) * 3, '9,999,990')
    ,NVL(COMM, 0) / 2
    FROM SALARY
    WHERE SALMONTH = '202306';
    --WHERE COMM IS NULL;
    
    --TO_CHAR()는 ()안에 들어가 있는 값을 문자로 바꿈
    --TO_DATE ()안에 들어간 값을 날짜로 만듦
    
--BETWEEN
SELECT *
    FROM SALARY
    WHERE  SALMONTH = '202306'
    AND COMM BETWEEN 300 AND 800;
    --PK인 SALMONTH 조건문이 더 위에 오고 다음조건이 밑에 오는 것이 좋은쿼리

--IN : 직원번호가 1001, 1002, 1003,1004,1005 조회
SELECT *
    FROM EMP
    WHERE EMPNO IN('1001', '1002', '1003', '1004', '1005'); --EMPNO의 번호가 순차적이면 비교연산자로 범위를 정해서 그 안에 있는 값을 가져올 수도 있음
    --IN 절은 뒤에서 부터 =비교함  위의 코드를 예들 들면 1005부터 먼저 가져오고 1001이 마지막으로 비교해서 가져온다
    
--LIKE
SELECT *
    FROM EMP
    WHERE ENAME LIKE '송%';
    
--DUAL 테이블
SELECT SYSDATE
    FROM DUAL;

--ROUND:반올림, TRUNC : 잘라냄, MOD:나눈 나머지
SELECT ROUND(10.157, 1)
        ,TRUNC(10.157, 1)
        ,MOD(10,3)
    FROM DUAL;

--문자처리함수 : LENGTH, CONCAT, SUBSTR, REPLACE
SELECT LENGTH('ABC')
    ,CONCAT('ABC', 'DEF')
    ,SUBSTR('ABCDEF', 3,2)
    ,REPLACE('DD', 'DD', 'ABCDE')
    FROM DUAL;
    
--날짜함수
SELECT SYSDATE
        ,SYSTIMESTAMP
        ,ADD_MONTHS(SYSDATE,1)
        ,MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 1), SYSDATE)
        ,NEXT_DAY(SYSDATE, '토요일')
        ,LAST_DAY(SYSDATE)
        ,ROUND(SYSDATE, 'month')  --현재 날짜를 기준으로 month 1 증가, ROUND는 15일을 기준으로 반올림함
        ,TRUNC(SYSDATE, 'month')  --현재 날자를 기준으로 버림 하고 month 출력
    FROM DUAL;


--날짜 포맷
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD')
    ,TO_CHAR(SYSDATE, 'YYYY/MM/DD')
    ,TO_CHAR(SYSDATE, 'YYYY-MM-DD')
    ,TO_CHAR(SYSDATE, 'YYYY=MM-DD- HH24:MI:SS')
    ,TO_CHAR(SYSDATE, 'MM/DD')
    ,TO_CHAR(SYSDATE, 'FMMM/DD')
    FROM DUAL;
    
    
--구분자로 날짜 형식
SELECT TO_CHAR(SYSDATE, 'YYYY"년 "MM"월 "DD"일"')
    ,TO_CHAR(SYSDATE, 'HH24"시 "MI"분 "SS"초"')
    FROM DUAL;

--시간에 오전,오후 표시
SELECT TO_CHAR(SYSDATE, 'AM')
    ,TO_CHAR(SYSDATE, 'AM HH:MI:SS')
    ,TO_CHAR(SYSDATE, 'YYYY-MM-DD AMHH:MI:SS')
    FROM DUAL;

--변환함수
SELECT TO_CHAR(SYSDATE, 'YYYY.MM.DD')
    ,TO_NUMBER('12345')
    ,TO_DATE('20230305', 'YYYYMMDD')
 FROM DUAL;


--집계함수(COUNT, MAX, MIN, AVG, SUM)
SELECT COUNT(*)
    FROM SALARY
    WHERE SAL >= 5000
      AND SAL <= 7000;

SELECT MAX(EMPNO) --어떤 컬럼의 MAX값인지 알아야하므로 ()에 *들어가면 안됨
    FROM EMP;
    
SELECT MAX(SAL)
    FROM SALARY
    WHERE SAL >= 5000
    AND SAL <= 7000;
    
SELECT MIN(EMPNO)
    FROM EMP;
    
SELECT MIN(SAL)
    FROM SALARY
    WHERE SAL >=5000   --조건이 AND 여서 조건연산자를 BETWEEN으로 해도 됨
    AND SAL <= 7000;
    
SELECT AVG(SAL) --, EMPNO 이렇게 하면 오류!! => 이렇게 하면 결과가 여러개인데 집계함수는 결과가 1개 이기떄문에 오류
    FROM SALARY
    WHERE SALMONTH = '202305';
    
SELECT SUM(SAL)
    FROM SALARY
    WHERE SALMONTH = '202305';
--집계함수 라는 것의 의미를 정확히 알기!!!
--집계함수는 결과가 무조건 1개임!!!

--문제)직원 번호가 1002 - 1006까지 직원이 몇명인지와 급여 합계를 구하시오 (2023년 6월 기준)
--출력예) '4명 32800원' 으로 출력하는 쿼리 작성 (별칭 : 팀장인원, 팀장 총 급여액)
SELECT COUNT(EMPNO) || '명' AS "팀장인원"  , SUM(SAL) ||'원' AS "팀장 총 급여액"  --COUNT(*)로 해도 되긴하지만 SALARY 테이블에 PK로 지정된 EMPNO와 SALMONTH중 하나를 써주는 것이 좋음
    FROM SALARY
    WHERE SALMONTH = '202306'
        AND EMPNO BETWEEN 1002 AND 1006;
--COUNT() 안에는 PK에 해당하는 컬럼값을 넣어주는 것이 가장 좋다
--PK는 정렬되어있음(오름차순으로??)
--PK는 내부적으로 주소값을 가지고 있는것이기 때문에 PK를 사용하면 빠르게 찾을 수 있기때문에 사용
--PK는 중간에 들어가는 것을 다시 순서를 재정비해주는 것이 따로 있다


--문제)
SELECT COUNT(*), MAX(SAL), MIN(SAL), AVG(SAL), SUM(SAL)
    FROM SALARY
    WHERE SALMONTH = '202306'
        AND EMPNO BETWEEN 1002 AND 1006;

--그룹핑(집계함수) GROUP BY
SELECT MGR, COUNT(*)
    FROM EMP
    WHERE MGR IS NOT NULL
    GROUP BY MGR;

--문제)직원에 대한 부서코드별 인원수를 조회하는 쿼리 작성
SELECT DEPTNO, COUNT(EMPNO) 
    FROM EMP
    GROUP BY DEPTNO;
 --COUNT(EMPNO) 또는 COUNT(*)을 할 수 있음


SELECT DEPTNO, COUNT(*) 
    FROM EMP
    WHERE DEPTNO IS NOT NULL
    GROUP BY DEPTNO
    HAVING COUNT(*) >= 3;
    
--문제)직원 테이블에서 관리자별 관리하는 사원의 수를 조회하는 쿼리작성
--단, 관리자가 없는 사원은 제외하고 관리 사원수가 3명 이상인 경우만 조회
SELECT MGR, COUNT(*)
    FROM EMP
    WHERE MGR IS NOT NULL
    GROUP BY MGR
    HAVING COUNT(*) >=3;

--DISTINCT
SELECT DISTINCT JOB
    FROM EMP;

SELECT DISTINCT JOB, DEPTNO
    FROM EMP;

SELECT *
    FROM EMP
    ORDER BY DEPTNO DESC;
    
SELECT DISTINCT DEPTNO, MGR
    FROM EMP
    ORDER BY DEPTNO ASC;
    
SELECT *
    FROM EMP
    ORDER BY DEPTNO ASC, MGR DESC; --DEPTNO가 오름차순으로 정렬이 되고 그 안에서 MGR가 내림차순으로 정렬되는 거임

--급여테이블에서 급여액이 높고 보너스가 낮은 순으로 조회하는 쿼리작성
--단, 금액으로만 처리하며 중복제거(2023년 6월 기준)
SELECT DISTINCT SAL, COMM
    FROM SALARY
    WHERE SALMONTH = '202306'
    ORDER BY SAL DESC, COMM ASC; --ODER BY 하는것이 2개이면 SELECT으로 가져오는 칼럼도 2개여야함!!


--조인
SELECT E.ROWID, D.ROWID, E.EMPNO, E.DEPTNO, D.DNAME, D.LOC --DEPTNO는 EMP테이블과 DEPT테이블 양쪽에 모두 있으므로 꼭 별칭을 써줘야함 -> 한 컬럼이 여러 테이블에있다면 꼭 별칭을 써줘야한다 
    FROM EMP E, DEPT D--테이블 ALIAS는 보통 테이블의 앞글자를 따서 하는 것이 많음
    WHERE E.DEPTNO IS NOT NULL;--= D.DEPTNO  --이렇게 비교하는 값에서 NULL은 제외,  NULL은 비교하지 않는다
    --앞에있는 EMP테이블이 기준테이블, DEPT테이블이 비교테이블임



--INNER JOIN
--모든 직원에 대한 부서명을 조회하는 쿼리를 작성
--조회 항목은 '직원번호, 직원명, 직급, 부서코드, 부서명'
SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME
    FROM EMP E, DEPT D  --이렇게만 하면 EMP 19개 * DEPT 6개
    WHERE E.DEPTNO = D.DEPTNO; --이게 조인하는거입! EQJOIN을 했다는 것은 똑같다는 것임
    --왜 WHERE절에서 조인을 해줘야만 하는지 파악하기
    --조인을 하므로써 E.DEPTNO와 일치하는 D.DEPTNO에 있는 레코드르 불러와서 마치 하나의 레코드 인것 처럼 사용하는것
    --WHERE E.DEPTNO IS NOT NULL로 하면 안됨!! 하나하나 전부 조인해서 엄청많은 데이터 출력됨
    
    --ROWID는 해당정보의 레코드가 어디에 있는지 정보를 가지고 있음 
    --ROWID값은 바꿀 수 없음, 만약 바꾸려면 다 지우고 다시 만들어야함

--SALARY FK 설정
ALTER TABLE SALARY
ADD CONSTRAINTS FK_SALMONTH FOREIGN KEY(EMPNO)
REFERENCES EMP(EMPNO);

DELETE FROM SALARY
WHERE EMPNO IN('2001', '2002', '2003');

COMMIT;

