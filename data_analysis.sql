-- Exploratory Data Analysis

select *
from layoffs_staging2;



select max(total_laid_off), max(percentage_laid_off)
from layoffs_staging2;

select *
from layoffs_staging2
where percentage_laid_off=1
order by funds_raised_millions desc;


select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;


select min(`date`),max(`date`)
from layoffs_staging2;

select sum(total_laid_off)
from layoffs_staging2;

select sum(funds_raised_millions), sum(total_laid_off)
from layoffs_staging2
where total_laid_off is not null;


select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;


select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc;


select year(`date`), sum(total_laid_off)
from layoffs_staging2
group by year(`date`)
order by 1 desc;



select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc;


select substring(`date`,1,7) `MONTH`, sum(total_laid_off)
from layoffs_staging2
group by `MONTH`
order by 2 desc;


select substring(`date`,1,7) `MONTH`, sum(total_laid_off)
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `MONTH`
order by 1;



with Rolling_total as 
(select substring(`date`,1,7) `MONTH`, sum(total_laid_off) total_off
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `MONTH`
order by 1)
select `MONTH`, total_off ,sum(total_off) over(order by `MONTH`) as rolling_total 
from Rolling_total;





select company,YEAR(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, YEAR(`date`)
order by 3 desc;


with Company_Year(company,years,total_laid_off) as
(select company,YEAR(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, YEAR(`date`)),
 Company_ranking as
(select *,dense_rank() over (partition by years order by total_laid_off desc) Ranking
from Company_Year
where years is not null)
select * 
from Company_ranking
where Ranking <=5; 



with Industry_Year(industry,years,total_laid_off) as
(select industry,YEAR(`date`), sum(total_laid_off)
from layoffs_staging2
group by industry, YEAR(`date`)),
 Industry_ranking as
(select *,dense_rank() over (partition by years order by total_laid_off desc) Ranking
from Industry_Year
where years is not null)
select * 
from Industry_ranking
where Ranking <=5; 
