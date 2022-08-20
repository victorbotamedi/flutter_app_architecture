abstract class PokeApiConfig {
  static const baseUrl = 'https://pokeapi.co/api/v2';
  static const _assetBaseUrl =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon';
  static const _animatedAssetUrl =
      '$_assetBaseUrl/versions/generation-v/black-white/animated';

  static String spriteUrl(int number) => '$_assetBaseUrl/$number.png';

  static String animatedSpriteUrl(int number) =>
      '$_animatedAssetUrl/$number.gif';
}
