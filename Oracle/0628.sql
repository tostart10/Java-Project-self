--NULL �� �ƴ� ��츸 ��ȸ
--(NULL : IS NULL, NULL�� �ƴѰ� üũ : IS NOT NULL
SELECT '[' || ENAME || ']-[' || JOB || ']' AS "������� ����"  --AS�Ƚ��ָ� �ڵ����� �̸�������
    FROM EMP
    WHERE MGR IS NOT NULL;
    --�̰Ŵ� ���������� �� ���� ���

--UPPER. LOWER, INITCAP
SELECT UPPER('manager'), LOWER('mANAger'), INITCAP('manager')
    FROM EMP
    WHERE JOB LIKE 'man%';
--WHERE UPPER(JOB) LIKE 'MAN%'
--Ư�� ���̽��� �ƴ��̻� ���ʿ� �ִ� ���� �������� �ʴ� ���� ��Ģ!!
--> ()�� ���� ���ڵ��� �ҹ���,�빮�� ��Ȯ�ϰ� ���ִ� ���� ����
--> ��ó�� JOB�÷��� �� WHERE ���� �����ۿ� ���� Ư���� ��쿡���Ѵ�

INSERT INTO SALARY(SALMONTH,EMPNO, SAL)
VALUES('202306', '2001', 5500);

INSERT INTO SALARY(SALMONTH,EMPNO, SAL)
VALUES('202306', '2002', 6000);

INSERT INTO SALARY(SALMONTH,EMPNO, SAL)
VALUES('202306', '2003', 5800);
--���� �̰Ŵ� SALARY TABLE�� FK�� ���������� �ʾƼ� �����Ѱ���

COMMIT;


--NVL��NULL �̸� ���� ���Ѵ�.?  NVLó���� �ϰ� 100�� ���Ѵ�
SELECT COMM
    ,TO_CHAR(NVL(COMM, 0) + 100, '9,999,990')  
    ,NVL(COMM, 0) - 10
    ,TO_CHAR(NVL(COMM, 0) * 3, '9,999,990')
    ,NVL(COMM, 0) / 2
    FROM SALARY
    WHERE SALMONTH = '202306';
    --WHERE COMM IS NULL;
    
    --TO_CHAR()�� ()�ȿ� �� �ִ� ���� ���ڷ� �ٲ�
    --TO_DATE ()�ȿ� �� ���� ��¥�� ����
    
--BETWEEN
SELECT *
    FROM SALARY
    WHERE  SALMONTH = '202306'
    AND COMM BETWEEN 300 AND 800;
    --PK�� SALMONTH ���ǹ��� �� ���� ���� ���������� �ؿ� ���� ���� ��������

--IN : ������ȣ�� 1001, 1002, 1003,1004,1005 ��ȸ
SELECT *
    FROM EMP
    WHERE EMPNO IN('1001', '1002', '1003', '1004', '1005'); --EMPNO�� ��ȣ�� �������̸� �񱳿����ڷ� ������ ���ؼ� �� �ȿ� �ִ� ���� ������ ���� ����
    --IN ���� �ڿ��� ���� =����  ���� �ڵ带 ���� ��� 1005���� ���� �������� 1001�� ���������� ���ؼ� �����´�
    
--LIKE
SELECT *
    FROM EMP
    WHERE ENAME LIKE '��%';
    
--DUAL ���̺�
SELECT SYSDATE
    FROM DUAL;

--ROUND:�ݿø�, TRUNC : �߶�, MOD:���� ������
SELECT ROUND(10.157, 1)
        ,TRUNC(10.157, 1)
        ,MOD(10,3)
    FROM DUAL;

--����ó���Լ� : LENGTH, CONCAT, SUBSTR, REPLACE
SELECT LENGTH('ABC')
    ,CONCAT('ABC', 'DEF')
    ,SUBSTR('ABCDEF', 3,2)
    ,REPLACE('DD', 'DD', 'ABCDE')
    FROM DUAL;
    
--��¥�Լ�
SELECT SYSDATE
        ,SYSTIMESTAMP
        ,ADD_MONTHS(SYSDATE,1)
        ,MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 1), SYSDATE)
        ,NEXT_DAY(SYSDATE, '�����')
        ,LAST_DAY(SYSDATE)
        ,ROUND(SYSDATE, 'month')  --���� ��¥�� �������� month 1 ����, ROUND�� 15���� �������� �ݿø���
        ,TRUNC(SYSDATE, 'month')  --���� ���ڸ� �������� ���� �ϰ� month ���
    FROM DUAL;


