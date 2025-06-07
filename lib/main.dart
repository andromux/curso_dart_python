// lib/main.dart
import 'package:flutter/material.dart';
import 'package:python_course_app/screens/home_page.dart'; // Importa tu HomePage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curso de Python para Principiantes',
      // Tema para modo claro
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        brightness: Brightness.light, // Asegura el tema claro por defecto
      ),
      // Tema para modo oscuro
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark, // Importante para el modo oscuro
        ),
        useMaterial3: true,
        brightness: Brightness.dark, // Asegura el tema oscuro
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black, // Fondo oscuro para la AppBar en modo oscuro
          foregroundColor: Colors.white, // Texto blanco en AppBar en modo oscuro
        ),
        scaffoldBackgroundColor: Colors.grey[900], // Fondo oscuro para Scaffold
        cardColor: Colors.grey[850], // Color de las tarjetas en modo oscuro
        textTheme: TextTheme( // Ajusta colores de texto para modo oscuro
          bodyLarge: TextStyle(color: Colors.white70),
          bodyMedium: TextStyle(color: Colors.white60),
          bodySmall: TextStyle(color: Colors.white54),
          headlineMedium: TextStyle(color: Colors.white),
          headlineSmall: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
        ),
      ),
      themeMode: ThemeMode.system, // Usa el tema del sistema (claro u oscuro)
      home: const HomePage(title: 'Curso de Python'),
    );
  }
}