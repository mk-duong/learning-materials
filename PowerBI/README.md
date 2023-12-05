# Learn Power BI

### Get started in PBI Service

- **Power BI Desktop** for authoring reports made up of datasets and visualizations.
- [Power BI service](https://app.powerbi.com/) for creating dashboards from published reports and distributing content with apps.
- **Power BI Mobile** for on-the-go access to the Power BI service content, designed for mobile.
- ****Refresh data****
    
    ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled.png)
    

- **What is a collection of reports and dashboards called in Power BI?**
    
    An app is a collection of ready-made visuals, pre-arranged in dashboards and reports. You can get apps that connect to many online services from the AppSource.
    
- **What is the common flow of activity in Power BI?**
    
    Bring data into Power BI Desktop and create a report, share it to the Power BI service, view and interact with reports and dashboards in the service and Power BI mobile.
    

### **Get data in PBI**

****Create dynamic reports with parameters****

- Dynamic reports: a single report can be used for multiple purposes
- Use parameters by determining the values that you want to see data for in the report → the report updates accordingly by filtering the data for you
- Need to write SQL query
- [Creat dynamic reports for INDIVIDUAL or MULTIPLE values](https://learn.microsoft.com/en-us/training/modules/get-data/3b-parameters)

****Get data from relational data sources****

- **Windows** - Use your Windows account (Azure Active Directory credentials).
- **Database** - Use your database credentials.
- **Microsoft account** - Use your Microsoft account credentials. This option is often used for Azure services.

**Lab: Prepare data in PowerBI**

- ****Get data from SQL Server and Preview Data in Power Query Editor****
    - ***DimEmployee** table in the SQL Server database stores one row for each employee*
        - Review the column distribution for the **EmployeeKey** column
            - *When the distinct and unique counts are the same, it means the column contains unique values.*
            - *When modeling, it’s important that some model tables have unique columns. These unique columns can be used to create one-to-many relationships, which you'll do in the **Model Data in Power BI Desktop** lab.*
    - ***DimEmployeeSalesTerritory** table stores one row for each employee and the sales territory regions they manage. The table supports relating many regions to a single employee. Some employees manage one, two, or possibly more regions. When you model this data, you’ll need to define a many-to-many relationship.*
    - **DimProduct** table contains one row per product sold by the company.
    - ***DimReseller** table contains one row per reseller. Resellers sell, distribute, or value add to the Adventure Works products.*
    - ***DimSalesTerritory** table contains one row per sales region, including **Corporate HQ** (headquarters). Regions are assigned to a country, and countries are assigned to groups.*
    - ***FactResellerSales** table contains one row per sales order line—a sales order contains one or more line items.*
        
        - Review the column quality for the **TotalProductCost** column → 8% of the rows are empty.
            
            *Missing **TotalProductCost** column values is a data quality issue. To address the issue, in the **Load Data in Power BI Desktop** lab, you’ll apply transformations to fill in missing values by using the product standard cost, which is stored in the related **DimProduct** table.*
            
- ****Get data from CSV Files****
    - ***ResellerSalesTargets** CSV file contains one row per salesperson, per year. Each row records 12 monthly sales targets (expressed in thousands). The business year for the Adventure Works company commences on July 1.*
    - *Hyphen character was used in the source CSV file to represent zero (0)*

****Select a storage mode: Import or DirectQuery?****

- **Importing** the data means that the data is stored (or cached) in the Power BI file and gets published along with the Power BI reports
    - Data refreshes can be scheduled or on-demand

But let’s say, for security reasons, you aren't allowed to import local copies of the data into your reports or your datasets may simply be too large

⇒ **DirectQuery** allows you to query the data in the data source directly and not import a copy into Power BI ⇒ ensures always viewing the most recent version of the data.

- **Dual** you can identify some data to be directly imported and other data that must be queried

****Get data from Azure Analysis Services****

![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%202.png)

- Similar to getting data from SQL Server:
    - Authenticate to the server.
    - Pick the model you want to use.
    - Select which tables you need.
- Differences
    - Analysis Services models have calculations already created.
    - Instead of using Transact-SQL (T-SQL) to query the data, you can use multi-dimensional expressions (MDX) or data analysis expressions (DAX).
- **Connect live**
    - Helps keep the data and DAX calculations in their original location (without having to import them all into Power BI)
    - When data is refreshed in the service → Power BI reports immediately updated
- You'll likely import the data directly into Power BI. An acceptable alternative is to import all other data that you want (from Excel, SQL Server, and so on) into the Azure Analysis Services model and then use a live connection → This approach keeps the data modeling and DAX measures in one place.

****Fix performance issues****

- ****Optimize performance in Power Query****
    - *Query folding* is the process by which the transformations and edits that you make in Power Query Editor are simultaneously tracked as native queries, or simple **Select** SQL statements, while you're actively making transformations.
    - If the **View Native Query** option isn't available → query folding isn't possible for this step
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%203.png)
        
    - Tips: If you can translate a transformation into a **Select** statement, which includes operators and clauses such as GROUP BY, SORT BY, WHERE, UNION ALL, and JOIN → you can use query folding.
- ****Query diagnostics****
    - Useful when you want to analyze performance on the Power Query side: loading datasets, running data refreshes, or running other transformative tasks, etc.
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%204.png)
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%205.png)
        
- ****Other techniques to optimize performance****
    - **Process as much data as possible in the original data source.**
    - **Use native SQL queries.** When using DirectQuery for SQL databases, make sure that you aren't pulling data from stored procedures or common table expressions (CTEs).
        - In Advanced Options: when customizing query, avoid using functions or CTE (*[If you use a transformation that is too complex, then you will receive an error that either it must be deleted, or the model switched to Import mode](https://community.fabric.microsoft.com/t5/Desktop/BUG-DirectQuery-with-Advanced-Options/m-p/315843))*
    - **Separate date and time** into distinct columns before importing into Power BI.
- ****Resolve data import errors****
    - ****Query timeout expired**** many people concurrently use the same data in the same database
    - ****Power BI Query Error: Timeout expired**** you’ve pulled too much data according to your organization’s policies
    - ****We couldn't find any data formatted as a table****
    - ****Couldn't find file****
    - ****Data type errors****
        - Sometimes, when you import data into Power BI, the columns appear blank → error in interpreting the data type in Power BI.
        - The resolution to this error is unique to the data source.
            
            Ex: If you're importing data from SQL Server and see blank columns, you could try to convert to the correct data type in the query.
            
            Instead of using this query: `SELECT CustomerPostalCode FROM Sales.Customers`
            
            Use this query: `SELECT CAST(CustomerPostalCode as varchar(10)) FROM Sales.Customers`
            

### ****Clean, transform, and load data****

**Shaping data**

- Promote headers; Rename cols; Remove rows/cols
- Unpivot/Pivot columns
- Replace nulls
    
    ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%206.png)
    
- Best practices for naming tables, columns, and values
    - Descriptive business terms
    - Replace underscores ("_") with spaces.
    - Be consistent with abbreviations, prefixes, and words like "number" and "ID"
    - Avoiding acronyms in values (provided that the text will fit on the visual)
- Data types
    - If date as type Text → Date ⇒ auto generated date hierarchy
    - But best practice: use a date table (`CALENDAR`/`CALENDARAUTO`) & create relationship ⇒ get rid of the auto generated hierarchy
        

****Combine multiple tables into a single table****

- Append queries: add rows of data to another table or query
    - **Append Queries as New** output of appending will result in a new query or table
    - **Append Queries** add the rows from an existing table into another
- Merge queries
    - Merging queries allows integrating data (even from different data sources such as SQL Server and a CSV file)
    

**Profile data**

- Examine data structures: using ***Model*** view
- Data anomalies and statistics:
    - By default, Power Query examines the first 1000 rows of your data set. To change this, select the profiling status in the status bar and select **Column profiling based on entire data set**.
    - **Column profile:** Starting point to determine outliers
        
        
        | Column statistics | Value distribution |
        | --- | --- |
        | Ex: Draw attention if you have a maximum value that is beyond what your business identifies as a "maximum” | Ex: If a value appears far more than other values in a column |

****Advanced Editor (M code)****

- Each time you shape data in Power Query, you create a step → The combined steps are available in Power Query Advanced Editor
    
    ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%208.png)
    
    ![08-m-code (2).png](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/08-m-code_(2).png)

