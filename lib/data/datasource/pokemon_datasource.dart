import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:pokedex/data/failure.dart';
import 'package:pokedex/data/model/pokemon_model.dart';

abstract class PokemonDataSource {
  Future<List<PokemonModel>> fetchDataFromApi();
}

class PokemonDataSourceImpl implements PokemonDataSource {
  @override
  Future<List<PokemonModel>> fetchDataFromApi() async {
    Response response =
        await get(Uri.parse('https://pokeapi.co/api/v2/pokemon/bulbasaur/'));
    if (response.statusCode == 200) {
      final pokemonDataList = json.decode(response.body);
      List<PokemonModel> pokemonsList = [];
      for (var pokemon in pokemonDataList['results']) {
        try {
          Response pokemonResponse = await get(Uri.parse(pokemon['url']));
          Map data = jsonDecode(pokemonResponse.body);
          if (pokemonResponse.statusCode == 200) {
            pokemonsList.add(PokemonModel(
                data['name'],
                data['id'],
                data['height'],
                data['sprites']['other']['official-artwork']['front-default'],
                (data['stats'] as Map<String, dynamic>).map((key, value) =>
                    MapEntry(value['stat']['name'], value['base_stat'])),
                (data['types'] as List<Map>)
                    .map((e) => e['type']['name'])
                    .toList(),
                data['weight']));
          }
        } catch (e) {}
      }
      return pokemonsList;
    } else {
      throw ServerFailure();
    }
  }
}
