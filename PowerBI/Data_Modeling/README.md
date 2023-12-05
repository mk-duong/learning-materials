## [Data Modeling for Power BI](https://www.youtube.com/watch?v=MrLnibFTtbA)

### Content
- What is a Star Schema?
- Building Facts and Dimensions
- Understanding Relationships
- Role-playing Dimensions
- Calculation Groups

### Exercises
Use the `Sales` fact table from [student files](https://prag.works/202208-LWTN-Files):
- Create a star schema model
- Create relationships between fact and dimension tables

    ![image](https://github.com/mk-duong/learning-materials/assets/151535478/efa2f08b-4a98-429d-89f0-acd9f9c3bcf9)

### Course note
- If theres no ProductID in fact table, then create SK (using index) when making dimension table

- Geography can be separate into a table so that if more fact tables are to be create in the future => can join them easily

    If leave Geography in the same table as Customer => thats fine too => It filters through the Customer table to the fact table (dont have to store that geography key in the fact table)

- After creating necessary dim tables => remove redundant columns from fact table

- How to create DimCatSeg to filter through DimProduct to the fact table?
  + In DimProduct: join with DimCatSeg on Catetory&Segment => keep DimCatSegSK, remove redundant Category & Segment columns
  + In FactBudget: join with DimCatSeg on Catetory&Segment => keep DimCatSegSK, remove redundant Category & Segment columns
  
  => Multiple fact tables (FactBudget, FactSales) can be modelled with dimensions in common

- In Model view: can create new layout

- Create aggregation table FactAggSales: 
    + To see FactSales at higher grain level
    + Transform in Power Query > Group By

    => (From `2:16:17`) Improve model performance, esp when using DirectQuery for the original FactSales table

- (From `2:17:00`) But there are drawbacks as well, like "What if users dont know whether to use measures in FactSales or the already-created aggregation in FactAggSales to conduct report)

    => (From `2:20:11`) Need to manage aggregations (This action is only enabled when the original FactSales table is in fact using Direct Query, otherwise options are grey out)

    => Avoid causing confusion to users because FactAggSales will now be hidden, but will automatically be used to improve performance