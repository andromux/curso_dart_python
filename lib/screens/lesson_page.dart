// lib/screens/lesson_page.dart
import 'package:flutter/material.dart';
import 'package:python_course_app/models/lesson.dart';
import 'package:python_course_app/widgets/code_block.dart';

class LessonPage extends StatelessWidget {
  final Lesson lesson;

  const LessonPage({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(lesson.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lesson.description,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24.0),

            if (lesson.codeExamples.isNotEmpty) ...[
              Text(
                'Ejemplos de Código:', // Cambié a 'Ejemplos de Código' para ser más general
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              const SizedBox(height: 12.0),
              ...lesson.codeExamples.map((example) => Column( // Envuelve en Column para el texto de explicación
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CodeBlock(
                        title: example.title,
                        code: example.code,
                        language: example.language,
                      ),
                      // *** NUEVO: Explicación del código ***
                      if (example.codeExplanation != null && example.codeExplanation!.isNotEmpty) ...[
                        const SizedBox(height: 12.0),
                        Text(
                          example.codeExplanation!,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontStyle: FontStyle.italic,
                            color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.8),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 24.0), // Espacio después de la explicación
                      ],
                    ],
                  )).toList(),
            ],
          ],
        ),
      ),
    );
  }
}