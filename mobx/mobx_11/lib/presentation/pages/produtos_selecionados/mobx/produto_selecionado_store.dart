import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx10/domain/models/produto_model.dart';
import 'package:mobx10/presentation/pages/home/mobx/home_page_store.dart';

part 'produto_selecionado_store.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch

class ProdutoSelecionadoStore = _ProdutoSelecionadoStore
    with _$ProdutoSelecionadoStore;

abstract class _ProdutoSelecionadoStore with Store {
  final formatacaoMonetaria = NumberFormat.simpleCurrency();
  final HomePageStore _homePageStore = GetIt.instance.get<HomePageStore>();

  _ProdutoSelecionadoStore({this.produtoModel, this.quantidade}) {
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
    _homePageStore.incrementarValorProdutoAdicionado(valor: produtoModel.valor);
  }

  @action
  retirarQuantidade() {
    quantidade--;
    _homePageStore.decrementarValorProdutoRetirado(valor: produtoModel.valor);
  }
}
