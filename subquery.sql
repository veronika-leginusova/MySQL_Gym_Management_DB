-- Subquery to extract data for analysis:This query will find all clients who are attending a class on a Monday and whose gym location is in the city of London (Kritika)

SELECT
    C.Client_ID,
    C.Name AS Client_Name,
    C.Surname AS Client_Surname,
    Cl.Class_Name,
    L.City,
    Cl.Day_of_Week
FROM
    Clients C
INNER JOIN
    Classes Cl ON C.Class_ID = Cl.Class_ID
INNER JOIN
    Locations L ON C.Location_ID = L.Location_ID
WHERE
    Cl.Day_of_Week = 'Monday'
    AND L.City = 'London';