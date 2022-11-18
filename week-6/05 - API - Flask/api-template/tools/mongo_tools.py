from config.mongo_config import db, c

## GET
def all_sentences (name):
    query = {"character_name": f"{name}"}
    sent = list(c.find(query, {"_id": 0})) 
    return sent

## POST
def inserting (dict_):
    c.insert_one(dict_)
    return f"I inserted {dict_} into the db"