--��¥ ����
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD')
    ,TO_CHAR(SYSDATE, 'YYYY/MM/DD')
    ,TO_CHAR(SYSDATE, 'YYYY-MM-DD')
    ,TO_CHAR(SYSDATE, 'YYYY=MM-DD- HH24:MI:SS')
    ,TO_CHAR(SYSDATE, 'MM/DD')
    ,TO_CHAR(SYSDATE, 'FMMM/DD')
    FROM DUAL;
    
    
--�����ڷ� ��¥ ����
SELECT TO_CHAR(SYSDATE, 'YYYY"�� "MM"�� "DD"��"')
    ,TO_CHAR(SYSDATE, 'HH24"�� "MI"�� "SS"��"')
    FROM DUAL;

--�ð��� ����,���� ǥ��
SELECT TO_CHAR(SYSDATE, 'AM')
    ,TO_CHAR(SYSDATE, 'AM HH:MI:SS')
    ,TO_CHAR(SYSDATE, 'YYYY-MM-DD AMHH:MI:SS')
    FROM DUAL;

--��ȯ�Լ�
SELECT TO_CHAR(SYSDATE, 'YYYY.MM.DD')
    ,TO_NUMBER('12345')
    ,TO_DATE('20230305', 'YYYYMMDD')
 FROM DUAL;


--�����Լ�(COUNT, MAX, MIN, AVG, SUM)
SELECT COUNT(*)
    FROM SALARY
    WHERE SAL >= 5000
      AND SAL <= 7000;

SELECT MAX(EMPNO) --� �÷��� MAX������ �˾ƾ��ϹǷ� ()�� *���� �ȵ�
    FROM EMP;
    
SELECT MAX(SAL)
    FROM SALARY
    WHERE SAL >= 5000
    AND SAL <= 7000;
    
SELECT MIN(EMPNO)
    FROM EMP;
    
SELECT MIN(SAL)
    FROM SALARY
    WHERE SAL >=5000   --������ AND ���� ���ǿ����ڸ� BETWEEN���� �ص� ��
    AND SAL <= 7000;
    
SELECT AVG(SAL) --, EMPNO �̷��� �ϸ� ����!! => �̷��� �ϸ� ����� �������ε� �����Լ��� ����� 1�� �̱⋚���� ����
    FROM SALARY
    WHERE SALMONTH = '202305';
    
SELECT SUM(SAL)
    FROM SALARY
    WHERE SALMONTH = '202305';
--�����Լ� ��� ���� �ǹ̸� ��Ȯ�� �˱�!!!
--�����Լ��� ����� ������ 1����!!!

--����)���� ��ȣ�� 1002 - 1006���� ������ ��������� �޿� �հ踦 ���Ͻÿ� (2023�� 6�� ����)
--��¿�) '4�� 32800��' ���� ����ϴ� ���� �ۼ� (��Ī : �����ο�, ���� �� �޿���)
SELECT COUNT(EMPNO) || '��' AS "�����ο�"  , SUM(SAL) ||'��' AS "���� �� �޿���"  --COUNT(*)�� �ص� �Ǳ������� SALARY ���̺� PK�� ������ EMPNO�� SALMONTH�� �ϳ��� ���ִ� ���� ����
    FROM SALARY
    WHERE SALMONTH = '202306'
        AND EMPNO BETWEEN 1002 AND 1006;
--COUNT() �ȿ��� PK�� �ش��ϴ� �÷����� �־��ִ� ���� ���� ����
--PK�� ���ĵǾ�����(������������??)
--PK�� ���������� �ּҰ��� ������ �ִ°��̱� ������ PK�� ����ϸ� ������ ã�� �� �ֱ⶧���� ���
--PK�� �߰��� ���� ���� �ٽ� ������ ���������ִ� ���� ���� �ִ�


