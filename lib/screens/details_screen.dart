import 'package:flutter/material.dart';
import 'package:cat_tinder/widgets/base/cat_scaffold.dart';
import 'package:cat_tinder/widgets/details_screen/detail_card.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CatScaffold(body: CatDetailCard());
  }
}
