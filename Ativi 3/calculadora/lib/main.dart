import 'package:flutter/material.dart';

void main() {
  runApp(const Calculadora());
}

class Calculadora extends StatelessWidget {
  const Calculadora({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 89, 183, 58)),
      ),
      home: const CalculadoraPage(),
    );
  }
}

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  String display = '';
  double num1 = 0;
  double num2 = 0;
  String operador = '';

  List<String> historico = []; // ✅ histórico agora dentro da classe

  void onButtonClick(String valor) {
    setState(() {
      if (valor == 'Limpar') {
        display = '';
        num1 = 0;
        num2 = 0;
        operador = '';
        return;
      }

      if (['+', '-', '*', '/'].contains(valor)) {
        num1 = double.tryParse(display) ?? 0;
        operador = valor;
        display = '';
        return;
      }

      if (valor == '=') {
        num2 = double.tryParse(display) ?? 0;

        String operacao = "$num1 $operador $num2";

        switch (operador) {
          case '+':
            display = (num1 + num2).toString();
            break;
          case '-':
            display = (num1 - num2).toString();
            break;
          case '*':
            display = (num1 * num2).toString();
            break;
          case '/':
            display =
                num2 != 0 ? (num1 / num2).toString() : 'Erro';
            break;
        }

        // ✅ salva no histórico
        historico.add("$operacao = $display");

        return;
      }

      display += valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora da turma do Goku'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // ✅ HISTÓRICO
          Expanded(
            child: ListView.builder(
              itemCount: historico.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(historico[index]),
                );
              },
            ),
          ),

          // ✅ DISPLAY
          DisplayWidget(texto: display),

          // ✅ BOTÕES
          Expanded(
            child: Column(
              children: [
                Row(children: [
                  BotaoNumero('7', onButtonClick),
                  BotaoNumero('8', onButtonClick),
                  BotaoNumero('9', onButtonClick),
                  BotaoOperacao('/', onButtonClick),
                ]),
                Row(children: [
                  BotaoNumero('4', onButtonClick),
                  BotaoNumero('5', onButtonClick),
                  BotaoNumero('6', onButtonClick),
                  BotaoOperacao('*', onButtonClick),
                ]),
                Row(children: [
                  BotaoNumero('1', onButtonClick),
                  BotaoNumero('2', onButtonClick),
                  BotaoNumero('3', onButtonClick),
                  BotaoOperacao('-', onButtonClick),
                ]),
                Row(children: [
                  BotaoNumero('0', onButtonClick),
                  BotaoOperacao('Limpar', onButtonClick),
                  BotaoOperacao('=', onButtonClick),
                  BotaoOperacao('+', onButtonClick),
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ================= DISPLAY =================
class DisplayWidget extends StatelessWidget {
  final String texto;

  const DisplayWidget({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.all(20),
      child: Text(
        texto,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 40),
      ),
    );
  }
}

// ================= BOTÃO NÚMERO =================
class BotaoNumero extends StatelessWidget {
  final String numero;
  final Function(String) onClick;

  const BotaoNumero(this.numero, this.onClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () => onClick(numero),
          child: Text(numero, style: const TextStyle(fontSize: 22)),
        ),
      ),
    );
  }
}

// ================= BOTÃO OPERAÇÃO =================
class BotaoOperacao extends StatelessWidget {
  final String operacao;
  final Function(String) onClick;

  const BotaoOperacao(this.operacao, this.onClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () => onClick(operacao),
          child: Text(operacao, style: const TextStyle(fontSize: 22)),
        ),
      ),
    );
  }
}