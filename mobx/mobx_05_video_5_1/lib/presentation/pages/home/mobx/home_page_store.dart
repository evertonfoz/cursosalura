import 'package:mobx/mobx.dart';

part 'home_page_store.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch

class HomePageStore = _HomePageStore with _$HomePageStore;

abstract class _HomePageStore with Store {
  @observable
  int paginaAtual = 0;

  @observable
  double _totalPedido = 0;

  // Código a ser implementado na classe _HomePageStore
  @observable
  bool orientacaoJaLida = false;

  @computed
  double get totalPedido => _totalPedido;

  @computed
  String get tituloHomePage =>
      (paginaAtual == 0) ? 'Produtos disponíveis' : 'Produtos selecionados';

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
