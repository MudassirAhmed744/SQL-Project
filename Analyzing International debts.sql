Create Database project;
use project;
select * from int_debt;

-- 1)Find the number of distinct countries
select count(distinct(country_name)) as dist_count from int_debt;
-- 2)Find Distinct debt indicator code
select distinct(indicator_code) as code
from int_debt;
-- 3)Totalling the amount of debt owned by all  the countries
SELECT ROUND(sum(debt)/1000000,2) as total_debt from int_debt;
-- 4)Country With Highest Debt
Select country_name,sum(debt) as total_debt from int_debt
group by country_name
order by total_debt desc;
-- 5)Avergage amount of debt across indicators
SELECT indicator_name,indicator_code as debt_indicator,
avg(debt) as average_debt
from int_debt
group by indicator_name,indicator_code
order by average_debt desc
LIMIT 10;
-- 6)The Highest amount of principal repayments
SELECT country_name,sum(debt) as total_debt
from int_debt
group by country_name
order by total_debt desc
limit 10;

-- 7)The Highest amount of principal repayments
SELECT country_name,indicator_name
from int_debt
where debt =(SELECT max(debt) from int_debt
where indicator_code='DT.AMT.DLXF.CD');

-- 8)Most Common Debt Indicator
SELECT 
    indicator_code,
    COUNT(indicator_code) AS indicator_count
FROM int_debt
GROUP BY indicator_code
ORDER BY indicator_count DESC, indicator_code DESC
LIMIT 20;

-- 9)countrywise debt
SELECT 
    country_name,
    MAX(debt) AS maximum_debt
FROM int_debt
GROUP BY country_name
ORDER BY maximum_debt DESC
LIMIT 10;
