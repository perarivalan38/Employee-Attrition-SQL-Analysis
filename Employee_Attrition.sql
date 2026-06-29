create database employees;

use employees;

select * from employee_attrition;

SELECT COUNT(*) AS totalemployees
FROM employee_attrition;

SELECT COUNT(*)
FROM employee_attrition
WHERE Attrition='Yes';

SELECT 
ROUND(100.0*
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
/COUNT(*),2) AS AttritionRate
FROM employee_attrition;

SELECT AVG(MonthlyIncome)
FROM employee_attrition;

SELECT Department,
COUNT(*) TotalEmployees
FROM employee_attrition
GROUP BY Department
ORDER BY TotalEmployees DESC;

SELECT DISTINCT Department
FROM employee_attrition;

SELECT
Department,
AVG(MonthlyIncome) AS AvgSalary
FROM employee_attrition
GROUP BY Department
ORDER BY AvgSalary DESC;

SELECT *
FROM
(
SELECT
Department,
EmployeeID,
MonthlyIncome,
RANK() OVER(
PARTITION BY Department
ORDER BY MonthlyIncome DESC
) AS RankNo
FROM employee_attrition
)t
WHERE RankNo=1;

SELECT
EmployeeID,
Department,
MonthlyIncome,
DENSE_RANK() OVER(
ORDER BY MonthlyIncome DESC
) RankNo
FROM employee_attrition
LIMIT 10;

SELECT
Department,
COUNT(*) AttritionCount
FROM employee_attrition
WHERE Attrition='Yes'
GROUP BY Department
ORDER BY AttritionCount DESC;

