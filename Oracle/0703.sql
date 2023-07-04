--������ �μ������� ��ȸ�ϴ� ������ ���� ���������� �̿��Ͽ� ���� �ۼ�
--��ȸ�׸�(���) : ������ȣ, ������, ����, �μ��ڵ�, �μ���
--��, ����� �޿��� 8500(����)�̻��� ��縸 ��ȸ
--2023�� 6�� ����
--WHERE DEPTNO IN()  ���� �ϱ�
--�� ������ OUTER JOIN ����!!
--ȥ���غ���
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


--����ڵ�
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
--AND E.DEPTNO = D.DEPTNO�� �־ WHERE D.DEPTNO IN(SELECT DISTINCT A.DEPTNO ���� WHERE����  E.DEPTNO ����  D.DEPTNO ���ִ°� ����
-- E.DEPTNO�� ��� �Ǽ��� ���εǴ°��̰�  D.DEPTNO��  E.DEPTNO = D.DEPTNO�� �־ �̰ſ� �ش��ϴ°Ÿ� ���ε�
--������ �����Ͱ� ��� ��������� �������� �ӵ� ���̰� ��



--������ ��������
--�μ��ڵ尡 30���� ���� �� �޿��� ���� ���� �޴� ������� �� ���� �޿��� �޴� ����� �̸��� �޿��� ����ϴ� ���� �ۼ�
--2023�� 6�� ����
--��ȸ�׸� : ������, �޿�
SELECT E.ENAME AS ������, S.SAL AS �޿�
    FROM EMP E, SALARY S
    WHERE S.SAL > (SELECT MAX(SS.SAL)
                        FROM EMP EE, SALARY SS
                        WHERE EE.DEPTNO = '30'
                        AND SS.EMPNO = EE.EMPNO)
    AND S.SALMONTH = '202306'
    AND E.EMPNO = S.EMPNO;


--�� 2���� ��µ���? -> S.EMPNO�� ������ ���̹Ƿ� ��� ���εǼ�  S.EMPNO�� 30���� ������ ��� ������ ����
--�׷��� MAX(S.SAL) �� 1���� S.EMPNO ���� ����� �� ���� -> �����Լ� ���� GROUP BY�� ������ϱ� ������...
--S.EMPNO�� ������ ������ �ϳ��� EMPNO�� �ϳ��� �ۿ� ���� ������ GROUP BY�� �� ����
-->S.SALMONTH = '202306'�� �ش��ϴ� �� EMPNO���� �ϳ��ۿ� ���� ����
--���� S.SALMONTH = '202306'�� ���ٸ� ����
SELECT S.EMPNO,E.DEPTNO, MAX(S.SAL)
    FROM EMP E, SALARY S
    WHERE E.DEPTNO = '30'
    AND S.EMPNO = E.EMPNO
    AND S.SALMONTH = '202306'
    GROUP BY S.EMPNO, E.DEPTNO;

--���� �̷��� ���ص� ������ �̷������ �ִ�
--���̺� ��ü�� �����ͼ� GROUP BY�ϴ°Ŷ� ���� ������ �ƴ�
SELECT MAX(S.SAL)
    FROM EMP E, SALARY S
    WHERE E.DEPTNO = '30'
    AND S.EMPNO = E.EMPNO
    AND S.SALMONTH = '202306'
    GROUP BY DEPTNO
    HAVING DEPTNO ='30';

--������������ ORDER BY�� �ȵ�!! ORDER BY�� �ȵ�!!!!


-- ����ڵ�
SELECT E1.ENAME, S1.SAL
    FROM EMP E1 , SALARY S1
    WHERE S1.SAL > (SELECT MAX(S.SAL)
                        FROM EMP E, SALARY S
                        WHERE S.SALMONTH = '202306'  --�� �������� �ٸ� �� ������ �ɷ����� �پ��
                        AND S.EMPNO = E.EMPNO  --��縦 �ߴٸ� �� ���ǿ��� �ɷ����� ������ �Ǽ��� �پ��
                        AND E.DEPTNO = '30')
    AND E1.EMPNO = S1.EMPNO
    AND S1.SALMONTH = '202306';


--���� �� ��ձ޿��� �̻��� �޴� ���忡 ���� ��ȸ�ϴ� �����ۼ�
--��ȸ�׸� : ������ȣ, ������, �޿���(2023�� 6�� ����)
SELECT DISTINCT A.EMPNO, A.ENAME, S1.SAL
    FROM EMP A, EMP B, SALARY S1
    WHERE S1.SAL > (SELECT AVG(S.SAL)
                    FROM EMP E, EMP EE, SALARY S
                    WHERE E.EMPNO = EE.MGR
                    AND E.EMPNO = S.EMPNO
                    AND S.SALMONTH = '202306')
    AND S1.SALMONTH = '202306'
    AND A.EMPNO = B.MGR;





--����ڵ�
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
 
 --��ȸ�� ����
SELECT * FROM SALARY
    WHERE SALMONTH = '202306'
    ORDER BY SAL DESC;



--������ ��������(ALL ������ ���)
--�μ��ڵ尡 30���� ������ �޿��� �̻����� �޴� ��� ������ ��ȸ�ϴ� ����
--������ 202306
--��ȸ�׸� : ������, �޿���
SELECT ENAME, SAL
    FROM EMP E1, SALARY S1
    WHERE E1.EMPNO = S1.EMPNO
    AND S1.SALMONTH = '202306'
    AND SAL > ALL (SELECT SAL  --8400, 5900
                        FROM EMP E, SALARY S
                        WHERE S.SALMONTH = '202306'
                        AND S.EMPNO = E.EMPNO
                        AND E.DEPTNO = '30');
--�� �������� �� -> 8400�� 5900���� ū ��  => ��, 8400���� ū �� �� �ȴ�.
--ALL�� ���������� �ش��ϴ°� ��� ���� ��
--���������� �˻������ ��� ��ġ�ؾ� ��


--ANY ������ ���
--������ : �μ��ڵ尡 30���� �����޿� �� ���� ���� ��(5900)���� ���� �޿��� �޴� �������� �̸�, �޿��� ����ϴ� ����
--��ȸ�׸� : ������, �޿���

--�������� ���� �ϼ��ϱ�
SELECT MIN(SAL)
    FROM EMP E, SALARY S
    WHERE S.SALMONTH = '202306'
    AND S.EMPNO =E.EMPNO
    AND E.DEPTNO = '30';

--���� ���� GRUOP BY , HAVING�� �̿��� �Ȱ��� ����ϱ�
SELECT MIN(SAL)
    FROM EMP E, SALARY S
    WHERE S.SALMONTH = '202306'
    AND S.EMPNO =E.EMPNO
    GROUP BY DEPTNO
    HAVING DEPTNO = '30';

SELECT ENAME, SAL   --��� : 15��
    FROM EMP E1, SALARY S1
    WHERE S1.SALMONTH = '202306'
    AND S1.EMPNO = E1.EMPNO
    AND S1.SAL > (SELECT MIN(SAL)
                    FROM EMP E, SALARY S
                    WHERE S.SALMONTH = '202306'
                    AND S.EMPNO =E.EMPNO
                    AND E.DEPTNO = '30');
                    --�������������� �ݾ� �̱� ���ؼ� DEPTNO�� ��������� �ٱ����������� �ʿ����
    -- ���� ���̺� = ������ ���̺�    -> ���� ���̺��� ������!!! �������̺��� ����� �ǳĿ� ���� �������� �Ǽ��� �޶���!!
    
    --��Ƽ�������� ��� �귯������ PLAN�� ¥�°� SQL Ʃ����

--���� �� ���� -> ����� 15���� �����°� �´��� ����
SELECT COUNT(*) FROM SALARY WHERE SALMONTH = '202306' AND SAL > 5900; --�̷��� �ϸ� ������ �ȵ����� ������ �ϴ� �Ǽ�


--������ ��������(ANY ������ ���)
--ANY : OR�ǰ����̶�� �����ϸ� �� ���������� ����� �� �ϳ��� ��ġ�ϸ� ��
--ALL : AND�� ����
SELECT ENAME, SAL
    FROM EMP E1, SALARY S1
    WHERE S1.SALMONTH = '202306'
    AND S1.EMPNO = E1.EMPNO
    AND S1.SAL > ANY(SELECT SAL   --�������� ��� : 8400, 5900   ANY�� 8400�� 5900�� �ϳ� �̻��̸� �Ǵ°Ŵϱ� ��������� 5900�̻��ΰ� �� �ȴ�.
                        FROM EMP E, SALARY S
                        WHERE S.SALMONTH = '202306'
                        AND S.EMPNO =E.EMPNO
                        AND E.DEPTNO = '30');

SELECT SAL
    FROM EMP E, SALARY S
    WHERE S.SALMONTH = '202306'
    AND S.EMPNO =E.EMPNO
    AND E.DEPTNO = '30';
    
--ALL�� EXIST�� ��ġ���α׷� ���� ���� ���δ� (��ġ���α׷� : �ϰ����α׷�)

--EXISTS / NOT EXISTS
SELECT A.EMPNO  --��������
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR
    AND A.DEPTNO = '20';


--DEPT -> EMP ->SALARY
SELECT EMPNO, ENAME
    FROM EMP
    WHERE EXISTS (SELECT A.EMPNO    -- EXISTS�� ���������� �ִ� ����� ������ TRUE,  NOT EXISTS�� ����Ŀ�� ����� �ƹ��͵� ����� TRUE
                    FROM EMP A, EMP B  --�������� �ȿ� SELECT 1�� ���൵ ������� -> Į���� �������� ���̾ƴ� �����Ͱ� �����ϴ��� ���ϴ�����
                    WHERE A.EMPNO = B.MGR --�Ǵ��ϴ� ���̱� ������ ���� Į���� �������� �ʾƵ� �ȴ�.
                    AND A.DEPTNO = '20');

--NOT EXISTS
SELECT EMPNO, ENAME
    FROM EMP
    WHERE NOT EXISTS (SELECT A.EMPNO    -- EXISTS�� ���������� �ִ� ����� ������ TRUE,  NOT EXISTS�� ����Ŀ�� ����� �ƹ��͵� ����� TRUE
                    FROM EMP A, EMP B
                    WHERE A.EMPNO = B.MGR
                    AND A.DEPTNO = '80');


--������ ��õå : ��뷮 �����ͺ��̽� �ַ�� (����:��ȭ��)- SQLƩ�� �����Ҷ� ����


--�ζ��κ�(FROM���� �������� ���) 
--�ζ��κ� ���� ����!! �� ����� �˾ƾߵ�!!
--�ζ��κ信�� ����ڵ带 �������� �۱����� ����
--���̺��� ������ �ʴ� ��찡 ���� �� �ִ� -> �����ֱ� ���ؼ� �Ϻθ� ���� ��� ������� ���� �����
--�ζ��κ並 �̿��� ��翡 �����ϴ� ����
SELECT E.EMPNO, E.ENAME, E.JOB
    FROM EMP E,
            (SELECT DISTINCT A.EMPNO  --�Ѹ��� ������ �������� ����� �����ϴϱ� �����ǳ��ͼ� DISTICT �ؾ��� , EE�� ������ ���� SELECT ���� �ִ� ���ε� ������ A.EMPNO�ۿ� ��� A.EMPNO�� ������ 
                FROM EMP A, EMP B
                WHERE A.EMPNO = B.MGR
            ) EE --�ӽ������� ��������� ��, ���� ��Ī�� EE�� ����
    WHERE E.EMPNO = EE.EMPNO;

--�ζ��κ� ���������� �̿��Ͽ� 
--������ �޿��� 8000�̻��� ������ ������ ��ȸ�ϴ� ���� �ۼ�
--��ȸ �׸� : ������ȣ, ������, ����, �޿���
--��, �ζ��κ� �������������� �����ڹ�ȣ(������ȣ)�� ��ȸ�ϰ� �ݾ�üũ�� �����Ͽ� ���� �ۼ�
--ȥ�� �غ���
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

--�������
--�������� ���� �ۼ�
SELECT DISTINCT E.EMPNO
    FROM EMP E, SALARY S, EMP E2
    WHERE E.EMPNO = E2.EMPNO
    AND E.EMPNO = S.EMPNO
    AND S.SALMONTH = '202306'
    AND S.SAL > 8000;

--�������� ��ġ��
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
    WHERE  1=1      --1=1�� ���̹Ƿ� �ƹ� ���� ����
    AND A.EMPNO = EE.EMPNO;

--MINUS ������
--�տ��̾� SELECT���� ���������ؼ� �ڿ����� SELECT ���� ��
--��縦 �A ����鸸 �̰� �ʹ� = EMP ���̺��� ����ڵ常 ����
SELECT EMPNO, ENAME
    FROM EMP
MINUS 

SELECT DISTINCT A.EMPNO, A.ENAME
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR;


--�Ի����� 2022�� 01�� 01�� ���� �Ի��� �� ������ ������ �����鸸 ��ȸ�ϴ� ����
--��ȸ�׸� : ������ȣ, ������, ����, �Ի���(YYYY-MM-DD)
--ȥ�������� Ʋ����
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


--MINUS ���
SELECT EMPNO, ENAME, E.JOB, TO_CHAR(E.HIREDATE , 'YYYY-MM-DD')
    FROM EMP 
    WHERE E.HIREDATE > '220101'
    
MINUS

--���常 ���ϱ� �̰Ÿ� MINUS�� ��ü���� ���� ������ ������ �����鸸 �����°�
SELECT A.EMPNO --��������
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR
    AND A.HIREDATE > '220101';


--�ܸӸ�
SELECT EMPNO, ENAME, JOB, TO_CHAR(HIREDATE , 'YYYY-MM-DD')
    FROM EMP
    WHERE JOB NOT IN('����', '����')
    AND HIREDATE >= '20220101';
    
    
--����ڵ�
SELECT EMPNO, ENAME, JOB, TO_CHAR(HIREDATE,'YYYY-MM-DD')
    FROM EMP
    WHERE HIREDATE >= '20220101'
--HIREDATE >= '20220101' �̷��� �ϸ� HIREDATE�� �ڵ�����ȯ ����, ������ �����ڵ� �ƴ� (���ʿ� �ִ� �� �ǵ帮�� ����)
--FULL SCAN ���̺��� ó������ ������ ��ĵ�ϴ°�
--WHERE  TO_CHAR(HIREDATE,'YYYY-MM-DD') >= '20220101'  �� �ϸ� EMP ���̺��� �����͸� ���� �޸𸮿� �ø��� Į������ �ϳ��ϳ� �ٲ㼭 ���� ����
--HIREDATE >=TO_DATE('20220101','YYYY-MM-DD') �̷��� �ϸ� ���������� ������ ������  �ִٰ� �������ִ°Ŷ� ���� ������� ���� ����

MINUS

SELECT A.EMPNO, A.ENAME, A.JOB,  TO_CHAR(A.HIREDATE,'YYYY-MM-DD')
FROM EMP A, EMP B
WHERE A.EMPNO = B.MGR;


--�ζ��� ��� �����
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


--����)�޿����� 6500�̻��̸鼭 20230101 ���� �Ի����� ������ ������ �����鸸 ��ȸ�ϴ� ����
--��ȸ �׸� : ������ȣ, ������, ����, �޿���, �Ի���(YYYY-MM-DD)
--202306 ����
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

