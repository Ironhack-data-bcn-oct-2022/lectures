import streamlit as st
import src.manage_data as cleaning

# 1. Show the data
st.write("Adventure time data: cleaned")
st.dataframe(cleaning.load_dataframe())