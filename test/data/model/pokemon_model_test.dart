import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/data/model/pokemon_model.dart';
import 'package:pokedex/domain/entity/pokemon.dart';

import '../../helpers/json_reader.dart';

void main() {
  PokemonModel pokemonModel = const PokemonModel(
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
      69);

  Pokemon pokemon = const Pokemon(
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
      69);
  late Map jsonData;
  setUp(() {
    jsonData = jsonDecode(readJson('./sample_pokemon_data.json'));
  });
  test('to entity returns Pokemon from PokemonModel', () {
    final result = pokemonModel.toEntity();
    expect(pokemon, equals(result));
  });

  test('toJson returns JSON form PokemonModel', () {
    final result = pokemonModel.toJson();
    expect(jsonData, equals(result));
  });

  test('fromJson returns PokemonModel', () {
    final result = pokemonModel.fromJson();
    expect(pokemonModel, result);
  });
}
