
# Flask API for data handling
One GET method and one POST method: getting info and inserting into a DB

# How does it work?

First: make sure you have a `.env` file with your databases info.

# @POST
Endpoint
- /new/sentence

We'll insert a new sentence into the database


# @GET
Endpoint
- /sentence/<name>

We'll extract all the sentences from a user in the database

```
url_sentences = "http://localhost:5000/sentence/"
name = "Albus Dumbledore"
```
