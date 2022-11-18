from os import name
from flask import Flask, request, jsonify
import markdown.extensions.fenced_code
import json
import random
import googletrans
import tools.mongo_tools as mongo
import tools.sql_tools as sql

app = Flask(__name__)

# GET: render markdown
@app.route("/")
def index():
    readme_file = open("README.md", "r")
    md_template = markdown.markdown(readme_file.read(), extensions = ["fenced_code"])
    return md_template

# Get everything: SQL
@app.route("/lines/")
def all_lines ():
    return jsonify(sql.get_everything())

# Get everything FROM someone: SQL & argument
@app.route("/sentences/<name>")
def sentence_name (name):
    return jsonify(sql.get_everything_from_someone(name))

# Get everything FROM someone AND use a condition: SQL, argument & params
@app.route("/one/<name>")
def one_random_language (name):
    frases = mongo.all_sentences(name)
    one = random.choice(frases)

    language = request.args["language"]
    trans = googletrans.Translator()
    result = trans.translate(one["dialogue"], dest=language)

    one["dialogue"] = result.text
    
    return one

# Get everything: mongo
@app.route("/line/<name>")
def all_from_mongo (name):
    lines = mongo.all_sentences(name)
    return jsonify(lines)

## POST
@app.route("/newline", methods=["POST"])
def insert_message():

    database = request.args["db"]

    if database == "mongo":
        dict_ = {"scene": request.form.get("scene"),
            "character_name": request.form.get("character_name"), 
            "dialogue": request.form.get("dialogue")}
        return mongo.inserting(dict_)


    elif database == "sql":
        scene = request.form.get("scene")
        char_ = request.form.get("char_")
        dialogue = request.form.get("dialogue")
        return sql.new_message(scene, char_, dialogue)

    else:
        return "You need to include the db param: either mongo or sql"


app.run(port=9000, debug=True)