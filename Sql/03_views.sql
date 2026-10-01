USE hr_analytics;

CREATE OR REPLACE VIEW vw_employee_segments AS
SELECT *,
       CASE WHEN YearsAtCompany < 2 THEN '0-1 yrs'
            WHEN YearsAtCompany < 5 THEN '2-4 yrs'
            WHEN YearsAtCompany < 10 THEN '5-9 yrs'
            ELSE '10+ yrs' END AS tenure_band,
       CASE WHEN MonthlyIncome < 3000 THEN 'Under 3k'
            WHEN MonthlyIncome < 6000 THEN '3k-6k'
            WHEN MonthlyIncome < 10000 THEN '6k-10k'
            ELSE '10k+' END AS income_band,
       CASE WHEN OverTime = 'Yes' AND MonthlyIncome < 3000 AND YearsAtCompany < 2 THEN '1. Critical'
            WHEN OverTime = 'Yes' AND MonthlyIncome < 3000 THEN '2. High'
            WHEN OverTime = 'Yes' OR MonthlyIncome < 3000 THEN '3. Elevated'
            ELSE '4. Low' END AS risk_tier
FROM hr_employees;
SELECT risk_tier, COUNT(*) FROM vw_employee_segments GROUP BY risk_tier;