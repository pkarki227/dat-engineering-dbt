from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from sqlalchemy import create_engine
import pandas as pd
from dotenv import load_dotenv
import os
import traceback

# ✅ Load environment variables from .env
load_dotenv()

# ✅ Securely load DB credentials from environment
db_user = os.getenv("DB_USER")
db_pass = os.getenv("DB_PASS")
db_host = os.getenv("DB_HOST")
db_port = os.getenv("DB_PORT")
db_name = os.getenv("DB_NAME")
sslmode = "require"

DATABASE_URL = f'postgresql+psycopg2://{db_user}:{db_pass}@{db_host}:{db_port}/{db_name}?sslmode={sslmode}'

engine = create_engine(DATABASE_URL)

# ✅ FastAPI app
app = FastAPI(
    title="🧠 Churn Feature Store API",
    description="Exposes engineered customer features for ML use",
    version="1.0.0"
)

class FeatureResponse(BaseModel):
    customer_id: int
    total_orders: int
    avg_order_value: float
    days_since_last_order: int
    signup_to_last_order_days: int
    web_event_count: int
    event_type: str
    is_active: bool

@app.get("/")
def root():
    return {"message": "🚀 Feature Store API is running!"}

@app.get("/api/v1/features/customer_id/{customer_id}", response_model=FeatureResponse)
def get_customer_features(customer_id: int):
    try:
        query = f"SELECT * FROM churn_feature_store WHERE customer_id = {customer_id} LIMIT 1"
        df = pd.read_sql(query, engine)

        if df.empty:
            raise HTTPException(status_code=404, detail="Customer not found")

        return df.iloc[0].to_dict()

    except Exception as e:
        print("Exception traceback:\n", traceback.format_exc())
        raise HTTPException(status_code=500, detail=f"Internal server error: {str(e)}")
