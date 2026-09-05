# 🎬 Netflix Data Analysis — SQL

<p align="center">
  <img src="https://img.shields.io/badge/SQL-Analysis-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="SQL">
  <img src="https://img.shields.io/badge/Netflix-Data%20Analysis-E50914?style=for-the-badge&logo=netflix&logoColor=white" alt="Netflix">
</p>

## 📌 Project Overview

This project analyzes the **Netflix Movies and TV Shows dataset** using **SQL**.

The project focuses on solving **15 business problems** using SQL queries and presenting the results.

The analysis covers Netflix content types, ratings, countries, genres, release trends, directors, actors, missing data, and keyword-based content classification.

---

## 🎯 Project Objectives

- Analyze the distribution of Movies and TV Shows on Netflix.
- Identify the most common content ratings.
- Analyze Netflix content by country and genre.
- Identify trends in content releases over the years.
- Find top-performing countries based on content volume.
- Analyze directors and actors associated with Netflix content.
- Identify missing values and incomplete information.
- Perform date-based and string-based analysis.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **SQL** | Data cleaning, transformation and business analysis |
| **CSV / Excel** | Dataset storage and initial data inspection |
| **GitHub** | Project documentation and version control |

---

## 📂 Dataset

The dataset contains information about Netflix Movies and TV Shows, including:

```text
show_id
type
title
director
cast
country
date_added
release_year
rating
duration
listed_in
description
```

The dataset contains both **Movies** and **TV Shows** along with metadata about their release, creators, cast, country, genre and description.

---

# 💼 Business Problems & SQL Analysis

## 1. 🎬 Count Movies vs TV Shows

**Business Question:**  
How many Movies and TV Shows are available in the Netflix catalog?

**SQL Approach:**  
Group the data by `type` and count the number of titles in each category.

**Concepts Used:**
- `GROUP BY`
- `COUNT()`

---

## 2. ⭐ Find the Most Common Rating for Movies and TV Shows

**Business Question:**  
What is the most frequently occurring rating for Movies and TV Shows?

**SQL Approach:**  
Group records by `type` and `rating`, count the titles and identify the highest-frequency rating.

**Concepts Used:**
- `GROUP BY`
- `COUNT()`
- `ORDER BY`
- Aggregation

---

## 3. 📅 List All Movies Released in a Specific Year

**Business Question:**  
Which Movies were released in a specific year, such as **2020**?

**SQL Approach:**

```sql
WHERE release_year = 2020
```

**Concepts Used:**
- `WHERE`
- Filtering

---

## 4. 🌍 Find the Top 5 Countries with the Most Content

**Business Question:**  
Which countries have the highest number of Netflix titles?

**SQL Approach:**  
Count titles by country, sort the results in descending order and return the top 5.

**Concepts Used:**
- `GROUP BY`
- `COUNT()`
- `ORDER BY`
- `LIMIT` / `TOP`

> **Note:** The `country` column contains multiple comma-separated values in some records. For detailed country-level analysis, the values should ideally be normalized into a separate table.

---

## 5. ⏱️ Identify the Longest Movie

**Business Question:**  
Which Movie has the longest duration?

**SQL Approach:**  
Extract the numeric duration and use `MAX()` to identify the longest Movie.

**Concepts Used:**
- `MAX()`
- String conversion/extraction
- Filtering

---

## 6. 📆 Find Content Added in the Last 5 Years

**Business Question:**  
Which Netflix titles were added during the last five years?

**SQL Approach:**  
Convert `date_added` into a date and filter records according to the required time period.

**Concepts Used:**
- Date functions
- Date filtering
- `WHERE`

---

## 7. 🎥 Find Content Directed by Rajiv Chilaka

**Business Question:**  
Which Netflix Movies or TV Shows were directed by **Rajiv Chilaka**?

**SQL Approach:**  
Filter the `director` column using the required director name.

**Concepts Used:**
- `WHERE`
- `LIKE`

---

## 8. 📺 Find TV Shows with More Than 5 Seasons

**Business Question:**  
Which TV Shows have more than five seasons?

**SQL Approach:**  
Filter records where `type = 'TV Show'`, extract the numeric season count from `duration`, and return shows with more than five seasons.

**Concepts Used:**
- `WHERE`
- String functions
- Numeric conversion
- Filtering

---

## 9. 🎭 Count Content Items in Each Genre

**Business Question:**  
How many Netflix titles belong to each genre/category?

**SQL Approach:**  
Analyze the `listed_in` column and count titles for each genre.

**Concepts Used:**
- String manipulation
- `GROUP BY`
- `COUNT()`

> **Note:** A single title can belong to multiple genres. For Power BI, separating these values into a bridge table provides a cleaner data model.

---

## 10. 🇮🇳 Top 5 Years with the Highest Average Content Release in India

