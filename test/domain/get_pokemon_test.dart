import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/domain/entity/pokemon.dart';
import 'package:pokedex/domain/usecases/get_pokemon.dart';

import '../helpers/mockito.mocks.dart';

Future<void> main() async {
  late MockPokemonRepository getPokemonRepository;
  late GetPokemon getPokemon;

  setUp(() {
    getPokemonRepository = MockPokemonRepository();
    getPokemon = GetPokemon(getPokemonRepository);
  });

  List<Pokemon> testPokemon = const [
    Pokemon(
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
  test('return Pokemon list upon getPokemons', () async {
    when(getPokemon.execute())
        .thenAnswer((realInvocation) async => Right(testPokemon));
    final result = await getPokemon.execute();
    expect(result, equals(Right(testPokemon)));
  });
}
