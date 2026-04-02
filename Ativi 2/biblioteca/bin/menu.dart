import "dart:io";

class Livro {
  String titulo;
  String autor;
  int numPaginas;
  int ano;

  Livro(this.titulo, this.autor, this.numPaginas, this.ano);

  void mostrarLivro() {
    print("\nTítulo do livro: $titulo \n Autor: $autor \n Páginas: $numPaginas \n Ano: $ano\n");
  }
}

List<Livro> listaLivros = [];

void main() {
  int opcao = 0;

  while (opcao != 5) {
    print("\n ──── 🕮    MENU    🕮 ──── ");
    print("1: Cadastrar livro");
    print("2: Listar livros");
    print("3: Atualizar livro");
    print("4: Remover livro");
    print("5: Sair \n\n");
    stdout.write("Escolha: ");

    opcao = int.parse(stdin.readLineSync()!);

    switch (opcao) {
      case 1:
        cadastrarLivro();
        break;
      case 2:
        listarLivros();
        break;
      case 3:
        atualizarLivro();
        break;
      case 4:
        removerLivro();
        break;
      case 5:
        print("Saindo da biblioteca.");
        break;
      default:
        print("Opção inválida.");
    }
  }
}

void cadastrarLivro() {
  stdout.write("Título: ");
  String titulo = stdin.readLineSync()!;

  stdout.write("Autor: ");
  String autor = stdin.readLineSync()!;

  stdout.write("Número de páginas: ");
  int numPaginas = int.parse(stdin.readLineSync()!);

  stdout.write("Ano: ");
  int ano = int.parse(stdin.readLineSync()!);

  listaLivros.add(Livro(titulo, autor, numPaginas, ano));

  print("Livro cadastrado com sucesso.");
}

void listarLivros() {
  if (listaLivros.isEmpty) {
    print("Nenhum livro cadastrado.");
    return;
  }

  for (var livro in listaLivros) {
    livro.mostrarLivro();
  }
}

void atualizarLivro() {
  stdout.write("Digite o título do livro: ");
  String titulo = stdin.readLineSync()!;

  for (var livro in listaLivros) {
    if (livro.titulo == titulo) {
      stdout.write("Novo título: ");
      livro.titulo = stdin.readLineSync()!;

      stdout.write("Novo autor: ");
      livro.autor = stdin.readLineSync()!;

      stdout.write("Novo ano: ");
      livro.ano = int.parse(stdin.readLineSync()!);

      print("Livro atualizado com sucesso.");
      return;
    }
  }

  print("Livro não encontrado.");
}

void removerLivro() {
  stdout.write("Digite o título do livro: ");
  String titulo = stdin.readLineSync()!;

  listaLivros.removeWhere((livro) => livro.titulo == titulo);

  print("Livro removido com sucesso");
}