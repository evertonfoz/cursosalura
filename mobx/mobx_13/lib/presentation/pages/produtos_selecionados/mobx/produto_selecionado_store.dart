import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx13/domain/models/produto_model.dart';
import 'package:mobx13/presentation/pages/home/mobx/home_page_store.dart';

part 'produto_selecionado_store.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch

class ProdutoSelecionadoStore = _ProdutoSelecionadoStore
    with _$ProdutoSelecionadoStore;

abstract class _ProdutoSelecionadoStore with Store {
  final HomePageStore _homePageStore = GetIt.instance.get<HomePageStore>();

  _ProdutoSelecionadoStore({this.produtoModel, this.quantidade}) {
    this.produtoModel = produtoModel;
    this.quantidade = quantidade;
  }

  ProdutoModel produtoModel;

  @observable
  int quantidade;

  @action
  adicionarQuantidade({int quantidadeParaAdicionar = 1}) {
    quantidade += quantidadeParaAdicionar;

    _homePageStore.somarAoTotalDoPedido(
        valor: produtoModel.valor * quantidadeParaAdicionar,
        operacaoRealizada:
            'Produto ${produtoModel.nome.toUpperCase()} atualizado para $quantidade');
  }

  @action
  retirarQuantidade() {
    quantidade--;
    _homePageStore.subtrairDoTotalDoPedido(
        valor: produtoModel.valor,
        operacaoRealizada:
            'Produto ${produtoModel.nome.toUpperCase()} atualizado para $quantidade');
  }
}
