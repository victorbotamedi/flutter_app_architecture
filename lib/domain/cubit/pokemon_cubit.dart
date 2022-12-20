import 'package:clean_architecture/domain/model/pokemon.dart';
import 'package:clean_architecture/domain/pokemon_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Pokemon list states.
abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object?> get props => [];
}

class PokemonLoadingState extends PokemonState {}

class PokemonListLoadedState extends PokemonState {
  final Iterable<Pokemon> pokemons;

  const PokemonListLoadedState(this.pokemons);

  @override
  List<Object?> get props => [pokemons];
}

class PokemonListCubit extends Cubit<PokemonState> {
  final PokemonRepository _repository;

  PokemonListCubit(this._repository) : super(PokemonLoadingState());

  void refreshList() {
    _repository.fetch().forEach((pokemons) {
      emit(PokemonListLoadedState(pokemons));
    });
  }
}
