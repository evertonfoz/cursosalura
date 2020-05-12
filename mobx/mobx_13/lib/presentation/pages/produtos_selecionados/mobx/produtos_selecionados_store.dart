import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx13/domain/models/produto_model.dart';
import 'package:mobx13/presentation/pages/home/mobx/home_page_store.dart';
import 'package:mobx13/presentation/pages/produtos_selecionados/mobx/produto_selecionado_store.dart';

part 'produtos_selecionados_store.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch

class ProdutosSelecionadosStore = _ProdutosSelecionadosStore
    with _$ProdutosSelecionadosStore;

abstract class _ProdutosSelecionadosStore with Store {
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
      GetIt.I.get<HomePageStore>().somarAoTotalDoPedido(
          valor: produto.valor * quantidade,
          operacaoRealizada:
              'Item ${produto.nome.toUpperCase()} selecionado com a quantidade $quantidade');
    } else
      _produtosSelecionados[indexOfProduto]
          .adicionarQuantidade(quantidadeParaAdicionar: quantidade);
  }

  @action
  retirarProduto({ProdutoSelecionadoStore produtoSelecionadoStore}) {
    final HomePageStore _homePageStore = GetIt.instance.get<HomePageStore>();
    _produtosSelecionados.removeWhere((produto) =>
        produto.produtoModel.produtoId ==
        produtoSelecionadoStore.produtoModel.produtoId);

    _homePageStore.subtrairDoTotalDoPedido(
        valor: produtoSelecionadoStore.quantidade *
            produtoSelecionadoStore.produtoModel.valor,
        operacaoRealizada:
            'O produto ${produtoSelecionadoStore.produtoModel.nome.toUpperCase()} foi retirado do pedido.');
  }
}
