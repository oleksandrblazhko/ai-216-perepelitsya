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
