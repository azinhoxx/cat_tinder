import 'package:cat_tinder/core/utils/mapper/data_mapper.dart';
import 'package:cat_tinder/features/cat_profiles/data/models/cat_weight_model.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_model.g.dart';

@JsonSerializable()
class CatModel extends DataMapper<CatEntity> {
  @JsonKey(name: 'url')
  final String? imageUrl;

  @_JsonKeyBreeds<String>(name: 'name')
  final String? name;

  @_JsonKeyBreeds<String>(name: 'alt_names')
  final String? altNames;

  @_JsonKeyBreeds<String>(name: 'origin')
  final String? origin;

  @_JsonKeyBreeds<String>(name: 'description')
  final String? description;

  @_JsonKeyBreeds<String>(name: 'temperament')
  final String? temperament;

  @_JsonKeyBreeds<String>(name: 'life_span')
  final String? lifeSpan;

  @_JsonKeyBreeds<String>(name: 'wikipedia_url')
  final String? wikipediaUrl;

  @_JsonKeyBreeds<String>(name: 'weight')
  final CatWeightModel? weight;

  @_JsonKeyBreeds<int>(name: 'adaptability')
  final int? adaptability;

  @_JsonKeyBreeds<int>(name: 'affection_level')
  final int? affectionLevel;

  @_JsonKeyBreeds<int>(name: 'child_friendly')
  final int? childFriendly;

  @_JsonKeyBreeds<int>(name: 'dog_friendly')
  final int? dogFriendly;

  @_JsonKeyBreeds<int>(name: 'energy_level')
  final int? energyLevel;

  @_JsonKeyBreeds<int>(name: 'grooming')
  final int? grooming;

  @_JsonKeyBreeds<int>(name: 'health_issues')
  final int? healthIssues;

  @_JsonKeyBreeds<int>(name: 'intelligence')
  final int? intelligence;

  @_JsonKeyBreeds<int>(name: 'shedding_level')
  final int? sheddingLevel;

  @_JsonKeyBreeds<int>(name: 'social_needs')
  final int? socialNeeds;

  @_JsonKeyBreeds<int>(name: 'stranger_friendly')
  final int? strangerFriendly;

  @_JsonKeyBreeds<int>(name: 'vocalisation')
  final int? vocalisation;

  CatModel({
    this.imageUrl,
    this.name,
    this.altNames,
    this.origin,
    this.description,
    this.temperament,
    this.lifeSpan,
    this.wikipediaUrl,
    this.weight,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) =>
      _$CatModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatModelToJson(this);

  @override
  CatEntity mapToEntity() {
    return CatEntity(
      imageUrl: imageUrl,
      name: name,
      altNames: altNames,
      origin: origin,
      description: description,
      temperament: temperament,
      lifeSpan: lifeSpan,
      wikipediaUrl: wikipediaUrl,
      weight: weight?.mapToEntity(),
      adaptability: adaptability,
      affectionLevel: affectionLevel,
      childFriendly: childFriendly,
      dogFriendly: dogFriendly,
      energyLevel: energyLevel,
      grooming: grooming,
      healthIssues: healthIssues,
      intelligence: intelligence,
      sheddingLevel: sheddingLevel,
      socialNeeds: socialNeeds,
      strangerFriendly: strangerFriendly,
      vocalisation: vocalisation,
    );
  }
}

class _JsonKeyBreeds<T> extends JsonConverter<T?, Map<String, dynamic>> {
  final String name;
  const _JsonKeyBreeds({required this.name});

  @override
  T? fromJson(Map<String, dynamic> json) {
    final breeds = json['breeds'] as List<dynamic>?;
    if (breeds == null || breeds.isEmpty) return null;
    final first = breeds.first as Map<String, dynamic>;
    return first[name] as T?;
  }

  @override
  Map<String, dynamic> toJson(T? object) {
    return {};
  }
}
