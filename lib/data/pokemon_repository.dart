import 'package:clean_architecture/data/data_source/data_source.dart';
import 'package:clean_architecture/domain/model/pokemon.dart';
import 'package:clean_architecture/domain/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDataSource _localDataSource;
  final PokemonDataSource _remoteDataSource;

  const PokemonRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Stream<Iterable<Pokemon>> fetch() async* {
    yield await _localDataSource.fetch();
    yield await _remoteDataSource.fetch();
  }
}
