## Challenge 1
- Work with COUNT, COUNTA, COUNTIFS, SUMIFS
- Work with Named Ranges
- Create spark line
- Create advanced charts with trendlines
  
  ![Screenshot (2530)](https://github.com/mk-duong/learn-excel/assets/151535478/47d749b5-bd41-4add-b033-b6893641df54)

  ![Screenshot (2532)](https://github.com/mk-duong/learn-excel/assets/151535478/257dcf19-4dfd-46b0-b36c-3eea2078245e)

  ![Screenshot (2534)](https://github.com/mk-duong/learn-excel/assets/151535478/27ba932c-c61b-4c12-9a2a-68071249064b)

## Challenge 2
**Note:** `@` reference appears because we're working in a table
- Calculate the *ValTrade ($m)* using formula: `=[@Price]*[@Volume]/1000000`
- Calculate the *TradeRange (%)* using formula: `=([@High]-[@Low])/[@Price]`
  
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
     + Validate to avoid duplicated student number: `=COUNTIFS(Student_number,C8)<=1`
     + Validate to have the birth year not to have the students less  than 16 years old: `=YEAR(TODAY())-J9>16`

- Advanced conditional formating:
  + Highlight the entire row of the students at the same Campus

![Screenshot (2553)](https://github.com/mk-duong/learning-materials/assets/151535478/6cffc952-7348-464c-83ff-7e0bdd08952f) 

![Screenshot (2554)](https://github.com/mk-duong/learning-materials/assets/151535478/d20e0157-0bb1-4ffb-b74d-ab3663465aa7)

