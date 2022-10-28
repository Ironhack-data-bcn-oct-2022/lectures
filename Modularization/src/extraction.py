from bs4 import BeautifulSoup
import requests

def get_names (url):
    soup = BeautifulSoup(requests.get(url).content, "html.parser")
    products = soup.find_all("div", attrs={"class":"name_product_box"})
    name = [i.getText().replace("\n", "") for i in products]
    return name