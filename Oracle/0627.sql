COMMENT ON TABLE EMP IS '��������';
COMMENT ON COLUMN EMP.EMPNO IS '������ȣ';
COMMENT ON COLUMN EMP.ENAME IS '������';
COMMENT ON COLUMN EMP.JOB IS '����';
COMMENT ON COLUMN EMP.MGR IS '����ȣ';
COMMENT ON COLUMN EMP.HIREDATE IS '�Ի���';
COMMENT ON COLUMN EMP.SAL IS '�޿�';
COMMENT ON COLUMN EMP.COMM IS '���ʽ�';
COMMENT ON COLUMN EMP.DEPTNO IS '�μ��ڵ�';

--���̺� ���� ��  �ܷ�Ű(FK)����
ALTER TABLE EMP ADD CONSTRAINTS FK_MGR  FOREIGN KEY(MGR)
REFERENCES EMP(EMPNO);

--ALL_, DBA_, USER_ �� �����ϴ°� -> �����ͻ��� ��
--������ �ߵǾ��մ��� Ȯ���ϴ� �뵵�̴�.


--���̺� Ŀ�� �߰�
ALTER TABLE EMP ADD USER_NAME VARCHAR2(10);  --ALTER ADD �÷��߰� ����

--���̺� ��Ű������ ��ȸ 
--DESC EMP;

--�÷� Ÿ�� ����
ALTER TABLE EMP MODIFY(USER_NAME VARCHAR2(20));  --MODIFY�� ������ Ÿ�� ����

--�÷��� ����
ALTER TABLE EMP RENAME COLUMN USER_NAME TO  USER_F_NAME;

--�÷� ����
ALTER TABLE EMP DROP COLUMN USER_F_NAME;

--������ �������� ������ Ȯ��
SELECT * FROM ALL_CONS_COLUMNS
WHERE TABLE_NAME = 'EMP' OR TABLE_NAME = 'DEPT';


--�μ� DEPT ���̺� INSERT��
INSERT INTO DEPT (DEPTNO, DNAME, LOC)
VALUES ('10','�ѹ���','���ﰭ����');
--DB���������� �����̶�� ��
--INSERT�� �ϰ� COMMIT�� ���ϸ� �ٸ� ���ǿ��� Ȯ���� �� ����
--�׷��� ���� ���� COMMIT���ϸ� �ٸ� ����� DB��������� ���� ������ �߸��� �� ����

INSERT INTO DEPT VALUES('20','�λ���','���ﰭ����');
--COMMIT�� �����ָ� DB���� LOCK�� �ɷ��� �Լ� ��� ���°� �ȴ�

INSERT INTO DEPT(DEPTNO, DNAME, LOC) VALUES('30','������','���︶����');
--PK�� �ݵ�� �־�����ϳ�, PK�� �ƴ� �ٸ� �͵��� NOT NULL�� �������� �ʾҴٸ� ���� �ȳ־��� ��� NULL�� ����

--SQL DEVELOPER���� �������ִ� ��
--���̺��� �巹�׾� ����ؿ��� �⺻���� Ʋ�� ������ �ش�
INSERT INTO Dept (
    Deptno,
    Dname,
    Loc
) VALUES (
    '40',
    '������',
    '�������α�'
);

INSERT INTO DEPT VALUES('50', '�渮��', '������Ǳ�');
INSERT INTO DEPT VALUES('60', '������', '���ﰭ�ϱ�');

--EMP INSERT
INSERT INTO EMP(EMPNO, ENAME, JOB, HIREDATE, SAL, COMM)
VALUES('1001','������','����', TO_DATE('2020-04-29', 'YYYY-MM-DD'), 9900, 1000);

INSERT INTO EMP VALUES('1002','�۹α�','����', '1001', TO_DATE('2020-06-14', 'YYYY-MM-DD'), 8500, 900, '20');
--VALUE 4��°�� ����ڵ�� FK�ε� ���⿡ PK�� �Ǿ� �մ����̺� ���� �����͸� ������ �������Ἲ ����!

INSERT INTO EMP VALUES('1010','���ϳ�', '�븮','1002', TO_DATE('2021-05-14', 'YYYY-MM-DD'), 6800, 50, '20');

INSERT INTO EMP VALUES('1011','������','���','1002',TO_DATE('2022-12-22', 'YYYY-MM-DD'), 4500, 100, '20');

