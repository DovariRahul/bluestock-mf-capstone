import pandas as pd
from sqlalchemy import create_engine

nav_df = pd.read_csv(
    "../data/processed/clean_nav.csv"
)

engine = create_engine(
    "sqlite:///../data/db/bluestock_mf.db"
)

nav_df.to_sql(
    "fact_nav",
    engine,
    if_exists="replace",
    index=False
)

