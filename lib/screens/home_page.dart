// lib/screens/home_page.dart
import 'package:flutter/material.dart';
import 'package:python_course_app/models/lesson.dart';
import 'package:python_course_app/screens/lesson_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  // Datos dummy de tus lecciones.
  // ¡Ahora con 20 lecciones y explicaciones de código!
  final List<Lesson> lessons = const [
    Lesson(
      title: 'Lección 1: Introducción a Python',
      description:
          'Python es un lenguaje de programación de alto nivel, interpretado y multiparadigma. Es ampliamente utilizado en desarrollo web, análisis de datos, inteligencia artificial y automatización. Es conocido por su sintaxis clara y legible.',
      codeExamples: [
        CodeExample(
          title: 'Hola Mundo en Python',
          code: """
print("¡Hola, Mundo!")
          """,
          codeExplanation:
              'La función `print()` es la forma más básica de mostrar salida en la consola en Python. Aquí simplemente imprime la cadena de texto "¡Hola, Mundo!".',
        ),
        CodeExample(
          title: 'Variables y Tipos de Datos',
          code: """
# Enteros
edad = 30
print(f"Edad: {edad}")

# Flotantes
altura = 1.75
print(f"Altura: {altura}")

# Cadenas de texto
nombre = "Alice"
print(f"Nombre: {nombre}")

# Booleanos
es_estudiante = True
print(f"Es estudiante: {es_estudiante}")
          """,
          codeExplanation:
              'En Python, no necesitas declarar el tipo de una variable; el intérprete lo infiere. Este ejemplo muestra cómo asignar valores a variables de diferentes tipos (entero, flotante, cadena de texto, booleano) y cómo imprimirlos usando f-strings para formatear la salida.',
        ),
      ],
    ),
    Lesson(
      title: 'Lección 2: Estructuras de Control (If/Else)',
      description:
          'Las estructuras de control permiten controlar el flujo de ejecución de un programa. La declaración `if` se utiliza para ejecutar un bloque de código solo si una condición es verdadera.',
      codeExamples: [
        CodeExample(
          title: 'Ejemplo de If/Else',
          code: """
temperatura = 25

if temperatura > 30:
    print("Hace mucho calor hoy.")
elif temperatura > 20:
    print("La temperatura es agradable.")
else:
    print("Hace frío.")
          """,
          codeExplanation:
              'Este código demuestra cómo usar las declaraciones `if`, `elif` (else if) y `else` para ejecutar diferentes bloques de código basados en la condición de la variable `temperatura`. Solo se ejecuta el bloque cuya condición es la primera en ser verdadera.',
        ),
      ],
    ),
    Lesson(
      title: 'Lección 3: Bucles (For y While)',
      description:
          'Los bucles son fundamentales para repetir tareas. El bucle `for` se usa para iterar sobre una secuencia (como una lista o un rango), y el bucle `while` repite un bloque de código mientras una condición sea verdadera.',
      codeExamples: [
        CodeExample(
          title: 'Bucle For',
          code: """
frutas = ["manzana", "banana", "cereza"]
for fruta in frutas:
    print(fruta)
          """,
          codeExplanation:
              'El bucle `for` itera sobre cada elemento de la lista `frutas` e imprime el nombre de cada fruta en una línea separada. Es ideal para recorrer colecciones.',
        ),
        CodeExample(
          title: 'Bucle While',
          code: """
contador = 0
while contador < 5:
    print(f"Contador: {contador}")
    contador += 1
          """,
          codeExplanation:
              'El bucle `while` se ejecuta mientras la condición `contador < 5` sea verdadera. En cada iteración, imprime el valor del `contador` y lo incrementa en 1, hasta que `contador` llega a 5.',
        ),
      ],
    ),
    // --- Continúa aquí con la Lección 4 a la 20 ---
    // Tendrás que añadir manualmente la propiedad `codeExplanation`
    // para CADA CodeExample de las 17 lecciones restantes.

    Lesson(
      title: 'Lección 4: Listas en Python',
      description:
          'Las listas son colecciones ordenadas y mutables de elementos. Pueden contener elementos de diferentes tipos de datos.',
      codeExamples: [
        CodeExample(
          title: 'Crear y Acceder a Listas',
          code: """
mi_lista = [1, "hola", 3.14, True]
print(mi_lista[0])   # Acceder al primer elemento
print(mi_lista[1:3]) # Acceder a un rango
mi_lista.append(False) # Añadir un elemento
print(mi_lista)
          """,
          codeExplanation:
              'Se crea una lista con varios tipos de datos. Se muestra cómo acceder a elementos individuales por índice (`mi_lista[0]`), a sublistas por rebanado (`mi_lista[1:3]`), y cómo modificar la lista añadiendo un elemento con `append()`.',
        ),
      ],
    ),
    Lesson(
      title: 'Lección 5: Tuplas y Conjuntos',
      description:
          'Las tuplas son colecciones ordenadas e inmutables. Los conjuntos son colecciones desordenadas de elementos únicos.',
      codeExamples: [
        CodeExample(
          title: 'Tuplas y sus usos',
          code: """
mi_tupla = (1, 2, "tres")
print(mi_tupla[0])
# mi_tupla[0] = 5 # Error: Las tuplas son inmutables
          """,
          codeExplanation:
              'Este ejemplo define una tupla. Muestra que se puede acceder a sus elementos por índice. La línea comentada ilustra que las tuplas son inmutables, es decir, sus elementos no pueden ser modificados después de su creación.',
        ),
        CodeExample(
          title: 'Conjuntos y Operaciones',
          code: """
mi_conjunto = {1, 2, 3, 2, 1} # Los duplicados se eliminan
print(mi_conjunto)
otro_conjunto = {3, 4, 5}
print(mi_conjunto.union(otro_conjunto))
          """,
          codeExplanation:
              'Un conjunto se crea con elementos, y automáticamente elimina duplicados. Luego se demuestra una operación de unión entre dos conjuntos, que combina los elementos únicos de ambos.',
        ),
      ],
    ),
    Lesson(
      title: 'Lección 6: Diccionarios en Python',
      description:
          'Los diccionarios son colecciones desordenadas y mutables de pares clave-valor. Son ideales para almacenar datos estructurados.',
      codeExamples: [
        CodeExample(
          title: 'Crear y Manipular Diccionarios',
          code: """
persona = {"nombre": "Juan", "edad": 30, "ciudad": "México"}
print(persona["nombre"]) # Acceder por clave
persona["edad"] = 31     # Modificar valor
persona["ocupacion"] = "Ingeniero" # Añadir nuevo par
print(persona)
          """,
          codeExplanation:
              'Se define un diccionario donde cada elemento es un par clave-valor. Se muestra cómo acceder a un valor usando su clave, cómo modificar el valor asociado a una clave existente, y cómo añadir una nueva clave-valor al diccionario.',
        ),
      ],
    ),
    Lesson(
      title: 'Lección 7: Funciones',
      description:
          'Las funciones son bloques de código reutilizables que realizan una tarea específica. Permiten organizar el código y evitar la repetición.',
      codeExamples: [
        CodeExample(
          title: 'Definir y Llamar Funciones',
          code: """
def saludar(nombre):
    return f"¡Hola, {nombre}!"

mensaje = saludar("Ana")
print(mensaje)
          """,
          codeExplanation:
              'Se define una función `saludar` que toma un argumento `nombre` y devuelve un saludo. Luego se llama a la función con el nombre "Ana" y se imprime el resultado.',
        ),
        CodeExample(
          title: 'Parámetros por defecto',
          code: """
def sumar(a, b=0):
    return a + b

print(sumar(5))
print(sumar(5, 3))
          """,
          codeExplanation:
              'La función `sumar` tiene un parámetro `b` con un valor por defecto de `0`. Esto permite llamarla con uno o dos argumentos. Si solo se proporciona `a`, `b` toma su valor por defecto.',
        ),
      ],
    ),
    Lesson(
      title: 'Lección 8: Ámbito de Variables (Scope)',
      description:
          'El ámbito (scope) de una variable define dónde puede ser accedida en un programa. Las variables pueden ser locales o globales.',
      codeExamples: [
        CodeExample(
          title: 'Variables Locales y Globales',
          code: """
x = 10 # Global

def mi_funcion():
    y = 5 # Local
    print(x) # Accede a la global
    print(y)

mi_funcion()
# print(y) # Error: 'y' no está definida aquí
          """,
          codeExplanation:
              'La variable `x` es global y accesible dentro y fuera de la función. `y` es local a `mi_funcion` y solo se puede acceder dentro de ella. Intentar acceder a `y` fuera de la función resultará en un error.',
        ),
      ],
    ),
    Lesson(
      title: 'Lección 9: Módulos y Paquetes',
      description:
          'Los módulos son archivos Python que contienen funciones, clases y variables. Los paquetes son colecciones de módulos.',
      codeExamples: [
        CodeExample(
          title: 'Importar Módulos',
          code: """
import math
print(math.pi)

from random import randint
print(randint(1, 10))
          """,
          codeExplanation:
              'El primer ejemplo importa el módulo `math` completo para acceder a su constante `pi`. El segundo ejemplo importa solo la función `randint` del módulo `random`, lo que permite usarla directamente sin prefijo de módulo.',
        ),
      ],
    ),
    Lesson(
      title: 'Lección 10: Manejo de Errores (Try-Except)',
      description:
          'El manejo de errores permite que tu programa continúe ejecutándose incluso si ocurren problemas. Se usa `try`, `except` y `finally`.',
      codeExamples: [
        CodeExample(
          title: 'Capturar Excepciones',
          code: """
try:
    resultado = 10 / 0
except ZeroDivisionError:
    print("Error: No se puede dividir por cero.")
finally:
    print("La operación ha terminado.")
          """,
          codeExplanation:
              'El código dentro del bloque `try` se intenta ejecutar. Si ocurre un `ZeroDivisionError` (división por cero), el control salta al bloque `except` y se imprime un mensaje de error. El bloque `finally` siempre se ejecuta, ocurra o no una excepción.',
        ),
      ],
    ),
    Lesson(
      title: 'Lección 11: Clases y Objetos (Programación Orientada a Objetos)',
      description:
          'Python soporta la Programación Orientada a Objetos (POO). Las clases son plantillas para crear objetos.',
      codeExamples: [
        CodeExample(
          title: 'Definir una Clase y Crear Objetos',
          code: """
class Perro:
    def __init__(self, nombre, raza):
        self.nombre = nombre
        self.raza = raza

    def ladrar(self):
        return f"{self.nombre} dice Guau!"

mi_perro = Perro("Fido", "Labrador")
print(mi_perro.ladrar())
          """,
          codeExplanation:
              'La clase `Perro` define un `__init__` (constructor) para inicializar `nombre` y `raza`, y un método `ladrar()`. Luego, se crea una instancia de `Perro` (`mi_perro`) y se llama a su método `ladrar()`.',
        ),
      ],
    ),
    Lesson(
      title: 'Lección 12: Herencia',
      description:
          'La herencia permite que una clase (subclase) herede propiedades y métodos de otra clase (superclase).',
      codeExamples: [
        CodeExample(
          title: 'Clases con Herencia',
          code: """
class Animal:
    def __init__(self, nombre):
        self.nombre = nombre

    def comer(self):
        return f"{self.nombre} está comiendo."

class Gato(Animal):
    def maullar(self):
        return f"{self.nombre} dice Miau!"

mi_gato = Gato("Whiskers")
print(mi_gato.comer())
print(mi_gato.maullar())
          """,
          codeExplanation:
              'La clase `Gato` hereda de `Animal`. Esto significa que `Gato` automáticamente obtiene los atributos y métodos de `Animal` (como `nombre` y `comer()`), además de sus propios métodos (`maullar()`).',
        ),
      ],
    ),
    Lesson(
      title: 'Lección 13: Archivos (Lectura y Escritura)',
      description:
          'Python permite leer y escribir archivos fácilmente. Es fundamental para manejar datos persistentes.',
      codeExamples: [
        CodeExample(
          title: 'Leer y Escribir en un Archivo',
          code: """
# Escribir
with open("ejemplo.txt", "w") as f:
    f.write("Hola, este es un ejemplo.\\n")
    f.write("Segunda línea.")

# Leer
with open("ejemplo.txt", "r") as f:
    contenido = f.read()
    print(contenido)
          """,
          codeExplanation:
              'El bloque `with open(...)` asegura que el archivo se cierre correctamente. En modo "w", se escribe en el archivo (sobrescribiéndolo si existe). En modo "r", se lee todo el contenido del archivo.',
        ),
      ],
    ),
    Lesson(
      title: 'Lección 14: Manejo de Expresiones Regulares (Regex)',
      description:
          'Las expresiones regulares son poderosas para buscar y manipular patrones de texto. Se usa el módulo `re`.',
      codeExamples: [
        CodeExample(
          title: 'Buscar Patrones con Regex',
          code: """
import re

texto = "Mi número de teléfono es 123-456-7890."
patron = r'\\d{3}-\\d{3}-\\d{4}'
resultado = re.search(patron, texto)

if resultado:
    print(f"Número encontrado: {resultado.group(0)}")
else:
    print("Número no encontrado.")
          """,
          codeExplanation:
              'El módulo `re` se usa para operaciones de regex. El patrón `r\'\\d{3}-\\d{3}-\\d{4}\'` busca un número de teléfono. `re.search` intenta encontrar la primera coincidencia del patrón en la cadena de texto, y `resultado.group(0)` devuelve la coincidencia encontrada.',
        ),
      ],
    ),
    Lesson(
      title: 'Lección 15: Comprensión de Listas (List Comprehensions)',
      description:
          'Una forma concisa y eficiente de crear listas basada en iterables existentes.',
      codeExamples: [
        CodeExample(
          title: 'Ejemplo de List Comprehension',
          code: """
numeros = [1, 2, 3, 4, 5]
cuadrados = [n**2 for n in numeros if n % 2 == 0]
print(cuadrados)
          """,
          codeExplanation:
              'Este ejemplo crea una nueva lista llamada `cuadrados`. Itera sobre `numeros`, eleva al cuadrado (`n**2`) solo los números pares (`if n % 2 == 0`) y los añade a la nueva lista de forma muy compacta.',
        ),
      ],
    ),
    Lesson(
      title: 'Lección 16: Lambdas (Funciones Anónimas)',
      description:
          'Las funciones lambda son pequeñas funciones anónimas de una sola expresión. Son útiles para operaciones simples.',
      codeExamples: [
        CodeExample(
          title: 'Uso de Lambda',
          code: """
sumar = lambda a, b: a + b
print(sumar(5, 3))

lista_pares = list(filter(lambda x: x % 2 == 0, [1, 2, 3, 4, 5, 6]))
print(lista_pares)
          """,
          codeExplanation:
              'Una función lambda `sumar` se define para sumar dos números. Luego, `filter()` se usa con otra lambda para crear una lista solo con números pares, demostrando cómo las lambdas son útiles para operaciones sencillas en una línea.',
        ),
      ],
    ),
    Lesson(
      title: 'Lección 17: Decoradores',
      description:
          'Los decoradores son una forma de modificar o extender el comportamiento de funciones o métodos sin cambiarlos directamente.',
      codeExamples: [
        CodeExample(
          title: 'Crear un Decorador Básico',
          code: """
def mi_decorador(func):
    def envoltura():
        print("Antes de llamar a la función")
        func()
        print("Después de llamar a la función")
    return envoltura

@mi_decorador
def saludar():
    print("¡Hola mundo!")

saludar()
          """,
          codeExplanation:
              'El `mi_decorador` envuelve la función `saludar`. Cuando `saludar()` es llamada, primero se ejecuta el código "Antes de llamar...", luego `saludar()` en sí, y finalmente "Después de llamar...". Esto es útil para añadir funcionalidades como logging o medir tiempos sin modificar la función original.',
        ),
      ],
    ),
    Lesson(
      title: 'Lección 18: Generadores e Iteradores',
      description:
          'Los generadores son funciones que devuelven un iterador. Son eficientes para procesar grandes secuencias de datos.',
      codeExamples: [
        CodeExample(
          title: 'Función Generadora',
          code: """
def cuenta_regresiva(n):
    while n > 0:
        yield n
        n -= 1

for numero in cuenta_regresiva(5):
    print(numero)
          """,
          codeExplanation:
              'La función `cuenta_regresiva` es un generador porque usa la palabra clave `yield`. En lugar de devolver todos los valores a la vez, `yield` "pausa" la función y devuelve un valor, reanudándose desde donde se quedó en la siguiente iteración del bucle `for`.',
        ),
      ],
    ),
    Lesson(
      title: 'Lección 19: Manejo Básico de Fechas y Horas',
      description:
          'El módulo `datetime` permite trabajar con fechas, horas y duraciones en Python.',
      codeExamples: [
        CodeExample(
          title: 'Fecha y Hora Actual',
          code: """
from datetime import datetime, timedelta

ahora = datetime.now()
print(f"Fecha y hora actual: {ahora}")

futuro = ahora + timedelta(days=7)
print(f"En una semana: {futuro.strftime('%Y-%m-%d')}")
          """,
          codeExplanation:
              'Se usa `datetime.now()` para obtener la fecha y hora actuales. `timedelta` permite realizar operaciones con tiempo, como añadir 7 días. `strftime()` se utiliza para formatear la fecha en un formato legible específico.',
        ),
      ],
    ),
    Lesson(
      title: 'Lección 20: Introducción a la Gestión de Paquetes (pip)',
      description:
          'Pip es el gestor de paquetes estándar de Python. Permite instalar, desinstalar y gestionar librerías de terceros.',
      codeExamples: [
        CodeExample(
          title: 'Comandos Básicos de Pip',
          code: """
# Instalar un paquete
pip install requests

# Desinstalar un paquete
pip uninstall requests

# Listar paquetes instalados
pip list

# Crear un archivo de requisitos
pip freeze > requirements.txt
          """,
          codeExplanation:
              'Esta lección presenta los comandos esenciales de `pip` para gestionar paquetes de Python. Los comandos están comentados porque son para ejecutar en la terminal de Python, no directamente en la app. Cubre instalación, desinstalación, listado y exportación de dependencias.',
        ),
      ],
    ),
  ];

  // Resto del código de HomePage (Drawer, _launchUrl, build, etc.)
  // ...
  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw 'No se pudo lanzar $urlString';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Curso de Python',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Aprendiendo Python',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Mis Redes Sociales',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.link, color: Theme.of(context).colorScheme.secondary),
              title: const Text('Mi Sitio Web'),
              onTap: () {
                _launchUrl('https://www.andromux.org');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.code, color: Theme.of(context).colorScheme.secondary),
              title: const Text('GitHub'),
              onTap: () {
                _launchUrl('https://github.com/andromux');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_camera, color: Theme.of(context).colorScheme.secondary),
              title: const Text('YouTube'),
              onTap: () {
                _launchUrl('https://www.youtube.com/@andromux');
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info_outline, color: Theme.of(context).colorScheme.secondary),
              title: const Text('Acerca de'),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'Curso de Python App',
                  applicationVersion: '1.0.0',
                  applicationLegalese: '© 2024 Andromux ORG',
                  children: [
                    Text('Aplicación creada para enseñar Python a principiantes.'),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 16.0),
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LessonPage(lesson: lesson),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      lesson.description.split('\n')[0],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}