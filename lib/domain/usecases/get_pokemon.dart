import 'package:dartz/dartz.dart';
import 'package:pokedex/data/failure.dart';
import 'package:pokedex/domain/entity/pokemon.dart';
import 'package:pokedex/domain/repository/get_pokemon_repository.dart';

class GetPokemon {
  GetPokemonRepository repository;
  GetPokemon(this.repository);

  Future<Either<Failure, List<Pokemon>>> execute() async {
    return await repository.getPokemon();
  }
}
