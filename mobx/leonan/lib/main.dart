import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leonan/apphelpers/app_router.dart';
import 'package:leonan/drawer/blocs/drawer_bloc.dart';
import 'package:leonan/routes/splash_screen_route.dart';

import 'routes/palavras/crud/palavras_crud_bloc.dart';

void main() => runApp(MultiBlocProvider(
      providers: [
        BlocProvider<DrawerOpenStateBloc>(
          create: (BuildContext context) => DrawerOpenStateBloc(),
        ),
        BlocProvider<PalavrasCrudFormBloc>(
          create: (BuildContext context) => PalavrasCrudFormBloc(),
        ),
      ],
      child: ForcaApp(),
    ));

class ForcaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Forca da UTFPR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.green,
      ),
      home: ForcaHomePage(),
    );
  }
}

class ForcaHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenRoute(),
    );
  }
}
