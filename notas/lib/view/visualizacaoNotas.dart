import 'package:flutter/material.dart';

import '../control/notaController.dart';
import '../model/nota.dart';
import 'criacaoNotas.dart';

class NoteListScreen extends StatefulWidget {
   late NotaController notaController;

  NoteListScreen();

  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  List<Nota> notas = [];

  @override
  void initState() {
    super.initState();
    loadNotas();
  }

  void loadNotas() async {
    notas = await widget.notaController.listarNotas();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notas'),
      ),
      body: ListView.builder(
        itemCount: notas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notas[index].title),
            subtitle: Text(notas[index].content),
            onTap: () {
              // Navegar para a tela de edição usando Navigator
            },
            onLongPress: () {
           //   widget.notaController.deleteNota(notas[index].id);
              loadNotas();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  NoteCreateScreen()),
          );

          // Navegar para a tela de edição usando Navigator
        },
        child: Icon(Icons.add),
      ),
    );
  }
}