import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../tarefaProvider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final tarefas = ref.watch(tarefaProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Tarefas")),
      body: Column(
        children: [
          // campo + botão
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Digite uma tarefa",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      ref.read(tarefaProvider.notifier)
                          .adicionar(controller.text);
                      controller.clear();
                    }
                  },
                )
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (context, index) {
                final tarefa = tarefas[index];

                return ListTile(
                  title: Text(
                    tarefa.titulo,
                    style: TextStyle(
                      decoration: tarefa.concluida
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  leading: Checkbox(
                    value: tarefa.concluida,
                    onChanged: (_) {
                      ref
                          .read(tarefaProvider.notifier)
                          .alternarStatus(index);
                    },
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      ref.read(tarefaProvider.notifier).remover(index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}