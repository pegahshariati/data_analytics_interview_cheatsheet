# Powe BI Interview Questions

## Descriptive
1. Where do you think power BI should be used the most? (analysis, visualization or data preprocessing?)

-  What highlights pbi for me is **building complex and beautiful data models** by connecting different tables (star schema). You always want to avoid wide tables and misusing memory and redundancy, the narrower the better with normalization and try to use star schema which is more optimized and focused and efficient. In pbi data modeling is presenting chosen tables, relationships, and specific columns after understanding the business needs and objectives and getting data from different sources. **Star schema** presents the simplest, most common organization of a database that includes **facts tables** and a number of **dimension tables** sometimes **snowflake schema** with additional dimensions tables. Dimension tables help me filter and see my fact table the way I wanna see. By monthes, by cities, by product. Denormalization is having more redundancy and more columns. Also, data can be cleansed using data transformation or edite queries this is for data preprocessing. And last but not the least DAX functions for data analysis. 

2. What is data modeling?
- Illustrsting and visually representing data to illustrate the type of data stored in the system, the relationship between those data types, what to keep what to remove how they filter each other and how they can be grouped  and organized. Modeling is based on business needs,business rules and requirements and they keep being adjusted based on that. Data modeling process starts with data collection based on business needs and then transformed into structured data. 



2. What are the advantages or calculated columns vs. measured columns? 
-  calculated columns are stored in the model already as rows in the table you can see them as a separated column, but measures are not already in the model. measures should be called in the model and used, they work in a real time. To keep the data small it is better to use measures and dont overwhelm the data model with calculated columns. 
calculated columns already have row context meaning that I can use aggregated functions on them. measures doesnt understand aggregated functions 


3. What are your go to DAX functions in Time Intelligence? 
- I would say DATEADD I was not supposed to work with Time Intelligence functions that much, 
```
Quantity Sold last month = CALCULATE([current table, DATEADD(TABLE[Column], -1, MONTH)

DATESINPERIOD for starndard time intervals and DATESBETWEEN:

```

4. What are the differences between SUM and SUMX?
In DAX we eather iterate or aggregate. Aggregation functions like SUM, COUNT return the sun of a column and iterating functions like SUMX  or AVGX go through each execcute the formula, or the function row and return the value.
```
Total revenue = SUM(Sales[Revenue])
```
Here we have a one big SUM for the revenue column.
```
Rvenue SUMX = SUMX(Sales,Sales[order quantity]*Sales[price])
```
 with SUMX I do not add anything to my model and overwhelm it.  Iteration functions. Using aggregation function is easy and probably the first thing to do but for some advanced methods it is defenetely better to use iteration functions. 


improving overall performance of the datamodels in Power BI

- Using drill through, selection pane, slicers, using measures instead of calculated columns, not more than 6 visualizations in one report page

5. Do you have a philosophy when creating Dashboards?
Not more than 4 or 5 graphs,  using measures for visualization not calculated columns to have cleaner model. 

6. How do you improve the overall performance of your data models? Less columns, more measures, getting rid of unnecessary tables, limit the visuals,turning off the automated Time intelligence setting to make the file smaller. 

7. Tell me more about star schema
The simplest most common shape of data modeling. You have a fact table and dimension tables connected to each other so the fact table could give me what I need from other tables. by country, by name, by number of sales. 

8. Give and example and describe a use-case for row-level security (RLS). based on logged in user the accessible data changes when I sign in as a data engineer I only see sales data and quantity and the customer or only US. I have nothing to do for Germany Sales.  USE Manage role and add email addresses that can have access to data. 

9. What is power BI? 
- business analytics tool developed by microsoft that gets data from diffeent and unrelated sources it could be excel spreadsheet or data warehouse and export insights out of those unrelated tables and visualize raw business data. 

10. Differences between power query and power pivot?
- Both can be used either in Excel or Power BI to load, transform data add calculated columns add and create measures. For reformatting changing, reshaping 

