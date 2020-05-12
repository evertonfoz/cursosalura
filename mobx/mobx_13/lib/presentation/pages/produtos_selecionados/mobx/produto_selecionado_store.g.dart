// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_selecionado_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoSelecionadoStore on _ProdutoSelecionadoStore, Store {
  final _$quantidadeAtom = Atom(name: '_ProdutoSelecionadoStore.quantidade');

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

  final _$_ProdutoSelecionadoStoreActionController =
      ActionController(name: '_ProdutoSelecionadoStore');

  @override
  dynamic adicionarQuantidade({int quantidadeParaAdicionar = 1}) {
    final _$actionInfo =
        _$_ProdutoSelecionadoStoreActionController.startAction();
    try {
      return super.adicionarQuantidade(
          quantidadeParaAdicionar: quantidadeParaAdicionar);
    } finally {
      _$_ProdutoSelecionadoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic retirarQuantidade() {
    final _$actionInfo =
        _$_ProdutoSelecionadoStoreActionController.startAction();
    try {
      return super.retirarQuantidade();
    } finally {
      _$_ProdutoSelecionadoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'quantidade: ${quantidade.toString()}';
    return '{$string}';
  }
}
