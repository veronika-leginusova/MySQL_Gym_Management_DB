-- Stored Procedure - shows the exact clients each trainer has in a descending alphabetical order by clients surname (Veronika)

DELIMITER $$
CREATE PROCEDURE clients_list(IN f_name VARCHAR(255), 
							  IN l_name VARCHAR(255))
BEGIN
	SELECT Staff.name, Staff.surname, Clients.name, Clients.surname FROM Clients
    LEFT JOIN Staff ON Clients.Staff_ID = Staff.Staff_ID    
    WHERE Staff.name = f_name AND Staff.surname = l_name
    ORDER BY Clients.surname DESC;
END $$
DELIMITER ;

CALL clients_list("John", "Lewis");
