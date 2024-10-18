-- Stored Function - returns number of classes on day requested (Jess)

DELIMITER $$
CREATE FUNCTION num_classes_on_day(day VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE class_count INT;
	SET class_count = (SELECT COUNT(Class_ID) FROM Classes WHERE Day_of_Week = day);
    return class_count;
END $$
DELIMITER ;

SELECT num_classes_on_day("Monday");