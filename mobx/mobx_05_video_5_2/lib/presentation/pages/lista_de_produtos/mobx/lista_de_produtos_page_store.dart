import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx05video52/domain/models/produto_model.dart';
import 'package:mobx05video52/presentation/pages/home/mobx/home_page_store.dart';

part 'lista_de_produtos_page_store.g.dart';

class ListaDeProdutosPageStore = _ListaDeProdutosPageStore
    with _$ListaDeProdutosPageStore;

abstract class _ListaDeProdutosPageStore with Store {
  // Adaptação da action registrarProduto para invocar o método somarAoTotalDoPedido(), de HomePageStore, a seleção do usuário
  @action
  registrarProduto({ProdutoModel produto, int quantidade}) {
    GetIt.I
        .get<HomePageStore>()
        .somarAoTotalDoPedido(valor: produto.valor * quantidade);
  }
}
