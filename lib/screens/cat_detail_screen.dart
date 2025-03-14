import 'package:flutter/material.dart';
import 'package:flutter_hw_1/widgets/cat_app_bar.dart';
import 'package:flutter_hw_1/widgets/cat_scaffold.dart';
import 'package:flutter_hw_1/widgets/cat_detail_card.dart';

class CatDetailScreen extends StatelessWidget {
  const CatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CatScaffold(
      appBar: CatAppBar(title: 'CatTinder'),
      body: CatDetailCard(),
    );
  }
}
