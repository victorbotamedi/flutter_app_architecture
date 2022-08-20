import 'dart:collection';

import 'package:clean_architecture/data/data_source/data_source.dart';
import 'package:clean_architecture/domain/model/pokemon.dart';

class PokemonLocalDataSource implements PokemonDataSource {
  @override
  Future<Iterable<Pokemon>> fetch() {
    return Future.value(UnmodifiableListView(_pokemons));
  }

  /// A List of all first generation Pokémon
  static const _pokemons = [
    Pokemon(1, "Bulbasaur"),
    Pokemon(2, "Ivysaur"),
    Pokemon(3, "Venusaur"),
    Pokemon(4, "Charmander"),
    Pokemon(5, "Charmeleon"),
    Pokemon(6, "Charizard"),
    Pokemon(7, "Squirtle"),
    Pokemon(8, "Wartortle"),
    Pokemon(9, "Blastoise"),
    Pokemon(10, "Caterpie"),
    Pokemon(11, "Metapod"),
    Pokemon(12, "Butterfree"),
    Pokemon(13, "Weedle"),
    Pokemon(14, "Kakuna"),
    Pokemon(15, "Beedrill"),
    Pokemon(16, "Pidgey"),
    Pokemon(17, "Pidgeotto"),
    Pokemon(18, "Pidgeot"),
    Pokemon(19, "Rattata"),
    Pokemon(20, "Raticate"),
    Pokemon(21, "Spearow"),
    Pokemon(22, "Fearow"),
    Pokemon(23, "Ekans"),
    Pokemon(24, "Arbok"),
    Pokemon(25, "Pikachu"),
    Pokemon(26, "Raichu"),
    Pokemon(27, "Sandshrew"),
    Pokemon(28, "Sandslash"),
    Pokemon(29, "Nidoran ♀"),
    Pokemon(30, "Nidorina"),
    Pokemon(31, "Nidoqueen"),
    Pokemon(32, "Nidoran ♂"),
    Pokemon(33, "Nidorino"),
    Pokemon(34, "Nidoking"),
    Pokemon(35, "Clefairy"),
    Pokemon(36, "Clefable"),
    Pokemon(37, "Vulpix"),
    Pokemon(38, "Ninetales"),
    Pokemon(39, "Jigglypuff"),
    Pokemon(40, "Wigglytuff"),
    Pokemon(41, "Zubat"),
    Pokemon(42, "Golbat"),
    Pokemon(43, "Oddish"),
    Pokemon(44, "Gloom"),
    Pokemon(45, "Vileplume"),
    Pokemon(46, "Paras"),
    Pokemon(47, "Parasect"),
    Pokemon(48, "Venonat"),
    Pokemon(49, "Venomoth"),
    Pokemon(50, "Diglett"),
    Pokemon(51, "Dugtrio"),
    Pokemon(52, "Meowth"),
    Pokemon(53, "Persian"),
    Pokemon(54, "Psyduck"),
    Pokemon(55, "Golduck"),
    Pokemon(56, "Mankey"),
    Pokemon(57, "Primeape"),
    Pokemon(58, "Growlithe"),
    Pokemon(59, "Arcanine"),
    Pokemon(60, "Poliwag"),
    Pokemon(61, "Poliwhirl"),
    Pokemon(62, "Poliwrath"),
    Pokemon(63, "Abra"),
    Pokemon(64, "Kadabra"),
    Pokemon(65, "Alakazam"),
    Pokemon(66, "Machop"),
    Pokemon(67, "Machoke"),
    Pokemon(68, "Machamp"),
    Pokemon(69, "Bellsprout"),
    Pokemon(70, "Weepinbell"),
    Pokemon(71, "Victreebel"),
    Pokemon(72, "Tentacool"),
    Pokemon(73, "Tentacruel"),
    Pokemon(74, "Geodude"),
    Pokemon(75, "Graveler"),
    Pokemon(76, "Golem"),
    Pokemon(77, "Ponyta"),
    Pokemon(78, "Rapidash"),
    Pokemon(79, "Slowpoke"),
    Pokemon(80, "Slowbro"),
    Pokemon(81, "Magnemite"),
    Pokemon(82, "Magneton"),
    Pokemon(83, "Farfetch'd"),
    Pokemon(84, "Doduo"),
    Pokemon(85, "Dodrio"),
    Pokemon(86, "Seel"),
    Pokemon(87, "Dewgong"),
    Pokemon(88, "Grimer"),
    Pokemon(89, "Muk"),
    Pokemon(90, "Shellder"),
    Pokemon(91, "Cloyster"),
    Pokemon(92, "Gastly"),
    Pokemon(93, "Haunter"),
    Pokemon(94, "Gengar"),
    Pokemon(95, "Onix"),
    Pokemon(96, "Drowzee"),
    Pokemon(97, "Hypno"),
    Pokemon(98, "Krabby"),
    Pokemon(99, "Kingler"),
    Pokemon(100, "Voltorb"),
    Pokemon(101, "Electrode"),
    Pokemon(102, "Exeggcute"),
    Pokemon(103, "Exeggutor"),
    Pokemon(104, "Cubone"),
    Pokemon(105, "Marowak"),
    Pokemon(106, "Hitmonlee"),
    Pokemon(107, "Hitmonchan"),
    Pokemon(108, "Lickitung"),
    Pokemon(109, "Koffing"),
    Pokemon(110, "Weezing"),
    Pokemon(111, "Rhyhorn"),
    Pokemon(112, "Rhydon"),
    Pokemon(113, "Chansey"),
    Pokemon(114, "Tangela"),
    Pokemon(115, "Kangaskhan"),
    Pokemon(116, "Horsea"),
    Pokemon(117, "Seadra"),
    Pokemon(118, "Goldeen"),
    Pokemon(119, "Seaking"),
    Pokemon(120, "Staryu"),
    Pokemon(121, "Starmie"),
    Pokemon(122, "Mr. Mime"),
    Pokemon(123, "Scyther"),
    Pokemon(124, "Jynx"),
    Pokemon(125, "Electabuzz"),
    Pokemon(126, "Magmar"),
    Pokemon(127, "Pinsir"),
    Pokemon(128, "Tauros"),
    Pokemon(129, "Magikarp"),
    Pokemon(130, "Gyarados"),
    Pokemon(131, "Lapras"),
    Pokemon(132, "Ditto"),
    Pokemon(133, "Eevee"),
    Pokemon(134, "Vaporeon"),
    Pokemon(135, "Jolteon"),
    Pokemon(136, "Flareon"),
    Pokemon(137, "Porygon"),
    Pokemon(138, "Omanyte"),
    Pokemon(139, "Omastar"),
    Pokemon(140, "Kabuto"),
    Pokemon(141, "Kabutops"),
    Pokemon(142, "Aerodactyl"),
    Pokemon(143, "Snorlax"),
    Pokemon(144, "Articuno"),
    Pokemon(145, "Zapdos"),
    Pokemon(146, "Moltres"),
    Pokemon(147, "Dratini"),
    Pokemon(148, "Dragonair"),
    Pokemon(149, "Dragonite"),
    Pokemon(150, "Mewtwo"),
    Pokemon(151, "Mew"),
  ];
}