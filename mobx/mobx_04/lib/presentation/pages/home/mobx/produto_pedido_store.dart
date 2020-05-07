import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx04/domain/models/produto_model.dart';
import 'package:mobx04/presentation/pages/home/mobx/home_page_store.dart';

part 'produto_pedido_store.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch

class ProdutoPedidoStore = _ProdutoPedidoStore with _$ProdutoPedidoStore;

abstract class _ProdutoPedidoStore with Store {
  final formatacaoMonetaria = NumberFormat.simpleCurrency();
  final HomePageStore homePageStore;

  _ProdutoPedidoStore(
      {this.produtoModel, this.quantidade, this.homePageStore}) {
    this.produtoModel = produtoModel;
    this.quantidade = quantidade;
  }
  @observable
  ProdutoModel produtoModel;

  @observable
  int quantidade;

  @action
  adicionarQuantidade() {
    quantidade++;
    homePageStore.incrementarValorProdutoAdicionado(valor: produtoModel.valor);
  }

  @action
  retirarQuantidade() {
    quantidade--;
    homePageStore.decrementarValorProdutoRetirado(valor: produtoModel.valor);
  }
}
