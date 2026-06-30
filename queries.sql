import sqlite3
conn=sqlite3.connect('telecom.db')
df.to_sql("customers", conn, if_exists="replace", index=False)
query="""
SELECT * FROM customers
LIMIT 5;
"""
result=pd.read_sql_query(query, conn)
result
query= """
SELECT Churn,
COUNT(*) AS Total
FROM customers
GROUP BY Churn;
"""
pd.read_sql_query(query, conn)
query="""
SELECT AVG(MonthlyCharges) AS Average_Bill
FROM customers
"""
pd.read_sql_query(query, conn)query="""
SELECT Contract,
COUNT(*) AS Churned_Customers
FROM customers
WHERE Churn='Yes'
GROUP BY Contract;
"""
pd.read_sql_query(query, conn)