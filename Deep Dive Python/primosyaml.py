import yaml
import json

# with open("primos.yml", "r") as f:
#     prime_service = yaml.safe_load(f)

# leyendo archivos yaml
f = open("primos.yml","r")
prime_service = yaml.safe_load(f)

print(prime_service['prime_numbers'][0])
print(prime_service['rest']['url'])

# convirtiendo de yaml a json
with open('primos.json', 'w') as json_file:
    json.dump(prime_service, json_file)

output = json.dumps(json.load(open('primos.json')), indent=2)
print(output)

# convirtiendo json a yaml
with open('primos.json', 'r') as file:
    configuration = json.load(file)

with open('config.yaml', 'w') as yaml_file:
    yaml.dump(configuration, yaml_file)

with open('config.yaml', 'r') as yaml_file:
    print(yaml_file.read())

"""
Advertencia: safe_load() es más seguro que load()
Tutorial: https://python.land/data-processing/python-yaml#Reading_and_parsing_a_YAML_file_with_Python
"""