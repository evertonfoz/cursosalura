import 'package:meta/meta.dart';

class ProdutoModel {
  final int produtoId;
  final String nome;
  final String descricao;
  final double valor;
  final String urlImagem;

  ProdutoModel(
      {@required this.produtoId,
      @required this.nome,
      @required this.descricao,
      @required this.valor,
      this.urlImagem = 'assets/images/produtos/cardapio.jpg'});
}
