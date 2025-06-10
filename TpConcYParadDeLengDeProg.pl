%*************SISTEMA DE ENCUESTAS**************

:- dynamic encuesta/8.

% Hechos iniciales - productos
producto(1, 'Celular SL').
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
crear_encuesta(Nombre, Ingredientes, Precio) :-
    % Se agrega a la base de datos el producto con los datos ingresados
    assert(producto(Nombre, Ingredientes, Precio)),
    % Se crea a su vez el producto en el stock, con catidad = 0
    assert(stock(Nombre, 0)),
    writeln('Nuevo producto creado exitosamente.').