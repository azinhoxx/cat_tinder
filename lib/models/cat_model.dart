import 'package:flutter/widgets.dart';
import 'package:cat_tinder/utilities/utils.dart';

@immutable
class CatModelListItem<T> {
  final String label;
  final T value;
  final String? add;

  const CatModelListItem({required this.label, required this.value, this.add});
}

@immutable
class CatModel {
  final String imageUrl;
  final String? name;
  final String? altNames;
  final String? origin;
  final String? description;
  final String? temperament;
  final String? lifeSpan;
  final String? wikipediaUrl;
  final String? weightImperial;
  final String? weightMetric;
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

  const CatModel({
    required this.imageUrl,
    this.name,
    this.altNames,
    this.origin,
    this.description,
    this.temperament,
    this.lifeSpan,
    this.wikipediaUrl,
    this.weightImperial,
    this.weightMetric,
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

  factory CatModel.fromJson({required Map<String, dynamic> json}) {
    final breeds = (json['breeds'] as List).firstOrNull;

    return CatModel(
      imageUrl: json['url'] as String,
      name: AppUtils.safeCast<String>(breeds?['name']),
      altNames: AppUtils.safeCast<String>(breeds?['alt_names']),
      origin: AppUtils.safeCast<String>(breeds?['origin']),
      description: AppUtils.safeCast<String>(breeds?['description']),
      temperament: AppUtils.safeCast<String>(breeds?['temperament']),
      lifeSpan: AppUtils.safeCast<String>(breeds?['life_span']),
      wikipediaUrl: AppUtils.safeCast<String>(breeds?['wikipedia_url']),
      weightImperial: AppUtils.safeCast<String>(breeds?['weight']['imperial']),
      weightMetric: AppUtils.safeCast<String>(breeds?['weight']['metric']),
      adaptability: AppUtils.safeCast<int>(breeds?['adaptability']),
      affectionLevel: AppUtils.safeCast<int>(breeds?['affection_level']),
      childFriendly: AppUtils.safeCast<int>(breeds?['child_friendly']),
      dogFriendly: AppUtils.safeCast<int>(breeds?['dog_friendly']),
      energyLevel: AppUtils.safeCast<int>(breeds?['energy_level']),
      grooming: AppUtils.safeCast<int>(breeds?['grooming']),
      healthIssues: AppUtils.safeCast<int>(breeds?['health_issues']),
      intelligence: AppUtils.safeCast<int>(breeds?['intelligence']),
      sheddingLevel: AppUtils.safeCast<int>(breeds?['shedding_level']),
      socialNeeds: AppUtils.safeCast<int>(breeds?['social_needs']),
      strangerFriendly: AppUtils.safeCast<int>(breeds?['stranger_friendly']),
      vocalisation: AppUtils.safeCast<int>(breeds?['vocalisation']),
    );
  }

  List<CatModelListItem<String?>> toStringValuesList() {
    return [
      CatModelListItem(label: 'Name', value: name),
      CatModelListItem(label: 'Alt Names', value: altNames),
      CatModelListItem(label: 'Origin', value: origin),
      CatModelListItem(label: 'Description', value: description),
      CatModelListItem(label: 'Temperament', value: temperament),
      CatModelListItem(label: 'Life Span', value: lifeSpan, add: ' years'),
      CatModelListItem(label: 'Wikipedia URL', value: wikipediaUrl),
      CatModelListItem(
        label: 'Imperial Weight',
        value: weightImperial,
        add: ' kg',
      ),
      CatModelListItem(label: 'Metric Weight', value: weightMetric, add: ' kg'),
    ];
  }

  List<CatModelListItem<int?>> toIntegerValuesList() {
    return [
      CatModelListItem(label: 'Adaptability', value: adaptability),
      CatModelListItem(label: 'Affection Level', value: affectionLevel),
      CatModelListItem(label: 'Child Friendly', value: childFriendly),
      CatModelListItem(label: 'Dog Friendly', value: dogFriendly),
      CatModelListItem(label: 'Energy Level', value: energyLevel),
      CatModelListItem(label: 'Grooming', value: grooming),
      CatModelListItem(label: 'Health Issues', value: healthIssues),
      CatModelListItem(label: 'Intelligence', value: intelligence),
      CatModelListItem(label: 'Shedding Level', value: sheddingLevel),
      CatModelListItem(label: 'Social Needs', value: socialNeeds),
      CatModelListItem(label: 'Stranger Friendly', value: strangerFriendly),
      CatModelListItem(label: 'Vocalisation', value: vocalisation),
    ];
  }
}
