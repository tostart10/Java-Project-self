--VIEW
--�Ϲ�����(�������) �� �μ��ڵ尡 30���� ��������ȸ�ϴ� VIEW �ۼ�
--��ȸ�׸� : ������ȣ, ������, ����, �޿�, ���ʽ�
CREATE OR REPLACE VIEW V_EMP_DEPT20
AS (
    SELECT E.EMPNO, E.DEPTNO, E.ENAME, E.JOB, S.SAL, S.COMM
        FROM EMP E, SALARY S
        WHERE E.DEPTNO = '20'
        AND S.SALMONTH = '202306'
        AND S.EMPNO = E.EMPNO
        AND E.EMPNO NOT IN (SELECT DISTINCT A.EMPNO
                                FROM EMP A, EMP B
                                WHERE A.EMPNO = B.MGR));

--VIEW ������ȸ
SELECT * FROM USER_VIEWS;  --���� ������ ������ DBA �����̱� ������ SELECT * FROM DBA_VIEWS �� ���� ��� ����

SELECT *
    FROM V_EMP_DEPT20;  --�Ϲ������� VIEW�� FROM ���� ����

--����)VIEW�� �̿��Ͽ� �ش� ���� �������� �μ����� ��ȸ�ϴ� ���� �ۼ�
--��ȸ�׸� : ������ȣ, �μ��ڵ�, �μ���, ������
--��, �μ����� ������ ������ ��ȸ�׸��� VIEW ���ؼ� ��ȸ��
SELECT V1.EMPNO, V1.DEPTNO, D.DNAME, V1.ENAME
    FROM V_EMP_DEPT20 V1, DEPT D
    WHERE V1.DEPTNO = D.DEPTNO;

--�ζ��κ�� �並 ���� ��츦 ��� �����ұ�?
--�並 ���� ������ �ϳ� :�ڵ��� �ߺ����� ���̱� ����
--�並 ����ϸ� ���̺��� �����͸� �κ������� ������ �� �ִ�?
--���� ���� : ����Ŭ�� �����͸� �����Ѵ�(����Ŭ�� �����Ҷ����� �䰡 �ִ� �ű� ������ �޸𸮸� ������)

--VIEW��CREATE �� �� OR REPLACE�� �Ⱦ��� ������ �ִ� �並 �����ϰ� �ٽ� ����� �ǹǷ� ����� ���� ����
--VIEW�� DBA�� ���� ����ϴ°� �ٸ� -> DBA�� �޸𸮰� ���ڸ��ų� ������ �������� �޸𸮸� �����ϴ� �並 ������� ���� �� ����


--�ε����� ���̴� ������ �ʼ��� �˾ƾ���!!

--����)�޿��� 6500�̻��̸鼭 20230101���� �Ի����� ����� ������ �����鸸 ��ȸ�ϴ� ����
--��ȸ�׸� : ������ȣ, ������, ����, �޿���, �Ի���(YYYY-MM-DD)
--��, ������ VIEW�� �̿���
--�� SELECT ���� �������� �� ����� ���;���
SELECT V1.EMPNO, V1.ENAME, V1.JOB, S.SAL, V1.HIREDATE  --���⿡�� (V1.EMPNO �� �ǹ��ϴ� ���� V1.�� SELECT ���� ���� �÷��� ��Ī)�̴� 
    FROM SALARY S, V_EMP_V2 V1     --�� �並 ���鶧 ��Ī�� �����ְ� �� ��Ī�� ������Ѵ�  (�����̺�Ī.�丸�鶧������� ��Ī)
    WHERE V1.EMPNO = S.EMPNO      --Ư���� TO_CHAR(E.HIREDATE, 'YYYY-MM-DD')ó�� ���� �ٲ��� ��쿡�� ������ ��Ī�� �����ְ� ��Ī���� ����ϱ�!!!��
    AND S.SALMONTH = '202306'
    AND S.SAL >= 6500;

