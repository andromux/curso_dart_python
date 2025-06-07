// lib/widgets/code_block.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para copiar al portapapeles
import 'package:flutter_highlight/flutter_highlight.dart'; // Para el resaltado de sintaxis
import 'package:flutter_highlight/themes/atom-one-dark.dart'; // Tema oscuro para el código
import 'package:flutter_highlight/themes/atom-one-light.dart'; // Tema claro para el código

class CodeBlock extends StatelessWidget {
  final String code;
  final String language;
  final String title;

  const CodeBlock({
    super.key,
    required this.code,
    this.language = 'python',
    this.title = 'Ejemplo de Código',
  });

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: code));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Código copiado al portapapeles!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final Map<String, TextStyle> codeTheme = brightness == Brightness.dark
        ? atomOneDarkTheme
        : atomOneLightTheme;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: brightness == Brightness.dark ? Colors.white70 : Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy),
                  tooltip: 'Copiar código',
                  onPressed: () => _copyToClipboard(context),
                  color: brightness == Brightness.dark ? Colors.white : Colors.grey[800],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            color: codeTheme['root']!.backgroundColor, // Color de fondo del tema de código
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Permite scroll horizontal si el código es muy largo
              child: HighlightView(
                code,
                language: language,
                theme: codeTheme,
                padding: const EdgeInsets.all(0),
                textStyle: const TextStyle(
                  fontFamily: 'monospace', // Una fuente monoespaciada para el código
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}