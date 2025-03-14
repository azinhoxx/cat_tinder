import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/colors.dart';

class CardProgressBar extends StatelessWidget {
  final String label;
  final int value;

  const CardProgressBar({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.0,
      children: [
        Text.rich(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          TextSpan(
            children: [
              TextSpan(
                text: '$label ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: '($value / 5)'),
            ],
          ),
        ),
        LinearProgressIndicator(
          value: value / 5,
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          color: Colors.redAccent,
          minHeight: 20,
          backgroundColor: AppColors.backgroundProgressBar,
        ),
      ],
    );
  }
}
