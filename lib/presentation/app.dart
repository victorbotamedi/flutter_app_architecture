import 'package:clean_architecture/data/api/remote_data_source.dart';
import 'package:clean_architecture/data/data_source/local_data_source.dart';
import 'package:clean_architecture/data/pokemon_repository.dart';
import 'package:clean_architecture/domain/service/pokemon_service.dart';
import 'package:clean_architecture/presentation/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PokemonService>(
          create: (_) => PokemonService(
            PokemonRepositoryImpl(
              PokemonLocalDataSource(),
              PokemonRemoteDataSource(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.red,
          appBarTheme: const AppBarTheme(
            color: Colors.red,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
