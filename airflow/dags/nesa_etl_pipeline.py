from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

default_args = {
    "owner": "nesa",
}

with DAG(
    dag_id="nesa_etl_pipeline",
    default_args=default_args,
    start_date=datetime(2026, 1, 1),
    schedule="@daily",
    catchup=False,
) as dag:

    load_raw = BashOperator(
        task_id="load_raw",
        bash_command="""
        PGPASSWORD=postgres psql -h postgres -U postgres -d nesa_data \
        -f /opt/airflow/sql/raw/001_create_raw_tables.sql
        """
    )

    load_staging = BashOperator(
        task_id="load_staging",
        bash_command="""
        PGPASSWORD=postgres psql -h postgres -U postgres -d nesa_data \
        -f /opt/airflow/sql/etl/001_load_staging.sql
        """
    )

    validate = BashOperator(
        task_id="validate",
        bash_command="""
        PGPASSWORD=postgres psql -h postgres -U postgres -d nesa_data \
        -f /opt/airflow/sql/validation/001_data_quality_checks.sql
        """
    )

    load_dimensions = BashOperator(
        task_id="load_dimensions",
        bash_command="""
        PGPASSWORD=postgres psql -h postgres -U postgres -d nesa_data \
        -f /opt/airflow/sql/warehouse/etl/001_load_dimensions.sql
        """
    )

    load_facts = BashOperator(
        task_id="load_facts",
        bash_command="""
        PGPASSWORD=postgres psql -h postgres -U postgres -d nesa_data \
        -f /opt/airflow/sql/warehouse/etl/002_load_fact_exam_results.sql
        """
    )

    reporting = BashOperator(
        task_id="reporting_views",
        bash_command="""
        PGPASSWORD=postgres psql -h postgres -U postgres -d nesa_data \
        -f /opt/airflow/sql/reporting/001_create_reporting_views.sql
        """
    )

    load_raw >> load_staging >> validate >> load_dimensions >> load_facts >> reporting