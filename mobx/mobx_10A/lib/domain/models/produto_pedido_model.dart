import 'package:meta/meta.dart';
import 'package:mobx09/domain/models/produto_model.dart';

class ProdutoPedidoModel {
  final ProdutoModel produtoModel;
  final int quantidade;

  ProdutoPedidoModel({
    @required this.produtoModel,
    @required this.quantidade,
  });
}
