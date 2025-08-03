-- Question1

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    ManagerID INT NULL
);



ALTER TABLE Employee 
ADD CONSTRAINT FK_Employee FOREIGN KEY (ManagerID)
REFERENCES Employee(EmpID);

INSERT INTO Employee VALUES (1, 'Alice', 'Finance', NULL);
INSERT INTO Employee VALUES (2, 'Bob', 'HR', 1);
INSERT INTO Employee VALUES (3, 'Charlie', 'Finance', 1);
INSERT INTO Employee VALUES (4, 'David', 'Research', 2);
INSERT INTO Employee VALUES (5, 'Eva', 'HR', 2);

SELECT 
    E1.EmpName AS [EMPLOYEE NAME], 
    E2.EmpName AS [MANAGER NAME],
    E1.Department AS [EMP_DEPARTMENT], 
    E2.Department AS [MANAGER_DEPT]
FROM Employee AS E1
LEFT OUTER JOIN Employee AS E2
    ON E1.ManagerID = E2.EmpID;



-- Question2
CREATE TABLE Y_TBL (
    ID INT,
    YEAR INT,
    NPV INT
);


CREATE TABLE Q_TBL (
    ID INT,
    YEAR INT
);

INSERT INTO Y_TBL (ID, YEAR, NPV) VALUES
(1, 2018, 100),
(7, 2020, 30),
(13, 2019, 40),
(1, 2019, 113),
(2, 2008, 121),
(3, 2009, 12),
(11, 2020, 99),
(7, 2019, 0);

INSERT INTO Q_TBL (ID, YEAR) VALUES
(1, 2019),
(2, 2008),
(3, 2009),
(7, 2018),
(7, 2019),
(7, 2020),
(13, 2019);

SELECT 
    Q.ID,
    Q.YEAR,

    ISNULL(Y.NPV, 0) AS NPV
FROM 
    Q_TBL Q
LEFT JOIN 
    Y_TBL Y
ON 
    Q.ID = Y.ID AND Q.YEAR = Y.YEAR
ORDER BY 
    Q.ID, Q.YEAR

