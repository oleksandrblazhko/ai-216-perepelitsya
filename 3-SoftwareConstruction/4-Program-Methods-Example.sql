CREATE OR REPLACE FUNCTION order_purifier (
    p_name IN VARCHAR2,
    p_cost IN INT
)
RETURN BOOLEAN IS
    v_name purifier.name%Type := upper(p_name);
    v_cost purifier.cost%Type := p_cost;
    v_purifier_id purifier.purifier_id%Type;
BEGIN
    IF LENGTH(v_name) > 100 THEN
        RETURN FALSE;

    END IF;
    BEGIN
        SELECT purifier_id INTO v_purifier_id FROM purifier WHERE TRIM (upper(name)) = v_name AND cost = v_cost;
        RETURN TRUE;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
    END;
END;
/
