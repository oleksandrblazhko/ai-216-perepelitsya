CREATE OR REPLACE FUNCTION order_purifier (
    p_name IN VARCHAR2,
    p_cost IN INT
)
RETURN BOOLEAN IS
    v_name purifier.name%Type := upper(p_name);
    v_cost purifier.cost%Type := p_cost;
    v_purifier_id purifier.purifier_id%Type; -- Assuming purifier_id is the primary key
BEGIN
    BEGIN
        SELECT purifier_id INTO v_purifier_id FROM purifier WHERE name = v_name AND cost = v_cost;
        RETURN TRUE;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
    END;
END;
/

--Якщо в таблиці "Очищувач" буде цей товар, то виведеться повідомлення про успішність замовлення, в іншому випадку - помилку
DECLARE
    v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM purifier
    WHERE name = 'Очищувач А228' AND cost = 345;

    IF v_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Успішно!');
        DBMS_OUTPUT.PUT_LINE('Оплата успішно проведена. Чекайте дзвінка оператора');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Помилка! Товар не знайдено! Спробуйте, буль-ласка, ще раз.');
    END IF;
END;
/
