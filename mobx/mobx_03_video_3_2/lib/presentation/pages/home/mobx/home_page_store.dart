import 'package:mobx/mobx.dart';

part 'home_page_store.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch

class HomePageStore = _HomePageStore with _$HomePageStore;

abstract class _HomePageStore with Store {
  @observable
  int paginaAtual = 0;

  @computed
  String get tituloHomePage =>
      (paginaAtual == 0) ? 'Produtos disponíveis' : 'Produtos selecionados';

  @action
  alternarPagina({int novaPagina}) {
    paginaAtual = novaPagina;
  }
}
