%*************SISTEMA DE ENCUESTAS**************

:- dynamic encuesta/8.

% Hechos iniciales - productos
producto(1, 'Celular TCL').
producto(2, 'Macbook').
producto(3, 'Auriculares JBL').
producto(4, 'Smart TV LG').
producto(5, 'Tablet Kindle').

% Hechos iniciales - rangos de edad
rango_edad(1, '18-25').
rango_edad(2, '26-35').
rango_edad(3, '36-45').
rango_edad(4, '46-55').
rango_edad(5, '56+').

% Hechos iniciales - géneros
genero(1, 'Masculino').
genero(2, 'Femenino').
genero(3, 'Otro/Prefiero no decir').

% Hechos iniciales - razones
razon_aceptacion(1, 'Calidad').
razon_aceptacion(2, 'Precio').
razon_aceptacion(3, 'Diseño').
razon_aceptacion(4, 'Marca').
razon_aceptacion(5, 'Otros').

razon_rechazo(1, 'Calidad').
razon_rechazo(2, 'Precio').
razon_rechazo(3, 'Diseño').
razon_rechazo(4, 'Marca').
razon_rechazo(5, 'Otros').

% Estructura de la encuesta
% (ID único, producto, rango de edad, género, valoración, razón de aceptación o rechazo según la valoración, precio dispuesto a pagar)
encuesta(1, 1, 2, 1, 4, 1, 0, 1200).
encuesta(2, 1, 3, 2, 2, 0, 2, 800).
encuesta(3, 2, 1, 1, 5, 3, 0, 2500).
encuesta(4, 2, 4, 2, 3, 2, 0, 1800).
encuesta(5, 3, 2, 3, 1, 0, 1, 150).
encuesta(6, 3, 5, 1, 4, 1, 0, 200).
encuesta(7, 4, 1, 2, 5, 3, 0, 3500).
encuesta(8, 4, 3, 1, 2, 0, 4, 2500).
encuesta(9, 5, 4, 2, 4, 5, 0, 300).
encuesta(10, 5, 2, 3, 3, 2, 0, 250).
encuesta(11, 1, 1, 1, 5, 4, 0, 1300).
encuesta(12, 1, 5, 2, 1, 0, 3, 700).
encuesta(13, 2, 3, 2, 4, 2, 0, 2200).
encuesta(14, 2, 2, 1, 2, 0, 1, 1500).
encuesta(15, 3, 4, 3, 5, 1, 0, 250).
encuesta(16, 3, 1, 2, 3, 5, 0, 180).
encuesta(17, 4, 5, 1, 4, 3, 0, 3200).
encuesta(18, 4, 2, 2, 1, 0, 2, 2800).
encuesta(19, 5, 3, 3, 2, 0, 4, 200).
encuesta(20, 5, 4, 1, 5, 1, 0, 350).
encuesta(21, 1, 2, 2, 3, 2, 0, 1100).
encuesta(22, 1, 1, 3, 4, 1, 0, 1250).
encuesta(23, 2, 5, 1, 5, 4, 0, 2600).
encuesta(24, 2, 3, 2, 2, 0, 3, 1900).
encuesta(25, 3, 4, 1, 1, 0, 1, 120).
encuesta(26, 3, 2, 2, 4, 2, 0, 220).
encuesta(27, 4, 1, 3, 3, 5, 0, 3000).
encuesta(28, 4, 3, 1, 5, 3, 0, 3800).
encuesta(29, 5, 5, 2, 2, 0, 4, 180).
encuesta(30, 5, 2, 3, 4, 1, 0, 320).
encuesta(31, 1, 4, 1, 1, 0, 2, 750).
encuesta(32, 1, 3, 2, 5, 4, 0, 1400).
encuesta(33, 2, 1, 3, 3, 2, 0, 2000).
encuesta(34, 2, 2, 1, 4, 1, 0, 2300).
encuesta(35, 3, 5, 2, 2, 0, 3, 160).
encuesta(36, 3, 3, 3, 5, 1, 0, 280).
encuesta(37, 4, 4, 1, 1, 0, 5, 2600).
encuesta(38, 4, 1, 2, 4, 3, 0, 3400).
encuesta(39, 5, 2, 3, 3, 2, 0, 270).
encuesta(40, 5, 3, 1, 2, 0, 4, 190).
encuesta(41, 1, 5, 2, 5, 4, 0, 1350).
encuesta(42, 1, 4, 3, 2, 0, 1, 850).
encuesta(43, 2, 2, 1, 3, 5, 0, 2100).
encuesta(44, 2, 1, 2, 4, 2, 0, 2400).
encuesta(45, 3, 3, 3, 1, 0, 3, 140).
encuesta(46, 3, 4, 1, 5, 1, 0, 300).
encuesta(47, 4, 5, 2, 2, 0, 2, 2900).
encuesta(48, 4, 2, 3, 4, 3, 0, 3600).
encuesta(49, 5, 1, 1, 3, 2, 0, 230).
encuesta(50, 5, 3, 2, 1, 0, 5, 150).

% Predicado para crear una nueva encuesta.
agregar_encuesta(ProductoID, RangoEdadID, GeneroID, Valoracion, RazonAceptacionID, RazonRechazoID, PrecioDispuesto) :-
    assertz(encuesta(_, ProductoID, RangoEdadID, GeneroID, Valoracion, RazonAceptacionID, RazonRechazoID, PrecioDispuesto)).

% Reglas para guardar la base de conocimiento
guardar_base :- tell('encuestas_backup.pl'), listing, told.

cargar_base :- consult('encuestas_backup.pl').

