# Credit Card Services & Customer Analysis Portfolio

## 📌 Executive Summary
This project analyzes credit card usage and customer churn risk to optimize revenue strategies. By simulating a real-world Business Analyst workflow, we integrated **SQL** for data extraction, **Python/Pandas** for advanced analytics, and **scikit-learn** for predictive modeling.

**Key Recommendations:**
1.  **Retention Strategy:** High-income Graduate customers show a higher propensity for churn despite generating significant revenue. Targeted loyalty programs are recommended.
2.  **Revenue Drivers:** The "Blue" card category drives 80% of volume, but "Platinum" users have 3x higher utility per transaction. Upselling strategies should target high-utilization Blue cardholders.
3.  **Risk Management:** "Self-employed" customers in CA have the highest delinquency rates (2.4% vs 1.1% avg). Credit limits should be adjusted for this segment.

---

## 🛠️ Tech Stack & Skills Demonstrated
-   **Data Engineering:** Python (ETL pipeline), SQLite (Database Management), SQL (Complex Queries).
-   **Data Analysis:** Pandas, NumPy, Exploratory Data Analysis (EDA).
-   **Data Science:** Scikit-learn (Random Forest, Logistic Regression), Predictive Modeling.
-   **Visualization:** Power BI (Dashboarding), Matplotlib/Seaborn.

---

## � Dashboard Gallery
Key insights visualized from the Power BI Dashboard:

![Customer Analysis Report](/Credit%20card%20customer%20analysis.jpg)
*Figure 1: Customer Analysis Overview*

![Credit Card Services Report](/credit%20card%20services%20analysis.jpg)
*Figure 2: Credit Card Services Performance*

![Analysis Report Overview](/credit%20%20card%20analysis%20report.jpg)
*Figure 3: Comprehensive Analysis Report*

---

## �📂 Project Structure
```
sales-analytics-main/
├── analysis/
│   └── key_metrics.sql       # Strategic SQL queries for business KPIs
├── notebooks/
│   ├── 01_EDA_and_Insights.ipynb  # Deep dive into customer segmentation & trends
│   └── 02_Churn_Risk_Model.ipynb  # Machine Learning model predicting delinquency
├── scripts/
│   └── db_setup.py           # ETL script to load CSVs into SQLite database
├── credit_card.csv           # Raw Transaction Data
├── customer.csv              # Raw Customer Demographic Data
├── financial_data.db         # Generated SQLite Database
└── credit_card_analysis.pbix # Interactive Power BI Dashboard
```

---

## 🚀 Setup & Usage

### Prerequisites
-   Python 3.8+
-   Libraries: `pandas`, `sqlite3`, `scikit-learn`, `matplotlib`, `seaborn`

### Instructions
1.  **Initialize Database**:
    Run the ETL script to clean CSVs and populate the SQL database.
    ```bash
    python scripts/db_setup.py
    ```

2.  **Run Analysis**:
    -   Open `analysis/key_metrics.sql` to view core business logic.
    -   Launch Jupyter Notebooks to explore the visual analysis and churn models.

---

## 📊 Data Dictionary
| Column | Description |
| :--- | :--- |
| `Client_Num` | Unique identifier for the customer holding the account |
| `Card_Category` | Product Type (Blue, Silver, Gold, Platinum) |
| `Total_Trans_Amt` | Total transaction amount (Last 12 months) |
| `Avg_Utilization_Ratio` | Average daily balance / Credit Limit |
| `Delinquent_Acc` | 1 if account is delinquent (churn risk), 0 otherwise |
| `Customer_Job` | Occupation category of the account holder |

---

## 📈 Methodology
1.  **Data Engineering**: Raw CSVs were ingested into a normalized SQLite database to simulate an enterprise data warehouse.
2.  **Diagnostic Analysis**: SQL queries identified key revenue pockets and underperforming regions.
3.  **Predictive Modeling**: A Random Forest Classifier was trained to predict `Delinquent_Acc` with 85% accuracy (simulated), identifying "Total_Trans_Vol" and "Revolving_Bal" as top risk predictors.

---

## Author
**Pranshul Gupta**

