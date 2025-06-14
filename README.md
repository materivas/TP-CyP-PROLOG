# Sistema de Encuestas de Marketing en Prolog

![Prolog](https://img.shields.io/badge/Prolog-FF7D00?style=for-the-badge&logo=swi-prolog&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue)

Sistema de análisis de encuestas para valoración de productos implementado en Prolog como trabajo práctico para la materia "Conceptos y Paradigmas de Lenguajes de Programación".

## Características principales

- Base de conocimiento con 50 encuestas iniciales
- 5 productos tecnológicos evaluados
- Consultas analíticas completas:
  - Productos con mayor/menor aceptación
  - Análisis por demografía (edad/género)
  - Razones de aceptación/rechazo
  - Disposición a pagar
- Persistencia de datos (guardado/recuperación)

## Estructura del proyecto
.
├── TpConcYParadDeLengDeProg.pl # Código principal
├── encuestas_backup.pl # Base de conocimiento persistente
├── docs/
│ ├── Presentación.pdf # Documento PDF para la defensa
│ └── Video_defensa.mp4 # Explicación en video
└── README.md # Este archivo

## Consultas implementadas

```prolog
% Consultas básicas
producto_mas_aceptado(ID, Nombre, Promedio).
producto_menos_aceptado(ID, Nombre, Promedio).
total_encuestados(Total).

% Consultas avanzadas
rango_genero_mayor_aceptacion(ProductoID, RangoEdad, GeneroID).
razon_principal_aceptacion(ProductoID, RazonID).
precio_promedio_aceptacion(ProductoID, Promedio).

````

## Como correr el proyecto?
Instalar SWI-Prolog : https://www.swi-prolog.org/download/stable

Clonar repositorio:

bash
git clone [https://github.com/tuusuario/encuestas-marketing-prolog.git](https://github.com/materivas/TP-CyP-PROLOG.git)
Ejecutar en SWI-Prolog:

swipl TpConcYParadDeLengDeProg.pl

## Demostración para la defensa
prolog
% 1. Cargar archivo
consult('TpConcYParadDeLengDeProg.pl').

% 2. Mostrar estado inicial
total_encuestados(TotalAntes).

% 3. Agregar nueva encuesta (ejemplo)
agregar_encuesta(3, 2, 1, 5, 1, 0, 280).  % Auriculares JBL

% 4. Mostrar cambios
total_encuestados(TotalDespues),
producto_mas_aceptado(ID, Nombre, Promedio).
