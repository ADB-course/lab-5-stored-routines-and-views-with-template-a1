-- (i) A Procedure called PROC_LAB5
DELIMITER //

CREATE PROCEDURE PROC_LAB5()
BEGIN
    SELECT 
        e.employeeNumber,
        CONCAT(e.firstName, ' ', e.lastName) AS fullName,
        e.jobTitle,
        COUNT(o.orderNumber) AS totalOrders
    FROM 
        employees AS e
    LEFT JOIN 
        orders AS o ON e.employeeNumber = o.salesRepEmployeeNumber
    GROUP BY 
        e.employeeNumber;
END //

DELIMITER ;

-- (ii) A Function called FUNC_LAB5
CREATE FUNCTION FUNC_LAB5(empID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE orderCount INT;
    
    SELECT COUNT(orderNumber) INTO orderCount
    FROM orders
    WHERE salesRepEmployeeNumber = empID;
    
    RETURN orderCount;
END;


-- (iii) A View called VIEW_LAB5
CREATE VIEW VIEW_LAB5 AS
SELECT 
    e.employeeNumber,
    CONCAT(e.firstName, ' ', e.lastName) AS fullName,
    e.jobTitle,
    COUNT(o.orderNumber) AS totalOrders
FROM 
    employees AS e
LEFT JOIN 
    orders AS o ON e.employeeNumber = o.salesRepEmployeeNumber
GROUP BY 
    e.employeeNumber;
