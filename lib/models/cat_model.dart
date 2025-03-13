import 'package:flutter/widgets.dart';

@immutable
class CatModel {
  final String imageUrl;
  final String? name;
  final String? origin;
  final String? description;
  final String? temperament;
  final String? lifeSpan;
  final String? wikipediaUrl;
  final String? indoor;

  const CatModel({
    required this.imageUrl,
    this.name,
    this.origin,
    this.description,
    this.temperament,
    this.lifeSpan,
    this.wikipediaUrl,
    this.indoor,
  });

  factory CatModel.fromJson({required Map<String, dynamic> json}) {
    final breeds = (json['breeds'] as List).firstOrNull;

    return CatModel(
      imageUrl: json['url'] as String,
      name: breeds?['name'] as String?,
      origin: breeds?['origin'] as String?,
      description: breeds?['description'] as String?,
      temperament: breeds?['temperament'] as String?,
      lifeSpan: breeds?['life_span'] as String?,
      wikipediaUrl: breeds?['wikipedia_url'] as String?,
    );
  }
}
