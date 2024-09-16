SET SERVEROUTPUT ON
DECLARE
v_text varchar(50) NOT NULL :='WELCOME';--DEFAULT 'HELLO';
BEGIN
v_text :='PL/SQL '|| 'COURSE';
DBMS_OUTPUT.put_line(v_text);
END;

DECLARE
v_number NUMBER(2) NOT NULL :=50.42;
BEGIN
DBMS_OUTPUT.put_line(v_NUMBER ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_number NUMBER(10,1) NOT NULL :=50.42;
BEGIN
DBMS_OUTPUT.put_line(v_NUMBER ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_number NUMBER(10,2) NOT NULL :=50.42;
BEGIN
DBMS_OUTPUT.put_line(v_NUMBER ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_integer PLS_INTEGER NOT NULL :=50;
BEGIN
DBMS_OUTPUT.put_line(v_integer ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_integer BINARY_FLOAT NOT NULL :=50.42f;
BEGIN
DBMS_OUTPUT.put_line(v_integer ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_date DATE NOT NULL := SYSDATE;
BEGIN
DBMS_OUTPUT.put_line(v_date ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_date DATE NOT NULL := '21-MAR-2024';
BEGIN
DBMS_OUTPUT.put_line(v_date ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_date DATE NOT NULL := '21-MAR-2024 19-12-20';
BEGIN
DBMS_OUTPUT.put_line(v_date ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_date TIMESTAMP WITH TIME ZONE NOT NULL := SYSTIMESTAMP;
BEGIN
DBMS_OUTPUT.put_line(v_date ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_date TIMESTAMP(3) WITH TIME ZONE NOT NULL := SYSTIMESTAMP;
BEGIN
DBMS_OUTPUT.put_line(v_date ||' BEGINNER TO ADVANCED');
END;

DECLARE
--default values are 2 for day amd 6 for milliseconds
v_date INTERVAL DAY(4) TO SECOND(2) := '21 01:05:21.012';
BEGIN
DBMS_OUTPUT.put_line(v_date ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_date INTERVAL YEAR(3) TO MONTH := '122-3';
BEGIN
DBMS_OUTPUT.put_line(v_date ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_bool BOOLEAN := TRUE;
BEGIN
DBMS_OUTPUT.put_line(v_bool ||' BEGINNER TO ADVANCED');
END;

-----------------------===================-----------------------
-----------------------DECLARING VARIABLES-----------------------
-----------------------===================-----------------------
SET SERVEROUTPUT ON;
DECLARE 
    v varchar2(20) := 2 + 25 * 3;
BEGIN
    dbms_output.put_line(v);
END;
-----------------------===================-----------------------
DECLARE 
    v_text varchar2(50) NOT NULL DEFAULT 'Hello';
    v_number1 number := 50;
    v_number2 number(2) := 50.42;
    v_number3 number(10,2) := 50.42;
    v_number4 PLS_INTEGER := 50;
    v_number5 BINARY_float := 50.42;
    v_DATE1 DATE := '22-NOV-18 12:01:32';
    v_DATE2 timestamp := systimestamp;
    v_DATE3 timestamp(9) WITH TIME ZONE := systimestamp;
    v_DATE4 interval day(4) to second (3) := '124 02:05:21.012 ';
    v_DATE5 interval year to month := '12-3';
BEGIN
    V_TEXT := 'PL/SQL' || 'Course';
    DBMS_OUTPUT.PUT_LINE(V_TEXT);
    DBMS_OUTPUT.PUT_LINE(v_number1);
    DBMS_OUTPUT.PUT_LINE(v_number2);
    DBMS_OUTPUT.PUT_LINE(v_number3);
    DBMS_OUTPUT.PUT_LINE(v_number4);
    DBMS_OUTPUT.PUT_LINE(v_number5);
    DBMS_OUTPUT.PUT_LINE(v_DATE1);
    DBMS_OUTPUT.PUT_LINE(v_DATE2);
    DBMS_OUTPUT.PUT_LINE(v_DATE3);
    DBMS_OUTPUT.PUT_LINE(v_DATE4);
    DBMS_OUTPUT.PUT_LINE(v_DATE5);
    END;
----------------==================================---------------
----------------USING BOOLEAN DATA TYPE in PL/SQL----------------
----------------==================================---------------
DECLARE
    v_boolean boolean := true;
BEGIN
    dbms_output.put_line(sys.diutil.bool_to_int(v_boolean));
END;
----------------==================================---------------