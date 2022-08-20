import 'dart:convert';

import 'package:clean_architecture/data/api/config.dart';
import 'package:clean_architecture/data/api/dto/list_result_dto.dart';
import 'package:clean_architecture/data/api/dto/pokemon_list_result_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const pokemonResultJson =
      '{"count":1154,"next":"https://pokeapi.co/api/v2/pokemon/?offset=2&limit=2","previous":null,"results":[{"name":"bulbasaur","url":"https://pokeapi.co/api/v2/pokemon/1/"},{"name":"ivysaur","url":"https://pokeapi.co/api/v2/pokemon/2/"}]}';

  group('ListResultDto', () {
    test('Deserialize Pokemon result', () {
      final json = jsonDecode(pokemonResultJson);
      final expectedResults = [
        PokemonListResultDto(
          1,
          'bulbasaur',
          sprite: PokeApiConfig.spriteUrl(1),
          animatedSprite: PokeApiConfig.animatedSpriteUrl(1),
        ),
        PokemonListResultDto(
          2,
          'ivysaur',
          sprite: PokeApiConfig.spriteUrl(2),
          animatedSprite: PokeApiConfig.animatedSpriteUrl(2),
        ),
      ];

      final actual =
          ListResultDto.fromJson(json, PokemonListResultDto.fromJson);
      expect(actual.count, 1154);
      expect(actual.results, expectedResults);
    });
  });
}
