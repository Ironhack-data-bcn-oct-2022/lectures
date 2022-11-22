import streamlit as st
import src.manage_data as cleaning
import plotly.express as px
import codecs
import streamlit.components.v1 as components

# 1. Create a bar chart
st.write("""
# Plotting page
""")
data_bar = cleaning.bar_1()
st.bar_chart(data_bar)

# 2. Select a person to plot  a line chart
person = st.selectbox("Choose one character", ["Hello", "how", "are you doing", "cake"])


# 3. Clean the dataframe for plotting
data_for_plot= cleaning.graph(person)

st.write("""
Here's the polarity for: 
""", person)

# 4. Plotting
fig = px.line(data_for_plot, y="polarity")
st.plotly_chart(fig)

#5. Insert Tableau map

f=codecs.open("data/tableau.html", 'r')
tableau = f.read()
components.html(tableau,height=550,scrolling=True)



    




