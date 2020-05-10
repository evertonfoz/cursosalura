import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx09/domain/models/produto_model.dart';
import 'package:mobx09/domain/models/produto_pedido_model.dart';

part 'produtos_selecionados_store.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch

class ProdutosSelecionadosStore = _ProdutosSelecionadosStore
    with _$ProdutosSelecionadosStore;

abstract class _ProdutosSelecionadosStore with Store {
  final formatacaoMonetaria = NumberFormat.simpleCurrency();

  ObservableList<ProdutoPedidoModel> _produtosSelecionados =
      ObservableList<ProdutoPedidoModel>();

  @computed
  ObservableList<ProdutoPedidoModel> get produtosSelecionados {
    _produtosSelecionados.sort((a, b) => a.produtoModel.nome
        .toLowerCase()
        .compareTo(b.produtoModel.nome.toLowerCase()));
    return _produtosSelecionados;
  }

  @action
  registrarProduto({ProdutoModel produto, int quantidade}) {
    _produtosSelecionados.add(
      ProdutoPedidoModel(produtoModel: produto, quantidade: quantidade),
    );
  }
}
