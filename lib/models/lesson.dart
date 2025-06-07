// lib/models/lesson.dart

class Lesson {
  final String title;
  final String description;
  final List<CodeExample> codeExamples;

  const Lesson({
    required this.title,
    required this.description,
    this.codeExamples = const [], // Puede que una lección no tenga ejemplos de código
  });
}

class CodeExample {
  final String title;
  final String code;
  final String language; // e.g., 'python', 'dart', 'java'
  final String? codeExplanation;

  const CodeExample({
    required this.title,
    required this.code,
    this.language = 'python', // Por defecto será Python
    this.codeExplanation,
  });
}