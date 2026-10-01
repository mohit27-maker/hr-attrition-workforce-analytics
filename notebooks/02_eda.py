from statistics import correlation

import pandas as pd, matplotlib.pyplot as plt, seaborn as sns, os
from sqlalchemy import create_engine
from urllib.parse import quote_plus
from scipy.stats import chi2_contingency

BASE = r"D:\projects(DA)\hr-attrition-workforce-analytics"
os.makedirs(BASE + r"\figures", exist_ok=True)

# Pull from the MySQL view so tiers match the SQL work
pw = quote_plus("YOUR_MYSQL_PASSWORD")
engine = create_engine(f"mysql+pymysql://root:{pw}@localhost:3306/hr_analytics")
df = pd.read_sql("SELECT * FROM vw_employee_segments", engine)
print(df.shape)  

#correlation with attrition
num = df.select_dtypes("number").drop(columns=["EmployeeNumber"])
corr = num.corr()["AttritionFlag"].drop("AttritionFlag").sort_values()
print(corr.head(8)); print(corr.tail(5))

plt.figure(figsize=(7, 8))
corr.plot(kind="barh", color="steelblue")
plt.title("Correlation with Attrition")
plt.tight_layout()
plt.savefig(BASE + r"\figures\correlation.png", dpi=150)

#attrition rate by risk tier
tier = df.groupby("risk_tier")["AttritionFlag"].mean().mul(100)
tier.plot(kind="bar", color=["#c0392b", "#e67e22", "#f1c40f", "#27ae60"])
plt.ylabel("Attrition %"); plt.title("Attrition by Risk Tier")
plt.xticks(rotation=0); plt.tight_layout()
plt.savefig(BASE + r"\figures\risk_tiers.png", dpi=150)

#is overtime significant?
ct = pd.crosstab(df["OverTime"], df["Attrition"])
chi2, p, _, _ = chi2_contingency(ct)
print(f"p-value: {p:.2e}")  # below 0.05 means not by chance