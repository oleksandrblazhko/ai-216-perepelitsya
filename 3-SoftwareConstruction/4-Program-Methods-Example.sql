CREATE OR REPLACE FUNCTION order_purifier (
    p_name IN VARCHAR2,
    p_cost IN INT
)
RETURN BOOLEAN IS
    v_name purifier.name%Type := upper(SUBSTR(p_name, 1, 100)); 
    v_cost purifier.cost%Type := p_cost;
    v_purifier_id purifier.purifier_id%Type; 
BEGIN
    IF v_cost <= 0 THEN
        RETURN FALSE;
    END IF;

    BEGIN
        SELECT purifier_id INTO v_purifier_id FROM purifier WHERE name = v_name AND cost = v_cost;
        RETURN TRUE;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
    END;
END;
/
