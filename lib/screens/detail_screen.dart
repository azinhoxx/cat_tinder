import 'package:flutter/material.dart';
// import 'package:flutter_hw_1/widgets/cat_app_bar.dart';

class CatDetailScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  const CatDetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // final imageUrl = data['url'] as String;
    // final breeds = data['breeds'][0];
    // final name = breeds['name'] as String;
    // final origin = breeds['origin'] as String;

    return Scaffold(appBar: AppBar(), body: Text('New screen'));
  }
}