11. What is power BI desktop?
- open source app to preprocess, analyze, visualize and model data

12. What is power pivot? 
It is an add on to extend analytical capabilities

13. What is power query? 
it is also an add-on BI tool that allows you to transform data, cleans it and reshape it if needed and then you can work with a refreshed data. 

14. self-service BI is so suitable for businesses with no coding background to get insights, visualize them draw draw predictions and design dashboards. (SSBI) allows business owners to to use flters functions segments and get better business insights without any deep understanding of statistical analysis. 

15. What is DAX?
- collection of funcitons and operations that help creating new data from what you already have.

17. What is **FIlter** in pbi? conditions in pbi that are applied to data and filter out essential information
- Drillthrough displays more details and information of a graph on another page
- tootltips that show ingormation by hovering 
- include/exclude
- Drill-down : based on the data hierarchy whether it is year, month, date order or the order is division, manager, team and , in the visualization using drill down helps to take me down one level and display the data specifically in that level. It is accurate and very impressive for a manager to see. 
- Pass through

18. Custom Visuals? customized visualization in pbi using JavaScript language

19. What is GetData? icon to import data

20. Mention pbi advantages?
- allows to transform data
- even no coding background 
- quick, accurate
- even you can perform queries 
- python and SQL integration 

21. disadvantages:
- no files larger than 1 GB
- dashboard can only be shared with users logged in with same email addresses 
- some of them are personal in some cases pandas is much more user friendly 
- big challenges was for me visualizing results by the time order that I wnated

22. Different connectivity modes
- SQL server: is the most common type on connection 
- Direct query: connecting to specific data sources only storing metadata
- Live connection directly query the existing service, no data can be stores mostely supported by Azure or Pbi dataset host or SQL server

23. Dashboard: presentation of results throgh visualization reports, bookmark, selection pane and drillthroughs

24. only one active relationship between two tables presentaed by continous line but the dotted ones are inactive relationships. 

25. What is CALCULATE function in DAX? The most useful and powerful function in DAX. So basically it creates new **calculated columns** from the multiplying net price and quantity. 
```<python>
new_column = Sales[Quantity]*Sales[Net price]
```
26. filter context vs. row context?
- row context is by default in the calculated column. calculated columns are row by row by default. 

27. Where data is stored in pbi?
- should be stored in a cloud such as MS Azure SQL database


29. What is general formatting the data? 
- make the data much easier to work with 

30. different views
- model view
- dashboard view
- data view

31. different versions:
- pbi deskttop
- pbi service

32. critical components: power Query, power pivot, power view, power map 

33. what is content pack? 
ready to use collection of reports and visualizations for quick use and skipping buiding a report from scratch

34. **bi-directional cross filterin** makes the modeling easier ...

35. 3 fundumental concepts of DAX: Syntax :SUM(), Function: time intelligence functions, date/time, statistical functions, logical functions... CONTEX: 2 types: row context and filter context 
Row context does calculations on each row such as SUMX or AVGX it is not stored in the model you cant see the row context in the table like a measure but filter context is a set of filters already exist in each column like calculated columns for example the SUM of sales column. 

36. commonly used tasks in Power Query
- connect to data
- shape and combine
- group row
- pivot columns
- query formulas

37. grouping means:
- group data for visualization 

38. Responsive slicer is: 
- in the final reporrt page the responsive slicer can be resized and reshaped so the data can find a match a fit better. So a visual report doesnt get too close to be useful

39. Query folding is when steps defind in query editor are translated in to SQL and excecute by source database instead of the device. 

40. M language is Power query language very similar to other programming languages. 

41. What are the different stages in the working of Power BI?
- Data integration
- Data processing
- Data Presentation

42. What are KPIs? Key performance Indicators to analyze the progress and compare the performance to the previouse one. 

43. What is slicer? gives you an option like a filter to selecet the part of the data you want to see in visualization 