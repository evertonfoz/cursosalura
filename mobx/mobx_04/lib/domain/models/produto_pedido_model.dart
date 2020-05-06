import 'package:meta/meta.dart';
import 'package:mobx04/domain/models/produto_model.dart';

class ProdutoPedidoModel {
  final ProdutoModel produto;
  final int quantidade;
  final double valor;

  ProdutoPedidoModel({
    @required this.produto,
    @required this.quantidade,
    @required this.valor,
  });
}
