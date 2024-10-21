-- Creating a view using JOINs: This view will combine client, class, and staff details, showing the staff member (if any) who trains or manages the client (Kritika)

CREATE VIEW Client_Class_Staff_View AS
SELECT
    C.Client_ID,
    C.Name AS Client_Name,
    C.Surname AS Client_Surname,
    Cl.Class_Name,
    Cl.Class_Category,
    S.Name AS Staff_Name,
    S.Surname AS Staff_Surname,
    S.Position AS Staff_Position,
    L.City,
    L.Street,
    L.Number
FROM
    Clients C
LEFT JOIN
    Classes Cl ON C.Class_ID = Cl.Class_ID
LEFT JOIN
    Staff S ON C.Staff_ID = S.Staff_ID
INNER JOIN
    Locations L ON C.Location_ID = L.Location_ID;
    
SELECT * FROM Client_Class_Staff_View;