USE hr_analytics;

SELECT CASE WHEN OverTime = 'Yes' AND MonthlyIncome < 3000 AND YearsAtCompany < 2
            THEN 'At-risk segment' ELSE 'Everyone else' END AS segment,
       COUNT(*) AS employees,
       SUM(AttritionFlag) AS leavers,
       ROUND(100 * AVG(AttritionFlag), 1) AS attrition_pct
FROM hr_employees
GROUP BY segment;