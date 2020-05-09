// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos_selecionados_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutosSelecionadosStore on _ProdutosSelecionadosStore, Store {
  Computed<ObservableList<ProdutoPedidoModel>> _$produtosSelecionadosComputed;

  @override
  ObservableList<ProdutoPedidoModel> get produtosSelecionados =>
      (_$produtosSelecionadosComputed ??=
              Computed<ObservableList<ProdutoPedidoModel>>(
                  () => super.produtosSelecionados))
          .value;

  final _$_ProdutosSelecionadosStoreActionController =
      ActionController(name: '_ProdutosSelecionadosStore');

  @override
  dynamic registrarProduto({ProdutoModel produto, int quantidade}) {
    final _$actionInfo =
        _$_ProdutosSelecionadosStoreActionController.startAction();
    try {
      return super.registrarProduto(produto: produto, quantidade: quantidade);
    } finally {
      _$_ProdutosSelecionadosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'produtosSelecionados: ${produtosSelecionados.toString()}';
    return '{$string}';
  }
}
