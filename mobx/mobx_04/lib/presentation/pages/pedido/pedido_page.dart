import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx04/presentation/pages/home/mobx/home_page_store.dart';

class PedidoPage extends StatelessWidget {
  final HomePageStore _homePageStore = GetIt.instance.get<HomePageStore>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: _homePageStore.produtosSelecionados.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.yellowAccent,
          );
        });
  }
}
