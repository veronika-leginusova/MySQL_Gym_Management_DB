-- Group By - shows how many clients has each plan (Jess)

SELECT Plans.Plan_Name, COUNT(Clients.Plan_ID) AS NumberOfClients FROM Clients
LEFT JOIN Plans ON Clients.Plan_ID = Plans.Plan_ID
GROUP BY Plan_Name;