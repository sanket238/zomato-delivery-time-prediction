import pandas as pd
import requests
from pathlib import Path

# path for data
root_path = Path(__file__).parent.parent
data_path = root_path / "data" / "raw" / "zomato_dataset.csv"

# prediction endpoint
predict_url = "http://127.0.0.1:8000/predict"

# sample row for testing the endpoint

sample_row = pd.read_csv(data_path).dropna().sample(1)
sample_row=sample_row.drop(columns="Time_Converted")
print("The target value is", sample_row.iloc[:,-1].values.item())
    
# remove the target column
data = sample_row.drop(columns=sample_row.columns.tolist()[19:]).squeeze().to_dict()
print(data)

# get the response from API
response = requests.post(url=predict_url,json=data)

print("The status code for response is", response.status_code)

if response.status_code == 200:
    print(f"The prediction value by the API is {float(response.text):.2f} min")
else:
    print("Error:", response.status_code)