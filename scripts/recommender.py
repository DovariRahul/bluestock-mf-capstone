import pandas as pd
import numpy as np
perf = pd.read_csv(
    "../data/processed/clean_performance.csv"
)

risk = input(
    "Enter Risk Level: "
)

result = (

    perf[
        perf["risk_grade"] == risk
    ]

    .sort_values(
        "sharpe_ratio",
        ascending=False
    )

    .head(3)

)

print(
    result[
        [
            "scheme_name",
            "risk_grade",
            "sharpe_ratio"
        ]
    ]
)
