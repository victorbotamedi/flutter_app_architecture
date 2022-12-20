import 'package:clean_architecture/data/api/remote_data_source.dart';
import 'package:clean_architecture/data/data_source/local_data_source.dart';
import 'package:clean_architecture/data/pokemon_repository.dart';
import 'package:clean_architecture/domain/bloc/pokemon_bloc.dart';
import 'package:clean_architecture/domain/pokemon_repository.dart';
import 'package:clean_architecture/presentation/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<PokemonRepository>(
      create: (context) => PokemonRepositoryImpl(
        PokemonLocalDataSource(),
        PokemonRemoteDataSource(),
      ),
      child: BlocProvider(
        create: (context) => PokemonListBloc(
          context.read<PokemonRepository>(),
        )..add(PokemonListRefreshed()),
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
      ),
    );
  }
}
