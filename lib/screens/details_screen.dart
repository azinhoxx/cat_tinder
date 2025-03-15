import 'package:flutter/material.dart';
import 'package:flutter_hw_1/widgets/base/cat_scaffold.dart';
import 'package:flutter_hw_1/widgets/details_screen/detail_card.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CatScaffold(body: CatDetailCard());
  }
}
