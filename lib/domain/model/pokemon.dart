import 'package:meta/meta.dart';

@immutable
class Pokemon {
  final String name;
  final int number;

  final String? sprite;
  final String? animatedSprite;

  const Pokemon(
    this.number,
    this.name, {
    this.sprite,
    this.animatedSprite,
  });

  @override
  String toString() => 'Pokemon(#$number - $name)';

  @override
  bool operator ==(covariant Pokemon other) {
    if (identical(this, other)) return true;
    return other.name == name &&
        other.number == number &&
        other.sprite == sprite &&
        other.animatedSprite == animatedSprite;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        number.hashCode ^
        sprite.hashCode ^
        animatedSprite.hashCode;
  }
}
