import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx10/domain/models/produto_model.dart';
import 'package:mobx10/presentation/pages/home/mobx/home_page_store.dart';
import 'package:mobx10/presentation/pages/produtos_selecionados/mobx/produtos_selecionados_store.dart';

part 'lista_de_produtos_page_store.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch

class ListaDeProdutosPageStore = _ListaDeProdutosPageStore
    with _$ListaDeProdutosPageStore;

abstract class _ListaDeProdutosPageStore with Store {
  @action
  registrarProduto({ProdutoModel produto, int quantidade}) {
    GetIt.I.get<HomePageStore>().somarAoTotalDoPedido(
        valor: produto.valor * quantidade,
        operacaoRealizada:
            'Item ${produto.nome.toUpperCase()} selecionado com a quantidade $quantidade');
    GetIt.I
        .get<ProdutosSelecionadosStore>()
        .registrarProduto(produto: produto, quantidade: quantidade);
  }
}
