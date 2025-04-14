import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:equatable/equatable.dart';

class CatLikedEntity extends Equatable {
  final CatEntity cat;
  final DateTime likedAt;

  const CatLikedEntity({required this.cat, required this.likedAt});

  @override
  List<Object> get props => <Object>[likedAt, cat];
}
