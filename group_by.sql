-- Group By - shows how many clients has each plan (Jess)

SELECT Plans.Plan_Name, COUNT(Clients.Plan_ID) AS NumberOfClients FROM Clients
LEFT JOIN Plans ON Clients.Plan_ID = Plans.Plan_ID
GROUP BY Plan_Name;

-- Group By - shows how many clients does each trainer have (Veronika)

SELECT Staff.Name, Staff.Surname, COUNT(Clients.Staff_ID) AS NumberOfClients FROM Clients
LEFT JOIN Staff ON Clients.Staff_ID = Staff.Staff_ID
GROUP BY Staff.Name, Staff.Surname;