-- COLLECTIONS, RECORDS, AND GOTO 
-- Purpose: Process access logs with PL/SQL logic
SET SERVEROUTPUT ON;
DECLARE
    -- Record type for access attempt
    TYPE AccessAttemptRec IS RECORD (
        user_id   Users.User_ID%TYPE,
        zone_id   Zones.Zone_ID%TYPE,
        status    VARCHAR2(10)
    );

    -- Collection type to hold multiple attempts
    TYPE AccessAttemptTab IS TABLE OF AccessAttemptRec;

    -- Declare collection variable
    attempts AccessAttemptTab := AccessAttemptTab();

    -- Loop index
    i INTEGER;

BEGIN
    attempts.EXTEND(6);
    attempts(1) := AccessAttemptRec(3, 1, 'FAILED');   -- Clara Uwase → Server Room
    attempts(2) := AccessAttemptRec(1, 3, 'SUCCESS');  -- Alice Mugenzi → Operations Hub
    attempts(3) := AccessAttemptRec(2, 1, 'SUCCESS');  -- Brian Niyonkuru → Server Room
    attempts(4) := AccessAttemptRec(5, 5, 'SUCCESS');  -- Eva Mukamana → Executive Suite
    attempts(5) := AccessAttemptRec(4, 4, 'SUCCESS');  -- David Habimana → Maintenance Area
    attempts(6) := AccessAttemptRec(6, 2, 'FAILED');   -- Frank Tuyishime → Main Lobby

    FOR i IN 1 .. attempts.COUNT LOOP
        
        IF attempts(i).status = 'FAILED' THEN
            GOTO log_alert;
        END IF;

        -- Insert successful access
        INSERT INTO Access_Logs (User_ID, Zone_ID, Status)
        VALUES (attempts(i).user_id, attempts(i).zone_id, attempts(i).status);

        DBMS_OUTPUT.PUT_LINE('✅ SUCCESS: User ' || attempts(i).user_id || 
                             ' accessed Zone ' || attempts(i).zone_id);

        GOTO continue_loop;

        <<log_alert>>
        -- Insert failed access
        INSERT INTO Access_Logs (User_ID, Zone_ID, Status)
        VALUES (attempts(i).user_id, attempts(i).zone_id, attempts(i).status);

        -- Insert corresponding alert
        INSERT INTO Alerts (Log_ID, Alert_Type, Message)
        VALUES (
            (SELECT MAX(Log_ID) FROM Access_Logs 
             WHERE User_ID = attempts(i).user_id AND Zone_ID = attempts(i).zone_id),
            'Unauthorized Access',
            'User ID ' || attempts(i).user_id || 
            ' failed to access Zone ID ' || attempts(i).zone_id
        );

        DBMS_OUTPUT.PUT_LINE('ALERT: User ' || attempts(i).user_id || 
                             ' failed to access Zone ' || attempts(i).zone_id);

        <<continue_loop>>
        NULL;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Processing complete using collections, records, and GOTO.');
END;
/
