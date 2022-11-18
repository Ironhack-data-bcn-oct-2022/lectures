import sqlalchemy as alch
import os
import dotenv

dotenv.load_dotenv()

passw = os.getenv("pass_sql")
dbName = "HP"
print(f"Connection established to {dbName}!")

if not dbName:
    raise ValueError("No URL for database")

connectionData = f"mysql+pymysql://root:{passw}@localhost/{dbName}"
engine = alch.create_engine(connectionData)