--�̰� �ζ��κ�ε� �غ���


--����)�޿����� 6500�̻��̸鼭 20230101 ���� �Ի����� ������ ������ �����鸸 ��ȸ�ϴ� ����
--��ȸ�׸� : ������ȣ, ������, ����, �޿���, �Ի���(YYYY-MM-DD)
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
   AND C.SALMONTH = '202306'; --�̰� �ȳ����� ���̳���
   

--����)�޿����� 6500�̻��̸鼭 20230101 ���� �Ի����� ������ ������ �����鸸 ��ȸ�ϴ� ����
--��ȸ�׸� : ������ȣ, ������, ����, �޿���, �Ի���(YYYY-MM-DD)
--ȥ��Ǯ���
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
    --AND C.SALMONTH = '202306'; �̰� �־����� �ʾ���
    --�̰� �־����� ������ �� ���̺��� ����� ��û ���� ����
    --���� �����̺��� �������� �ϱ� ������ ������� ������ ������ SALARY TABLE ���� SALMONTH��PK�� �����ֱ� ������
    --�־�����Ѵ�.
    --�� PK�̶� ������ϴ���??
    --���� ������ ��������

--minus�� �� ���̺��� ���ڵ� �Ǽ����� ���� ���̺��� �Ǽ��� ���ִ� ��
--minus�� �����̺��� select ���� ���� �÷��� ���� ���� ���̺���  select ���� ���� �÷��� ���� ���ƾ��Ѵ�!!!
--select���� �ʿ���Į������ ���� �����͵������� ���� �������� �ȵȴ�
--�������������� order by ���� ����
--������ ���̺��̹Ƿ� RDBMS���� �޸𸮸� ������ ���� �� ���������� �������� ����
--
