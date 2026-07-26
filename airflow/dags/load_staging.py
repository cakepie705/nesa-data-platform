from datetime import datetime

from airflow import DAG
from airflow.operators.bash import BashOperator

with DAG(
    dag_id="load_staging",
    start_date=datetime(2026, 1, 1),
    schedule="@daily",
    catchup=False,
    tags=["nesa", "etl"],
) as dag:

    load_staging = BashOperator(
        task_id="load_staging_sql",
        bash_command="""
        PGPASSWORD=postgres psql \
        -h postgres \
        -U postgres \
        -d nesa_data \
        -f /opt/airflow/sql/etl/001_load_staging.sql
        """
    )