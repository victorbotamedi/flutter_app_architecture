import 'package:clean_architecture/domain/model/pokemon.dart';
import 'package:clean_architecture/domain/pokemon_repository.dart';

class PokemonService {
  final PokemonRepository _repository;

  const PokemonService(this._repository);

  Stream<Iterable<Pokemon>> fetch() => _repository.fetch();
}
