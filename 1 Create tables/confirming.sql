SET SERVEROUTPUT ON;
BEGIN
    DBMS_OUTPUT.PUT_LINE('✅ Tables created:');
    FOR rec IN (
        SELECT table_name 
        FROM user_tables 
        WHERE table_name IN ('USERS', 'ZONES', 'ACCESS_LOGS', 'ALERTS')
        ORDER BY table_name
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(' - ' || rec.table_name);
    END LOOP;
END;
/