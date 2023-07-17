import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/data/datasource/pokemon_datasource.dart';
import 'package:pokedex/domain/repository/get_pokemon_repository.dart';

@GenerateMocks(
  [GetPokemonRepository, PokemonDataSource],
  customMocks: [
    MockSpec<GetPokemonRepository>(as: #MockPokemonRepository),
    MockSpec<PokemonDataSource>(as: #MockPokemonDatasource),
  ],
)
void main() {}