INSERT INTO EMP VALUES('1012', '������', '���','1002', SYSDATE, 4500, 50, '20'); --SYSDATE�� ���� �ý����� ��¥�� ����

INSERT INTO EMP VALUES('1003', '�����', '����', '1001', TO_DATE('2021-03-07', 'YYYY-MM-DD'), 8500, 800, '30');
--�������� �Ϸ��� ������ �ؾ��ؼ� ������ Ʋ���� �ȵ�

INSERT INTO EMP VALUES('1013', '������', '�븮', '1003', TO_DATE('2022-07-02', 'YYYY-MM-DD'), 6000, 100, '30');

INSERT INTO EMP VALUES('1004','�����', '����', '1001', TO_DATE('2021-12-10', 'YYYY-MM-DD'), 8300, 850, '40');

INSERT INTO EMP VALUES('1014','����ȣ', '�븮', '1004', TO_DATE('2022-01-23', 'YYYY-MM-DD'), 7500, 700, '40');

INSERT INTO EMP VALUES('1015','���Ѽ�', '���', '1004', TO_DATE('2022-01-30', 'YYYY-MM-DD'), 7800, 650, '40');

INSERT INTO EMP VALUES('1005','������', '����', '1001', TO_DATE('2020-02-10', 'YYYY-MM-DD'), 8500, 900, '50');

INSERT INTO EMP VALUES('1016','�ڿ���', '�븮', '1005', TO_DATE('2021-11-05', 'YYYY-MM-DD'), 7000, 550, '50');

INSERT INTO EMP VALUES('1017','����ȣ', '���', '1005', TO_DATE('2022-06-20', 'YYYY-MM-DD'), 6800, 550, '50');

INSERT INTO EMP VALUES('1006','������', '����', '1001', TO_DATE('2020-01-22', 'YYYY-MM-DD'), 8800, 750, '60');

INSERT INTO EMP VALUES('1018','������', '�븮', '1006', TO_DATE('2020-03-22', 'YYYY-MM-DD'), 6700, 550, '60');

INSERT INTO EMP VALUES('1019','�ڼ���', '���', '1006', TO_DATE('2021-08-20', 'YYYY-MM-DD'), 6000, 600, '60');

INSERT INTO EMP VALUES('1007','�̿�ȿ', '����', '1001', TO_DATE('2020-03-22', 'YYYY-MM-DD'), 8900, 800, '10');

INSERT INTO EMP VALUES('1020','�ӷ���', '�븮', '1007', TO_DATE('2020-06-21', 'YYYY-MM-DD'), 6900, 700, '10');

INSERT INTO EMP VALUES('1021','�ǹ̸�', '���', '1007', SYSDATE, 6100, 580, '10');
--RR/MM/DD���� RR�� �������� �� ���ڸ� �ڸ��� �ڿ� ���ڸ��� ǥ���ϰڴٴ� ��

COMMIT;
ROLLBACK;


--FK ���� �� PK�� �ƴѰ�� ����
ALTER TABLE EMP ADD(DNAME VARCHAR2(20));

ALTER TABLE EMP
ADD CONSTRAINTS FK_ENAME FOREIGN KEY(ENAME) REFERENCES DEPT(DNAME);

SELECT * FROM ALL_CONS_COLUMNS WHERE TABLE_NAME = 'DEPT';

ALTER TABLE EMP DROP COLUM DNAME;

--UPDATE
UPDATE EMP
    SET COMM = COMM + 10;
--�ϳ��� ���ڵ� ������ COMM
--WHERE�� �����Ƿ� ���̺��� ��� ���ڵ尡 ����� �Ǿ ��� �����Ͱ� 10�� �þ

UPDATE EMP
    SET COMM = COMM + 500  -- ����Ŭ���� =�� �������� ���� ���ʿ� �����ض�
WHERE EMPNO = '1001';
--����Ŭ���� UPDATE���� ������Ʈ�� ��ȯ���� ó�� �Ǽ��̴�.

--����Ŭ���� ���ٴ� =, �ٸ��ٴ� != �Ǵ� <>
ROLLBACK;

--DELETE ����
--�̷��Ŵ� �DB�� �ƴ� ����DB(����DB)���� ��
--���̺� ����(PK, FK�� ������� ����)
CREATE TABLE EMP_TMP1 AS
SELECT * FROM EMP;       --�̷��� �ϸ� EMP�� �״�� �����ؼ� EMP_TMP1�� ������
--�� ���̺� ��Ű���� �����͸� ����Ǵ� ������ PK, FK���� �͵��� ������� �ʴ´�

