## Challenge 1
- Work with COUNT, COUNTA, COUNTIFS, SUMIFS
- Work with Named Ranges
- Create spark line
- Create advanced charts with trendlines
  
  ![Screenshot (2530)](https://github.com/mk-duong/learn-excel/assets/151535478/47d749b5-bd41-4add-b033-b6893641df54)

  ![Screenshot (2532)](https://github.com/mk-duong/learn-excel/assets/151535478/257dcf19-4dfd-46b0-b36c-3eea2078245e)

  ![Screenshot (2534)](https://github.com/mk-duong/learn-excel/assets/151535478/27ba932c-c61b-4c12-9a2a-68071249064b)

## Challenge 2
> **Note:** `@` reference appears because we're working in a table
- Calculate the *ValTrade ($m)*: `=[@Price]*[@Volume]/1000000`
- Calculate the *TradeRange (%)*: `=([@High]-[@Low])/[@Price]`
  
- Create **Total** row in a table
  
  ![Screenshot (2536)](https://github.com/mk-duong/learn-excel/assets/151535478/2389de8b-c3a4-4865-92f0-f76227761c9c)

- Create subtotal rows in a table

  ![Screenshot (2538)](https://github.com/mk-duong/learn-excel/assets/151535478/d4931b76-5b6e-40ed-a2f2-f05366c51de5)
  
  ![Screenshot (2542)](https://github.com/mk-duong/learn-excel/assets/151535478/303a6817-ced8-4366-9024-3c676ac9a745)

## Challenge 3
- Work with Pivot Table, Pivot Chart
- Add a slicer to sync filter between pivot elements

  ![Screenshot (2544)](https://github.com/mk-duong/learn-excel/assets/151535478/9d508c4a-f4bd-46c2-8040-93e0b2058a0c)

## Challenge 4
- Create data validation with:
  + List, Whole Number, Decimal, Date
  + Custom formula
     + Validate to avoid duplicated student number: `=COUNTIFS(Student_number, C8) <= 1`
     + Validate to have the birth year not to have the students less  than 16 years old: `=YEAR(TODAY()) - J9 > 16`

- Advanced conditional formating:
  + Highlight the entire row of the students at the same Campus

  ![Screenshot (2553)](https://github.com/mk-duong/learning-materials/assets/151535478/6cffc952-7348-464c-83ff-7e0bdd08952f) 

- Work with COUNTIF(S), SUMIF(S)
  
  ![Screenshot (2554)](https://github.com/mk-duong/learning-materials/assets/151535478/d20e0157-0bb1-4ffb-b74d-ab3663465aa7)

## Challenge 5
Use conditional functions (IF, AND, OR) and create nested IF functions

- Task 1:
  + Calculate the *Purchase value*: `Price paid * Volume`

    ```=D3*E3```

  + Calculate the *Gain value*: `(Last price - Price paid) * Volume`

    ```=IF((E3-D3)*C3 > 0, (E3-D3)*C3, 0)```

  + Calculate the *Loss value*: `(Price paid - Last price) * Volumns`

    ```=IF((D3-E3)*C3 > 0, (D3-E3)*C3, 0)```

  + Calculate the *Net Gain (or Loss)*: `Gain value - Loss value`

    ```=SUM(G3:G12) - SUM(H3:H12)```

  ![Screenshot (2562)](https://github.com/mk-duong/learning-materials/assets/151535478/b95fbce7-f097-49e5-b37d-e2f2db8e9f75)

- Task 2:
  + Total sum of the final grades: `=SUM(L12:R12)`
  + Grade determination: 
  
    ```=IF(T12<=$P$4, "Fail", IF(T12<=$P$5, "Pass", IF(T12<=$P$6, "Credit", IF(T12<=$P$7, "Distinction", "High Distinction"))))```

  ![Screenshot (2564)](https://github.com/mk-duong/learning-materials/assets/151535478/f3698c5f-bcd5-4116-9e3b-f35fa4e297b8)

- Task 3:
  + Complete the *Delivery* column, delivering as much of the clients order as possible according to the amounts in stock:

    ```=IF(Z6 > AC6, AC6, Z6)```

  + In the *Comment* column, place a comment "Partial fill - out of stock" for the items that could only be partly filled, due to not having enough in stock:

    ```=IF(AD6 < AC6, "Partially filled - Out of stock", "")```

  + The *Post Delivery Alerts* column, check whether the client is waiting on items and report "Order immediately for client". If the number of items remaining in stock after this order falls below the reorder level report "Running low - think about reordering":

    ```=IF(Z6-AD6 >= AA6, "", IF(AD6 < AC6, "Order immediately for client", "Running low - think about reordering"))```

  ![Screenshot (2566)](https://github.com/mk-duong/learning-materials/assets/151535478/b0722439-1aec-452e-8474-f39b9266ff49)

## Challenge 6
Work with CHOOSE, VLOOKUP, MATCH, and INDEX

- Task 1: Use the CHOOSE function to classify the star rating to its resoective category given in the table:

  ```=CHOOSE(D3,Instructions!$C$27,Instructions!$C$28,Instructions!$C$29,Instructions!$C$30,Instructions!$C$31,Instructions!$C$32)```
  
![Screenshot (2570)](https://github.com/mk-duong/learning-materials/assets/151535478/28277465-7478-4680-aabb-c65d03f46199)


- Task 2: Use the VLOOKUP function to perform the grading of students who took a Basic Excel course

  > **Note:** If range_lookup is TRUE, then if the value in the lookup_value is smaller than the smallest value in the first column of the table_array, you'll get the #N/A error value.

  ```=VLOOKUP(I3,$H$14:$J$18,3,TRUE)```

  ![Screenshot (2573)](https://github.com/mk-duong/learning-materials/assets/151535478/ac243365-6691-49f9-a29a-c41876e96e9b)

- Task3: Use an exact match VLOOKUP and MATCH to gauge the success of Brad's fishing expedition he is planning in March

  ```=VLOOKUP(M3, $M$9:$Y$41, MATCH(N3, $M$8:$Y$8, 0), FALSE)```

  ![Screenshot (2577)](https://github.com/mk-duong/learning-materials/assets/151535478/fe1fc190-f085-45c3-b863-43929a57b540)

- Task 4: Use the INDEX and MATCH function for the client who has several combinations in mind to help them choose the highest rated

  ```=INDEX(ColourMatrix, MATCH(AB13, ColoursWall, 0), MATCH(AC13, ColoursCeiling, 0))```

  ![Screenshot (2580)](https://github.com/mk-duong/learning-materials/assets/151535478/1c21fad0-8796-41de-ba3a-12fabe774d24)

