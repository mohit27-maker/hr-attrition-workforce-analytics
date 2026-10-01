import pandas as pd
import os
BASE = r"D:\projects(DA)\hr-attrition-workforce-analytics"

df = pd.read_csv(os.path.join(BASE, "raw_hr.csv"))

# 1. First look
print(df.shape)
print(df.isnull().sum().sum(), "missing values")
print(df.duplicated().sum(), "duplicate rows")
df.info()

# 2. Drop columns with no information (same value for every row)
df = df.drop(columns=["EmployeeCount", "StandardHours", "Over18"])

# 3. Numeric flag for attrition (easier for SQL and correlation)
df["AttritionFlag"] = (df["Attrition"] == "Yes").astype(int)

# 4. Sanity check
print(df["Attrition"].value_counts())
print(f"Attrition rate: {df['AttritionFlag'].mean():.1%}")

# 5. Save cleaned file
os.makedirs(os.path.join(BASE, "data"), exist_ok=True)
df.to_csv(os.path.join(BASE, "data", "clean_hr.csv"), index=False)