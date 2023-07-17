import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/data/failure.dart';
import 'package:pokedex/data/model/pokemon_model.dart';
import 'package:pokedex/data/repository/get_pokemon_repository_impl.dart';
import 'package:pokedex/domain/entity/pokemon.dart';
import '../../helpers/mockito.mocks.dart';

void main() {
  late MockPokemonDataSource mockPokemonDataSource;
  late GetPokemonRepositoryImpl pokemonRepositoryImpl;

  setUp(() {
    mockPokemonDataSource = MockPokemonDataSource();
    pokemonRepositoryImpl = GetPokemonRepositoryImpl(mockPokemonDataSource);
  });
  List<Pokemon> pokemon = [
    const Pokemon(
        "bulbasaur",
        1,
        7,
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
        {
          "hp": 45,
          "attack": 49,
          "defense": 49,
          "special-attack": 65,
          "special-defense": 65,
          "speed": 45
        },
        ["grass", "poison"],
        69)
  ];
  List<PokemonModel> pokemonModel = [
    const PokemonModel(
        "bulbasaur",
        1,
        7,
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
        {
          "hp": 45,
          "attack": 49,
          "defense": 49,
          "special-attack": 65,
          "special-defense": 65,
          "speed": 45
        },
        ["grass", "poison"],
        69)
  ];
  test('when success, return Pokemon', () async {
    when(mockPokemonDataSource.fetchDataFromApi())
        .thenAnswer((realInvocation) async => pokemonModel);
    final result = await pokemonRepositoryImpl.getPokemon();
    verify(mockPokemonDataSource.fetchDataFromApi());
    expect(result, equals(Right(pokemon)));
  });

  test('when failure, return failure', () async {
    when(mockPokemonDataSource.fetchDataFromApi()).thenThrow(ServerFailure());
    final result = await pokemonRepositoryImpl.getPokemon();
    verify(mockPokemonDataSource.fetchDataFromApi());
    expect(result, equals(Left(ServerFailure())));
  });
}
