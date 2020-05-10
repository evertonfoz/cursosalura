import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'home_page_store.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch

class HomePageStore = _HomePageStore with _$HomePageStore;

abstract class _HomePageStore with Store {
  final formatacaoMonetaria = NumberFormat.simpleCurrency();

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
  somarAoTotalDoPedido({double valor}) {
    _totalPedido += valor;
  }

  @action
  registrarLeituraOrientacao() {
    orientacaoJaLida = true;
  }
}