DELETE FROM EMP_TMP1;  --WHERE ���� DELETE -> 19���� ���� ������

DELETE FROM EMP_TMP1
    WHERE MGR = '1001';  --MGR �� 1001�� ������ 6���� ������

ROLLBACK;

DROP TABLE EMP_TMP1;

TRUNCATE TABLE EMP_TMP1;  --TMP1�� �߷Ƚ��ϴ� ��� �߸鼭 ������ �����


--SELECT ��ȸ
SELECT *
    FROM EMP;  --��� �÷�, ������ ������ ��µ�
    
SELECT EMPNO, ENAME, JOB         --������ȣ, ������, ����
    FROM EMP
    WHERE EMPNO = '1001';
    
SELECT *
    FROM EMP
    WHERE EMPNO > '1015'; -- 1016~1021

SELECT *
    FROM EMP
    WHERE COMM > 550; 

SELECT *
    FROM EMP
    WHERE EMPNO >'1015'
    AND COMM > 550;

SELECT *
    FROM EMP
    WHERE EMPNO >'1015'
    OR COMM > 550;


--������ȣ�� 1020�� �̻��̸鼭 ���ʽ��� 500���� �̻��� ����������ȸ
SELECT EMPNO, ENAME, JOB --������ȣ, ������ , ����
    FROM EMP
    WHERE EMPNO >= '1020'
    AND COMM >= 500;


--��ȸ�׸��� ������ȣ, ������, ����, �޿�+���ʽ�, �μ��ڵ�
--����ڵ尡'1001'�� ���� ����������ȸ
SELECT EMPNO, ENAME, JOB, SAL + COMM, DEPTNO  --SELECT������ ��(���)�� �;��Ѵ�.
    FROM EMP
    WHERE  MGR = '1001';

--��ȸ�׸��� ������ȣ, ������, ����, �޿�+���ʽ�, �μ��ڵ�
--������ȣ�� '1010' �̻��� �����̸鼭 �ѱ޿�(�޿�+���ʽ�) 9500�̻��� �������� ��ȸ
SELECT EMPNO AS ������ȣ, ENAME ������, JOB ����, SAL + COMM AS �̴ޱ޿�, DEPTNO �μ��ڵ�
    FROM EMP
    WHERE EMPNO >= '1010'
    AND SAL+COMM >= 8000;
    --EMP�� pk�� EMPNO�̱� ������ AND SAL+COMM�� �ᵵ �������� ����
    --����Ŭ�� ������ �Ʒ�,���ʿ��� ���������ν����ϱ� ������ and�� or�� ���� ���� �� �տ�(����)���������� ����
    
SELECT DEPTNO
    FROM EMP
    WHERE EMPNO = '1001';
    
--����Ŭ���� �����ϴ� �Լ� ���
SELECT NVL(DEPTNO, '00') AS "�μ� �ڵ�"
    FROM EMP
    WHERE EMPNO = '1001';

--�޿� ���̺� ����
CREATE TABLE SALARY(
    SALMONTH CHAR(6),
    EMPNO CHAR(4),
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    CONSTRAINT PK_SALARY PRIMARY KEY(SALMONTH, EMPNO)
    );

INSERT INTO SALARY
SELECT '202305', EMPNO, SAL, COMM
    FROM EMP;
    
--���θ���
INSERT INTO SALARY
SELECT '202306', EMPNO, SAL-100, COMM-50
    FROM SALARY
    WHERE SALMONTH = '202305';
    
COMMIT;

ALTER TABLE EMP DROP COLUMN SAL; --PK�� �ƴϱ� ������ DROP����
ALTER TABLE EMP DROP COLUMN COMM;
    
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'SALARY';
SELECT * FROM ALL_CONS_COLUMNS WHERE TABLE_NAME = 'SALARY';

SELECT *
    FROM SALARY
    WHERE SALMONTH = '202305'
    AND EMPNO = '1001';   --���� �޿����̺��� EMPNO�����θ� �� �� �� ��� ����� �ʿ��Ѱ�'
    --SALARY ���̺��� EMPNO�� FK��
    --����Ű ������ PK ������� �ϴ°� ���� -> CONSTRAINT PK_SALARY PRIMARY KEY(SALMONTH, EMPNO)�� �߱⶧����
    --PK�� ������ SALMONTH�� ����,  EMPNO�� �ι�° PK�� �Ǵ� ���̴�
    