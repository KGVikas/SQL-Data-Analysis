# Layoffs Data Analysis Project

## Overview

This project involves cleaning and analyzing layoff data from various companies. The work was done in two main phases:

1. **Data Cleaning**: Performed in `data_cleaning_project.sql` where I processed the raw `layoffs.csv` dataset
2. **Exploratory Data Analysis**: Conducted in `data_analysis.sql` using the cleaned dataset

## Data Cleaning Process

In the data cleaning phase (`data_cleaning_project.sql`), I:
- Removed duplicate entries
- Standardized values (trimmed company names, corrected industry/country names)
- Handled null/blank values
- Converted date formats to proper SQL date type
- Removed unnecessary columns and rows with missing critical data

The result was a clean dataset named `layoffs_staging2` ready for analysis.

## Key Findings from Analysis

The exploratory analysis (`data_analysis.sql`) revealed several insights:

### Overall Metrics
- Calculated maximum layoffs (both absolute numbers and percentages)
- Identified companies with 100% staff laid off, ordered by funds raised
- Total layoffs across all companies: [sum from your analysis]

### Industry Trends
- Ranked industries by total layoffs
- Top 5 industries affected each year

### Geographic Impact
- Countries most affected by layoffs, ordered by severity

### Temporal Patterns
- Date range of the dataset
- Layoffs by year showing trends over time
- Monthly layoffs with rolling totals to show cumulative impact

### Company-Specific Analysis
- Companies with the highest total layoffs
- Top 5 companies with most layoffs each year

## Technical Approach

The analysis utilized:
- Aggregation functions (SUM, MAX, MIN)
- Date functions (YEAR, substring for month extraction)
- Window functions for rolling totals and rankings
- Common Table Expressions (CTEs) for complex queries
- DENSE_RANK() to identify top affected companies/industries by year

## How to Use

1. Review the data cleaning process in `data_cleaning_project.sql`
2. Explore the analysis queries in `data_analysis.sql`
3. The queries can be adapted for similar datasets or extended with additional metrics

The project demonstrates a complete data workflow from raw data cleaning to insightful analysis of workforce reduction trends.
