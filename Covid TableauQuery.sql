/*
Queries used for Tableau Project
*/


-- 1
-- GLOBAL NUMBERS

SELECT SUM(new_cases) as total_cases, SUM(CAST(new_deaths as int)) as total_deaths , SUM(CAST(new_deaths as int))/SUM(new_cases) *100 as DeathPercentage
from [Covid Dataset]..[Covid Deaths]
-- where location like '%states%'
where continent is not null
-- GROUP BY date
order by 1,2

-- Just a double check based off the data provided
-- numbers are extremely close so we will keep them - The Second includes "International"  Location


--Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
--From Covid Dataset..CovidDeaths
----Where location like '%states%'
--where location = 'World'
----Group By date
--order by 1,2


-- 2. 

-- We take these out as they are not inluded in the above queries and want to stay consistent
-- European Union is part of Europe

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From [Covid Dataset]..[Covid Deaths]
--Where location like '%states%'
Where continent is null 
and location not in ('World', 'European Union', 'International','High income','Upper middle income', 'Lower middle income', 'Low income')
Group by location
order by TotalDeathCount desc


--3
-- Countries with Higest total cases Infection Rate compared to Population

select location, population, MAX(total_cases) as HigestInfectionCount , MAX (total_cases/population) * 100 as PercentagePolutaionInfected
from [Covid Dataset]..[Covid Deaths]
-- where location like '%states%'
GROUP BY location, population
order by PercentagePolutaionInfected desc


--4
-- Countries with Higest total cases Infection Rate compared to Population and date
select location, population,date, MAX(total_cases) as HigestInfectionCount , MAX (total_cases/population) * 100 as PercentagePolutaionInfected
from [Covid Dataset]..[Covid Deaths]
-- where location like '%states%'
GROUP BY location, population,date
order by PercentagePolutaionInfected desc
