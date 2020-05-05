import 'package:meta/meta.dart';

class ProdutoModel {
  final int produtoId;
  final String nome;
  final String descricao;
  final double valor;

  ProdutoModel({
    @required this.produtoId,
    @required this.nome,
    @required this.descricao,
    @required this.valor,
  });
}
