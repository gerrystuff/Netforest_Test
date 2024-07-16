#!/bin/bash

# Configuración de variables
DATABASE="articlesdb"
COLLECTION="articles"
FILE="data.json"

# Comando de importación
mongoimport --db $DATABASE --collection $COLLECTION --file $FILE --jsonArray --drop

# --jsonArray indica que el archivo contiene un array JSON
# --drop indica que la colección existente debe ser eliminada antes de la importación
