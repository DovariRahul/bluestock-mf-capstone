from pathlib import Path
import pandas as pd

RAW_PATH = Path("data/raw")

def load_csv_files():

    csv_files = list(RAW_PATH.glob("*.csv"))

    for file in csv_files:

        df = pd.read_csv(file)

        print(f"\nLoaded: {file.name}")
        print(f"Shape: {df.shape}")

if __name__ == "__main__":
    load_csv_files()
    