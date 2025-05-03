import 'package:cat_tinder/features/cat_profiles/data/models/cat_breed_model.dart';
import 'package:cat_tinder/features/cat_profiles/data/models/cat_liked_model.dart';
import 'package:cat_tinder/features/cat_profiles/data/models/cat_model.dart';
import 'package:cat_tinder/features/cat_profiles/data/models/cat_weight_model.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_breed_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_liked_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_weight_entity.dart';

extension CatLikedEntityMapper on CatLikedEntity {
  CatLikedModel mapToModel() {
    return CatLikedModel(cat: cat.mapToModel(), likedAt: likedAt);
  }
}

extension CatEntityMapper on CatEntity {
  CatModel mapToModel() {
    final List<CatBreedModel?>? modelBreeds =
        breeds?.map((e) => e?.mapToModel()).toList();
    return CatModel(id: id, url: url, breeds: modelBreeds);
  }
}

extension CatBreedEntityMapper on CatBreedEntity {
  CatBreedModel mapToModel() {
    return CatBreedModel(
      name: name,
      altNames: altNames,
      origin: origin,
      description: description,
      temperament: temperament,
      lifeSpan: lifeSpan,
      wikipediaUrl: wikipediaUrl,
      weight: weight?.mapToModel(),
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

extension CatWeightEntityMapper on CatWeightEntity {
  CatWeightModel mapToModel() {
    return CatWeightModel(imperial: imperial, metric: metric);
  }
}
