import requests

def acortar_url(url):

    endpoint = "https://cleanuri.com/api/v1/shorten"
    data = {"url": url}
    respuesta = requests.post(endpoint, data=data)
    return respuesta.json()["result_url"]
url = input("Ingrese la URL que desea acortar: ")
print("URL acortada:", acortar_url(url))
