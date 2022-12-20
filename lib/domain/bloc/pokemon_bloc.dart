import 'package:clean_architecture/domain/model/pokemon.dart';
import 'package:clean_architecture/domain/pokemon_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Pokemon list events.
abstract class PokemonListEvent {}

class PokemonListRefreshed extends PokemonListEvent {}

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

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonState> {
  final PokemonRepository _repository;

  PokemonListBloc(this._repository) : super(PokemonLoadingState()) {
    on<PokemonListRefreshed>((event, emit) async {
      await emit.forEach(_repository.fetch(),
          onData: (Iterable<Pokemon> pokemons) {
        return PokemonListLoadedState(pokemons);
      });
    });
  }
}
