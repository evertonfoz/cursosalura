// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_de_produtos_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaDeProdutosPageStore on _ListaDeProdutosPageStore, Store {
  final _$_ListaDeProdutosPageStoreActionController =
      ActionController(name: '_ListaDeProdutosPageStore');

  @override
  dynamic registrarProduto({ProdutoModel produto, int quantidade}) {
    final _$actionInfo =
        _$_ListaDeProdutosPageStoreActionController.startAction();
    try {
      return super.registrarProduto(produto: produto, quantidade: quantidade);
    } finally {
      _$_ListaDeProdutosPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = '';
    return '{$string}';
  }
}
