import 'package:dartz/dartz.dart';
import 'package:pokedex/data/failure.dart';
import 'package:pokedex/domain/entity/pokemon.dart';

abstract class GetPokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemon();
}
