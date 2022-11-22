import streamlit as st
from streamlit_folium import folium_static
import streamlit.components.v1 as components
import codecs
import folium
import requests

# 1. Declare a default location
st.write("""
### Folium map
""")

default_value_goes_here = "Carrer de Pamplona 96 08018 Barcelona"
user_input = st.text_input("Enter an adress: ", default_value_goes_here)

latlon = [41.3977737, 2.1904561]

# 2. Try to get a new one through geocode

try:
    data = requests.get(f"https://geocode.xyz/{user_input}?json=1").json()
    latlon = [data["latt"], data["longt"]]

except:
    st.warning('Geocode doesnt want to work', icon="🤷‍♂️")

# 3. Plot a map

icon_ = folium.Icon(color="blue",
            prefix = "fa",
            icon="rocket",
            icon_color="black")
data_2 = {"location": latlon, "tooltip": "Ironhack", "icon":icon_}
mark = folium.Marker(**data_2)

map_1 = folium.Map(location = latlon, zoom_start=15)
mark.add_to(map_1)

folium_static(map_1)


# 4. Insert a downloaded HTML map

st.write("""
### Inserted map with HTML
""")

f=codecs.open("data/choropleth-spain.html", 'r')
mapa = f.read()

components.html(mapa,height=550,scrolling=True)
