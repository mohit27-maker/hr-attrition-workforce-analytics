USE hr_analytics;

SELECT risk_tier,
       COUNT(*) AS employees,
       SUM(AttritionFlag) AS leavers,
       ROUND(AVG(CASE WHEN AttritionFlag = 1 THEN MonthlyIncome END) * 12) AS avg_annual_salary_leavers
FROM vw_employee_segments
GROUP BY risk_tier
ORDER BY risk_tier;