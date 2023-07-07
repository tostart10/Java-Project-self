--PL/SQL �⺻ ����
--PL/SQL�� ȣ���Ҷ��� �����ǰ� ������ �����
SET SERVEROUTPUT ON;  --����� ���ٷ��� ������ �̸� ������� -> SELECT���� �������� �̰� ���� �����������

DECLARE --���⿡ ����������  ,, �̰Ŵ� ���� ����, ȣ��� ���� �����
    DATA EMP%ROWTYPE;  --ROWTYPE�� �����̶� �Ȱ��� �ϰڴٴ� ��
BEGIN
    DBMS_OUTPUT.PUT_LINE('PL/SQL ����...');
    
    SELECT *
    INTO DATA  --DATA�� ����
    FROM EMP
    WHERE EMPNO = '2001';

--���⼭ ��� : DBMS_OUTPUT.PUT_LINE�̶�°� ������ִ� �Լ�
    DBMS_OUTPUT.PUT_LINE(DATA.ENAME || ',' || DATA.JOB);

END;
/
--�̰Ŵ� ������Ƽ� �־��ְų� ����Ŭ���ο��� ���ε��� ��ġ�� INSERT ���ִ°�

--���ν��� : �ѹ� �������� ���� ȣ���ؼ� ���°�
--OR REPLACE�� ���༭ ������ �����ص� ���� ����
CREATE OR REPLACE PROCEDURE InsertEMP
(--�Ű������� ���� ������ ���⿡ ��
    P_ENAME IN VARCHAR2
)
AS
--����ϴ� ������ ���ٰ���
    P_EMPNO CHAR(4);

BEGIN
--������ ��
    DBMS_OUTPUT.PUT_LINE('InsertEMP ����...');
    
    INSERT INTO EMP (EMPNO, ENAME, HIREDATE)  --������ EMPNO�� ���� �������� ��������� ������
    VALUES (EX_EMPNO_SEQ.NEXTVAL, P_ENAME, SYSDATE);  --()�� ������ �̸�.NEXTVAL
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('�̸��� ' || P_ENAME);
END;
/


EXEC InsertEMP('ȫ�浿'); 
--�μ����� ������ �ٷ� �����ݷ� �ص� ��  EXEC InsertEMP;