%********CONSULTAS**************
% Producto con más aceptación (mayor promedio de valoración)
producto_mas_aceptado(ID, Nombre, Promedio) :-
    findall(ProdID, producto(ProdID, _), ListaProd),
    findall(Prom-ProdID, (
        member(ProdID, ListaProd),
        findall(V, encuesta(_, ProdID, _, _, V, _, _, _), Valoraciones),
        Valoraciones \= [],
        sum_list(Valoraciones, Suma),
        length(Valoraciones, Cant),
        Prom is Suma / Cant
    ), Promedios),
    max_member(Prom-IDMax, Promedios),
    producto(IDMax, Nombre),
    ID = IDMax,
    Promedio = Prom.


% Producto con menos aceptación
producto_menos_aceptado(ID, Nombre, Promedio) :-
    findall(ProdID, producto(ProdID, _), ListaProd),
    findall(Prom-ProdID, (
        member(ProdID, ListaProd),
        findall(V, encuesta(_, ProdID, _, _, V, _, _, _), Valoraciones),
        Valoraciones \= [],
        sum_list(Valoraciones, Suma),
        length(Valoraciones, Cant),
        Prom is Suma / Cant
    ), Promedios),
    min_member(Prom-IDMin, Promedios),
    producto(IDMin, Nombre),
    ID = IDMin,
    Promedio = Prom.


% Listados varios
listar_productos :-
    producto(ID, Nombre),
    write('ID: '), write(ID), write(' - '), write(Nombre), nl,
    fail.
listar_productos.

% Rango de edad y género que más acepta cada producto
rango_genero_mayor_aceptacion(ProductoID, RangoEdadID, GeneroID) :-
    findall((Rango, Genero), 
        (encuesta(_, ProductoID, Rango, Genero, Valoracion, _, _, _), Valoracion >= 3), 
        Pares),
    max_frecuencia_pares(Pares, (RangoEdadID, GeneroID)).

% Predicado auxiliar para encontrar el par (Rango, Género) más frecuente de una lista
contar_frecuencias([], _, _, Resultado, Resultado).
contar_frecuencias([Elem|Resto], Lista, MaxF, ElemActual, Resultado) :-
    include(=(Elem), Lista, SubLista),
    length(SubLista, Frecuencia),
    (Frecuencia > MaxF ->
        contar_frecuencias(Resto, Lista, Frecuencia, Elem, Resultado)
    ;
        contar_frecuencias(Resto, Lista, MaxF, ElemActual, Resultado)
    ).

contar_frecuencias([], _, _, _, _).
contar_frecuencias([Elem|Resto], Lista, MaxF, _, Resultado) :-
    include(=(Elem), Lista, SubLista),
    length(SubLista, Frecuencia),
    (Frecuencia > MaxF ->
        NuevoMaxF = Frecuencia,
        NuevoElem = Elem
    ;
        NuevoMaxF = MaxF,
        NuevoElem = Resultado
    ),
    contar_frecuencias(Resto, Lista, NuevoMaxF, _, Resultado1),
    Resultado = NuevoElem.


% Cantidad de encuestados
total_encuestados(Total) :-
    findall(ID, encuesta(ID, _, _, _, _, _, _, _), Lista),
    length(Lista, Total).

% Cantidad de encuestas de aceptación (valoración >= 3)
total_aceptaciones(Total) :-
    findall(ID, (encuesta(ID, _, _, _, Valoracion, _, _, _), Valoracion >= 3), Lista),
    length(Lista, Total).

% Cantidad de encuestas de no aceptación (valoración < 3)
total_rechazos(Total) :-
    findall(ID, (encuesta(ID, _, _, _, Valoracion, _, _, _), Valoracion < 3), Lista),
    length(Lista, Total).

% Consulta: Razón principal de aceptación (más mencionada) para un producto dado
razon_principal_aceptacion(ProductoID, RazonID) :-
    findall(Razon,
        (encuesta(_, ProductoID, _, _, Valoracion, Razon, _, _), Valoracion >= 3, Razon \= 0),
        Razones),
    max_frecuencia(Razones, RazonID).


% Consulta: Razón principal de rechazo (más mencionada) para un producto dado
razon_principal_rechazo(ProductoID, RazonID) :-
    findall(Razon,
        (encuesta(_, ProductoID, _, _, Valoracion, _, Razon, _), Valoracion < 3, Razon \= 0),
        Razones),
    max_frecuencia(Razones, RazonID).

% Consulta: Precio promedio de los encuestados que aceptan un producto (valoración >= 3)
precio_promedio_aceptacion(ProductoID, Promedio) :-
    findall(Precio,
        (encuesta(_, ProductoID, _, _, Valoracion, _, _, Precio), Valoracion >= 3),
        Precios),
    Precios \= [],
    sum_list(Precios, Suma),
    length(Precios, Cant),
    Promedio is Suma / Cant.

%*********HELPER****************

% Encuentra el valor con mayor frecuencia en una lista
max_frecuencia(Lista, MasFrecuente) :-
    sort(Lista, Unicos),
    contar_frecuencias_valor(Unicos, Lista, 0, _, MasFrecuente).

contar_frecuencias_valor([], _, _, _, _).
contar_frecuencias_valor([Elem|Resto], Lista, MaxF, _, Resultado) :-
    include(=(Elem), Lista, SubLista),
    length(SubLista, Frecuencia),
    (Frecuencia > MaxF ->
        NuevoMaxF = Frecuencia,
        NuevoElem = Elem
    ;
        NuevoMaxF = MaxF,
        NuevoElem = Resultado
    ),
    contar_frecuencias_valor(Resto, Lista, NuevoMaxF, _, Resultado1),
    Resultado = NuevoElem.
