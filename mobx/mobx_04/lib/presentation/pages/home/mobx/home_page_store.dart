import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx04/domain/models/produto_model.dart';

part 'home_page_store.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch

class HomePageStore = _HomePageStore with _$HomePageStore;

abstract class _HomePageStore with Store {
  final formatacaoMonetaria = NumberFormat.simpleCurrency();

  @observable
  double _totalPedido = 0;

  @observable
  int paginaAtual = 0;

  @observable
  ObservableList<ProdutoModel> produtosSelecionados =
      ObservableList<ProdutoModel>();

  @computed
  String get totalPedido => formatacaoMonetaria.format(_totalPedido);

  @computed
  String get tituloHomePage =>
      (paginaAtual == 0) ? 'Produtos' : 'Produtos selecionados';

  @action
  registrarProduto({double valorProduto}) {
    _totalPedido += valorProduto;
  }

  @action
  alternarPagina({int novaPagina}) {
    paginaAtual = novaPagina;
  }
}
