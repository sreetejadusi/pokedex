import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/entity/pokemon.dart';

class PokemonModel extends Equatable {
  final String name;
  final int id;
  final int height;
  final String cover;
  final Map stats;
  final List types;
  final int weight;

  const PokemonModel(
    this.name,
    this.id,
    this.height,
    this.cover,
    this.stats,
    this.types,
    this.weight,
  );

  @override
  List<Object?> get props => [name, id, height, cover, stats, types, weight];

  Pokemon toEntity() {
    return Pokemon(name, id, height, cover, stats, types, weight);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'height': height,
      'cover': cover,
      'stats': stats,
      'types': types,
      'weight': weight
    };
  }

  PokemonModel fromJson() {
    return PokemonModel(
      name,
      id,
      height,
      cover,
      stats,
      types,
      weight,
    );
  }
}
