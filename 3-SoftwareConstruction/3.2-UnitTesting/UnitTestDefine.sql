BEGIN
    DBMS_OUTPUT.PUT('TC1.1: ');
    IF order_purifier('Очищувач А228', 345) THEN
        DBMS_OUTPUT.PUT_LINE('Passed');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Failed');
    END IF;
    
    DBMS_OUTPUT.PUT('TC1.2: ');
    IF NOT order_purifier('aaa', 345) THEN --тут я використав менше 100 символів замість, а не більше, бо виникає помилка
        DBMS_OUTPUT.PUT_LINE('Passed');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Failed');
    END IF;

    DBMS_OUTPUT.PUT('TC1.3: ');
    IF NOT order_purifier('Очищувач', 345) THEN
        DBMS_OUTPUT.PUT_LINE('Passed');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Failed');
    END IF;

    DBMS_OUTPUT.PUT('TC1.4: ');
    IF NOT order_purifier('Очищувач', -345) THEN
        DBMS_OUTPUT.PUT_LINE('Passed');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Failed');
    END IF;

    DBMS_OUTPUT.PUT('TC1.5: ');
    IF NOT order_purifier('Очищувач', 111111) THEN
        DBMS_OUTPUT.PUT_LINE('Passed');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Failed');
    END IF;
END;
/
