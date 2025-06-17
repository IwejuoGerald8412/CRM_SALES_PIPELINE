# **CRM SALES PIPELINE ANALYSIS** 

## **Introduction**  
In today’s competitive B2B landscape, data-driven decision-making is key to maximizing sales performance. 
This report analyzes PrimeCircuit’s sales data. **PrimeCircuit** is a fictional Business-to-Business (B2B) company that sells computer hardware to other businesses. The goal is to understand how the sales teams and agents are performing, identify the most successful products, and spot trends that can help improve future sales efforts.

The analysis looks at things like who’s closing the most deals, which products bring in the most money, how long it takes to close a sale, and whether certain types of clients are more likely to buy. Based on the findings, simple and actionable recommendations are provided to help the company grow.

### **Objectives**  
1. Identify **top-performing sales teams and agents** to replicate success.  
2. Analyze **monthly deal trends** to optimize sales timing.  
3. Evaluate **product performance** to focus on high-revenue offerings.  
4. Assess the impact of **company size and account age** on win rates.  
5. Determine the **average sales cycle duration** for better forecasting.  
6. Provide **data-backed strategies** to boost overall sales performance.

#### **Company**: PrimeCircuit (Fictitious B2B Computer Hardware Firm)

#### **Objective**: To assess sales team and product performance, to understand what’s working and find ways to increase revenue and efficiency.

#### **Tools Used**: SQL Server Management Studio (SSMS), Excel and PowerPoint.

#### **Data Source**: The data was gotten from **Maven Analytics** and includes information about sales opportunities and deal stages, sales agents and their teams, products offered, client account details, deal timelines etc.
The data was organized across different tables such as sales_pipeline, sales_teams, products, and accounts. SQL queries were used to pull insights directly from this structured data.

---

## **Key Findings & Recommendations**  

### **1. Top Performing Sales Teams**  
**Question:** *Which sales team is the best-performing?*

**What was looked at:**  I wanted to see which team was bringing in the most revenue and converting the most deals.
![image](https://github.com/user-attachments/assets/dfcd6921-6437-4285-8c23-ee60855fa4db)

**Findings:**  
- The team led by **Melvin Marxen** in the **Central region** closed the highest total deal value **$2,251,930** and a win rate of **45.7%**.
- The **Rocco Neubert** led team in the **East region** has the highest win rate of **52.0%** and a total deal value of **$1,960,545**.
- Some teams also had high win rates, showing strong conversion skills.

**Recommendation:** Learn from the top teams on how they handle deals, communicate with clients, and close sales. Use those lessons to train other teams.

### **2. Sales Agent Performance**  
**Question:** *Which sales agents have closed the most deals and who are those lagging behind?*  

**What was looked at:** I compared how many deals each sales agent closed and how effective they were.
![image](https://github.com/user-attachments/assets/29ae5a29-c3df-43f7-b677-4d3aaf95a87c)

**Findings:**  
- **Reed Clapper** closed the most deals with a win rate of **65.4%** having won **155 deals** out of **237 deals**.
- A few agents closed deals above **50%**, while others with similar opportunities had low win rates.

**Recommendation:** Offer extra training or mentoring to agents who are falling behind. You might also consider shifting responsibilities if needed.

### **3. Monthly Deal & Revenue Trends**  
**Question:** *How does the number of deals and revenue trend across months?*  

**What was looked at:** I tracked how deals and revenue changed from month to month clustered by Quaters.
![image](https://github.com/user-attachments/assets/cf1ac4a0-5f9f-4db6-a25a-c3021c77cfe5)

**Findings:** Deal activity tends to spike at the end of each quarter. This might be because of seasonal demand or strategic promotions.

**Recommendation:** Plan marketing pushes and client outreach for these high-performing months especially at the end of each quarter.

### **4. Product Performance**  
**Question:** *Which products have the highest win rate and highest revenue contribution?*  

**What was looked at:** I wanted to know which products sold the most and converted best.
![image](https://github.com/user-attachments/assets/89df816e-1eac-48db-9b65-577d887861bd)

**Findings:**  
- **GTX Plus Pro** with a win rate of **48.5%** has total revenue of **$2,629,651**. It has the highest win rate and revenue. Although it has a relatively low number of deals (**968 deals, 479 won deals**), it generated the highest revenue and therefore, it is a good performing product.
- Some other products have relatively high win rates and revenue than others.

**Recommendation:** Concentrate sales and marketing around top products like GTX Plus Pro. Consider improving or removing those that don’t perform as well.

### **5. Impact of Company Size**  
**Question:** *Does company size have effect on win rate?*  

**What was looked at:** I grouped customers by their company size and compared their win rates.
![image](https://github.com/user-attachments/assets/5f1131df-8365-4a90-ad69-e56a92f5a487)

**Findings:**  
- Small companies have higher win rate (**61.8%**) despite having the lowest number of deals and won deals.
- Medium and large companies convert more deals than small businesses. 

**Recommendation:** Use different approaches for each group
For small businesses: offer flexible, budget-friendly packages.
For large clients: focus on long-term value and service.

### **6. Sales Cycle Duration**  
**Question:** *How long Does it Typically Take for a Deal to Move From "Engaging" to "Won" or "Lost"??*  

**What was looked at:** We calculated how long it takes for a deal to go from “Engaging” to “Won” or “Lost”.  
![image](https://github.com/user-attachments/assets/4c8c3693-3025-4fe6-947f-b7986ed2d43f)

**Findings:**  
- Deals take **47** days on average to close.
- **Cecily Lampkin** had the fastest average closing time of just **38 days**.

**Recommendation:** Use these numbers to set expectations and deadlines. Look into what helps speed up deals and apply those practices.

### **7. Account Age & Win Rate**  
**Question:** *Are Newer Accounts More Likely or Less Likely to Close Deals?*  

**What was looked at:** I compared new, mid-age and old accounts to see which ones are more likely to close deals.
![image](https://github.com/user-attachments/assets/5dfaaea9-b8bc-4acf-86e5-7ebee9bfe568)

**Findings:**  
- Newer accounts (**opened after 2015**) had a much higher win rate (**62%**) than older ones.
  
**Recommendation:** Pay special attention to new clients. Consider welcome campaigns, onboarding bonuses, or dedicated support to keep them engaged.

---

## **General Recommendations**  
1. **Encourage Knowledge Sharing:** Have high-performing teams share their tips and strategies with others.
2. **Focus Where It Matters:** Put more effort into top-performing products and newer accounts.
3. **Target Peak Periods:** Use past trends to time promotions and campaigns around quarter-ends.
4. **Agent Support:** Keep track of agent performance regularly and offer support where needed.

## **CONCLUSION**
This report shows clear opportunities for the company to grow its revenue and improve sales efficiency. By learning from successful teams, focusing on what sells best, and planning around seasonal trends, the business can become more strategic and effective in how it sells computer hardware to other companies.
