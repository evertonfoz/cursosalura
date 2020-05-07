import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx04/domain/models/produto_model.dart';
import 'package:mobx04/presentation/pages/home/mobx/produto_pedido_store.dart';

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

//  @observable
  ObservableList<ProdutoPedidoStore> _produtosSelecionados =
      ObservableList<ProdutoPedidoStore>();

  @computed
  String get totalPedido => formatacaoMonetaria.format(_totalPedido);

  @computed
  String get tituloHomePage =>
      (paginaAtual == 0) ? 'Produtos' : 'Produtos selecionados';

  @computed
  ObservableList<ProdutoPedidoStore> get produtosSelecionados {
    _produtosSelecionados.sort((a, b) => a.produtoModel.nome
        .toLowerCase()
        .compareTo(b.produtoModel.nome.toLowerCase()));
    return _produtosSelecionados;
  }

  @action
  registrarProduto({ProdutoModel produto, int quantidade}) {
    _produtosSelecionados.add(
      ProdutoPedidoStore(
          produtoModel: produto, quantidade: quantidade, homePageStore: this),
    );
    _totalPedido += (produto.valor * quantidade);
  }

  @action
  alternarPagina({int novaPagina}) {
    paginaAtual = novaPagina;
  }

  @action
  incrementarValorProdutoAdicionado({double valor}) {
    _totalPedido += valor;
  }

  @action
  decrementarValorProdutoRetirado({double valor}) {
    _totalPedido -= valor;
  }

  @action
  retirarProdutoDoPedido({ProdutoPedidoStore produtoPedidoStore}) {
    _totalPedido -=
        produtoPedidoStore.quantidade * produtoPedidoStore.produtoModel.valor;
    _produtosSelecionados.removeWhere((produto) =>
        produto.produtoModel.produtoId ==
        produtoPedidoStore.produtoModel.produtoId);
  }
}
