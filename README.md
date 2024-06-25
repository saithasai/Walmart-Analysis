# Walmart Analysis
<img src="https://assets1.drugstorenews.com/s3fs-public/styles/hero/public/2022-01/walmart-interactive-01.png" width="1000" height="600" />

The dataset comprises sales transactions of different products from 45 Walmart stores across 3 different regions

### Objective of this Project:
The objective of this SQL project is to understand the sale trends and patterns of various products that affect the overall Walmart sales. And to study how sale strategies can be enhanced and improved. 

### Analysis List:
Here, product, sales, customer/client analysis are done respectively to:

- To understand the various product lines, products that perform well and those which need improvement, carry out an analysis of data.
- To answer the issue of product sale trends. This can help to measure the effectiveness of each sales strategy employed by a firm and what modifications are needed in order for it to achieve more business with greater revenue.
- The purpose of this analysis is to identify the different customer segments, trends in sales and profitability of each customer segment.

### Tools used:
MySQL Workbench 

### Approach Used:

Exploratory Data Analysis (EDA): - Data cleaning,Data analysing,Data visualising in tabular form    
Exploratory data analysis is done to answer the following business questions that may arise :

### Generic Question
Q1.How many unique cities does the data have?   
Q2.In which city is each branch?

### Product analysis
Q1.What is the total revenue by month?  
Q2.What month had the largest COGS(cost of goods)?   
Q3.What is the city with the largest revenue?    
Q4.Which branch sold more products than average product sold?   
Q5.What is the most common payment method?   
Q6. Highest revenue yielding product ?    
Q7. Highest number of units sold by product?   
Q8. Product_line by date graph   
Q9. Product_line vs maximum rating     
Q10. Product_line vs avg price

### Sales analysis
Q1.Number of sales made in each time of the day per weekday   
Q2.How much sales in each month    
Q3.Find the time at which sales are highest   
Q4.Display daily the sales by day of the week

### Customer analysis
Q1. What is the gender distribution per branch?   
Q2. Which time of the day do customers give most ratings?   
Q3. Which time of the day do customers give most ratings per branch?    
Q4. What is the gender of most of the customers?   
Q5. Which day of the week has the best average ratings?   
Q6. How many unique payment methods does the data have?    
Q7. Which day of the week has the best average ratings per branch?     
Q8. How long have been customers working (by adding another column)    
Q9. Min and max days stayed by customers?
Q10.Which branch got revenue?

### Additional queries
Q1. Replacing payment column by payment_mode   
Q2. Convert text variable for date to date variable   
Q3. Rating conditions

### Findings:
1) By product analysis, total revenue earned and having largest cogs is in the month of January
   - Naypyitaw is the city with largest revenue.
   - Branch A sold 39 products more than B and 28 more than C.
   - Top revenue yielding product is Food and beverages ($56145).
2) By Customer analysis,
   - Branch A,B,C receives most ratings in the evening
   - Monday has the best average ratings
   - Branch A has most avg  ratings on Friday
   - Branch B has most ratings on Monday
   - Branch C has most ratings on Friday
3) By sales analysis,
   - More sales at evening
   - More sales during saturday and least sales on Monday
   - January has more sales,so more revenue will be earned during this month
   - Febraury has 14% reduction in sales than January, followed by 13% increase.
