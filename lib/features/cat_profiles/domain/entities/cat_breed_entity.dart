import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_weight_entity.dart';
import 'package:equatable/equatable.dart';

class CatBreedEntity extends Equatable {
  final String? name;
  final String? altNames;
  final String? origin;
  final String? description;
  final String? temperament;
  final String? lifeSpan;
  final String? wikipediaUrl;
  final CatWeightEntity? weight;
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

  const CatBreedEntity({
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

  @override
  List<Object?> get props => <Object?>[
    name,
    altNames,
    origin,
    description,
    temperament,
    lifeSpan,
    wikipediaUrl,
    weight,
    adaptability,
    affectionLevel,
    childFriendly,
    dogFriendly,
    energyLevel,
    grooming,
    healthIssues,
    intelligence,
    sheddingLevel,
    socialNeeds,
    strangerFriendly,
    vocalisation,
  ];
}
