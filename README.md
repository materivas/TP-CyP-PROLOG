
# 🧠 Sistema de Encuestas de Marketing en Prolog

![Prolog](https://img.shields.io/badge/Prolog-FF7D00?style=for-the-badge&logo=swi-prolog&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue)

Sistema de análisis de encuestas para valoración de productos, desarrollado en **Prolog** como trabajo práctico final para la materia *Conceptos y Paradigmas de Lenguajes de Programación*.

---

## 📌 Características principales

- 🧾 Base de conocimiento con 50 encuestas iniciales.
- 🖥️ Evaluación de 5 productos tecnológicos.
- 🔍 Consultas analíticas completas:
  - Productos con mayor o menor aceptación.
  - Análisis por demografía (edad y género).
  - Razones de aceptación o rechazo.
  - Disposición a pagar de los usuarios.
- 💾 Soporte de persistencia de datos (guardado/recuperación).

---

## 📁 Estructura del proyecto

```
.
├── TpConcYParadDeLengDeProg.pl   # Código principal en Prolog
├── encuestas_backup.pl           # Base de conocimiento persistente
├── docs/
│   ├── Presentación.pdf          # Documento explicativo
│   └── Video_defensa.mp4         # Video de presentación
└── README.md                     # Este archivo
```

---

## 📊 Consultas implementadas

```prolog
% Consultas básicas
producto_mas_aceptado(ID, Nombre, Promedio).
producto_menos_aceptado(ID, Nombre, Promedio).
total_encuestados(Total).
total_aceptaciones(Total).
total_rechazos(Total).

% Consultas avanzadas
rango_genero_mayor_aceptacion(ProductoID, RangoEdad, GeneroID).
razon_principal_aceptacion(ProductoID, RazonID).
razon_principal_rechazo(ProductoID, RazonID).
precio_promedio_aceptacion(ProductoID, Promedio).
```

---

## ⚙️ Cómo correr el proyecto

1. **Instalar SWI-Prolog**  
   👉 [https://www.swi-prolog.org/download/stable](https://www.swi-prolog.org/download/stable)

2. **Clonar el repositorio**

```bash
git clone https://github.com/materivas/TP-CyP-PROLOG.git
cd TP-CyP-PROLOG
```

3. **Ejecutar en SWI-Prolog**

```bash
swipl TpConcYParadDeLengDeProg.pl
```

---

## Demostración para la defensa

```prolog
% 1. Cargar el archivo
consult('TpConcYParadDeLengDeProg.pl').

% 2. Mostrar el estado inicial
total_encuestados(TotalAntes).

% 3. Agregar una nueva encuesta (ejemplo)
agregar_encuesta(3, 2, 1, 5, 1, 0, 280).  % Auriculares JBL

% 4. Verificar los cambios
total_encuestados(TotalDespues).
producto_mas_aceptado(ID, Nombre, Promedio).
```

---

## Créditos

Trabajo realizado como parte de la cursada de **Conceptos y Paradigmas de Lenguajes de Programación** – Año 2025  
Universidad: *Universidad de Lanús*  
