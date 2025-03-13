import 'package:flutter/material.dart';

class CatScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;

  const CatScaffold({super.key, this.appBar, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
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
