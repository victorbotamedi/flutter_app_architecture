import 'package:clean_architecture/data/api/remote_data_source.dart';
import 'package:clean_architecture/data/data_source/local_data_source.dart';
import 'package:clean_architecture/data/pokemon_repository.dart';
import 'package:clean_architecture/domain/model/pokemon.dart';
import 'package:clean_architecture/domain/pokemon_service.dart';
import 'package:clean_architecture/view/store/pokemon_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => PokemonStore(
          PokemonService(
            PokemonRepositoryImpl(
              PokemonLocalDataSource(),
              PokemonRemoteDataSource(),
            ),
          ),
        ),
        builder: (context, child) {
          final store = context.watch<PokemonStore>();
          return ListView.separated(
            itemCount: store.pokemons.length,
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            itemBuilder: (context, index) => _ListItem(
              pokemon: store.pokemons.elementAt(index),
            ),
          );
        },
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final Pokemon pokemon;

  const _ListItem({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: pokemon.animatedSprite != null
              ? Image.network(
                  pokemon.animatedSprite!,
                  frameBuilder: (context, child, frame, _) => _imageFrame(
                    child: child,
                  ),
                  errorBuilder: (context, error, _) => Image.network(
                    pokemon.sprite!,
                    frameBuilder: (context, child, frame, _) => _imageFrame(
                      child: child,
                    ),
                  ),
                )
              : _imageFrame(),
        ),
        const SizedBox(
          width: 8,
        ),
        Text.rich(
          TextSpan(
            text: '#${pokemon.number}',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.deepOrangeAccent,
                ),
            children: [
              TextSpan(
                text: ' - ${pokemon.name}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _imageFrame({Widget? child}) => DecoratedBox(
        key: const ValueKey('imageFrame'),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: child,
      );
}
