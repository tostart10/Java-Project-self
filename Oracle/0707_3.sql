UPDATE SALARY
    SET SALMONTH = '202202'
    WHERE SALMONTH = '202306';

COMMIT;

--���ν��� Ŀ�� Ȱ��
CREATE OR REPLACE PROCEDURE PC_CURSOR


IS

BEGIN
    --CURSOR����
    DECLARE
        CURSOR cursor_Salary
        IS
            SELECT SALMONTH, EMPNO, SAL, COMM
                FROM SALARY
                WHERE SALMONTH = (SELECT MAX(SALMONTH)
                                    FROM SALARY);
            
        --��������
        V_PRODUCT SALARY%ROWTYPE;  --SALARY%ROWTYPE�� SALARY �÷��� Ÿ�԰� ���������� �����´�?
        --��ü �� �޾ƿ� ����%ROWTYPE�� ����
        --� �������ö��� ���� �����ؼ� ��������
    BEGIN
        DBMS_OUTPUT.PUT_LINE('���ν��� Ŀ�� ����..');
        OPEN cursor_Salary;  --���� BEGIN���� �ִ� ������ �������� ���ؼ� ������� --�޸𸮿� �÷���
        
        --�ݺ�����
        LOOP
            FETCH cursor_Salary INTO V_PRODUCT; --���� �ϳ��� ������ ������
            --SELECT SALMONTH, EMPNO, SAL, COMM �׸���� �ϳ��� �����ͼ� V_PRODUCT�� ����
            --cursor_Salary�� �׸���� �����ð�, V_PRODUCT�� �����Ұ���
            EXIT WHEN cursor_Salary%NOTFOUND;
            
            DBMS_OUTPUT.PUT_LINE('SALMONTH : ' || V_PRODUCT.SALMONTH);
            DBMS_OUTPUT.PUT_LINE('EMPNO : ' || V_PRODUCT.EMPNO);
            
            --���⿡���� V_PRODUCT.SALMONTH V_PRODUCT.~~�̷��� �Ǿ���
            INSERT INTO SALARY
            VALUES (TO_CHAR(ADD_MONTHS(TO_DATE(V_PRODUCT.SALMONTH, 'YYYYMM'),1), 'YYYYMM'),
                    V_PRODUCT.EMPNO, V_PRODUCT.SAL + 10, V_PRODUCT.COMM + 5);
            --��� �÷��� �� ����ֱ� ����VALUES�� ���ش�
            
        END LOOP;
        
        COMMIT; --�ϰ������� Ŀ���ϱ� ���� LOOP���������� ���ֱ�!
        CLOSE cursor_Salary; --����Ŭ�޸𸮿��� �޸� �ݳ��ϵ��� �ݾ���
        
    END;

END;
/

--Ŀ�� �ý��� ����ڵ�
--���ν��� Ŀ�� Ȱ��
CREATE OR REPLACE PROCEDURE PC_CURSOR

IS

BEGIN
    --CURSOR ����
    DECLARE
        CURSOR cursor_Salary
        IS
            SELECT SALMONTH, EMPNO, SAL, COMM
              FROM SALARY
             WHERE SALMONTH = (SELECT MAX(SALMONTH)
                                 FROM SALARY); 
             
        --��������
        V_PRODUCT SALARY%ROWTYPE;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('���ν��� Ŀ�� ����...');
        OPEN cursor_Salary;
        
        --�ݺ�����
        LOOP
            FETCH cursor_Salary INTO V_PRODUCT;
            EXIT WHEN cursor_Salary%NOTFOUND;
            
            DBMS_OUTPUT.PUT_LINE('SALMONTH : ' || V_PRODUCT.SALMONTH);
            DBMS_OUTPUT.PUT_LINE('EMPNO : ' || V_PRODUCT.EMPNO);
            
            INSERT INTO SALARY 
            VALUES(TO_CHAR(ADD_MONTHS(TO_DATE(V_PRODUCT.SALMONTH, 'YYYYMM'), 1), 'YYYYMM'),
                   V_PRODUCT.EMPNO, V_PRODUCT.SAL + 10, V_PRODUCT.COMM + 5);
            
        END LOOP;
        
        COMMIT;
        CLOSE cursor_Salary;
    END;

