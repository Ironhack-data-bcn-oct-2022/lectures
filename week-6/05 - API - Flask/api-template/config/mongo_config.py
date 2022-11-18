import os
import dotenv
from pymongo import MongoClient

dotenv.load_dotenv()

dburl = os.getenv("URL")
print(f"Connection established to {dburl}!")

if not dburl:
    raise ValueError("No URL for database")

client=MongoClient()
db=client.get_database("Ironhack")
c = db["HP"]