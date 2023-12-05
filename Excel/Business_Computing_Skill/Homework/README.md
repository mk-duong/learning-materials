## Problem 1: Formulas and Conditional Formatting
- Calculate the HW Average (items HW1-HW6) with 1 decimal place, i.e.: 18.0
- Fill in the Bonus Point column for each student based on their attendance with the following rules:
  + Attend 8 or 9 lectures: bonus 0.4 points
  + Attend 6 or 7 lectures: bonus 0.2 points
  + Attend less than 6 lectures: bonus 0 point
- Calculate the Course Grade using the given formula with 2 decimal places:

  *Course Grade = HW Average*0.3 + Midterm Exam*0.3 + Final Exam*0.4 + Bonus*

  ``` =ROUND(K3*0.3+N3*0.3+O3*0.4+M3,2) ```

- Use Conditional Formatting to highlight top-6 students who got the highest scores
- Use IF function to fill the Scholarship column the text “Awarded Scholarship” for students who got the Course Grade greater than 19.0, others leave the field empty:

  ``` =IF(P3>19,"Awarded Scholarship","") ```
  
- Use CONCAT and IF functions to return the percentage of scholarship awarded for 1st, 2nd, and 3rd rank student:
  + 1st: 100%
  + 2nd: 75%
  + 3rd: 50%
    
  ``` =IF(A3>3, " ", CONCAT(IF(A3=3, "50%", IF(A3=2, "75%", "100%")), " awarded")) ```
  
- Use VLOOKUP function to fill:
  + Student Name with respect to rank:

  ``` =VLOOKUP(1,$A$3:$C$22,3,0) ```

  + Course Grade with respect to rank:

  ``` =VLOOKUP(C26,$C$3:$P$22,14,0) ```

  ![Screenshot (2505)](https://github.com/mk-duong/learning-materials/assets/151535478/2da1de49-d363-49cc-b8b5-feb8b9ba583e)

## Problem 2: Basic Chart
- Plot a pie chart in a new worksheet which names *Brigham Corp. Expenses*
  
  ![Screenshot (2506)](https://github.com/mk-duong/learning-materials/assets/151535478/b271a4e6-9028-41c1-8f2f-5a92f8f30e61)

## Problem 3: Trend Line
- Plot a scatter diagram in a new worksheet which names *BalloonsSold*
- Modify each data and marker to fit with its color (for blue data - diamond, and for green data - square)
- Add a trend-line to forecast each data 3 periods in advance (trend-line type: polynomial, order: 4)
  
  ![Screenshot (2508)](https://github.com/mk-duong/learning-materials/assets/151535478/ca67b908-aef9-4f15-8d2a-d48274019345)

## Problem 4: Pivot Table & Pivot Chart
- Create a PivotTable that shows quarterly expenditures for each hotel department:

  ![Screenshot (2514)](https://github.com/mk-duong/learning-materials/assets/151535478/a84d6af4-cc05-40d3-b3ce-99d27dc1c07e)

- Create a PivotChart that shows Total Expenditures Over Quarters For Four Departments):

  ![Screenshot (2516)](https://github.com/mk-duong/learning-materials/assets/151535478/c0cfca5f-7855-40f4-afb0-618e63556dea)

## Problem 5: Sorting & Filtering
-  Apply quick filters to find out all students stated as Hispanic population (Ethnicity column has a value H) who have R-MSS in Top 50% and W-MSS less than 725
-  [File](https://github.com/mk-duong/learning-materials/Excel/blob/main/Business_Computing_Skill/Homework/DuongMinhKhanh_IELSIU19175_Problem4.xlsx)

## Problem 6: Validating Data
- Remove duplicate data in List of Discoverers column
- Circle all cells of column C (Discoverer) that do not belong to the list (List of Discoverers)

  ![Screenshot (2518)](https://github.com/mk-duong/learning-materials/assets/151535478/b233627d-95ef-47b7-9f03-ba68238d19f9)

## Problem 7: What-If Analysis – Scenario Manager
- The manager of the restaurant plans to make some changes as follows:
  + Recruit 3 more staff in Kitchen
  + Increase Renting amount (Overhead) up to $5,000
  + Increase Average hourly rate for Clean up staff to $8.35
  + Decrease Supply amount to Kitchen down to $28,000
    
  Create a scenario to see how these changes would affect on the monthly expense

  ![Screenshot (2520)](https://github.com/mk-duong/learning-materials/assets/151535478/9ada4a79-1d5a-4714-b273-3b6d3639a846)

- Create a summary:
  
  ![Screenshot (2522)](https://github.com/mk-duong/learning-materials/assets/151535478/65c52c00-2299-4e53-bf68-d229887e6ee3)

## Problem 8: What-If Analysis – Goal Seeking
- Currently, the restaurant spends annually $1,221,600.00. However, the manager wants to decrease this spending down to $1,150,000.00 each year
- Use Goal Seek to find out what is the Supply Amount to kitchen department (cell `Average Expenses per month!$E$3`) that you would pay to achieve the financial target the manager had set
- Explain the result that you find

  ![Screenshot (2525)](https://github.com/mk-duong/learning-materials/assets/151535478/4023634d-59dd-45c7-8cf1-a4190b28b2b1)

