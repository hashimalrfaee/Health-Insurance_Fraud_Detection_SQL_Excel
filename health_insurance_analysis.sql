-- ==============================
-- 1️⃣ Basic Queries
-- ==============================

-- Display all customers with their age, gender, and city
SELECT CustomerID, Name, Age, Gender, City
FROM Customers;

-- Count the number of customers in each city
SELECT City, COUNT(*) AS NumCustomers
FROM Customers
GROUP BY City;

-- Display all policies with their type and premium for each customer
SELECT p.PolicyID, c.Name, p.PolicyType, p.PremiumAmount
FROM Policies p
JOIN Customers c ON p.CustomerID = c.CustomerID;

-- Count the number of policies by type
SELECT PolicyType, COUNT(*) AS NumPolicies
FROM Policies
GROUP BY PolicyType;

-- Calculate average premium amount by policy type
SELECT PolicyType, AVG(PremiumAmount) AS AvgPremium
FROM Policies
GROUP BY PolicyType;

-- Display all claims with policy and customer information
SELECT cl.ClaimID, p.PolicyID, c.Name, cl.ClaimAmount, cl.ClaimStatus
FROM Claims cl
JOIN Policies p ON cl.PolicyID = p.PolicyID
JOIN Customers c ON p.CustomerID = c.CustomerID;

-- Total claim amount by policy type
SELECT p.PolicyType, SUM(cl.ClaimAmount) AS TotalClaims
FROM Claims cl
JOIN Policies p ON cl.PolicyID = p.PolicyID
GROUP BY p.PolicyType;

-- Count of claims by claim status
SELECT ClaimStatus, COUNT(*) AS NumClaims
FROM Claims
GROUP BY ClaimStatus;

-- ==============================
-- 2️⃣ Advanced Queries (Insights)
-- ==============================

-- Customers with more than one claim
SELECT c.Name, COUNT(cl.ClaimID) AS NumClaims
FROM Claims cl
JOIN Policies p ON cl.PolicyID = p.PolicyID
JOIN Customers c ON p.CustomerID = c.CustomerID
GROUP BY c.Name
HAVING COUNT(cl.ClaimID) > 1;

-- Average claim amount by age and gender
SELECT c.Gender, c.Age, AVG(cl.ClaimAmount) AS AvgClaim
FROM Claims cl
JOIN Policies p ON cl.PolicyID = p.PolicyID
JOIN Customers c ON p.CustomerID = c.CustomerID
GROUP BY c.Gender, c.Age
ORDER BY c.Age;

-- Top 10 largest claims
SELECT c.Name, cl.ClaimAmount, cl.ClaimStatus
FROM Claims cl
JOIN Policies p ON cl.PolicyID = p.PolicyID
JOIN Customers c ON p.CustomerID = c.CustomerID
ORDER BY cl.ClaimAmount DESC
LIMIT 10;

-- ==============================
-- 3️⃣ Fraud Detection Queries
-- ==============================

-- Customers with high number of claims and high total amount (>3 claims AND total > 5000)
SELECT c.Name, COUNT(cl.ClaimID) AS NumClaims, SUM(cl.ClaimAmount) AS TotalClaimAmount
FROM Claims cl
JOIN Policies p ON cl.PolicyID = p.PolicyID
JOIN Customers c ON p.CustomerID = c.CustomerID
GROUP BY c.Name
HAVING COUNT(cl.ClaimID) > 3 AND SUM(cl.ClaimAmount) > 5000;

-- Policies with a single claim but unusually high amount (> 1500)
SELECT p.PolicyID, c.Name, cl.ClaimAmount
FROM Claims cl
JOIN Policies p ON cl.PolicyID = p.PolicyID
JOIN Customers c ON p.CustomerID = c.CustomerID
WHERE cl.ClaimAmount > 1500;

-- Customers with multiple claims within 30 days (rapid claims)
SELECT c.Name, COUNT(cl.ClaimID) AS NumClaims, MIN(cl.ClaimDate) AS FirstClaim, MAX(cl.ClaimDate) AS LastClaim
FROM Claims cl
JOIN Policies p ON cl.PolicyID = p.PolicyID
JOIN Customers c ON p.CustomerID = c.CustomerID
GROUP BY c.Name
HAVING COUNT(cl.ClaimID) > 1 AND DATEDIFF(MAX(cl.ClaimDate), MIN(cl.ClaimDate)) <= 30;

-- Customers with multiple policies of the same type (possible exploitation)
SELECT c.Name, p.PolicyType, COUNT(p.PolicyID) AS NumPolicies
FROM Policies p
JOIN Customers c ON p.CustomerID = c.CustomerID
GROUP BY c.Name, p.PolicyType
HAVING COUNT(p.PolicyID) > 1;
