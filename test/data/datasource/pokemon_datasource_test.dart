import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/data/model/pokemon_model.dart';

import '../../helpers/mockito.mocks.dart';

void main() {
  late MockPokemonDataSource mockPokemonDataSource;

  setUp(() {
    mockPokemonDataSource = MockPokemonDataSource();
  });
  List<PokemonModel> pokemonModel = const [
    PokemonModel(
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

  test('return PokemonModel when datasource is called', () async {
    when(mockPokemonDataSource.fetchDataFromApi())
        .thenAnswer((realInvocation) async => pokemonModel);
    final result = await mockPokemonDataSource.fetchDataFromApi();
    expect(pokemonModel, result);
  });
}
