# API-REST Endpoints 

# COMENTARIOS DE LOS PRODUCTOS

### GET(Lista todos los comentarios mostando también a que producto se hizo ese comentario)

```
localhost/TPE2/api/comments/
```

### GET/ID:(Lista comentario por ID)

```
localhost/TPE2/api/comments/2
```
### POST(Inserta un nuevo comentario indicando a que producto queremos hacer el comentario.)

```
localhost/TPE2/api/comments/
```
### DELETE:ID(Elimina un comentario)

```
localhost/TPE2/api/comments/2
```
# Requisitos Opcionales

### PAGINADO(Obtiene los datos paginado aclarando un limit y offset)

```
localhost/TPE2/api/comments/?limit=10&offset=2
```
### FILTRADO(Permite filtrar cualquier columna aclarando tambien el dato que queremos traer. EJ: columna comment y valor: buenisimo)

```
localhost/TPE2/api/comments/?filterby=comment&value=buenisimo
```
### ORDENAMIENTO(Permite ordenar los datos por CUALQUIER columna y de manera ASCENDENTE o DESCENDENTE)

```
localhost/TPE2/api/comments/?sortby=id_comment&order=desc
```

### FILTRADO Y ORDENAMIENTO(Permite ordenar los datos por CUALQUIER columna y de manera ASCENDENTE o DESCENDENTE y a la vez filtrar cualquier columna con su valor.)

```
localhost/TPE2/api/comments/?filterby=comment&value=buenisimo&sortby=id_comment&order=desc
```
### AUTENTICACIÓN POR TOKEN

```
Se debe solicitar el token con el verbo GET y la URL: localhost/TPE2/api/auth/token habiendo ingresado el usuario: admin y la pw: 1234.
Para finalmente iniciar sesión ingresar el token en bearer token y tener la sesión con la URL localhost/TPE2/api/auth/.
```

# API-REST Endpoints DE LOS PRODUCTOS

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
### FILTRADO(Permite filtrar cualquier columna aclarando tambien el dato que queremos traer. EJ: columna talles y valor: L)

```
localhost/TPE2/api/products/?filterby=talle&value=L
```
### ORDENAMIENTO(Permite ordenar los datos por CUALQUIER columna y de manera ASCENDENTE o DESCENDENTE)

```
localhost/TPE2/api/products/?sortby=id&order=desc
```

### FILTRADO Y ORDENAMIENTO(Permite ordenar los datos por CUALQUIER columna y de manera ASCENDENTE o DESCENDENTE y a la vez filtrar cualquier columna con su valor.)

```
localhost/TPE2/api/products/?filterby=talle&value=XXL&sortby=id&order=desc
```
### FILTRADO POR CATEGORÍA(Permite filtrar la columna de categorías asignandole un valor. EJ: columna id_categoria_fk y valor: Buzos)

```
localhost/TPE2/api/products/?filterby=id_categoria_fk&value=buzos
```
### AUTENTICACIÓN POR TOKEN

```
Se debe solicitar el token con el verbo GET y la URL: localhost/TPE2/api/auth/token habiendo ingresado el usuario: admin y la pw: 1234.
Para finalmente iniciar sesión ingresar el token en bearer token y tener la sesión con la URL localhost/TPE2/api/auth/.
```

