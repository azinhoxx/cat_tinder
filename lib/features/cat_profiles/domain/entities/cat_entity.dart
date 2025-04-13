import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_breed_entity.dart';
import 'package:equatable/equatable.dart';

class CatEntity extends Equatable {
  final String? url;
  final List<CatBreedEntity?>? breeds;

  const CatEntity({this.url, this.breeds});

  @override
  List<Object?> get props => <Object?>[url, breeds];
}
