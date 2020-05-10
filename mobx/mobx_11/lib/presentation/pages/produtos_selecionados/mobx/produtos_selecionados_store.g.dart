// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos_selecionados_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutosSelecionadosStore on _ProdutosSelecionadosStore, Store {
  Computed<ObservableList<ProdutoSelecionadoStore>>
      _$produtosSelecionadosComputed;

  @override
  ObservableList<ProdutoSelecionadoStore> get produtosSelecionados =>
      (_$produtosSelecionadosComputed ??=
              Computed<ObservableList<ProdutoSelecionadoStore>>(
                  () => super.produtosSelecionados))
          .value;

  final _$produtoModelAtom =
      Atom(name: '_ProdutosSelecionadosStore.produtoModel');

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

  final _$quantidadeAtom = Atom(name: '_ProdutosSelecionadosStore.quantidade');

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
  dynamic adicionarQuantidade() {
    final _$actionInfo =
        _$_ProdutosSelecionadosStoreActionController.startAction();
    try {
      return super.adicionarQuantidade();
    } finally {
      _$_ProdutosSelecionadosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'produtoModel: ${produtoModel.toString()},quantidade: ${quantidade.toString()},produtosSelecionados: ${produtosSelecionados.toString()}';
    return '{$string}';
  }
}