**Lab: Transform and load data**

- ***Go to Column** is a useful feature with many columns. Otherwise, you can horizontally scroll find columns.*

- **Merge Columns**
    - To create a single name column, first select the **FirstName** column header. While pressing the **Ctrl** key, select the **LastName** column.
        
        ![https://raw.githubusercontent.com/MicrosoftLearning/PL-300-Microsoft-Power-BI-Data-Analyst/Main/Instructions/Labs/Linked_image_Files/02-load-data-with-power-query-in-power-bi-desktop_image22.png](https://raw.githubusercontent.com/MicrosoftLearning/PL-300-Microsoft-Power-BI-Data-Analyst/Main/Instructions/Labs/Linked_image_Files/02-load-data-with-power-query-in-power-bi-desktop_image22.png)
        
    - Right-click either of the select column headers, and then in the context menu, select **Merge Columns** *(available in the ribbon as well)*

- **Custom Column**
    - *You may recall in the **Prepare Data in Power BI Desktop** lab that a small percentage of **FactResellerSales** rows had missing **TotalProductCost** values.*
    - *The **DimProduct** column has been included to retrieve the product standard cost column to assist fixing the missing values.*
        - Expand the **DimProduct** column → include only the **StandardCost** column
        - `if [TotalProductCost] = null then [OrderQuantity] * [StandardCost] else [TotalProductCost]`

- **Fixed Decimal Number ($ symbol)**
    - *The fixed decimal number data type allows for 19 digits, and allows for more precision to avoid rounding errors.*
    - *It’s important to use the fixed decimal number type for **financial values**, or rates (like exchange rates).*
        - Unit Price
        - Sales
        - Cost

- **Custom From Examples**

- Transform > Number Column > Standard > Multiply
    - To multiply the **Target** values by 1000
        
        ![https://raw.githubusercontent.com/MicrosoftLearning/PL-300-Microsoft-Power-BI-Data-Analyst/Main/Instructions/Labs/Linked_image_Files/02-load-data-with-power-query-in-power-bi-desktop_image63.png](https://raw.githubusercontent.com/MicrosoftLearning/PL-300-Microsoft-Power-BI-Data-Analyst/Main/Instructions/Labs/Linked_image_Files/02-load-data-with-power-query-in-power-bi-desktop_image63.png)
        

- **Merging queries:** **Privacy Levels**
    - Privacy levels can be configured for data source to determine whether data can be shared between sources.
    - Setting each data source as **Organizational** allows them to share data, if necessary.
    - Private data sources can never be shared with other data sources. It doesn’t mean that Private data can't be shared; it means that the Power Query engine can't share data between the sources.
        
        ![https://raw.githubusercontent.com/MicrosoftLearning/PL-300-Microsoft-Power-BI-Data-Analyst/Main/Instructions/Labs/Linked_image_Files/02-load-data-with-power-query-in-power-bi-desktop_image74.png](https://raw.githubusercontent.com/MicrosoftLearning/PL-300-Microsoft-Power-BI-Data-Analyst/Main/Instructions/Labs/Linked_image_Files/02-load-data-with-power-query-in-power-bi-desktop_image74.png)
        

- **Not load a table to data model**
    - In the **Query Settings** pane, select the **All Properties** link.
        
        ![https://raw.githubusercontent.com/MicrosoftLearning/PL-300-Microsoft-Power-BI-Data-Analyst/Main/Instructions/Labs/Linked_image_Files/02-load-data-with-power-query-in-power-bi-desktop_image80.png](https://raw.githubusercontent.com/MicrosoftLearning/PL-300-Microsoft-Power-BI-Data-Analyst/Main/Instructions/Labs/Linked_image_Files/02-load-data-with-power-query-in-power-bi-desktop_image80.png)
        
    - In the **Query Properties** window, UNCHECK the **Enable Load To Report** checkbox.
        
        ![https://raw.githubusercontent.com/MicrosoftLearning/PL-300-Microsoft-Power-BI-Data-Analyst/Main/Instructions/Labs/Linked_image_Files/02-load-data-with-power-query-in-power-bi-desktop_image81.png](https://raw.githubusercontent.com/MicrosoftLearning/PL-300-Microsoft-Power-BI-Data-Analyst/Main/Instructions/Labs/Linked_image_Files/02-load-data-with-power-query-in-power-bi-desktop_image81.png)
        

### Design a data model

- **Develop data model**
    - **Developing the model involves the following tasks:**
        - Connect to data
        - Transform and prepare data
        - Define business logic by adding DAX calculations
        - Enforce data permissions with row-level security by adding roles
        - Publish the model to Power BI
        
        Optimal models are important for delivering good query performance and for minimizing data refresh times and the use of service resources, including memory and CPU.
        
    
    - **Star schema:**
        - **Fact tables** store an accumulation of rows that represent ***observations*** or ***events*** that record a specific business activity
            
            Ex: sales orders and the order lines; record stock movements, stock balances, or daily currency exchange rates.
            
        - **Dimension tables** describe your business entities, which commonly represent people, places, products, or concepts.
            
            
    - **Filtering:** or slicing
        - Filters can be applied to three different scopes: the entire report, a specific page, or a specific visual.
        - Filtering is also applied in the background when row-level security (RLS) is enforced.
            - Ex: When doing Learnit’s PBI course: apply RLS so that a specific role can only see the data of the West region.
        - Each report visual can inherit filters or have filters directly applied to it.
        
- **Choose a PBI model framework: import model, DirectQuery model, or composite model?**
    - **PBI model fundamentals:**
        - **Data model** (or model):
            - comprises of tables
            - It can also include relationships, hierarchies, and calculations.
            
            ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2011.png)
            
        - **PBI dataset:** a model published to a workspace in PBI Service ⇒ dataset
            - Some datasets represent connections to external-hosted models in AAS or SSAS
            - Others can represent real-time data structures (push datasets, streaming datasets, or hybrid datasets)
        - **Analytic query:**
            - When PBI visualizes dataset data, it prepares and sends an analytic query.
            - An analytic query has three phases executed in order: Filter → Group → Summarize
        - **Star schema design**
        - **Table storage mode**
            - **Import** – Queries retrieve data that’s stored, or cached, in the model.
            - **DirectQuery** – Queries pass through to the data source.
            - **Dual** – Queries retrieve stored data or pass through to the data source. Power BI determines the most efficient plan, striving to use cached data whenever possible.
        - **Model framework:**
            - An import model: all tables’ storage mode set to **Import**
            - A DirectQuery model: all tables’ storage mode set to **DirectQuery**
            - A composite model: more than one source group.
        
    - ****Import model****
        
        **Benefits:**
        
        - Support all Power BI data source types: databases, files, feeds, web pages, dataflows, and more.
        - Can integrate source data. For example, one table sources its data from a relational database while a related table sources its data from a web page.
        - Support all DAX and Power Query (M) functionality.
        - Support calculated tables.
        - Deliver the best query performance. That’s because the data cached in the model is optimized for analytic queries (filter, group, and summarize) and the model is stored entirely in memory.
        
        **Limitations:**
        
        - **Model size:** 1-GB per dataset limit (refers to the compressed size of the Power BI model, not the volume of data being collected from the source system)
        - **Data refresh:** Imposes limits on how often scheduled refresh operations can occur (up to 8 times per day in a shared capacity, and up to 48 times per day in a dedicated capacity)
            - By default, to refresh a table, Power BI removes all data and reloads it again.
            - For large fact tables, to reduce burden → incremental refresh ⇒ automates the creation and management of time-period partitions, and intelligently update only those partitions that require refresh.
            
    - **DirectQuery model**
        
        **Benefits:**
        
        - Source data is large (e.g., an entire data WH) and changes rapidly + users need to see current data
        - ****Enforce source RLS:****
            - Useful when the source database already enforces row-level security (RLS). Instead of replicating those RLS rules in  PBI model, the source data base can enforce its rules.
            - Works only for some relational databases (see [Azure SQL Database with DirectQuery](https://learn.microsoft.com/en-us/power-bi/connect-data/service-azure-sql-database-with-direct-connect))
        - ****Data sovereignty restrictions:****
            - If your organization has security policies that restrict data leaving their premises, then it isn’t possible to import data. A DirectQuery model that connects to an on-premises data source may be appropriate. ([Power BI Report Server](https://learn.microsoft.com/en-us/power-bi/report-server/get-started) for on-premises reporting)
        - ****Create specialized datasets:****
            - You can connect to a **PBI dataset** (or Azure Analysis Services model) and convert it to a DirectQuery local model.
            - The original dataset is a remote model, and the new dataset is the local model.
            - Can personalize and/or extend a remote model:
                - Rename objects (tables or columns), add measures, calculated columns or calculated tables
                - Can add new Import or DirectQuery tables → might become a composite model
        
        **Limitations:**
        
        - **Not all data sources are supported:** Only major relational database systems are supported.
        - All Power Query (M) transformations are not possible
            - Ex: If you are connecting to a MySQL database, you would write a native query in MySQL flavor.
                
                → Native queries are used to translate Power Query (M) transformations into a language that the underlying data source can understand. 
                
                → This means that some transformations, such as pivot and unpivot, cannot be translated into a native query and are therefore not supported in DirectQuery.
                
        - Analytic query performance can be slow, especially if source systems aren’t optimized (with indexes or materialized views), or database has insufficient resources for the analytic workload.
        - Analytic queries can impact on source system performance → could result in slower experience for all workloads, including OLTP operations.
        
        ****Boost DirectQuery model performance:****
        
        - ****Data source optimizations:**** create indexes and materialized views; ensure the database has sufficient resources for all workloads
        - ****Aggregation tables using DirectQuery storage mode:****
            - [User-defined aggregation](https://learn.microsoft.com/en-us/power-bi/transform-model/aggregations-advanced)
            - When you set the aggregation table to DirectQuery storage mode, it can query a materialized view in the data source.
            
    - **Composite model:**
        
        **Benefits:** 
        
        - Boost performance (when some analytic queries can be performed from imported data)
        - Can extend your model with new calculated columns and tables
        
        **Limitations:**
        
        - Import (or dual, as described later) storage mode tables requires periodic refresh as imported data can become out of sync with DirectQuery sourced data
        - ******When an analytic query must combine imported and DirectQuery data, Power BI must consolidate source group query results, which can impact performance.
        - When chaining models (DirectQuery to Power BI datasets), modifications made to upstream models can break downstream models ([dataset impact analysis](https://learn.microsoft.com/en-us/power-bi/collaborate-share/service-dataset-impact-analysis))
        - Relationships between tables from different source groups are known as limited relationships. A model relationship is limited when the Power BI can’t determine a “one” side of a relationship. Limited relationships may result in different evaluations of model queries and calculations. (see [Relationship evaluation](https://learn.microsoft.com/en-us/power-bi/transform-model/desktop-relationships-understand))
        
        ****Boost DirectQuery model performance with import data:****
        
        - ******To help avoid this situation for higher-grain queries → Can add aggregation tables using Import storage mode to your model (or enable automatic aggregations) and set related dimension tables to dual storage mode.
            
            ⇒ This way, Power BI directs higher-grain fact queries to a cached aggregation.
            
            ⇒ Slicer visuals and filter card lists (often based on dimension table columns) render more quickly because they’re queried from cached data.
            
        
        ****Deliver real-time data from an import model:**** Premium license
        
        - When you set up an import table with incremental refresh, you can enable the **Get the latest data in real-time with DirectQuery** option.
            
            ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2012.png)
            
        - By enabling this option, Power BI automatically creates a table partition that uses DirectQuery storage mode.
        - In this case, the table becomes a **hybrid table**, meaning it has import partitions to store older data, and a single DirectQuery partition for current data.
        - When Power BI queries a hybrid table, the query uses the cache for older data, and passes through to the data source to retrieve current data.
        
        <aside>
        💡 Choose the **import** model framework whenever possible. This framework offers you the most options, design flexibility, and delivers fast performance. Be sure to apply data reduction techniques to ensure that Power BI loads the least amount of data possible.
        
        Choose the **DirectQuery** model framework when your data source stores large volumes of data and/or your report needs to deliver near real-time data.
        
        Choose the **composite** model framework to:
        
        - Boost the query performance of a DirectQuery model.
        - Deliver near real-time query results from an import model.
        - Extend a Power BI dataset (or Azure Analysis Services model)
        
        You can boost the query performance of a DirectQuery model by using aggregation tables that use either import or DirectQuery storage mode:
        
        - When using import aggregation tables, be sure to set related dimension tables to use dual storage mode. That way, Power BI can satisfy higher-grain queries entirely from cache.
        - When you set the aggregation table to DirectQuery storage mode, it can query a materialized view in the data source.
        
        You can deliver near real-time query results from in import model by creating a hybrid table. In this case, Power BI adds a DirectQuery partition for the current period.
        
        Lastly, you can create specialized models by chaining to a core model by using DirectQuery. This type of development is typically done by a business analyst who extends core models, which IT delivers and supports.
        
        </aside>
        
- **Design a data model in Power BI**
    
    ****Work with tables****
    
    - Build relationships between tables
    - Configure table and column properties: **Properties** pane
        
        | General tab | Formatting tab (when click on column) | Advanced tab |
        | --- | --- | --- |
        | • Edit the name and description of the column
        • Add synonyms that can be used to identify the column when you are using the Q&A feature
        • Add columns into a folder to further organize the table structure
        • Hide or show the column | • Change the data type
        • Format date | • Sort by a specific column
        • Assign a specific category to the data (ex: 🌐 icon displayed if choose category “Country/Region for a column)
        • Summarize the data
        • Determine if the column or table contains nulls |
        
    
    ****Create a date table****
    
    - ****Create a common date table****
        - **Source data:** Occasionally, source databases and data warehouses already have their own date tables.
            - Identify company holidays
            - Separate calendar and fiscal year
            - Identify weekends versus weekdays
        - ****DAX:**** CALENDARAUTO() or CALENDAR()
            
            ```jsx
            Dates  = CALENDAR(DATE(2011, 5, 31), DATE(2022, 12, 31))
            ```
            
        
        You also want to see columns for just the year, the month number, the week of the year, and the day of the week: select **New Columns**
        
        ```jsx
        Year = YEAR(Dates[Date])
        MonthNum = MONTH(Dates[Date])
        WeekNum = WEEKNUM(Dates[Date])
        DayoftheWeek = FORMAT(Dates[Date], "DDDD")
        ```
        
        - ****Power Query:**** [link](https://learn.microsoft.com/en-us/training/modules/design-model-power-bi/3-date-table)
        
    - ****Mark as the official date table****
    - ****Build your visual****
        - Need to establish a relationship btw common date table and the Sales and Orders tables.
    
    ****Work with dimensions****
    
    - ****Hierarchies****
        - Values of the date type auto entered as a hierarchy (if the table has not been marked as a date table)
            
            ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2014.png)
            
        - Consider that you want to create a stacked bar chart of **Total Sales by Category and Subcategory →** create a hierarchy in the **Product** table for categories and subcategories.
            - Right-click **Category Name** > **New hierarchy**
                
                ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2015.png)
                
            - Drag and drop the **Subcategory** column into this new hierarchy
            - In **Properties** pane > scroll down > select **Apply Level Changes** for hierarchy
            - Visualize
                
                ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2016.png)
                
            - Drill down on the visual to view both **Category** and **Subcategory**
                
                ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2017.png)
                
    
    - ****Parent-child hierarchy:**** multiple employees can have the same manager, manager is “child” of another manager
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2018.png)
        
        → Your responsibility to "flatten" it so that you can see more data granularity.
        
        ****Flatten parent-child hierarchy****
        
        - DAX to retrieve managerial path for each employee
            
            ```jsx
            Path = PATH(Employee[Employee ID], Employee[Manager ID])
            ```
            
            ![Roger M (ID 1013) ← Pam H (ID 1011) is his manager ← Roy F (ID 1010) is her manager](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2019.png)
            
            Roger M (ID 1013) ← Pam H (ID 1011) is his manager ← Roy F (ID 1010) is her manager
            
        - To flatten the hierarchy → PATHITEM function
        
        ```jsx
        Level 1 = PATHITEM(Employee[Path],1)
        ```
        
        ```jsx
        Level 2 = PATHITEM(Employee[Path],2)
        ```
        
        ```jsx
        Level 3 = PATHITEM(Employee[Path],3)
        ```
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2020.png)
        
        - Create a hierarchy as did previously
        
    - ****Role-playing dimensions:****
        - A **role-playing dimension** is a dimension that can filter related facts differently.
        - For example, at Adventure Works, the date dimension table has three relationships to the **FactResellerSales** table.
            
            ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2021.png)
            
            → You have a table named **FactResellerSales** that includes two date columns, **OrderDateKey** and **ShipDateKey.** 
            
            → Both columns are related to the **Date** column in the **DimDate** table. 
            
            → In this case, the **Date** table is described as a role-playing dimension because it could play the role of *order date* or *ship date*.
            
            ⇒ While this design is possible, it's important to understand that there can only be one active relationship between two tables. All remaining relationships must be set to inactive.
            
            ⇒ In this instance, the active relationship is set to the most common filter used by reports at Adventure Works: *order date* relationship.
            
        - To use inactive relationships: `USERELATIONSHIP`
        - [Mitchell's course: avoid rebuild measures for role-playing dimension (from 1:53:58)](https://www.youtube.com/watch?v=MrLnibFTtbA&pp=ygUaZGF0YSBtb2RlbGxpbmcgaW4gcG93ZXIgYmk%3D) **Tabular Editor add-ins → Calculation groups**
    
    ****Define data granularity****
    
    - **Data granularity:** The ***level of detail*** in your data (more granularity → greater level of detail)
    
    Scenario: You company manages 1,000 refrigerated semi-trucks. Every few minutes, each truck uses a MS Azure IoT application to record its current temperature → TOO MANY records each day to find interesting ones.
    
    - You might want to import the data by using a daily average for each truck → reduce the records in the database to one record for each truck for each day.
        
        → If acceptable enough for tracking costs and errors, then use that data granularity.
        
    - Alternatively, you could select the last recorded temperature, or you could only import records that are above or below a normal range of temperatures.
    
    ⇒ Any of these methods will reduce the total records that you import, while still bringing in data that is comprehensive and valuable.
    
    For different scenarios, you could settle on data granularity that is defined weekly, monthly, or quarterly.
    
    - ****Change data granularity to build a relationship between two tables****
        
        Asked to build a matrix of total sales and budget over time by using the **Calendar**, **Sales**, and **Budget** tables. 
        
        - Lowest level of time-based detail that the **Sales** table goes into is by day, for instance 5/1/2020, 6/7/2020, and 6/18/2020.
        - The **Budget** table only goes to the monthly level, for instance, the budget data is 5/2020 and 6/2020.
            
            ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2022.png)
            
            As shown in the preceding figure, a relationship between Budget and Calendar is missing. 
            
            Current columns of 2 tables:
            
            ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2023.png)
            
            - Concatenate the **Year** and **Month** columns of the **Budget** table
            - Change **MonthYear** column’s data type to Date type (auto create hierarchy)
            - Change format to dd/mm/yyyy ****(auto generates 1st of each month)
            - Create the relationship: **MonthYear** column of **Budget** table - **Date** column of **Calendar** table
                
                ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2024.png)
                
            - Visualize
                
                ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2025.png)
                
    
    - **Lab: Model data in Power BI Desktop**
        
        ****Cross-filter direction:****
        
        - **Cross Filter Direction** dropdown list > **Single**
        - *Single filter direction means that filters propagate from the “one side” to the “many side”. In this case, it means filters applied to the **Product** table will propagate to the **Sales** table, but not in the opposite direction.*
            
        **Configure tables:**
        
        - **Properties** pane > **Display Folder** box
            
            *2 columns are now inside a folder **Formatting***
            
            ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2027.png)
            
        
        - **Category**
            
            *Data categorization can provide hints to the report designer. In this case, categorizing the column as country or region* (🌐) *provides more accurate information to Power BI when it renders a map visualization.*
            
            ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2028.png)
            
        
        - ****Create a many-to-many relationship:**** [Read this section carefully](https://microsoftlearning.github.io/PL-300-Microsoft-Power-BI-Data-Analyst/Instructions/Labs/03-configure-data-model-in-power-bi-desktop.html#review-the-model-interface-1)
            
            *Consider that the **Salesperson** table filters the **Sales** table. It also filters the **SalespersonRegion** table, but it doesn't continue by propagating filters to the **Region** table (the arrowhead is pointing the wrong direction btw SalespersonRegion and Region).*
            
            ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2029.png)
            
            *After configuring, relationship has double-arrow head and the other relationship is inactive.*
            
            ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2030.png)
            
        
        **Understanding the lab then come back to this [module](https://learn.microsoft.com/en-us/training/modules/design-model-power-bi/6-relationships-cardinality) can help understanding section *Cross-filter direction &* *Cardinality and cross-filter direction* better.**
        

### DAX

- **Write DAX formula**
    
    **DAX formula**
    
    - Calculated tables
        - Date tables
        - Role-playing dimensions
        - What-if analysis
            - A calculated table is automatically added to your model.
            - What-if parameters allow report users to select or filter by values stored in the calculated table.
            - What-if calculated tables aren't related to other model tables.
    - Calculated columns: Add New Column > include calculations
    
    ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2031.png)
    
    - Measures
        - Measures don't store values in the model.
        - Measures are only evaluated during query time to return summarizations of model data.
        - Measures can reference other measures → compound measure.
        - *Implicit measures* only use a specific aggregation function (e.g., either SUM or AVG etc.)
        - (*Explicit) measures* are more complex calculations (e.g., calculate the ratio of each month's sales amount over the yearly sales amount)
    
    <aside>
    💡 While **calculated** **columns** are evaluated during data **refresh** time, **measures** are only evaluated during **query** time.
    
    </aside>
    
    <aside>
    💡 Add **custom columns (using M)** to Power Query queries.
    
    Add **calculated columns (using DAX)** to model tables.
    
    </aside>
    
    ****DAX data types****
    
    | Model data type | DAX data type | Related function |
    | --- | --- | --- |
    | N/A | BLANK | https://learn.microsoft.com/en-us/dax/blank-function-dax/ DAX function returns BLANK
    https://learn.microsoft.com/en-us/dax/isblank-function-dax/ DAX function tests whether an expression evaluates to BLANK |
    
    **DAX operators**
    
    - ****Comparison operators****
        
        
        | Operator | Description |
        | --- | --- |
        | == | Strict equal to |
        
        All comparison operators, **EXCEPT** **strict equal to** (**==**), treat BLANK as equal to the number zero, an empty string (""), the date December 30, 1899, or FALSE. 
        
        - `[Revenue] = 0` will be TRUE when the value of `[Revenue]` is either zero or BLANK.
        - `[Revenue] == 0` is TRUE only when the value of `[Revenue]` is zero.
    - ****Text concatenation operator****
        
        ```jsx
        Model Color = 'Product'[Model] & "-" & 'Product'[Color]
        ```
        
    - ****Logical operators****
    
    | Operator | Description |
    | --- | --- |
    | && | AND |
    | || (double pipe) | OR |
    | IN |  |
    | NOT |  |
    
    ```jsx
    ANZ Revenue =
    CALCULATE(
        [Revenue],
        Customer[Country-Region] IN {
            "Australia",
            "New Zealand"
        }
    )
    ```
    
- **Add measures (can skip)**
    
    [Add measures to Power BI Desktop models - Training](https://learn.microsoft.com/en-us/training/modules/dax-power-bi-add-measures/)
    
- **Add calculated tables and columns**
    - Ex: When the formula is evaluated for each row, the `'Due Date'[Due Date]` column reference returns the column value for *that row* (like how Excel works)
    - However, row context doesn't extend beyond the table. If your formula needs to reference columns in other tables:
        - If the tables are related, directly or indirectly:
            - `RELATED` function retrieves the value at the one-side of the relationship,
            - `RELATEDTABLE` retrieves values on the many-side (returns a table object)
        - When the tables aren't related, you can use the `[LOOKUPVALUE](https://learn.microsoft.com/en-us/dax/lookupvalue-function-dax/)` DAX
        - Ex: Add to the **Sales** table:
            
            ```jsx
            Discount Amount =
            (
                Sales[Order Quantity]
                    * RELATED('Product'[List Price])
            ) - Sales[Sales Amount]
            ```
            
- **DAX time intelligence + Lab**
    
    Time intelligence calculations modify the filter context for ***date filters*** (involving a date table).
    
    Useful for cumulative calculations like yearly/quarterly/monthly running total/average
    
    - `[TOTALYTD](https://learn.microsoft.com/en-us/dax/totalytd-function-dax/)` Evaluates an expression for YTD in the current filter context (can only pass 1 filter expression)
        - `[TOTALQTD](https://learn.microsoft.com/en-us/dax/totalqtd-function-dax/)` , `[TOTALMTD](https://learn.microsoft.com/en-us/dax/totalmtd-function-dax/)`
    
    <aside>
    💡 If need to apply multiple filter expressions, use `CALCULATE` + `DATESYTD` functions.
    
    </aside>
    
    - `[DATESYTD](https://learn.microsoft.com/en-us/dax/datesytd-function-dax/)` Returns a 1-column table that contains dates for the year-to-date
        - `[DATESQTD](https://learn.microsoft.com/en-us/dax/datesqtd-function-dax/)` , `[DATESMTD](https://learn.microsoft.com/en-us/dax/datesmtd-function-dax/)`
    - `[DATESBETWEEN](https://learn.microsoft.com/en-us/dax/datesbetween-function-dax/)` Returns a 1-column table that contains dates (given start date, ***given end date***)
    - `[DATESINPERIOD](https://learn.microsoft.com/en-us/dax/datesinperiod-function-dax/)` Returns a 1-column table that contains dates (given start date, ***number of intervals***)
    
    ****Comparisons over time****
    
    - `[DATEADD](https://learn.microsoft.com/en-us/dax/dateadd-function-dax/)` Returns a 1-column table that contains dates
    - `[PARALLELPERIOD](https://learn.microsoft.com/en-us/dax/parallelperiod-function-dax/)`
    
    <aside>
    💡 Dates starts at June 10 and finishes at June 21 of the same year → want to shift that selection forward by one month: 
    + `DATEADD` returns only dates from July 10 to July 21
    + `PARALLELPERIOD` returns all dates from the next month (July 1 to July 31)
    
    </aside>
    
    - `[SAMEPERIODLASTYEAR](https://learn.microsoft.com/en-us/dax/sameperiodlastyear-function-dax/)` Returns a 1-column table that contains dates shifted 1 year back in time from the dates specified.
    - Others: `[NEXTDAY](https://learn.microsoft.com/en-us/dax/nextday-function-dax/)` and `[PREVIOUS](https://learn.microsoft.com/en-us/dax/previousday-function-dax/)DAY` (MONTH, QUARTER, YEAR)
    
    📌 **See [example](https://learn.microsoft.com/en-us/training/modules/dax-power-bi-time-intelligence/2-functions) in each section and in lab**
    
    📌 ****Additional time intelligence calculations:**** [Read examples](https://learn.microsoft.com/en-us/training/modules/dax-power-bi-time-intelligence/3-calculations)
    
    - ****Calculate new occurrences**** (life-to-date (LTD) calculations)
        
        Ex: Calculate number of new customers up to Aug 2017
        
        Calculate number of new customers within Aug 2017
        
    - ****Snapshot calculations****
        
        Ex: Last recorded units balance for each month
        
        - [`LASTDATE`](https://learn.microsoft.com/en-us/dax/lastdate-function-dax)
        - [`LASTNONBLANK`](https://learn.microsoft.com/en-us/dax/lastnonblank-function-dax)
            
            
            | Term | Definition |
            | --- | --- |
            | column | A column expression |
            | expression | An expression evaluated for blanks (for each value of column) |
    - **Lab:** `REMOVEFILTERs`
        
        **Work with Filter Context:** Matrix visual
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2032.png)
        
        - Sales % All Region
            
            ```jsx
            Sales % All Region =  
            DIVIDE(  
             SUM(Sales[Sales]),  
             CALCULATE(  
             SUM(Sales[Sales]),  
             REMOVEFILTERS(Region)  
             )  
            )
            ```
            
            R*emoves any filters applied to the **Region** table*
            
        
        - Sales % Country
            
            ```jsx
            Sales % Country =  
            DIVIDE(  
             SUM(Sales[Sales]),  
             CALCULATE(  
             SUM(Sales[Sales]),  
             REMOVEFILTERS(Region[Region])  
             )  
            )
            ```
            
            *Removing filters on the **Region** column of the  table, not all columns of the  table. It means that any filters applied to the group or country columns are preserved. It will achieve a result that represents the sales as a percentage of country.*
            
            - To improve the readability of measure **Sales % Country**
                
                ```jsx
                Sales % Country =  
                IF(  
                 ISINSCOPE(Region[Region]),  
                 DIVIDE(  
                 SUM(Sales[Sales]),  
                 CALCULATE(  
                 SUM(Sales[Sales]),  
                 REMOVEFILTERS(Region[Region])  
                 )  
                 )  
                )
                ```
                
                ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2033.png)
                
                *The IF() function uses the ISINSCOPE() function to test **whether the region column is the level in a hierarchy of levels**. When true, the DIVIDE() function is evaluated.*
                
            
        - Sales % Group
            
            ```jsx
            Sales % Group =  
            DIVIDE(  
             SUM(Sales[Sales]),  
             CALCULATE(  
             SUM(Sales[Sales]),  
             REMOVEFILTERS(  
             Region[Region],  
             Region[Country]  
             )  
             )  
            )
            ```
            
            ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2034.png)
            
            - To improve the readability of measure **Sales % Group**
            
            ```jsx
            Sales % Group =  
            IF(  
             ISINSCOPE(Region[Region])  
             || ISINSCOPE(Region[Country]),  
             DIVIDE(  
             SUM(Sales[Sales]),  
             CALCULATE(  
             SUM(Sales[Sales]),  
             REMOVEFILTERS(  
             Region[Region],  
             Region[Country]  
             )  
             )  
             )  
            )
            ```
            
            ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2035.png)
            
        
        **Work with Time Intelligence**
        
        ****Create a YTD measure****
        
        ```jsx
        Sales YTD =  
        TOTALYTD(SUM(Sales[Sales]), 'Date'[Date], "6-30")
        ```
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2036.png)
        
        *The TOTALYTD() function evaluates an expression—in this case the sum of the **Sales** column—over a given date column. The date column must belong to a date table marked as a date table, as was done in the **Create DAX Calculations in Power BI Desktop** lab.*
        
        *The function can also take a third optional argument representing the last date of a year. By default, December 31 is the last date of the year. For Adventure Works, June in the last month of their year, and so “6-30” is used.*
        
        *For example, to compute YTD sales for September 2019 (the third month of the fiscal year), all filters on the **Date** table are removed and replaced with a new filter of dates commencing at the beginning of the fiscal year (July 1, 2019) and extending through to the last date of the in-context date period (September 30, 2019).*
        
        ****Create a YoY growth measure**** (compare a year to the previous year)
        
        ```jsx
        Sales YoY Growth =  
        VAR SalesPriorYear =  
         CALCULATE(  
         SUM(Sales[Sales]),  
         PARALLELPERIOD(  
         'Date'[Date],  
         -12,  
         MONTH  
         )  
         )  
        RETURN  
         DIVIDE(  
         (SUM**(**Sales[Sales]**)** - SalesPriorYear),  
         SalesPriorYear  
         )
        ```
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2037.png)
        
        *PARALLELPERIOD() function to shift 12 months back from each date in filter context.*
        

