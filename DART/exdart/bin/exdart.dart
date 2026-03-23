import 'package:exdart/exdart.dart' as exdart;

void main() {
  exemploAbstracao();


}

void exemplosTipos(){
  print('Hello world!');
  int quantidadeProdutos = 10;
  double precoProduto = 10.99;
  String nomeProduto = "Teclado";
  bool emEstoque = true;

  var categoriaProduto = "Informática";

  print('int: $quantidadeProdutos');
  print('double: $precoProduto');
  print('String: $nomeProduto');
  print('bool: $emEstoque');
  print('var: $categoriaProduto');

}

void exemplosDecisao(){
  double valorPedido = 150.0;
  
  if(valorPedido > 99.99){
    print("Pedido com frete grátis");
  }else{
    print("Pedido com frete pago");
  }

  switch(valorPedido){
    case 0:
      print("Pedido vazio");
      break;

    case < 100:
      print("Pedido com frete pago");
      break;

    default:
      print("Pedido com frete grátis");

  }
}

void exemplosRepeticao(){
  /*for(int i = 0; i < 5; i++){
    print("Contagem: $i");
  }

  int contador = 0;
  while(contador < 5){
    print("Contagem: $contador");
    contador++;
  }*/

  List<String> produtos = ["PS5", "XBOX", "Nintendo"];
  for(var produto in produtos){
    if(produto == "XBOX"){
      print("Melhor console");
      break;
    }else{
      print("Console: $produto");
    }
    
  }
}

void exemploMap(){
  Map<String, double> precos = {
    "PS5: ": 4999.99,
    "XBOX: ": 5299.99,
    "Nintendo: ": 4399.99 
  };

  precos['PS5'] = 4799.99;
  print("Preço atualizado: ${precos['PS5']}");
}

class Produto{
  String nome;
  double preco;
  String categoria;

  Produto(this.nome, this.preco, this.categoria);

  void exibirProduto(){
    print("Produto: ${this.nome}, Preço: ${this.preco}, Categoria: ${this.categoria}");
  }
}

class VideoGame extends Produto{
  String marca;
  VideoGame(String nome, double preco, String categoria, this.marca){
    super(nome, preco, categoria);
    this.marca = marca;
  }
}

void exemploClasse(){
  Produto p1 = Produto("PS5", 5000.00, "Video game");
  p1.exibirProduto();

  print("Herança\n");
  VideoGame ps5 = VideoGame("PS5", 5000.00, "VideoGame", "Sony");
  ps5.exibirProduto();
}

abstract class Documento(){
  void validarDocumeto();

}

class Cpf{
  @override
  void validarDocumeto(){
    print("CPF válido");
  }
}

void exemploAbstracao(){
  print("Abstração em Dart\n");
  Cpf cpf = Cpf();
  cpf.validarDocumeto();
}

mixin LogOperacao{
  void log(String mensagem){
    print("Log: $mensagem");
  }
}

class ServcoPedido with LogOperacao{
  void processarPedido(){
    log("Processando pedido...");
    log("Pedido processado...");
  }
}

void exemploMixin(){
  print("Mixin em Dart\n");
  ServcoPedido servico = ServcoPedido();
  servico.processarPedido();
}

void sacar(double valor, double saldoAtual){
  if(valor > saldoAtual){
    throw Exception("Saldo insuficiente");
  }
  print("Saquel realizado");
}

void exemploException(){
  print("Tratamento de exceção em Dart\n");
  double saldo = 100.00;
  double valorSaque = 150.00;

  try{
    sacar(valorSaque, saldo);
  }catch (e){
    print("Erro ao sacar: $e");
  }finally{
    
  }
}

void exemploNullSafety(){
  print("Null Safety em Dart\n");
  String? nomeProduto = null;

  if(nomeProduto != null){
    print("Nome do produto: $nomeProduto");
  }else{
    print("Nome do produto não disponivel");
  }
}