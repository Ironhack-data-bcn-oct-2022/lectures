from config.sql_config import engine
import pandas as pd

## GET
def get_everything ():
    query = (f"""SELECT * FROM users;""")
    df=pd.read_sql_query(query,con=engine)
    return df.to_dict(orient='records')

def get_everything_from_someone(name):
    query = (f"""SELECT * FROM users WHERE character_name = '{name}';""")
    df=pd.read_sql_query(query,con=engine)
    return df.to_dict(orient='records')


## POST
def new_message (scene, character_name, dialogue):
    engine.execute(f"""
    INSERT INTO users (scene, character_name, dialogue)
    VALUES ({scene}, '{character_name}', '{dialogue}');
    """)
    
    return f"Correctly introduced: {scene} {character_name} {dialogue}"


