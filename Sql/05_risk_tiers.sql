USE hr_analytics;

SELECT CASE
         WHEN OverTime = 'Yes' AND MonthlyIncome < 3000 AND YearsAtCompany < 2 THEN '1. Critical'
         WHEN OverTime = 'Yes' AND MonthlyIncome < 3000 THEN '2. High'
         WHEN OverTime = 'Yes' OR MonthlyIncome < 3000 THEN '3. Elevated'
         ELSE '4. Low' END AS risk_tier,
       COUNT(*) AS employees,
       SUM(AttritionFlag) AS leavers,
       ROUND(100 * AVG(AttritionFlag), 1) AS attrition_pct
FROM hr_employees
GROUP BY risk_tier
ORDER BY risk_tier;