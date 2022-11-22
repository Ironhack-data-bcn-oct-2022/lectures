import streamlit as st
from PIL import Image
import streamlit.components.v1 as components
import codecs

st.set_page_config(
     page_title="Adventure time",
     page_icon="🏠",
     layout="wide",
     initial_sidebar_state="expanded",
     menu_items={
         'Get Help': 'https://www.extremelycoolapp.com/help',
         'Report a bug': "https://www.extremelycoolapp.com/bug",
         'About': "# This is a header. This is an *extremely* cool app!"
     }
 )

cover = Image.open("images/cover.jpg")
st.image(cover, use_column_width=True)
st.write("""
# My SUPER awesome Dashboard
##     With Jake the Dog and Finn the Human 🚀
""")
f=codecs.open("data/adventure-youtube.html", 'r')
pedro = f.read()

components.html(pedro,height=550,scrolling=True)
