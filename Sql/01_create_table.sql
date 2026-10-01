CREATE DATABASE IF NOT EXISTS hr_analytics;
USE hr_analytics;

CREATE TABLE hr_employees (
    Age INT,
    Attrition VARCHAR(3),
    BusinessTravel VARCHAR(30),
    DailyRate INT,
    Department VARCHAR(40),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(30),
    EmployeeNumber INT PRIMARY KEY,
    EnvironmentSatisfaction INT,
    Gender VARCHAR(10),
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(40),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(20),
    MonthlyIncome INT,
    MonthlyRate INT,
    NumCompaniesWorked INT,
    OverTime VARCHAR(3),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
    StockOptionLevel INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT,
    AttritionFlag INT
);

SELECT COUNT(*) AS total,
       SUM(AttritionFlag) AS leavers,
       ROUND(100 * AVG(AttritionFlag), 1) AS attrition_pct
FROM hr_employees;