### Optimize model performance

**Review performance**

- Identify the slowest query in the semantic model → work through
- **View** tab > **Performance Analyzer** > **Start recording**
    - Make sure to start with a clear visual cache and a clear data cache
    - Review result:
        - **DAX query** - The time it took for the visual to send the query, along with the time it took Analysis Services to return the results.
        - **Visual display** - The time it took for the visual to render on the screen, including the time required to retrieve web images or geocoding.
        - **Other** - The time it took the visual to prepare queries, wait for other visuals to complete, or perform other background processing tasks. (If displays a long duration → optimize DAX queries for other visuals, or reduce the number of visuals in the report).
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2038.png)
        
    - To analyze your queries in more detail → DAX Studio (open-source tool)

****Resolve issues and optimize performance****

- ****Visuals:**** fewer visuals → better performance
- **DAX query:** take ≤ 120 milliseconds
- ****Relationships:**** established correct relationships
- **Columns:** don’t import columns not needed
- ****Metadata:**** Identify unnecessary columns, data errors, incorrect data types, volume of data loaded, etc.
    - Remove unnecessary columns/rows
    - Ensure data type is correct
    - Column quality, Column distribution, Column profile
    - File size of data loaded into PBI
    - Data refresh rate
    
    Benefit of analyzing the metadata → identify data inconsistences with your semantic model.
    
