import 'package:dartz/dartz.dart';
import 'package:pokedex/data/datasource/pokemon_datasource.dart';
import 'package:pokedex/data/failure.dart';
import 'package:pokedex/data/model/pokemon_model.dart';
import 'package:pokedex/domain/entity/pokemon.dart';
import 'package:pokedex/domain/repository/get_pokemon_repository.dart';

class GetPokemonRepositoryImpl implements GetPokemonRepository {
  final PokemonDataSource dataSource;
  GetPokemonRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemon() async {
    // TODO: implement getPokemon
    try {
      List<PokemonModel> pokemon = await dataSource.fetchDataFromApi();
      return Right(pokemon.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
