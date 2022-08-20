import 'package:clean_architecture/domain/model/pokemon.dart';

abstract class PokemonRepository {
  Stream<Iterable<Pokemon>> fetch();
}
