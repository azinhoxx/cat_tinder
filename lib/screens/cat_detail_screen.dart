import 'package:flutter/material.dart';
import 'package:flutter_hw_1/widgets/cat_app_bar.dart';
import 'package:flutter_hw_1/widgets/cat_scaffold.dart';
import 'package:flutter_hw_1/widgets/cat_detail_card.dart';

class CatDetailScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  const CatDetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CatScaffold(
      appBar: const CatAppBar(title: 'CatTinder'),
      body: CatDetailCard(data: data),
    );
  }
}