- ****Auto date/time feature****
    - If your data source already defines a date dimension table, that table should be used to consistently define time within your organization → should disable **Auto date/time** → lower the size of your semantic model & reduce the refresh time
    - Enable/disable this **Auto date/time** option globally → applies to all PBI files
    - Enable/disable the option for the current file only
    - **File** **>** **Options and settings** **>** **Options (**either the **Global** or **Current File** section) > **Data Load** > **Time Intelligence**
    

****Use variables (VAR) in DAX****

****Reduce cardinality****

- ****Cardinality levels in columns:**** A column with lots of unique values → high level of cardinality. Lower cardinality = optimized performance.
- ****Reduce relationship cardinality****
- ****Reduce cardinality levels****
    
    For example, a source sales fact table stores one row for each individual transaction order. Significant data reduction could be achieved by grouping by date at month level. However, reporting at day level or an individual order level is no longer possible → lose the ability to drill through. This tradeoff could be mitigated by using a **mixed model design**.
    
    - The summarized sales data could be used to achieve high performance "summary" reporting.
    - A drill-through page could be created to display granular sales for specific (and narrow) filter context. It would include visuals based on a **DirectQuery** table to retrieve the sales order details.

****Optimize DirectQuery models with table level storage:**** [link](https://learn.microsoft.com/en-us/training/modules/optimize-model-power-bi/5-directquery-models)

****Create and manage aggregations****

Ex: Aggregate this sales data at the day level

![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2039.png)

- If you have access to the database, you could create a table/view with the aggregation and then import that table/view into Power BI Desktop.
- In PBI Desktop, you can use Power Query Editor to create the aggregations step-by-step.
    - Choose Columns > **OrderDate,** **OrderQuantity,** **SalesAmount** columns
    - Group By
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2040.png)
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2041.png)
        

