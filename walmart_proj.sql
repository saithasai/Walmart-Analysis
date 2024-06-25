drop database if exists walmart_proj;
create database walmart_proj;
use walmart_proj;
select * from walmart_analysis;

#adding one more column
select time, 
case when time between "00:00:00" and "12:00:00" then "Morning"
      when time between "12:01:00" and "16:00:00" then "Afternoon"
      else "Evening"
end as Parts_of_the_day from walmart_analysis
order by time;

#adding one more column
alter table walmart_analysis add column Parts_of_the_day text;
update walmart_analysis set Parts_of_the_day=(case when time between "00:00:00" and "12:00:00" then "Morning"
                                                   when time between "12:01:00" and "16:00:00" then "Afternoon"
                                                   else "Evening"
                                             end);

#adding day_name and month_name column
alter table walmart_analysis add column day_name text;
update walmart_analysis set day_name=dayname(date);

alter table walmart_analysis add column month_name text;
update walmart_analysis set month_name=monthname(date);
select * from walmart_analysis;

-----GENERIC QUESTION-----
#Q1. How many unique cities does the data have?
select distinct city,count(*) from walmart_analysis
group by city;

#Q2. In which city is each branch?
select distinct city,branch from walmart_analysis;

--------PRODUCT----------
	
#Q1. What is the total revenue by month?
select sum(total) as total_revenue,month_name from walmart_analysis
group by month_name
order by total_revenue desc;

#Q2. What month had the largest COGS?
select month_name,sum(cogs) as cogs from walmart_analysis
group by month_name
order by cogs desc;

#Q3. What is the city with the largest revenue?
select sum(total) as total_revenue,city from walmart_analysis
group by city
order by total_revenue desc;

#Q4. Which branch sold more products than average product sold?
select branch,sum(Quantity) as qty from walmart_analysis
group by branch
having qty>(select avg(Quantity) from walmart_analysis);
									
#Q5. what is the most common payment method?
select payment,count(*) from walmart_analysis
group by payment;

#Q6. Highest revenue yielding product ?
select product_line,round(sum(total)) as amount,concat(round(round(sum(total))*100/(select sum(total) from walmart_sales),0),"%") as perc from walmart_sales
group by product_line
order by amount desc;

#Q7. Highest number of units sold by product?
select product_line,sum(quantity) as qty from walmart_sales
group by product_line
order by qty desc;

#Q8. Product_line by date graph
select product_line,date,round(sum(total),0) from walmart_sales
group by product_line,date
having product_line="Fashion accessories"
order by date asc;

#Q9. Product_line vs maximum rating 
select product_line,max(rating) from walmart_sales
group by product_line;

#Q10. Product_line vs avg price
select product_line,round(sum(total),0)/sum(quantity) as avg_revenue from walmart_sales
group by product_line;


------SALES-----

#Q1. Number of sales made in each time of the day per weekday
select Parts_of_the_day,count(*) from walmart_analysis
group by Parts_of_the_day;

#Q2. How much sales in each month
select month(date),count(*) as Total_sales from walmart_analysis
group by month(date)

#Q3.Find the time at which sales are highest
select hour from (select hour(time) as hour, sum(total) as sales from walmart_analysis
group by hour
order by sales desc
limit 1) total_amount

#Q4.Display daily the sales by day of the week
select dayofweek(date) as week,sum(total) from walmart_analysis
group by week
order by sum(total) desc;
	
-------CUSTOMER------
	
#Q1. whats the gender distribution per branch
select gender,count(*) from walmart_analysis
where branch="C"
group by gender;

#Q2. Which time of the day do customers give most ratings?
select Parts_of_the_day,avg(rating) from walmart_analysis
group by Parts_of_the_day
order by avg(rating) desc;

#Q3. Which time of the day do customers give most ratings per branch?
select branch,avg(rating) as rating,Parts_of_the_day from walmart_analysis
#where branch="A"
group by branch,Parts_of_the_day
order by branch 

#Q4. What is the gender of most of the customers?
select gender,count(*) from walmart_analysis
group by gender;

#Q5. Which day of the week has the best average ratings?
select day_name,avg(Rating) from walmart_analysis
group by day_name
order by avg(Rating) desc;

#Q6.How many unique payment methods does the data have?
select count(distinct payment) from walmart_analysis;

#Q7. Which day of the week has the best average ratings per branch?
select avg(Rating) as rat,day_name from walmart_analysis
group by branch,day_name
having branch="C"
order by rat desc limit 1

#Q8. How long have been they working (by adding another column)
alter table walmart_analysis
add column days_stayed int;
update walmart_analysis set days_stayed=timestampdiff(day,date,curdate());

#Q9. Min and max days stayed
select min(days_stayed) as min_day,max(days_stayed) as max_day from walmart_analysis;

#Q10. Which branch got revenue?
select branch,round(sum(total),0) as revenue from walmart_sales
group by branch
order by revenue desc;

----------Additional queries----------

#Q1. Replacing payment column by payment_mode
alter table walmart_analysis change column Payment Payment_mode text;

#Q2. Convert text variable for date to date variable
alter table walmart_analysis
modify column date date;
describe walmart_analysis;
 
#Q3. Rating conditions
select rating,count(*),case 
when rating>=9 then "best"
when rating>=7 then "better"
when rating>=5 then "need improvement"
when rating>=4 then "given next chance"
else "bad"
end as remarks from walmart_analysis
group by Rating
order by rating desc

alter table walmart_sales add column month text;
update walmart_sales set month=month(DATE_FORMAT(str_to_date(Date,'%m/%d/%Y'),'%Y-%m-%d'));
select * from walmart_sales;

# month and total amount
select month(DATE_FORMAT(str_to_date(Date,'%m/%d/%Y'),'%Y-%m-%d')) as month, round(sum(Total),3) from walmart_sales
group by month
order by month

# % decrease and increase in total amount of jan and march compared to feb
SELECT ROUND(((116291.868 - 97219.374) / 116291.868) * 100) AS percentage_decrease;   
SELECT ROUND(((109455.507 -97219.374) / 97219.374) * 100) AS percentage_increase; 
