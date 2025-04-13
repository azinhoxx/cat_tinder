import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder/core/base_components/cat_scaffold.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/details_screen/cat_detail_card.dart';

class DetailsScreen extends StatelessWidget {
  final CatEntity cat;

  const DetailsScreen({required this.cat, super.key});

  @override
  Widget build(BuildContext context) {
    return CatScaffold(body: CatDetailCard(cat: cat));
  }
}
