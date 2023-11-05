import 'package:flutter/material.dart';
import 'package:notas/model/nota.dart';

import '../control/notaController.dart';

class NoteCreateScreen extends StatefulWidget {
  final NotaController? notaController;

  NoteCreateScreen({this.notaController});

  @override
  _NoteCreateScreenState createState() => _NoteCreateScreenState();
}

class _NoteCreateScreenState extends State<NoteCreateScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Nota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: 'Conteúdo'),
            ),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text;
                final content = contentController.text;
                final novaNota = Nota(title: title, content: content);
                widget.notaController?.cadastrarNota(novaNota);
                Navigator.pop(context); // Fechar a tela de criação de notas
              },
              child: Text('Salvar Nota'),
            ),
          ],
        ),
      ),
    );
  }
}