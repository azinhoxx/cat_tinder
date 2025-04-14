import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_liked_entity.dart';
import 'package:flutter/material.dart';

class LikedCatItem extends StatelessWidget {
  final CatLikedEntity cat;

  const LikedCatItem({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(cat.cat.breeds![0]!.name!),
        Text(cat.likedAt.toIso8601String()),
      ],
    );
  }
}
