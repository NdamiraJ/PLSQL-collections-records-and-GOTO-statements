
-- INSERT USERS

INSERT INTO Users (Full_Name, Role, Access_Level, Status)
VALUES ('Alice Mugenzi', 'Security Officer', 3, 'Active');

INSERT INTO Users (Full_Name, Role, Access_Level, Status)
VALUES ('Brian Niyonkuru', 'IT Admin', 5, 'Active');

INSERT INTO Users (Full_Name, Role, Access_Level, Status)
VALUES ('Clara Uwase', 'Visitor', 1, 'Active');

INSERT INTO Users (Full_Name, Role, Access_Level, Status)
VALUES ('David Habimana', 'Maintenance Staff', 2, 'Inactive');

INSERT INTO Users (Full_Name, Role, Access_Level, Status)
VALUES ('Eva Mukamana', 'Security Officer', 4, 'Active');

INSERT INTO Users (Full_Name, Role, Access_Level, Status)
VALUES ('Frank Tuyishime', 'IT Admin', 5, 'Inactive');

-- INSERT ZONES
INSERT INTO Zones (Zone_Name, Required_Access_Level)
VALUES ('Server Room', 5);
INSERT INTO Zones (Zone_Name, Required_Access_Level)
VALUES ('Main Lobby', 1);
INSERT INTO Zones (Zone_Name, Required_Access_Level)
VALUES ('Operations Hub', 3);
INSERT INTO Zones (Zone_Name, Required_Access_Level)
VALUES ('Maintenance Area', 2);
INSERT INTO Zones (Zone_Name, Required_Access_Level)
VALUES ('Executive Suite', 4);
INSERT INTO Zones (Zone_Name, Required_Access_Level)
VALUES ('Cafeteria', 1);

-- INSERT ACCESS LOGS


INSERT INTO Access_Logs (User_ID, Zone_ID, Status)
VALUES (3, 1, 'FAILED');
INSERT INTO Access_Logs (User_ID, Zone_ID, Status)
VALUES (1, 3, 'SUCCESS');
INSERT INTO Access_Logs (User_ID, Zone_ID, Status)
VALUES (2, 1, 'SUCCESS');
INSERT INTO Access_Logs (User_ID, Zone_ID, Status)
VALUES (5, 5, 'SUCCESS');   
INSERT INTO Access_Logs (User_ID, Zone_ID, Status)
VALUES (4, 4, 'SUCCESS');
INSERT INTO Access_Logs (User_ID, Zone_ID, Status)
VALUES (6, 2, 'FAILED');

-- INSERT ALERTS FOR FAILED ACCESS

INSERT INTO Alerts (Log_ID, Alert_Type, Message)
VALUES (
    (SELECT Log_ID FROM Access_Logs WHERE User_ID = 3 AND Zone_ID = 1 AND Status = 'FAILED'),
    'Unauthorized Access',
    'Visitor Clara Uwase attempted to access Server Room without sufficient clearance.'
);
INSERT INTO Alerts (Log_ID, Alert_Type, Message)
VALUES (
    (SELECT Log_ID FROM Access_Logs WHERE User_ID = 6 AND Zone_ID = 2 AND Status = 'FAILED'),
    'Unauthorized Access',
    'IT Admin Frank Tuyishime attempted to access Main Lobby without sufficient clearance.'
);

SET SERVEROUTPUT ON;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Data inserted successfully.');
END;
/
