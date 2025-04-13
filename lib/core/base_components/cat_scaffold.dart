import 'package:flutter/material.dart';
import 'package:cat_tinder/core/base_components/cat_app_bar.dart';

class CatScaffold extends StatelessWidget {
  final Widget body;

  const CatScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CatAppBar(),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 560),
            margin: const EdgeInsets.only(bottom: 20.0),
            child: body,
          ),
        ),
      ),
    );
  }
}
