# curso_dart_python: 

- [Descargar app de ejemplo](https://github.com/andromux/curso_dart_python/releases/download/0.1.0/cursos-python.apk)

## Arquitectura y Estructura del Código: Aplicación "Curso de Python para Principiantes" en Flutter

Esta guía está diseñada para que cualquier desarrollador, incluso con experiencia limitada en Flutter, pueda entender rápidamente la organización de la aplicación, cómo interactúan sus componentes y, lo más importante, cómo añadir nuevas funcionalidades y contenido.

### **1. Visión General de la Aplicación**

La "App Curso de Python" es una aplicación móvil desarrollada con Flutter que ofrece lecciones interactivas de Python. Su principal característica es la presentación de contenido educativo con texto explicativo, ejemplos de código con resaltado de sintaxis y funcionalidad de copiar, y una navegación sencilla entre lecciones. La aplicación también soporta el modo oscuro del sistema y enlaces externos a través de un menú lateral.

**Propósito Principal:**

  * **Enseñanza de Python:** Proporcionar un recurso accesible para aprender Python de forma autodidacta.
  * **Contenido Estructurado:** Presentar lecciones de manera organizada, con descripciones y ejemplos de código.
  * **Interactividad:** Permitir la copia de código y la navegación intuitiva.
  * **Adaptabilidad:** Funcionar en diferentes dispositivos y con temas de sistema.

### **2. Estructura de Directorios (Organización del Proyecto)**

El proyecto sigue una estructura modular y lógica, diseñada para la escalabilidad y la fácil localización de componentes:

```
python_course_app/
├── android/            # Archivos específicos de la plataforma Android
├── ios/                # Archivos específicos de la plataforma iOS
├── lib/                # ¡Aquí está la magia de Flutter!
│   ├── main.dart       # Punto de entrada de la aplicación
│   ├── models/         # Definiciones de modelos de datos
│   │   └── lesson.dart # Clases Lesson y CodeExample
│   ├── screens/        # Widgets que representan pantallas completas
│   │   ├── home_page.dart # Pantalla principal con lista de lecciones
│   │   └── lesson_page.dart # Pantalla para el contenido de cada lección
│   └── widgets/        # Widgets reutilizables más pequeños
│       └── code_block.dart # Widget para mostrar bloques de código
├── assets/             # Recursos de la aplicación (ej. imágenes de íconos)
│   └── app_icon.png
├── pubspec.yaml        # Configuraciones del proyecto y dependencias
├── README.md           # Documentación del proyecto
└── ... (otros archivos de configuración de Flutter)
```

**Explicación de cada directorio clave:**

  * **`lib/main.dart`**:

      * Es el corazón de la aplicación, donde todo comienza.
      * Configura el `MaterialApp`, que es el widget raíz de una aplicación Flutter que implementa el diseño de Material Design.
      * Define los **temas de la aplicación** (`theme` para modo claro y `darkTheme` para modo oscuro), permitiendo que la interfaz se adapte automáticamente al tema del sistema del usuario (`themeMode: ThemeMode.system`).
      * Establece la pantalla inicial (`home`) de la aplicación, que es `HomePage`.

  * **`lib/models/`**:

      * Contiene las **estructuras de datos (modelos)** de la aplicación.
      * **`lesson.dart`**: Define las clases Dart que representan la información de las lecciones:
          * `Lesson`: Objeto que representa una lección completa, incluyendo su `title` (título), `description` (descripción general) y una lista de `codeExamples`.
          * `CodeExample`: Objeto que representa un bloque de código específico dentro de una lección, con su propio `title` (título del ejemplo), `code` (el código Python en sí), `language` (el lenguaje para el resaltado de sintaxis, por defecto 'python') y `codeExplanation` (la descripción detallada de ese código).
      * **Importancia:** Separar los modelos de las vistas (screens/widgets) es una buena práctica de diseño (similar a MVC o MVVM), ya que permite que la lógica de datos sea independiente de la lógica de la interfaz de usuario.

  * **`lib/screens/`**:

      * Contiene los widgets que representan **pantallas completas** de la aplicación. Son los "contenedores" principales de la interfaz de usuario.
      * **`home_page.dart`**:
          * Es la **pantalla principal** que el usuario ve al abrir la aplicación.
          * Muestra una `AppBar` con el título de la aplicación.
          * Contiene un `Drawer` (el menú "hamburguesa") con enlaces a redes sociales y una sección "Acerca de".
          * Utiliza un `ListView.builder` para mostrar una lista de `Card` widgets, cada uno representando una lección.
          * La **lógica de navegación** (`Navigator.push`) se encuentra aquí, para pasar el objeto `Lesson` seleccionado a la `LessonPage`.
          * **¡Importante\!** La lista de lecciones (`final List<Lesson> lessons = const [...]`) se define directamente en este archivo. Este es el lugar clave para **añadir, modificar o eliminar contenido del curso**.
      * **`lesson_page.dart`**:
          * Es la **pantalla de detalle** para una lección específica.
          * Recibe un objeto `Lesson` a través de su constructor (`required this.lesson`).
          * Muestra el título de la lección en la `AppBar` y la `description` de la lección en el cuerpo.
          * Itera sobre la lista `lesson.codeExamples` para mostrar cada bloque de código y su explicación asociada.
          * **Organización del contenido:** Usa un `SingleChildScrollView` para asegurar que el contenido sea desplazable si excede el tamaño de la pantalla, y un `Column` para organizar verticalmente la descripción, los títulos de los ejemplos y los `CodeBlock`s con sus explicaciones.

  * **`lib/widgets/`**:

      * Contiene **widgets reutilizables** más pequeños que pueden ser utilizados en múltiples pantallas. Promueve la modularidad y evita la duplicación de código.
      * **`code_block.dart`**:
          * Este es un widget especializado para **mostrar y permitir copiar ejemplos de código Python**.
          * Utiliza la librería `flutter_highlight` para el **resaltado de sintaxis**, que automáticamente colorea el código según el lenguaje especificado (en nuestro caso, Python).
          * Incluye un `IconButton` para la funcionalidad de **"copiar al portapapeles"** usando `Clipboard.setData`.
          * Está diseñado para ser genérico, aceptando `title`, `code` y `language` como propiedades, lo que lo hace muy reutilizable.

### **3. Flujo de Datos y Interacción entre Componentes**

1.  **Inicio de la App (`main.dart`):** La aplicación arranca y muestra `HomePage`.
2.  **Carga de Lecciones (`home_page.dart`):** `HomePage` carga la lista estática de objetos `Lesson` que están definidos dentro de sí misma.
3.  **Listado de Lecciones (`home_page.dart`):** El `ListView.builder` itera sobre esta lista de `Lesson` y crea una `Card` para cada una.
4.  **Selección de Lección (`home_page.dart` a `lesson_page.dart`):** Cuando el usuario toca una `Card` de lección, el `onTap` de `ListTile` (o `InkWell` si se usó) utiliza `Navigator.push` para ir a la `LessonPage`. **Crucialmente, el objeto `Lesson` completo de la lección seleccionada se pasa como argumento** al constructor de `LessonPage`.
5.  **Visualización del Contenido (`lesson_page.dart`):** `LessonPage` recibe el objeto `Lesson` y usa sus propiedades (`lesson.title`, `lesson.description`, `lesson.codeExamples`) para construir la interfaz.
6.  **Renderizado de Código (`lesson_page.dart` usando `code_block.dart`):** Dentro de `LessonPage`, se itera sobre `lesson.codeExamples`. Para cada `CodeExample`, se crea una instancia del widget `CodeBlock`, pasándole el título, el código y el lenguaje del ejemplo.
7.  **Copia de Código (`code_block.dart`):** El `CodeBlock` maneja internamente la lógica de copiar su propio texto de código al portapapeles.

### **4. Cómo Añadir Más Clases (Lecciones) de Python**

El diseño actual facilita la expansión del contenido. No necesitas modificar la lógica central de la aplicación para añadir más lecciones.

1.  **Abre el archivo `lib/screens/home_page.dart`.**

2.  Busca la línea donde se define la lista `final List<Lesson> lessons = const [...]`.

3.  **Para añadir una nueva lección:**

      * Simplemente añade un nuevo objeto `Lesson(...)` a esta lista, asegurándote de seguir el formato existente.
      * Cada `Lesson` debe tener un `title` (String), una `description` (String) y una lista de `codeExamples` (List\<CodeExample\>).
      * Cada `CodeExample` debe tener un `title` (String), `code` (String - tu código Python, ¡usa triple comillas `"""` para multilínea\!), `language` (String, por defecto 'python'), y ahora un `codeExplanation` (String, explica el código).

```dart
    // Ejemplo de cómo añadir una nueva lección
    Lesson(
      title: 'Lección 21: Introducción a Pandas', // Título de tu nueva lección
      description: 'Pandas es una librería fundamental para el análisis de datos en Python...', // Descripción general
      codeExamples: [
        CodeExample(
          title: 'Crear un DataFrame', // Título del ejemplo de código
          code: """

import pandas as pd
data = {'col1': [1, 2], 'col2': [3, 4]}
df = pd.DataFrame(data)
print(df)
""",
language: 'python', // Asegúrate de que el lenguaje sea 'python'
codeExplanation: 'Este código importa la librería Pandas y crea un DataFrame básico a partir de un diccionario. Luego, imprime el DataFrame resultante en la consola.' // Explicación del código
),
// Puedes añadir más CodeExample si tu lección tiene varios ejemplos
CodeExample(
title: 'Selección de datos',
code: """

# ... (más código de Pandas)


      """,
      codeExplanation: 'Aquí se muestra cómo seleccionar columnas o filas específicas en un DataFrame.'
    ),
  ],
),
// ... y así sucesivamente para cada nueva lección
```

4.  **Guarda el archivo.** La próxima vez que ejecutes o hagas un "Hot Restart" de tu aplicación, la nueva lección aparecerá automáticamente en la pantalla principal.

### **5. Consideraciones para Futuros Desarrolladores**

  * **Manejo de Contenido Grande:** Si el curso crece a cientos de lecciones, considerar la carga de contenido desde un archivo JSON local o una base de datos (SQLite, Firebase, etc.) sería más eficiente que tener toda la data en `home_page.dart`.
  * **Mejoras de UI/UX:**
      * **Progreso del Usuario:** Implementar un sistema para marcar lecciones como completadas.
      * **Búsqueda:** Añadir una barra de búsqueda en `HomePage` para encontrar lecciones.
      * **Personalización:** Más opciones de tema, tamaños de fuente, etc.
  * **Testing:** Añadir pruebas unitarias y de widgets para asegurar la robustez de los componentes.
  * **Internacionalización (i18n):** Si se planea que la app esté en varios idiomas, se necesitará implementar el sistema de internacionalización de Flutter.

#### Esta guía proporciona una base sólida para entender y extender la aplicación. ¡Feliz desarrollo!
