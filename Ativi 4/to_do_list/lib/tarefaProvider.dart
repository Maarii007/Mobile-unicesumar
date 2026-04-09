import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../tarefa.dart';

class TarefaNotifier extends StateNotifier<List<Tarefa>> {
  TarefaNotifier() : super([]);

  void adicionar(String titulo) {
    state = [...state, Tarefa(titulo: titulo)];
  }

  void remover(int index) {
    final novaLista = [...state];
    novaLista.removeAt(index);
    state = novaLista;
  }

  void alternarStatus(int index) {
    final novaLista = [...state];
    novaLista[index].concluida = !novaLista[index].concluida;
    state = novaLista;
  }
}

final tarefaProvider =
    StateNotifierProvider<TarefaNotifier, List<Tarefa>>((ref) {
  return TarefaNotifier();
});