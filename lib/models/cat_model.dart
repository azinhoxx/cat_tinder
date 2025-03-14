import 'package:flutter/widgets.dart';
import 'package:flutter_hw_1/utilities/utils.dart';

@immutable
class CatModelListItem<T> {
  final String label;
  final T value;
  const CatModelListItem({required this.label, required this.value});
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
  final int? intelligence;
  final int? healthIssues;
  final int? affectionLevel;
  final int? adaptability;
  final int? energyLevel;
  final int? childFriendly;
  final int? dogFriendly;
  final int? strangerFriendly;

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
    this.intelligence,
    this.healthIssues,
    this.affectionLevel,
    this.adaptability,
    this.energyLevel,
    this.childFriendly,
    this.dogFriendly,
    this.strangerFriendly,
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
      intelligence: AppUtils.safeCast<int>(breeds?['intelligence']),
      healthIssues: AppUtils.safeCast<int>(breeds?['healt_issues']),
      affectionLevel: AppUtils.safeCast<int>(breeds?['affection_level']),
      adaptability: AppUtils.safeCast<int>(breeds?['adaptability']),
      energyLevel: AppUtils.safeCast<int>(breeds?['energy_level']),
      childFriendly: AppUtils.safeCast<int>(breeds?['child_friendly']),
      dogFriendly: AppUtils.safeCast<int>(breeds?['dog_friendly']),
      strangerFriendly: AppUtils.safeCast<int>(breeds?['stranger_friendly']),
    );
  }

  List<CatModelListItem<String?>> toStringValuesList() {
    return [
      CatModelListItem(label: 'Name', value: name),
      CatModelListItem(label: 'Alt Names', value: altNames),
      CatModelListItem(label: 'Origin', value: origin),
      CatModelListItem(label: 'Description', value: description),
      CatModelListItem(label: 'Temperament', value: temperament),
      CatModelListItem(label: 'Life Span', value: '$lifeSpan years'),
      CatModelListItem(label: 'Wikipedia URL', value: wikipediaUrl),
      CatModelListItem(label: 'Imperial Weight', value: '$weightImperial kg'),
      CatModelListItem(label: 'Metric Weight', value: '$weightMetric kg'),
    ];
  }

  List<CatModelListItem<int?>> toIntegerValuesList() {
    return [
      CatModelListItem(label: 'Intelligence', value: intelligence),
      CatModelListItem(label: 'Health Issues', value: healthIssues),
      CatModelListItem(label: 'Affection Level', value: affectionLevel),
      CatModelListItem(label: 'Adaptability', value: adaptability),
      CatModelListItem(label: 'Energy Level', value: energyLevel),
      CatModelListItem(label: 'Child Friendly', value: childFriendly),
      CatModelListItem(label: 'Dog Friendly', value: dogFriendly),
      CatModelListItem(label: 'Stranger Friendly', value: strangerFriendly),
    ];
  }
}
