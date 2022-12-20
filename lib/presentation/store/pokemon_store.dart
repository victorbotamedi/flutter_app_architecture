import 'dart:async';

import 'package:clean_architecture/domain/model/pokemon.dart';
import 'package:clean_architecture/domain/service/pokemon_service.dart';
import 'package:flutter/foundation.dart';

class PokemonStore extends ChangeNotifier {
  final PokemonService _service;
  StreamSubscription? _fetchSubscription;

  Iterable<Pokemon> pokemons = [];

  PokemonStore(this._service) {
    fetchList();
  }

  Future<void> fetchList() async {
    _fetchSubscription?.cancel();
    _fetchSubscription = _service.fetch().listen((items) {
      pokemons = items;
      notifyListeners();
    });
  }
}
