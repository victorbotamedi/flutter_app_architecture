import 'package:clean_architecture/data/api/config.dart';
import 'package:clean_architecture/domain/model/pokemon.dart';

class PokemonListResultDto extends Pokemon {
  const PokemonListResultDto(
    super.number,
    super.name, {
    super.sprite,
    super.animatedSprite,
  });

  factory PokemonListResultDto.fromJson(Map<String, dynamic> json) {
    final urlSegments = json["url"].split('/');
    final number = int.parse(urlSegments[urlSegments.length - 2]);
    return PokemonListResultDto(
      number,
      json["name"],
      sprite: PokeApiConfig.spriteUrl(number),
      animatedSprite: PokeApiConfig.animatedSpriteUrl(number),
    );
  }
}
