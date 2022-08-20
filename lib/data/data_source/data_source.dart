import 'package:clean_architecture/domain/model/pokemon.dart';

abstract class PokemonDataSource {
  Future<Iterable<Pokemon>> fetch();
}
