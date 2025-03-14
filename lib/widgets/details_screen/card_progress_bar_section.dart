import 'package:flutter/material.dart';

class CardProgressBarSection extends StatelessWidget {
  final List<Widget> items;

  const CardProgressBarSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 350;

        return Container(
          margin: const EdgeInsets.only(top: 12.0),
          child: Column(
            spacing: 16.0,
            children:
                isSmallScreen
                    ? items
                    : <Widget>[
                      for (int i = 0; i < items.length; i += 2)
                        Row(
                          spacing: 12.0,
                          children: [
                            Flexible(child: items[i]),
                            if (i + 1 < items.length)
                              Flexible(child: items[i + 1]),
                          ],
                        ),
                    ],
          ),
        );
      },
    );
  }
}
