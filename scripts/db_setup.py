import pandas as pd
import sqlite3
import os

# Define file paths
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATA_DIR = BASE_DIR  # CSVs are in the same folder as the sales-analytics-main root
DB_PATH = os.path.join(DATA_DIR, 'financial_data.db')

CREDIT_CSV = os.path.join(DATA_DIR, 'credit_card.csv')
CUSTOMER_CSV = os.path.join(DATA_DIR, 'customer.csv')

def clean_column_names(df):
    """Standardize column names to snake_case and remove special characters."""
    df.columns = [c.strip().lower().replace(' ', '_').replace('-', '_') for c in df.columns]
    return df

def setup_database():
    print(f"Looking for data in: {DATA_DIR}")
    
    if not os.path.exists(CREDIT_CSV) or not os.path.exists(CUSTOMER_CSV):
        print("Error: CSV files not found.")
        return

    # Load Data
    print("Loading CSVs...")
    df_credit = pd.read_csv(CREDIT_CSV)
    df_customer = pd.read_csv(CUSTOMER_CSV)

    # Clean Data
    print("Cleaning data...")
    df_credit = clean_column_names(df_credit)
    df_customer = clean_column_names(df_customer)

    # Connect to SQLite
    print(f"Connecting to database at {DB_PATH}...")
    conn = sqlite3.connect(DB_PATH)
    
    # Write to SQL
    print("Writing to SQL tables...")
    df_credit.to_sql('credit_card', conn, if_exists='replace', index=False)
    df_customer.to_sql('customer', conn, if_exists='replace', index=False)
    
    # Verify
    cursor = conn.cursor()
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
    tables = cursor.fetchall()
    print(f"Tables created: {tables}")
    
    # Add some basic indexes for performance
    print("Creating indexes...")
    try:
        cursor.execute("CREATE INDEX idx_credit_client ON credit_card(client_num);")
        cursor.execute("CREATE INDEX idx_cust_client ON customer(client_num);")
    except Exception as e:
        print(f"Index creation warning (might already exist): {e}")

    conn.close()
    print("Database setup complete.")

if __name__ == "__main__":
    setup_database()
