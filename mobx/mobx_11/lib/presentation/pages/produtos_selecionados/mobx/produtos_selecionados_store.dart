import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx11/domain/models/produto_model.dart';
import 'package:mobx11/presentation/pages/home/mobx/home_page_store.dart';
import 'package:mobx11/presentation/pages/produtos_selecionados/mobx/produto_selecionado_store.dart';

part 'produtos_selecionados_store.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch

class ProdutosSelecionadosStore = _ProdutosSelecionadosStore
    with _$ProdutosSelecionadosStore;

abstract class _ProdutosSelecionadosStore with Store {
  final formatacaoMonetaria = NumberFormat.simpleCurrency();

  @observable
  ProdutoModel produtoModel;

  @observable
  int quantidade;

  ObservableList<ProdutoSelecionadoStore> _produtosSelecionados =
      ObservableList<ProdutoSelecionadoStore>();

  @computed
  ObservableList<ProdutoSelecionadoStore> get produtosSelecionados {
    _produtosSelecionados.sort((a, b) => a.produtoModel.nome
        .toLowerCase()
        .compareTo(b.produtoModel.nome.toLowerCase()));
    return _produtosSelecionados;
  }

  @action
  registrarProduto({ProdutoModel produto, int quantidade}) {
    int indexOfProduto = _produtosSelecionados.indexWhere(
        (element) => element.produtoModel.produtoId == produto.produtoId);
    if (indexOfProduto < 0) {
      _produtosSelecionados.add(
        ProdutoSelecionadoStore(produtoModel: produto, quantidade: quantidade),
      );
      final HomePageStore _homePageStore = GetIt.instance.get<HomePageStore>();
      _homePageStore.incrementarValorProdutoAdicionado(
          valor: produto.valor * quantidade);
    } else
      _produtosSelecionados[indexOfProduto]
          .adicionarQuantidade(novaQuantidade: quantidade);
  }

  @action
  retirarProduto({ProdutoSelecionadoStore produtoSelecionadoStore}) {
    final HomePageStore _homePageStore = GetIt.instance.get<HomePageStore>();

    _homePageStore.decrementarValorProdutoRetirado(
        valor: produtoSelecionadoStore.quantidade *
            produtoSelecionadoStore.produtoModel.valor);
    _produtosSelecionados.removeWhere((produto) =>
        produto.produtoModel.produtoId ==
        produtoSelecionadoStore.produtoModel.produtoId);
  }
}
