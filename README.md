# API-REST Endpoints 

### GET(Lista todos los productos)

```
localhost/TPE2/api/products/
```

### GET/ID:(Lista todos los productos por ID)

```
localhost/TPE2/api/products/2
```
### POST(Inserta un nuevo producto)

```
localhost/TPE2/api/products/
```
### DELETE:ID(Elimina un producto)

```
localhost/TPE2/api/products/2
```
# Requisitos Opcionales

### PAGINADO(Obtiene los datos paginado aclarando un limit y offset)

```
localhost/TPE2/api/products/?limit=10&offset=2
```
### FILTRADO(Permite filtrar cualquier columna aclarando tambien el dato que queremos traer. EJ: columna talles y valor: XXL)

```
localhost/TPE2/api/products/?filterby=talle&value=XXL
```
### ORDENAMIENTO(Permite ordenar los datos por CUALQUIER columna y de manera ASCENDENTE o DESCENDENTE)

```
localhost/TPE2/api/products/?sortby=id&order=desc
```

### FILTRADO Y ORDENAMIENTO(Permite ordenar los datos por CUALQUIER columna y de manera ASCENDENTE o DESCENDENTE y a la vez filtrar cualquier columna con su valor.)

```
localhost/TPE2/api/products/?filterby=nombre&value=hola&sortby=id&order=desc
```
