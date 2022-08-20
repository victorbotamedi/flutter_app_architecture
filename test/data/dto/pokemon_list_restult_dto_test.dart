import 'dart:convert';

import 'package:clean_architecture/data/api/config.dart';
import 'package:clean_architecture/data/api/dto/pokemon_list_result_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const apiModelJson =
      '{"name":"bulbasaur","url":"https://pokeapi.co/api/v2/pokemon/1/"}';

  group('PokemonListResultDto', () {
    test('Deserialize json', () {
      final json = jsonDecode(apiModelJson);
      expect(
        PokemonListResultDto.fromJson(json),
        PokemonListResultDto(
          1,
          'bulbasaur',
          sprite: PokeApiConfig.spriteUrl(1),
          animatedSprite: PokeApiConfig.animatedSpriteUrl(1),
        ),
      );
    });
  });
}
