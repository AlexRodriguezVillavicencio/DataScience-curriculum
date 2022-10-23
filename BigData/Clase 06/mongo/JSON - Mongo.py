import requests
from pprint import pprint
import pymongo

url = 'https://cdn.buenosaires.gob.ar/datosabiertos/datasets/salud/hospitales/hospitales.geojson'
response = requests.get(url)
objeto = response.json()
#pprint(objeto)
#pprint(objeto['features'])
#for hospital in objeto['features']:
    #pprint(hospital['properties'])
cliente = pymongo.MongoClient("mongodb://localhost:27017/")
bd = cliente['salud']
coleccion = bd['hospitales']
#coleccion.remove()
coleccion.insert_many(objeto['features'])