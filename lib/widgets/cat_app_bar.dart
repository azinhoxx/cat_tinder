import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/icons.dart';

class CatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CatAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            WidgetSpan(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Icon(AppIcons.heart1, color: Colors.redAccent, size: 36),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