### ****Build PBI visuals and reports****

- **Scope**
    
    ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2042.png)
    
    ****Dashboard**** 
    
    - "How are we doing?" or "Are we there yet?”
    - Analytics values, targets, statuses, and trends
    
    ****Analytical reports****
    
    - "How are we doing?"
    - "Why did that happen?" or "What might happen next?"
    - Common: drill down, drill through, and tooltips (e.g., sales revenue from year, down to quarter, month, and day.)
    
    ****Operational reports****
    
    - Monitor current or real-time data, make decisions, and act on those decisions
    - Minimize the number of analytical features
    - A good example of an operational report → allows monitoring of a manufacturing production line.
        
        When an unexpected event arises, such as equipment malfunction, a button could allow workers to start a maintenance request.
        
    
    ****Educational reports****
    
    - Often used in journalism and by governments to disseminate information to large audiences that have varying levels of understanding of the subject
    - Ex: COVID-19 vaccination progress
- **Design**
    
    **Layout**
    
    - ****Placement**** left to right and top to bottom
    - ****Balance**** a page to have one large visual to draw initial attention → then supported by smaller visuals that provide context
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2043.png)
        
    - ****Proximity**** related visuals are placed near one another
    - ****Contrast**** emphasize important objects
    - ****Repetition**** Many key metrics are presented in single-value cards → this design allows report consumers to quickly understand and interpret the metrics.
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2044.png)
        
    
    **Margin & Alignment**
    
    - ****Margins****
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2045.png)
        
    - ****Alignment****
        - Alignment of titles and legends *within visuals* should be consistent
        - When multiple visuals are on the report page → spacings between visuals should be consistent
            - ****Implied sections:**** aligning groups of visuals in close proximity
                
                ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2046.png)
                
            - ****Explicit sections:**** colored background shapes and spacing (highlighted with shading) separate the visuals into three sections
                
                ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2047.png)
                
        
    
    ****Select report visuals:**** [link](https://learn.microsoft.com/en-us/training/modules/power-bi-effective-reports/5-report-visuals)
    
    - ****Time series visuals****
        
        If missing values are a possibility, a column chart might be a better visual choice because it will help to avoid the interpretation of a non-existent trend.
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2048.png)
        
    
    - ****Proportional visuals****
        
        If necessary, you can reveal the actual values in a tooltip
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2049.png)
        
    
    - ****Grid visuals****
        - Table: A table doesn't support drill down to reveal detailed values
            
            ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2050.png)
            
        - Matrix: A matrix visual allows drill down on the columns and rows to reveal detailed values
            - Can turn off stepped layout
            
            ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2051.png)
            
        - Conditional formatting for grid visuals:
            - Background color
            - Font color
            - Data bars
            - Icons
        
    - ****Performance visuals:****
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2052.png)
        
        - Gauge
        - [KPI](https://learn.microsoft.com/en-us/training/modules/power-bi-effective-reports/8-kpi)
        - Table, with conditional formatting
        - Matrix, with conditional formatting
        
    - **Q&A visuals**
        - Allows for the entry of natural language questions that are answered by data visuals
        
- **Report filters**
    
    ### Filters pane
    
    - If the **Filters** pane isn't hidden, a report consumer can:
        - Clear the filter
        - Apply a new filter
        - Change the filter type: from basic to advanced (unless disabled for the report)
            
            ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2053.png)
            
        - Search for values to filter by (unless disabled for the report)
    - **Top N** filtering can only be achieved in the Filters pane
    
    ### **Slicer**
    
    ✅ A visual that propagates filters to other visuals on the same page or (when synced) across other pages.
    
    ❌ Slicers apply page-level filters
    
    ---
    
    **Relative Date/Time** can also be used for slicer ****
    
    ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2054.png)
    
    ****Sync slicers****
    
    - Click on a slicer visual > **View** ribbon tab > **Show Panes** group > **Sync Slicers**
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2055.png)
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2056.png)
        
    
    ### **Cross filter (or cross highlighting)**
    
    - Report consumers: can temporarily cross filter visuals on the report page by selecting one or more elements in a visual
    - Ex: select a single or multiple bars
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2057.png)
        
    - Report author:
        - By default, cross filtering (or cross highlighting) works between any two visuals
            
            → Can edit visual interactions in either direction
            
        - Can disable cross filtering
        - Can modify to use cross highlighting instead
    
    ### ****Advanced filtering techniques****
    
    - **Visual interactions:**
        
        Stop the filters from a slicer propagating to a visual: **Format** ribbon > **Edit interactions**
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2058.png)
        
    - ****Drill-through****
    - ****Report tooltip****
    - ****Bookmarks****
    
    ### ****Persistent filters****
    
    - Automatically applies the settings when the report consumer reopens the report
    - Revert to default filters:
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2059.png)
        
        If the **Reset to default** button is not available → persistent filters is disabled for the report.
        
    
    ### Query reduction: **Create *Apply* button**
    
    - [In slicer](https://learn.microsoft.com/en-us/power-bi/create-reports/buttons-apply-all-clear-all-slicers?tabs=powerbi-desktop)
    - [In Filters pane](https://learn.microsoft.com/en-us/power-platform-release-plan/2020wave2/power-bi/apply-all-button-report-filters)
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2060.png)
        
    
    <aside>
    💡 **Tips:**
    
    - Use either filters or slicers. Avoid using both filter techniques because it can create confusion.
    - In the **Filters** pane, consider locking or hiding visual-level filters to avoid confusing report consumers. (Often, report consumer shouldn't modify or see visual-level filters.)
    - Create a bookmark to reset all slicers to default values. Then, add a button to the page to invoke the bookmark. For example, the button could be captioned as **Reset slicers**.
    - When a requirement is in place to lay out many slicers, consider creating a page that is dedicated to showing all slicers. For example, the page could be named **Slicers**. Sync the slicers to other pages and then set the slicers as hidden on those pages. This design technique will require that report consumers should always go to the **Slicers** page to modify slicer settings. To help them, you can add a page navigation button at a consistent location on each page so that they can easily return to the **Slicers** page.
    - Consider using other visuals in place of slicers. Be sure to teach report consumers how to cross filter by using these visuals.
    
    For more information, see [Create buttons in Power BI reports](https://learn.microsoft.com/en-us/power-bi/create-reports/desktop-buttons/).
    
    For more information, see [Create page navigation](https://learn.microsoft.com/en-us/power-bi/create-reports/desktop-buttons#create-page-navigation).
    
    </aside>
    

### Enhance reports

****Highlight values****

- Conditional formatting
- Overlaid analytics (trend lines)
    
    ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2061.png)
    
- Anomaly detection [link](https://learn.microsoft.com/en-us/power-bi/visuals/power-bi-visualization-anomaly-detection)
    
    ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2062.png)
    
- Specialized visuals
    
    Highlight values; specifically, the **Key influencers** visual and the **Decomposition Tree** visual.
    

****Design reports that behave like apps: Button action****

- **Q&A** action
    - [Q&A for Power BI business users](https://learn.microsoft.com/en-us/power-bi/consumer/end-user-q-and-a).
    - Unlike the **Q&A** visual, a button that is assigned the  action doesn't occupy significant space on the report page.
- **Web URL** action
    - Opens the URL by using the default web browser
    - Can produce a URL that appends filter context to the query string. For example, if the report consumer filters the page by a single customer, the measure can return a URL to an external system that includes the customer key in the query string.
- ****Work with bookmarks:**** [link](https://learn.microsoft.com/en-us/training/modules/power-bi-effective-user-experience/4-bookmarks) 📌
    
    [Lab instructions](https://microsoftlearning.github.io/PL-300-Microsoft-Power-BI-Data-Analyst/Instructions/Labs/07-design-report-in-power-bi-desktop-enhanced.html#add-bookmarks-and-buttons)
    
    → How to create a bookmark to swap visuals
    
    → Understand “Data” bookmark state
    
    ![Screenshot (2392).png](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Screenshot_(2392).png)
    

****Visual headers****

![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2063.png)

- Always leave sufficient space for the visual headers to appear in the upper-right section of objects.
- Turns off visual headers for objects that don't need them
    
    ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2064.png)
    
- Disable all visual header icons would include the **More options** (**...**) menu
    
    Example use case: When report contains some sensitive data that shouldn’t be exported → disabling the More options (…) icon → report consumers can’t export data
    

****Built-in assistance****

- Information page
    - Dedicate an entire report page that includes instructions and definitions.
    - Configure these buttons to use the **Information** or **Help** icon.
- Visual header tooltip icon
    
    ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2065.png)
    
- Button overlay
    - Use buttons and bookmarks to overlay an image, shape, or text box that provides built-in assistance.
    - Ex: Create a bookmark to swap visuals
    
    ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2066.png)
    

### ****Create dashboards in PBI****

****Configure data alerts****

- PBI service only
- Can only be set on specific visuals such as KPI cards, gauges, and cards.
    
    ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2067.png)
    

****Review Quick insights****

- PBI service only
- Only works with data that is imported to Power BI
    
    ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2068.png)
    
- Can add Quick insights result to your dashboard by selecting **Pin visual**
    
    ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2069.png)
    