**Business Question:**  
Which years had the highest average amount of Netflix content associated with India?

**SQL Approach:**

1. Filter content associated with India.
2. Group the data by release year.
3. Calculate the average content release.
4. Sort the result in descending order.
5. Return the top 5 years.

**Concepts Used:**
- `AVG()`
- `GROUP BY`
- `ORDER BY`
- Filtering
- Aggregation

---

## 11. 🎞️ List All Movies That Are Documentaries

**Business Question:**  
Which Netflix Movies belong to the Documentary genre?

**SQL Approach:**  
Filter Movies where the `listed_in` field contains **Documentaries**.

**Concepts Used:**
- `WHERE`
- `LIKE`
- String filtering

---

## 12. ⚠️ Find All Content Without a Director

**Business Question:**  
Which Netflix titles have missing director information?

**SQL Approach:**  
Filter records where the `director` field is `NULL` or missing.

**Concepts Used:**
- `IS NULL`
- Data-quality analysis

---

## 13. 🧑‍🎤 Count Movies Featuring Salman Khan in the Last 10 Years

**Business Question:**  
How many Movies featuring **Salman Khan** were released during the last 10 years?

**SQL Approach:**

1. Filter for Movies.
2. Search the `cast` column for Salman Khan.
3. Apply the required 10-year date/release-year filter.
4. Count the resulting titles.

**Concepts Used:**
- `LIKE`
- Date/year filtering
- `COUNT()`
- Multiple conditions

---

## 14. 🏆 Top 10 Actors in Indian Movies

**Business Question:**  
Which 10 actors have appeared in the highest number of Movies associated with India?

**SQL Approach:**

1. Filter content associated with India.
2. Filter for Movies.
3. Split the comma-separated `cast` values.
4. Count Movie appearances for each actor.
5. Sort in descending order.
6. Return the top 10 actors.

**Concepts Used:**
- CTEs
- String splitting
- `GROUP BY`
- `COUNT()`
- `ORDER BY`
- Top-N analysis

---

## 15. 🔎 Classify Content Using `kill` and `violence` Keywords

**Business Question:**  
How many titles contain potentially violent keywords in their descriptions?

**Classification Logic:**

| Condition | Category |
|---|---|
| Description contains `kill` or `violence` | **Bad** |
| Description does not contain either keyword | **Good** |

The final analysis counts the number of titles in each category.

**Concepts Used:**
- `CASE`
- `LIKE`
- String functions
- `COUNT()`
- Conditional classification

> ⚠️ **Important:** This is a simple keyword-based classification created for analytical purposes. It is **not** an official Netflix content-safety or quality rating.

---

---

# 🧠 SQL Concepts Demonstrated

This project demonstrates practical usage of:

- `SELECT`
- `WHERE`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `COUNT()`
- `COUNT(DISTINCT ...)`
- `MAX()`
- `AVG()`
- `CASE`
- `LIKE`
- `IS NULL`
- String functions
- Date functions
- CTEs
- Subqueries
- Window functions
- Joins
- Aggregations
- Top-N analysis

---

# 📈 Skills Demonstrated

### SQL

- Business problem solving
- Data filtering
- Data aggregation
- String manipulation
- Date-based analysis
- Conditional logic
- CTEs and subqueries
- Analytical SQL
- Top-N analysis

### Data Analytics

- Translating business requirements into SQL
- Extracting meaningful insights
- Data-quality analysis
- Preparing data for visualization
- Presenting analytical findings

---

# 💡 Business Value

The project demonstrates how raw Netflix catalog data can be converted into meaningful business insights.

The analysis helps answer questions such as:

- What type of content dominates Netflix?
- Which ratings are most common?
- Which countries contribute the most content?
- Which genres have the highest representation?
- How has Netflix content changed over time?
- Which directors and actors appear frequently?
- How significant is Indian content in the catalog?
- Where does the dataset contain missing information?
- How can unstructured text be converted into analytical categories?

---

# 🚀 Future Improvements

Possible improvements to the project include:

- Add more advanced SQL business problems.
- Build a proper star-schema data model in Power BI.
- Normalize multi-valued columns using bridge tables.
- Add DAX measures for advanced KPIs.
- Add interactive slicers for country, year, genre and rating.
- Add drill-through pages for actors and directors.
- Perform sentiment analysis on descriptions.
- Create a recommendation system using content metadata.
- Add automated data refresh.

---

# 👨‍💻 About

This project was created as a **Data Analytics portfolio project** to demonstrate practical skills in:

**SQL + Data Analysis + Data Modeling**

The project focuses on solving business-oriented problems rather than simply creating visualizations.

---

## ⭐ If You Found This Project Useful

If you found this project helpful, consider giving the repository a ⭐ on GitHub.
