import 'dart:core';

import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final String name;
  final int id;
  final int height;
  final String cover;
  final Map stats;
  final List types;
  final int weight;

  const Pokemon(this.name, this.id, this.height, this.cover, this.stats,
      this.types, this.weight);

  @override
  // TODO: implement props
  List<Object?> get props => [name, id, height, cover, stats, types, weight];
}
