
CREATE DATABASE Bank_Loan_DB;
USE Bank_Loan_DB;

SELECT * FROM finance_1;
SELECT COUNT(*) FROM finance_1;
SELECT COUNT(*) FROM finance_2;

# Yearwise Loan Amount Status
Select Year(issue_d) as year_of_issue_d, loan_status,
sum(loan_amnt) as Total_loan_amnt
from finance_1
group by year_of_issue_d, loan_status
order by year_of_issue_d, loan_status;

# Grade & Subgrade wise Revolving Balance
Select
grade, sub_grade, sum(revol_bal) as total_revolving_bal
from finance_1 inner join finance_2
on (finance_1.id = finance_2.id)
group by grade, sub_grade
order by grade, sub_grade;

# Total Payment for Verified & Non-verified Status
Select verification_status, 
Concat("$", format(round(sum(total_pymnt)/1000000,2),2),"M") as Total_payment
from finance_1 inner join finance_2 
on (finance_1.id = finance_2.id)
group by verification_status
order by verification_status;


# State wise and last_credit_pull_d wise loan status
Select addr_state, last_credit_pull_d, loan_status	
from finance_1 inner join finance_2
on (finance_1.id = finance_2.id)
group by addr_state, last_credit_pull_d, loan_status	
order by last_credit_pull_d;

# Home ownership Vs last payment date status
Select 
home_ownership, last_pymnt_d,
Concat("$", format(round(sum(last_pymnt_amnt)/10000,2),2),"K") as Total_amount
from finance_1 inner join finance_2 
on (finance_1.id = finance_2.id)
group by home_ownership, last_pymnt_d
order by last_pymnt_d Desc, home_ownership;



