import 'package:cat_tinder/core/utils/mapper/data_mapper.dart';
import 'package:cat_tinder/features/cat_profiles/data/models/cat_weight_model.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_breed_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_breed_model.g.dart';

@JsonSerializable()
class CatBreedModel extends DataMapper<CatBreedEntity> {
  final String? name;
  final String? altNames;
  final String? origin;
  final String? description;
  final String? temperament;
  final String? lifeSpan;
  final String? wikipediaUrl;
  final CatWeightModel? weight;
  final int? adaptability;
  final int? affectionLevel;
  final int? childFriendly;
  final int? dogFriendly;
  final int? energyLevel;
  final int? grooming;
  final int? healthIssues;
  final int? intelligence;
  final int? sheddingLevel;
  final int? socialNeeds;
  final int? strangerFriendly;
  final int? vocalisation;

  CatBreedModel({
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

  factory CatBreedModel.fromJson(Map<String, dynamic> json) =>
      _$CatBreedModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatBreedModelToJson(this);

  @override
  CatBreedEntity mapToEntity() {
    return CatBreedEntity(
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
