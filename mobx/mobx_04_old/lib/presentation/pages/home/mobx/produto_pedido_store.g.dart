// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_pedido_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoPedidoStore on _ProdutoPedidoStore, Store {
  final _$produtoModelAtom = Atom(name: '_ProdutoPedidoStore.produtoModel');

  @override
  ProdutoModel get produtoModel {
    _$produtoModelAtom.context.enforceReadPolicy(_$produtoModelAtom);
    _$produtoModelAtom.reportObserved();
    return super.produtoModel;
  }

  @override
  set produtoModel(ProdutoModel value) {
    _$produtoModelAtom.context.conditionallyRunInAction(() {
      super.produtoModel = value;
      _$produtoModelAtom.reportChanged();
    }, _$produtoModelAtom, name: '${_$produtoModelAtom.name}_set');
  }

  final _$quantidadeAtom = Atom(name: '_ProdutoPedidoStore.quantidade');

  @override
  int get quantidade {
    _$quantidadeAtom.context.enforceReadPolicy(_$quantidadeAtom);
    _$quantidadeAtom.reportObserved();
    return super.quantidade;
  }

  @override
  set quantidade(int value) {
    _$quantidadeAtom.context.conditionallyRunInAction(() {
      super.quantidade = value;
      _$quantidadeAtom.reportChanged();
    }, _$quantidadeAtom, name: '${_$quantidadeAtom.name}_set');
  }

  final _$_ProdutoPedidoStoreActionController =
      ActionController(name: '_ProdutoPedidoStore');

  @override
  dynamic adicionarQuantidade() {
    final _$actionInfo = _$_ProdutoPedidoStoreActionController.startAction();
    try {
      return super.adicionarQuantidade();
    } finally {
      _$_ProdutoPedidoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic retirarQuantidade() {
    final _$actionInfo = _$_ProdutoPedidoStoreActionController.startAction();
    try {
      return super.retirarQuantidade();
    } finally {
      _$_ProdutoPedidoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'produtoModel: ${produtoModel.toString()},quantidade: ${quantidade.toString()}';
    return '{$string}';
  }
}