****Dashboard theme****

Go to a dashboard > Edit dropdown arrow > **Dashboard theme**

**Pin an entre report page:** [link](https://learn.microsoft.com/en-us/power-bi/create-reports/service-dashboard-pin-live-tile-from-report)

- When you pin an entire page, the tiles are *live →* can interact with them on the dashboard.
- Any changes made to any of the visualizations back in the report editor are reflected on the dashboard when the page is refreshed

****Configure a real-time dashboard:**** [link](https://learn.microsoft.com/en-us/training/modules/create-dashboards-power-bi/7-configure-real-time-dashboard)

****Configure data classification:**** [link](https://learn.microsoft.com/en-us/training/modules/create-dashboards-power-bi/8-configure-data-classification)

- PBI service only → admin role
- Go to dashboard > Hover over the ellipsis (**...**) by the name of the dashboard and then select **Settings**
- If contains highly sensitive information → mark as **High Impact**

**Display refresh time on a dashboard tile**

![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2070.png)

### Perform analytics in PBI

****Statistical summary:**** [link](https://learn.microsoft.com/en-us/training/modules/perform-analytics-power-bi/2-statistical-summary)

- **Top N analysis:** using a Q&A visual, Top N filter, or writing DAX
- **Histogram**
    - From a bar chart > Group your numerical and time field data into "bins" of equal size
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2071.png)
        
- **Identify outliers:** [link](https://learn.microsoft.com/en-us/training/modules/perform-analytics-power-bi/3-visuals/?ns-enrollment-type=learningpath&ns-enrollment-id=learn.wwl.build-power-bi-visuals-reports)
    - Scatter plot
    - DAX

**Grouping & Clustering**

- **Clustering:** [link](https://learn.microsoft.com/en-us/training/modules/perform-analytics-power-bi/5-clustering-techniques)
- ****Group data:****

![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2072.png)

![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2073.png)

**Time series analysis:**

- Microsoft AppSource: [Play Axis (Dynamic Slicer)](https://learn.microsoft.com/en-us/training/modules/perform-analytics-power-bi/6-time-series-analysis)

****Use the Analyze feature****

- Options that are available will depend on the data point selected.
- (**+**) icon to add it to your report

![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2074.png)

****Create what-if parameters:**** [link](https://learn.microsoft.com/en-us/training/modules/perform-analytics-power-bi/8-what-if-parameters)

![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2075.png)

****Specialized visuals:**** [link](https://learn.microsoft.com/en-us/training/modules/perform-analytics-power-bi/9-use-specialized-visuals)

- Key influencers
    
    ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2076.png)
    
- Decomposition tree
    - Lock icon: split added by report author
    - Light bulb icon: split suggested by AI
    
    ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2077.png)
    
- Q&A visual
    - To optimize the Q&A → enhance the semantic model with synonyms and terms.
    - Hide fields, such as fields that are used in model relationships → restrict their use in Q&A.
    - Add suggested questions that become prompts in the **Q&A** visual.
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2078.png)
        

### Paginated report

- [Link](https://learn.microsoft.com/en-us/training/modules/create-paginated-reports-power-bi/)
- PBI Report Builder
- All of the material in the SQL Server Reporting Service (SSRS) documentation will apply to PBI Report Builder

### Manage workspace and semantic model

**Workspace**

- A workspace → share reports, build dashboards, and collaborate with your teams.
- Workspaces appropriate security requirements → easier to share content

---

- Monitor usage and performance
    
    ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2079.png)
    
- Deployment pipeline (Premium): Dev - Test - Prd
- View data lineage
- Sensitivity labels
    
    ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2080.png)
    

**Semantic model**

- Published to organization's workspace → collaborate
- One semantic model can be used for different business reasons → create multiple reports
- Reuse semantic models → productivity boost

---

- Set up and maintain a gateway to access on-premises data source from the cloud
- Refresh semantic models:
    - Schedule refresh → need to have created a [gateway connection](https://learn.microsoft.com/en-us/training/modules/manage-datasets-power-bi/4-power-bi-gateway)
    - Manual refresh
    - Manual incremental refresh
        
        ****Define filter parameters****
        
        1. Power Query > **Home** tab > **Manage Parameters**.
        2. Add two new parameters: **RangeStart** and **RangeEnd**
        3. **Current Value** → configure the start and end of where incremental refresh should occur
            
            ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2081.png)
            
        
        ****Apply the filter****
        
        Go to the applicable **Date** column > select **Custom Filter**
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2082.png)
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2083.png)
        
        ****Define the incremental refresh policy****
        
        Right-click the applicable table > select **Incremental refresh**
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2084.png)
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2085.png)
        
        **Publish to Power BI service**
        
        Defined the incremental refresh policy in PBI Desktop → Need to publish the report to PBI Service to apply that refresh policy
        

---

- Direct users to the most up-to-date and highest-quality semantic models in your workspaces ([link](https://learn.microsoft.com/en-us/training/modules/manage-datasets-power-bi/7-manage-datasets))
    - Promotion does not need specific permissions
    - Certification requires permission from the semantic model owner to access to the semantic model
        
        ![Untitled](https://github.com/mk-duong/learning-materials/blob/main/PowerBI/images/Untitled%2086.png)
        

---

- Query caching ([link](https://learn.microsoft.com/en-us/training/modules/manage-datasets-power-bi/9-query-caching))
    - Use the local caching services of PBI to process query results (aka cloud resources on PBI Premium)
    

### Model security

RLS → access to specific data row

Object-level security (OLS) → access to entire tables or columns