--ȥ���غ��� -> ������ ������ �並 ���鶧 �Ƚᵵ �Ǵ� ���̺��� ����
CREATE OR REPLACE VIEW V_EMP_V2
AS (
    SELECT E.EMPNO AS EMPNO, E.ENAME AS ENAME, E.JOB AS JOB, S.SAL AS SAL, TO_CHAR(E.HIREDATE, 'YYYY-MM-DD') AS HIREDATE
        FROM EMP E, SALARY S   --���⼭ SALARY ���̺� �Ƚ��� ���� -> �� ���̺� �����͸� ��ȸ�ϴ� ���ǿ� SAL�� ���� ������ ������ ��� ����
        WHERE  E.EMPNO NOT IN (SELECT DISTINCT A.EMPNO
                                FROM EMP A, EMP B
                                WHERE A.EMPNO = B.MGR)
        AND E.EMPNO = S.EMPNO
        AND S.SALMONTH = '202306'
        AND S.SAL >= 6500
        AND E.HIREDATE < TO_DATE('20230101' , 'YYYYMMDD'));
         --AND E.HIREDATE < TO_CHAR('20230101' , 'YYYY-MM-DD') �� �̰� ������ �ȵ���??
         -->E.HIREDATE�� DATEŸ���̱� ������ TO_CHAR�� �ƴ� ��_DATE �����ϰ�
         --('20230101' , 'YYYY-MM-DD')���� '20230101'�� ���İ� 'YYYY-MM-DD'�� ������ Ʋ���� �ȵ� -> ���� ��ġ���������
         --'20230101'�� �׳� ���ڿ��ٸ� �����߰����� ���� DATEŸ���̱� ������ ��������
         --����, ('20230101', 'YYYYMMDD')���� ������� �Ѵ�.
         

SELECT E.EMPNO , E.ENAME , E.JOB 
        FROM EMP E
        WHERE  E.EMPNO NOT IN (SELECT DISTINCT A.EMPNO
                                FROM EMP A, EMP B
                                WHERE A.EMPNO = B.MGR)
        AND E.EMPNO = S.EMPNO
        AND S.SALMONTH = '202306'
        AND S.SAL >= 6500


-- ���� ��Ī�� ���� �ּ������ظ� �������� ��
SELECT V1.������ȣ, V1.������, V1.����, S.�޿�, V1.�����  --���⿡�� (V1.EMPNO �� �ǹ��ϴ� ���� V1.�� SELECT ���� ���� �÷��� ��Ī)�̴� 
    FROM SALARY S, V_EMP_V2 V1     --�� �並 ���鶧 ��Ī�� �����ְ� �� ��Ī�� ������Ѵ�  (�����̺�Ī.�丸�鶧������� ��Ī)
    WHERE V1.EMPNO = S.EMPNO
    AND S.SALMONTH = '202306'
    AND S.SAL >= 6500;

CREATE OR REPLACE VIEW V_EMP_V2
AS (
    SELECT E.EMPNO AS ������ȣ, E.ENAME AS ������, E.JOB AS ����, S.SAL AS �޿�, TO_CHAR(E.HIREDATE, 'YYYY-MM-DD') AS �����
        FROM EMP E, SALARY S
        WHERE  ~~~~~~);


--����ڵ�(�並 �����ϴ� �ڵ�)
CREATE OR REPLACE  VIEW V_EMP_V2--OR REPLACE�� UPDATEó�� �������ִ� ��
AS (SELECT EMPNO, ENAME, JOB, HIREDATE
        FROM EMP
        WHERE HIREDATE < TO_CHAR('20230101' , 'YYYY-MM-DD')
    MINUS
    SELECT A.EMPNO, A.ENAME, A.JOB, A.HIREDATE
    FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR);

--�׻� �����ϱ� ���� �����Ͱ� ����� �������� ����
SELECT * FROM V_EMP_V2;


--ROWID��ȸ
SELECT ROWID, A.*
    FROM EMP A;
--ROWID�� �ߺ��� ����!!


--INDEX
SELECT * FROM USER_INDEXES;  --���⼭�� FK�� ���� ������ �ȳ����� PK�� ���� ������ ����!

--
SELECT * FROM USER_IND_COLUMNS
    WHERE INDEX_NAME = 'PK_EMP';

--
SELECT * FROM USER_IND_COLUMNS
    WHERE TABLE_NAME ='SALARY';



--�ε��� �߰�
CREATE INDEX EX_EMPNO ON SALARY(EMPNO, SAL);
--��Ƽ�������� �Ǵ��� �帮�� �ʱ� ���� �ε����� ����
--�ε����� ���� ���� ���� ���? WHERE���� ���� �÷��� �󵵼��� ������
--�ε����� ���� �ȵǴ°�!! -> ���� ��� �����̶�� Ȯ���� ��(50%)�̹Ƿ� �̰Ŵ� �ε����� ��°� ���� �׳� ó������ �����͸� �����°� �� ����
--�ش����̺��� �������� �󵵸� ���� �ε����� ��ƾ���!!
--WHERE���� ���ٰ� ��� �ε����� ��°� �ƴ�
--�ش絥������ �󵵸� ������ 40%������ �ε����� ���� ����

--������ ������ �� 3: 7�� ��쵵 ��������� �� 7�ΰ�쿡�� �ε��� ���°�찡 �� �����ŵ�,,
--����Ŭ�� ��Ʈ��°��� ��Ƽ�������� ��θ� �������ִ� �����


--�ε��� ������
ALTER INDEX PK_EMP REBUILD; --�̸��� PK_EMP�ΰ��� �ٽ� ������ ��� ��
--�ε��� ������� �����͸� �� ���� ������ ������Ѵ� -> �ε��� �����尡 ���������� DB�� ���ɸ��� ����
SELECT 'ALTER INDEX' || INDEX_NAME || ' REBUILD;'  --��������ǥ �ȿ� �����ݷ�; �� �־������
    FROM USER_INDEXES
    WHERE TABLE_OWNER = 'C##SISTUSER' --����Ŭ ����  //������ �ٲ㼭 ������ ��
    AND INDEX_NAME LIKE 'PK_%';   --���ڸ����� �ε����� / ���������� ������ �״�� �������� ���ٸ� ���ְų�

ALTER INDEX PK_DEPT REBUILD;
ALTER INDEX PK_EMP REBUILD;
ALTER INDEX PK_SALARY REBUILD;


--��� --�ش絥������ �󵵸� ������ 40% ���� �ƴ���?


--������
--������ ����
CREATE SEQUENCE EX_SEQ
INCREMENT BY 1  --1������
START WITH 60
MINVALUE 10
MAXVALUE 99
NOCYCLE
NOCACHE;

--USER_SEQUENCES�� ������ ������
SELECT * FROM USER_SEQUENCES;

INSERT INTO DEPT VALUES(EX_SEQ.NEXTVAL, '��ȹ��', '����ø�����');
--NEXTVAL�� ��������� ���� �������� ������
--���� �������� ���� 60�̶��,  �������� ������ ��INCREMENT BY 1 ��� �ߴٸ� 1�������Ǵµ� �׷��ٸ� ���� �������� ���� 61�̴�.

-- ~�� �������� ȣ���Ҷ� ���� �����ȴ�
--ĳ�ô� ����Ʈ�� 20����, ���� ĳ�� 5�ϸ� 5�� �����ٳ���

--���� �������� ������� ��ȸ(Ȯ��)
--EX_SEQ.CURRVAL(��������.CURRVAL)  CURRVAL�� ���� �������� ���� ������
SELECT EX_SEQ.CURRVAL
FROM DUAL;


CREATE SEQUENCE EX_SEQ2
INCREMENT BY 1  --1������
START WITH 1
MINVALUE 1
MAXVALUE 99
NOCYCLE
NOCACHE;

SELECT EX_SEQ2.NEXTVAL
FROM DUAL;
--�������� Ư¡ : NEXTVAL�� �ϰ� �����ؾ� ���´�
--USER_SEQUENCES�� ��ϸ� �س��� ������ ���� �޸𸮴� �ö��� ����, �ڵ����� �޸𸮰� �ö��� �ʱ� ������ NEXTVAL�� ����� �޸𸮿� �ö󰣴�.
--�������� �����Ҷ� NEXTVAL�� ���ϸ� CREATE SEQUENCE�� ��ϸ� �س��� �޸𸮰� �ö��� ��������
--NEXTVAL�� �ϸ� �޸� ����(�Ҵ�?)�� �Ǿ� �������� ���۵Ǵ� ��?

CREATE SEQUENCE EX_EMPNO_SEQ
INCREMENT BY 1  --1������
START WITH 3000  --3000���� ����
MINVALUE 1     --���� ���� ��  -> CYCLE�� �س������� 9999���� ������ ���������� 1���� ���۵�
MAXVALUE 9999
NOCYCLE   --3000���� �����ؼ� 9999���� �������� ���ư��� �ʰ� ������
NOCACHE;   --DEFAULT�� NOCACHE��,  ĳ�ø޸𸮿� �ִ� 20���� �޸𸮸� �÷����� ȣ���Ҷ� �÷����� �޸𸮸� �����ش�
--����Ŭ ���� �޸𸮸� ����ϱ� ������ CACHE �� �Ⱦ�

--����
INSERT INTO EMP(EMPNO, ENAME, HIREDATE, DEPTNO)
VALUES (EX_EMPNO_SEQ.NEXTVAL, '�׽�Ʈ1', SYSDATE, '20');
--�������� �ܵ���
--���������� ����������
--��������� : ���� ���̺��� Ŀ�Ի��¿����� �������
--NEXTVAL�� �ϸ� �������Ἲ������ ���� ����
--***�������� Ư�� ���̺� Ư������ �ִµ� PK�� �ش��ϴ� ���� 1�� �����Ǿ���� �� ���
--������(EX_EMPNO_SEQ.NEXTVAL)�� �⺻���� ������Ÿ���� NUMBER��

INSERT INTO EMP(EMPNO, ENAME, HIREDATE, DEPTNO)
VALUES (TRIM(TO_CHAR(EX_EMPNO_SEQ.NEXTVAL, '0009')), '�׽�Ʈ1', SYSDATE, '20');  --TO_CHAR(EX_EMPNO_SEQ.NEXTVAL, '0009')�̷��Ը� �ϸ� ������� 4�ڸ����ƴ� 5�ڸ��� �Ǽ� ������
COMMIT;

INSERT INTO EMP(EMPNO, ENAME, HIREDATE, DEPTNO)
VALUES ('A' || TRIM(TO_CHAR(EX_EMPNO_SEQ.NEXTVAL, '0009')), '�׽�Ʈ1', SYSDATE, '20');  --EX_EMPNO_SEQ.NEXTVAL�̰� �����ΰ���
--0009�� 4�ڸ��� �� ä�����ϴµ�, 000�κ��� ���ڰ� ������ ������ 0�� ������¶�

--���� ����
--ȸ�翡���� �̷������� �����
SELECT 'A' || TRIM(TO_CHAR(EX_EMPNO_SEQ.NEXTVAL, '0009')), FROM DUAL;

--REPLACE(���ڿ�, ã������, ���湮��)
--REPLACE(���ڿ�, ' ', '') --���ڿ����� �����ϳ��� ���ֱ� ����

--�̷����ϸ� �������ӽÿ� ���Ἲ ���� ������ ����(���Ἲ�������� ����)
INSERT INTO EMP(EMPNO, ENAME, HIREDATE, DEPTNO)
VALUES ((SELECT MAX(EMPNO)+1 FROM EMP) , '�׽�Ʈ1', SYSDATE, '20'); --�ȿ� �������� ����
--INSERT�ϴ� ������ +1�� ��

--�������� : ��������� ���ÿ� ���� ��Ʈ��ũ�� �����ϴ°� (�𵵽������� ������ ���������� ���̴°���

--�̴�������Ʈ���� ���̺� �����
/*1. ȸ�����̺�(�����)
���̺���� T_USER�� ����, ȸ�����Խ� �ʿ��� �÷��� �����ϰ�, ȸ������(���(Y), ����(N))�� ������ �� �ֵ��� ����
�� �÷��� ���� COMMENT�� �����Ͽ� �÷��� �ǹ̸� ������ �� �ֵ���
����� ���̵� PK�� ������.(��, ���̺� ���� �� PK����)
(Ÿ�԰� ���̸� �� �̷��� ���ߴ���
�� �÷��� �� �ʿ�����
�� ���̺��� �� �ʿ��ϴٰ� �����ؼ� �־������� ������ �� ������ ��)
(ȸ�����̺�� �Խ��� ���̺� �����)
(���ο� ���� ����� ������� ���۱��� �Ұ���)

2. �Խ��� ���̺�(��� ���� ����)
�Խ��Ǳ۹�ȣ�� NUMBER(12)�� ���ϰ� �������� SEQ_BOARD�� �Ͽ� ������  -> PK,FK�� ���Ѱ� �� �����ؾ���
�� �÷��� ���� COMMENT�� �����Ͽ� �÷��� �ǹ̸� ������ �� �ֵ���
�Խ��� �۹�ȣ�� PK�� ������.(��, ���̺� ���� �� PK����)
�Խ��� ��ȸ������ �����Ѵ�. ũ��� �Խ��� �۹�ȣ�� �����ϰ� ����.
�Խ��� ���̺��� ������, �۳���(TEXTAREA), ��ȸ����(�����ȸ�����) ��..
�۳����� CLOB()�̿�?

����÷��, �̹��� ÷�� �̷��� ����
*/

/*1. ȸ�����̺�(�����)
���̺���� T_USER�� ����, ȸ�����Խ� �ʿ��� �÷��� �����ϰ�, ȸ������(���(Y), ����(N))�� ������ �� �ֵ��� ����
�� �÷��� ���� COMMENT�� �����Ͽ� �÷��� �ǹ̸� ������ �� �ֵ���
����� ���̵� PK�� ������.(��, ���̺� ���� �� PK����)
*/
CREATE TABLE T_USER(
    --USERNO CHAR(2) CONSTRAINT PK_DEPT PRIMARY KEY,  
    USERID VARCHAR2(20) CONSTRAINT PK_T_USER PRIMARY KEY,
    UNAME VARCHAR2(20),
    REGISTDATE DATE,
    UPW VARCHAR2(20),
    EMAIL VARCHAR2(20),
    BDAY DATE,
    PHNOENUM VARCHAR2(11),
    USTAUTS CHAR(1)   --CHECK �Ӽ����� Y,N�� �� �� �ֵ���/ ���̺� ������ �÷��� üũ��� �˻��ϸ� ��(CHECK��� ������ ����)
);

--CHECK�Ӽ� �߰�
ALTER TABLE T_USER ADD CONSTRAINT USTAUTS_CK CHECK(USTAUTS IN ('Y', 'N'));

COMMENT ON TABLE T_USER IS 'ȸ�����̺�';
--COMMENT ON COLUMN T_USER.USERNO IS '����ڹ�ȣ';
COMMENT ON COLUMN T_USER.UNAME IS '������̸�';
COMMENT ON COLUMN T_USER.REGISTDATE IS '������';
COMMENT ON COLUMN T_USER.UPW IS '��й�ȣ';
COMMENT ON COLUMN T_USER.EMAIL IS '�̸���';
COMMENT ON COLUMN T_USER.BDAY IS '�������';
COMMENT ON COLUMN T_USER.PHNOENUM IS '��ȭ��ȣ';
COMMENT ON COLUMN T_USER.USTAUTS IS 'ȸ������';


/*
2. �Խ��� ���̺�(��� ���� ����)
�Խ��Ǳ۹�ȣ�� NUMBER(12)�� ���ϰ� �������� SEQ_BOARD�� �Ͽ� ������  -> PK,FK�� ���Ѱ� �� �����ؾ���
�� �÷��� ���� COMMENT�� �����Ͽ� �÷��� �ǹ̸� ������ �� �ֵ���
�Խ��� �۹�ȣ�� PK�� ������.(��, ���̺� ���� �� PK����)
�Խ��� ���̺��� ������, �۳���(TEXTAREA), ��ȸ����(�����ȸ�����)
*/
CREATE TABLE BOARD(
    POSTNO NUMBER(12) CONSTRAINT PK_BOARD PRIMARY KEY, --PK
    BTITEL VARCHAR2(20),
    TCONTENT CLOB,
    VIEWS VARCHAR2(1000),
    USERID VARCHAR2(20) CONSTRAINT FK_T_USER REFERENCES T_USER, --FK
    CREATED DATE,
    LIKES VARCHAR2(20)
    --ī�װ��� ����� -> ī�װ��� ���� � ���̺��� �������� �����Ǵϱ�
);



COMMENT ON TABLE BOARD IS '�Խ���';
COMMENT ON COLUMN BOARD.POSTNO IS '�۹�ȣ';
COMMENT ON COLUMN BOARD.BTITEL IS '������';
COMMENT ON COLUMN BOARD.TCONTENT IS '�۳���';
COMMENT ON COLUMN BOARD.VIEWS IS '��ȸ��';
COMMENT ON COLUMN BOARD.USERID IS '������̸�';
COMMENT ON COLUMN BOARD.CREATED IS '�����������';
COMMENT ON COLUMN BOARD.LIKES IS '���ƿ�';

--�ε��� �߰�
CREATE INDEX EX_BOARD ON BOARD(POSTNO, USERID);


--������ ����
CREATE SEQUENCE EX_SEQ_BOARD
INCREMENT BY 1  --1������
START WITH 1
MINVALUE 1
MAXVALUE 99
NOCYCLE
NOCACHE;

--USER_SEQUENCES�� ������ ������
SELECT * FROM USER_SEQUENCES;

--���� �������� ������� ��ȸ(Ȯ��)
SELECT EX_SEQ_BOARD.CURRVAL   --���� EX_SEQ_BOARD.NEXTVAL�� �����༭ ����
FROM DUAL;

--�������� CREATE�ϰ� ���� EX_SEQ_BOARD.NEXTVAL�� ���� �ʰ� SELECT EX_SEQ_BOARD.CURRVAL �� �ϸ� ����!!
--��? => �������� CREATE�ϰ� ���� EX_SEQ_BOARD.NEXTVAL�� �ؾ� CREATE�� �Ҷ� START WITH 1�� ����� ������ 1���� ������ �ϰ� �ȴ�
--�׷��� NEXTVAL�� �ϰ� ���� CURRVAL�� �ϸ� 1���� �����ϴ°���
--���� START WITH 100���� �ߴٸ� CURRVAL�� ���� �� 100���� ���۵�

--�������� NOORDER�ɼǵ� ����
--ȸ���� Ż���ص� �����ʹ� ���ܳ��� ��
--���̺� ������ �÷��� üũ(CHECK��� ������ ����)