--����)
SELECT COUNT(*), MAX(SAL), MIN(SAL), AVG(SAL), SUM(SAL)
    FROM SALARY
    WHERE SALMONTH = '202306'
        AND EMPNO BETWEEN 1002 AND 1006;

--�׷���(�����Լ�) GROUP BY
SELECT MGR, COUNT(*)
    FROM EMP
    WHERE MGR IS NOT NULL
    GROUP BY MGR;

--����)������ ���� �μ��ڵ庰 �ο����� ��ȸ�ϴ� ���� �ۼ�
SELECT DEPTNO, COUNT(EMPNO) 
    FROM EMP
    GROUP BY DEPTNO;
 --COUNT(EMPNO) �Ǵ� COUNT(*)�� �� �� ����


SELECT DEPTNO, COUNT(*) 
    FROM EMP
    WHERE DEPTNO IS NOT NULL
    GROUP BY DEPTNO
    HAVING COUNT(*) >= 3;
    
--����)���� ���̺��� �����ں� �����ϴ� ����� ���� ��ȸ�ϴ� �����ۼ�
--��, �����ڰ� ���� ����� �����ϰ� ���� ������� 3�� �̻��� ��츸 ��ȸ
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
    ORDER BY DEPTNO ASC, MGR DESC; --DEPTNO�� ������������ ������ �ǰ� �� �ȿ��� MGR�� ������������ ���ĵǴ� ����

--�޿����̺��� �޿����� ���� ���ʽ��� ���� ������ ��ȸ�ϴ� �����ۼ�
--��, �ݾ����θ� ó���ϸ� �ߺ�����(2023�� 6�� ����)
SELECT DISTINCT SAL, COMM
    FROM SALARY
    WHERE SALMONTH = '202306'
    ORDER BY SAL DESC, COMM ASC; --ODER BY �ϴ°��� 2���̸� SELECT���� �������� Į���� 2��������!!


--����
SELECT E.ROWID, D.ROWID, E.EMPNO, E.DEPTNO, D.DNAME, D.LOC --DEPTNO�� EMP���̺�� DEPT���̺� ���ʿ� ��� �����Ƿ� �� ��Ī�� ������� -> �� �÷��� ���� ���̺��ִٸ� �� ��Ī�� ������Ѵ� 
    FROM EMP E, DEPT D--���̺� ALIAS�� ���� ���̺��� �ձ��ڸ� ���� �ϴ� ���� ����
    WHERE E.DEPTNO IS NOT NULL;--= D.DEPTNO  --�̷��� ���ϴ� ������ NULL�� ����,  NULL�� ������ �ʴ´�
    --�տ��ִ� EMP���̺��� �������̺�, DEPT���̺��� �����̺���



--INNER JOIN
--��� ������ ���� �μ����� ��ȸ�ϴ� ������ �ۼ�
--��ȸ �׸��� '������ȣ, ������, ����, �μ��ڵ�, �μ���'
SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME
    FROM EMP E, DEPT D  --�̷��Ը� �ϸ� EMP 19�� * DEPT 6��
    WHERE E.DEPTNO = D.DEPTNO; --�̰� �����ϴ°���! EQJOIN�� �ߴٴ� ���� �Ȱ��ٴ� ����
    --�� WHERE������ ������ ����߸� �ϴ��� �ľ��ϱ�
    --������ �ϹǷν� E.DEPTNO�� ��ġ�ϴ� D.DEPTNO�� �ִ� ���ڵ帣 �ҷ��ͼ� ��ġ �ϳ��� ���ڵ� �ΰ� ó�� ����ϴ°�
    --WHERE E.DEPTNO IS NOT NULL�� �ϸ� �ȵ�!! �ϳ��ϳ� ���� �����ؼ� ��û���� ������ ��µ�
    
    --ROWID�� �ش������� ���ڵ尡 ��� �ִ��� ������ ������ ���� 
    --ROWID���� �ٲ� �� ����, ���� �ٲٷ��� �� ����� �ٽ� ��������

--SALARY FK ����
ALTER TABLE SALARY
ADD CONSTRAINTS FK_SALMONTH FOREIGN KEY(EMPNO)
REFERENCES EMP(EMPNO);

DELETE FROM SALARY
WHERE EMPNO IN('2001', '2002', '2003');

COMMIT;

