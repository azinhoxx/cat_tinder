import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/models/cat_list_item_model.dart';

extension CatEntityMapper on CatEntity {
  List<CatListItemModel<T>> toListItemsOfType<T>() {
    final result = <CatListItemModel<T>>[];

    final breed = breeds?.firstOrNull;
    if (breed == null) return result;

    final Map<String, dynamic> data = {
      'Name': breed.name,
      'Alt Names': breed.altNames,
      'Origin': breed.origin,
      'Description': breed.description,
      'Temperament': breed.temperament,
      'Life Span': breed.lifeSpan,
      'Wikipedia URL': breed.wikipediaUrl,
      'Imperial Weight': breed.weight?.imperial,
      'Metric Weight': breed.weight?.metric,
      'Adaptability': breed.adaptability,
      'Affection Level': breed.affectionLevel,
      'Child Friendly': breed.childFriendly,
      'Dog Friendly': breed.dogFriendly,
      'Energy Level': breed.energyLevel,
      'Grooming': breed.grooming,
      'Health Issues': breed.healthIssues,
      'Intelligence': breed.intelligence,
      'Shedding Level': breed.sheddingLevel,
      'Social Needs': breed.socialNeeds,
      'Stranger Friendly': breed.strangerFriendly,
      'Vocalisation': breed.vocalisation,
    };

    data.forEach((label, value) {
      if (value is T && value.toString().isNotEmpty) {
        result.add(
          CatListItemModel<T>(
            label: label,
            value: value,
            suffix: _getItemSuffixByLabel(label),
          ),
        );
      }
    });

    return result;
  }

  String? _getItemSuffixByLabel(String label) {
    return label.contains('Weight')
        ? ' kg'
        : label == 'Life Span'
        ? ' years'
        : null;
  }
}
