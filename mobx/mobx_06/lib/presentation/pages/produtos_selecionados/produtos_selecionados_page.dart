import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx06/presentation/pages/home/mobx/home_page_store.dart';

class ProdutosSelecionadosPage extends StatelessWidget {
  final HomePageStore _homePageStore = GetIt.instance.get<HomePageStore>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Produtos selecionados'),
    );
  }
}
