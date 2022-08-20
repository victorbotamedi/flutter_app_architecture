import 'dart:collection';
import 'dart:convert';

import 'package:clean_architecture/data/api/config.dart';
import 'package:clean_architecture/data/api/dto/list_result_dto.dart';
import 'package:clean_architecture/data/api/dto/pokemon_list_result_dto.dart';
import 'package:clean_architecture/data/data_source/data_source.dart';
import 'package:clean_architecture/domain/model/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonRemoteDataSource implements PokemonDataSource {
  @override
  Future<Iterable<Pokemon>> fetch() async {
    final url = Uri.parse(
      '${PokeApiConfig.baseUrl}/pokemon/?offset=0&limit=2000',
    );
    final response = await http.read(url);

    final decoded = json.decode(response);
    final dto = ListResultDto.fromJson(decoded, PokemonListResultDto.fromJson);
    return UnmodifiableListView(dto.results);
  }
}
