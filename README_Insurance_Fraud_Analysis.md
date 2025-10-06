
# 🧠 Insurance Fraud Analysis Dashboard
![Dashboard Screenshot](Insureance_Project)

## 📋 Project Overview
This project analyzes **insurance claims data** to identify **potential fraud cases** and provide **key business insights**.  
It was built using **Excel, Python, and SQL-style logic** to simulate a real-world fraud detection workflow for a health insurance company.

The final output is an interactive **Excel dashboard** showing KPIs, visual summaries, and fraud indicators.

---

## 🎯 Objectives
- Detect suspicious insurance claims using business rules and thresholds.
- Analyze claim behavior by **policy type, city, and status**.
- Provide visual dashboards for management and decision-makers.
- Demonstrate data analysis and visualization skills for a portfolio project.

---

## 🧩 Dataset Description
| Dataset | Description |
|----------|--------------|
| **Customers** | Basic customer information (age, gender, city) |
| **Policies** | Policy details (type, start/end date, premium) |
| **Claims** | Claim transactions with status and fraud flags |

The data was synthetically generated to resemble realistic insurance operations.

---

## 📊 Dashboard Highlights
The Excel dashboard includes:

1. **Number of Claims per Policy Type**
2. **Total Claim Amount per City**
3. **Fraudulent vs Normal Claims**
4. **Average Claim Amount by Status**
5. **Top KPIs**: Total Claims, Claim Amount, Fraud %, Average Claim

---

## 🧠 Fraud Detection Logic
Fraud flags were assigned using these conditions:

- Claim amount greater than 2× standard deviation above the mean.  
- More than **3 claims** by the same customer.  
- Total claim amount per customer > **15,000**.  
- Multiple claims within **30 days** for the same customer.

If any condition is met → `FraudFlag = Suspicious`, else `Normal`.

---

## 🧰 Tools & Technologies
- **Excel (Dashboard & Visualization)**
- **Python (Data Preparation & Aggregation)**
- **Pandas, NumPy, OpenPyXL**
- **SQL-like queries** for data manipulation logic

---

## 📈 Key Insights
- Health insurance policies have the **highest number of claims**.
- The city of **Ibb** recorded the **highest claim amounts**.
- Around **18% of total claims** were flagged as suspicious.
- Fraudulent claims often involve **multiple small claims within 30 days**.

---

## 🚀 How to Use
1. Download the file: `Insurance_Project_Full_Dashboard_v2.xlsx`  
2. Open in Excel (desktop recommended).  
3. Interact with slicers and charts for analysis.  

---

## 🧾 Author
👤 **Hashem** – Data Analyst  
📧 Contact: [your.email@example.com]  
🌐 GitHub: [github.com/YourUsername]

---

⭐ *If you like this project, don’t forget to give it a star on GitHub!* ⭐
