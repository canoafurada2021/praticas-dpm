import '../model/nota.dart';
import '../model/notaDAO.dart';

class NotaController {
  final DBHelper databaseController;

  NotaController(this.databaseController);

  Future<int> cadastrarNota(Nota nota) {
    return databaseController.insertNota(nota);
  }

  Future<List<Nota>> listarNotas() {
    return databaseController.getNotas();
  }


}