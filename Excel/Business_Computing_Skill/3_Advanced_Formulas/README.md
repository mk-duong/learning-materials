## Exercise 1
Use the file **10 Fabrikam Bonus**:
- Apply VLOOKUP to find the Individual Bonus Rate

  In cell E5, enter the formula and use fill handle for other cells:

   ``` =VLOOKUP(B5,$A$16:$C$20,2,TRUE) ```
  
- Apply VLOOKUP to find the Back Office Bonus Rate
   In cell F5, enter the formula and use fill handle for other cells:

  ``` =VLOOKUP(B5,$A$16:$C$20,3,TRUE) ```

  ![Screenshot (2484)](https://github.com/mk-duong/learning-materials/assets/151535478/5e7c9cb5-996e-4d05-be2e-68b4efb9c4c4)
  
- Apply HLOOKUP to find the respective Beds and Feet:

  ``` =HLOOKUP(G2,A1:D7,F2+1,1) ```

![Screenshot (2488)](https://github.com/mk-duong/learning-materials/assets/151535478/3227b0f2-1d3d-4539-ba46-c7fc74072559)

## Exercise 2
Use the file **10 Fabrikam Sales**, calculate:
- Sum of sales over $200,000:

  ``` =SUMIF(C5:C16,">200000") ```
  
- Sum of properties that sold for a percentage difference of less than 3%:

  ``` =SUMIF(E5:E16,"<3%",C5:C16) ```
  
- Sum of properties listed 60 days or less valued at more than $200,000:

  ``` =SUMIF(F5:F16,"<=60",C5:C16) ```

- Sum of properties sold within 60 days for a percentage difference of less than 3%:

  ``` =SUMIFS(C5:C16,F5:F16,"<=60",E5:E16,"<3%") ```

- Number of properties listed for $200,000 or more

  ``` =COUNTIF(B5:B16,">200000") ```
  
- Number of properties sold for $200,000 or more

  ``` =COUNTIF(C5:C16,">200000") ```
  
- Number of properties listed 60 days or more and list price reduced by 5% or more

  ``` =COUNTIFS(F5:F16,">60",E5:E16,"<5%") ```
  
- Average list price

  ``` =AVERAGE(B5:B16) ```
  
- Average days on market for properties listed over $200,000

  ``` =AVERAGEIF(B5:B16,">200000",F5:F16) ```
  
- Average days on market for properties listed less than $200,000 and price reduced by 5% or less

  ``` =AVERAGEIFS(F5:F16,B5:B16,"<200000",E5:E16,"<=5%") ```

![Screenshot (2486)](https://github.com/mk-duong/learning-materials/assets/151535478/f0fc3e0c-d873-4f0c-bdf1-c7122acc8b20)
