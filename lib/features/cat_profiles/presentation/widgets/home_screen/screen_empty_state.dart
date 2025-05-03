import 'package:flutter/widgets.dart';

class ScreenEmptyState extends StatelessWidget {
  const ScreenEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'There are no cats 🙀 \nPlease, try again later',
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
    );
  }
}
