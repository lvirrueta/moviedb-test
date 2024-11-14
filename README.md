# TheMovieDB

## Descripción
Cartelera es una aplicación móvil que consume datos de la API de TMDb (The Movie Database). La aplicación ofrece tres servicios principales:

- **Cartelera**: Ver las películas que actualmente están en cines.
- **Favoritos**: Guardar tus películas favoritas.
- **Buscar Películas**: Buscar películas en la base de datos de TMDb.

## Tecnologías Usadas
- **Flutter**

## Requisitos
Para ejecutar este proyecto, asegúrate de tener Flutter instalado.

## Configuración
1. Copia el archivo `.env.template` para crear un nuevo archivo `.env`.
2. En el archivo `.env`, agrega el host de TMDb y tu token para habilitar las solicitudes a la API.

## Funcionalidades
- **Explorar Películas**: Ver las últimas películas en cartelera.
- **Guardar Favoritos**: Marcar películas como favoritas para acceder a ellas fácilmente después.
- **Buscar Películas**: Buscar películas específicas en la base de datos.
- **Detalles de la Película**: Ver información detallada sobre cualquier película.
- **Compartir Películas**: La funcionalidad de compartir está simulada con un Snackbar para mostrar la acción de compartir.

## Cuestionario
1. `¿Qué es Flutter y cuáles son sus principales ventajas?`

Flutter es un framework para desarrollo movil, sus principales ventajas son las compilacion que ofrece para sistemas android y sistemas ios, con el mismo código. 

2. `¿Qué es el widget Tree en Flutter y cómo funciona?`

El widget Tree (árbol de widgets) Cada widget se relaciona con sus widgets hijos y padres, y el framework construye y actualiza esta estructura de acuerdo a los cambios en el estado o en la pantalla.

3. `Explique la diferencia entre StatelessWidget y StatefulWidget`.

Un StatelessWidget es inmutable y su contenido no cambia después de ser creado. Un StatefulWidget, en cambio, es mutable

4. `Explique el ciclo de vida de un StatefulWidget. ¿Cómo se pueden 
utilizar métodos como initState, didChangeDependencies y dispose?`

El ciclo de vida de un StatefulWidget incluye la creación, actualización y destrucción del widget.

- **initstate**: se llama al inicio de la aplicacion, justo antes de renderizar el widget
- **didChange**: se invoca cuando cambian las depedencias del widget
- **dispose**: se ejecuta antes de la destruccion del widget, permitiendo liberar recursos

5. `¿Qué son los Future y Stream en Dart, y cómo se utilizan en Flutter?`

- **Future**: operacion asíncrona que da un solo valor
- **Stream**: eventos de multiples valores, se usan para `FutureBuilder` y `StreamBuilder`

6. `¿Cómo se implementa la navegación entre pantallas en Flutter?`

La navegación en Flutter se realiza usando el widget Navigator. Para ir a otra pantalla, se utiliza Navigator.push, y para volver, Navigator.pop. 
