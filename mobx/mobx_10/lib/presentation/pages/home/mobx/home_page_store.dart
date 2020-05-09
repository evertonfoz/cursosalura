import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx10/domain/models/produto_model.dart';
import 'package:mobx10/presentation/pages/produtos_selecionados/mobx/produtos_selecionados_store.dart';

part 'home_page_store.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch

class HomePageStore = _HomePageStore with _$HomePageStore;

abstract class _HomePageStore with Store {
  final formatacaoMonetaria = NumberFormat.simpleCurrency();
  final ProdutosSelecionadosStore _produtosSelecionadosStore =
      GetIt.instance.get<ProdutosSelecionadosStore>();

  @observable
  int paginaAtual = 0;

  @observable
  double _totalPedido = 0;

  @observable
  bool orientacaoJaLida = false;

  @computed
  String get tituloHomePage =>
      (paginaAtual == 0) ? 'Produtos disponíveis' : 'Produtos selecionados';

  @computed
  String get totalPedido => formatacaoMonetaria.format(_totalPedido);

  @action
  alternarPagina({int novaPagina}) {
    paginaAtual = novaPagina;
  }

  @action
  registrarProduto({ProdutoModel produto, int quantidade}) {
    _totalPedido += (produto.valor * quantidade);
    _produtosSelecionadosStore.registrarProduto(
        produto: produto, quantidade: quantidade);
  }

  @action
  registrarLeituraOrientacao() {
    orientacaoJaLida = true;
  }
}