END;
/


--����)�����ٷ� ��� : ����� EX_SALARY, 1�п� �ѹ��� ����
BEGIN 
    DBMS_SCHEDULER.CREATE_JOB
    (
        JOB_NAME => 'EX_SALARY',  --���
        JOB_TYPE => 'STORED_PROCEDURE',
        JOB_ACTION => 'PC_CURSOR',  --���ν��� �̸�
        REPEAT_INTERVAL => 'FREQ=MINUTELY;INTERVAL=1',          --1�п� 1��
        COMMENTS => '�޿��߰� ��ü'
    );
END;
/

--�� ��ü ���� �α� Ȯ��
SELECT * FROM USER_SCHEDULER_JOB_LOG;
SELECT * FROM USER_SCHEDULER_JOB_RUN_DETAILS;


--�� ����/���� (�� �����ٷ� ����)
BEGIN
    --DBMS_SCHEDULER.ENABLE('EX_SALARY');  --�����ٷ� ����
    DBMS_SCHEDULER.DISABLE('EX_SALARY'); --�� ����
END;

SELECT * FROM SALARY ORDER BY SALMONTH DESC;

--���� 202305�� �Ѿ ������ ������ �����
DELETE FROM SALARY WHERE SALMONTH > '202305';

SELECT COUNT(*) FROM SALARY;

--ROWNUM : HAVING ���� ���������� DBMS�� �����͸� �����ٳ��� SELECT �ϴ� ������ �ѹ����� �ű�
--SELECT �ϴ¼������ ������ �Ű���
--�ѹ����� �Ű������� ORDER BY��
--ORDER BY�ϰ� ���� �ѹ����� �ű�°�쵵 ����
--ROWNUM 323��

--ROWNUM�� ���ؼ� �� �����ϱ�!!! -> �� ORDER BY �� ���� ������ �ٲ���� �ȹٲ����  (�ٲ�� ��½� ���ڰ� ���׹����� ä�� ��µ�)

--����¡ ó�� ���Ұ��
SELECT ROWNUM AS RUM, SALMONTH, EMPNO, SAL, COMM
        FROM( SELECT ROWNUM AS RUM ,SALMONTH, EMPNO, SAL, COMM
                FROM SALARY
                WHERE SALMONTH BETWEEN '202201' AND '202305'
                ORDER BY SAL ASC);

--���� ���׹���
SELECT ROWNUM AS RUM ,SALMONTH, EMPNO, SAL, COMM
                FROM SALARY
                WHERE SALMONTH BETWEEN '202201' AND '202305'
                ORDER BY SAL ASC;

SELECT SALMONTH, EMPNO, SAL, COMM
    FROM(SELECT ROWNUM AS RUM, SALMONTH, EMPNO, SAL, COMM
        FROM( SELECT SALMONTH, EMPNO, SAL, COMM
                FROM SALARY
                WHERE SALMONTH BETWEEN '202201' AND '202305'
                ORDER BY SAL ASC)) A
    WHERE A.RUM >=1 AND A.RUM <= 5;
            --�ζ��κ�� ���������� �ƴ�
--SALMONTH �� ORDER BY�� �������� ROWNUM�� ������ ����
--> INSERT �� ������� �������� ����?
--�ε����� �����ͼ�

--�ش��ϴ� FROM ���� �ִ� ���̺�� WHERE���� ������
--SALMONTH�� PK�� �־ ���������� PK������? �ε�������?���� �̹� ������ �Ǿ��־ �ѹ����� ������� ��
--�� ������ �ѹ����� �Ű���

--�ش��ϴ� �޸𸮸� �����͸� DBMS�� ������ ���� ORDER BY�� ��
--�����ѰŸ� RDBMS������ ������ ���� ORDER BY�� ������ ��
--������ DBMS�������� ���ִ� ����!!DB�������� ����

--ROWID�� ��� �ؼ��� ������� ����
--ROWNUM�� �ѹ����ϰ� ��� ���ĵǴ����� ���� NUM�� ������ �ٲ�
--ROWNUM ��¥ �߿���!!! ȸ�翡�� �� ����ϰ� ���� �����!! �̰� �� �����ϱ�!!!

