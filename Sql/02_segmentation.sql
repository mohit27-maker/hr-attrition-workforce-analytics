USE hr_analytics;

-- 1. By department
SELECT Department, COUNT(*) AS employees, SUM(AttritionFlag) AS leavers,
       ROUND(100 * AVG(AttritionFlag), 1) AS attrition_pct
FROM hr_employees
GROUP BY Department
ORDER BY attrition_pct DESC;

-- 2. By overtime
SELECT OverTime, COUNT(*) AS employees, SUM(AttritionFlag) AS leavers,
       ROUND(100 * AVG(AttritionFlag), 1) AS attrition_pct
FROM hr_employees
GROUP BY OverTime;

-- 3. By tenure band
SELECT CASE WHEN YearsAtCompany < 2 THEN '1. 0-1 yrs'
            WHEN YearsAtCompany < 5 THEN '2. 2-4 yrs'
            WHEN YearsAtCompany < 10 THEN '3. 5-9 yrs'
            ELSE '4. 10+ yrs' END AS tenure_band,
       COUNT(*) AS employees, SUM(AttritionFlag) AS leavers,
       ROUND(100 * AVG(AttritionFlag), 1) AS attrition_pct
FROM hr_employees
GROUP BY tenure_band
ORDER BY tenure_band;

-- 4. By income band
SELECT CASE WHEN MonthlyIncome < 3000 THEN '1. Under 3k'
            WHEN MonthlyIncome < 6000 THEN '2. 3k-6k'
            WHEN MonthlyIncome < 10000 THEN '3. 6k-10k'
            ELSE '4. 10k+' END AS income_band,
       COUNT(*) AS employees, SUM(AttritionFlag) AS leavers,
       ROUND(100 * AVG(AttritionFlag), 1) AS attrition_pct
FROM hr_employees
GROUP BY income_band
ORDER BY income_band;

-- 5. By job role
SELECT JobRole, COUNT(*) AS employees, SUM(AttritionFlag) AS leavers,
       ROUND(100 * AVG(AttritionFlag), 1) AS attrition_pct
FROM hr_employees
GROUP BY JobRole
ORDER BY attrition_pct DESC;