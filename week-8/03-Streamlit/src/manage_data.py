from tkinter import E
import pandas as pd
import streamlit as st
import os

def load_dataframe ():
    df = pd.read_pickle("data/clean.pkl")
    return df

def rename_id (x):
    return f"Sentence {x}"

def graph (character):
    data = load_dataframe()
    data = data[(data["character_name"]==f"{character}")]
    data = data[["frase", "polarity"]].reset_index(drop=True)
    data["frase"] = data.index+1
    data["frase"] = data.frase.apply(rename_id)
    return data


def bar_1():
    data = load_dataframe()
    data = data.groupby("character_name").agg({"character_name":'count'}).rename(columns={"character_name":"character_name", "character_name":"number of sentences"}).reset_index().set_index("character_name", drop=True)
    return data


def charachter_list():
    data = load_dataframe()
    return list(data.character_name.unique())