import os

os.system("python etl_pipeline.py")
os.system("python compute_metrics.py")
os.system("python recommender.py")