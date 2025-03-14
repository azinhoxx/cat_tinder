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
      title: FittedBox(
        fit: BoxFit.scaleDown,
        child: RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            children: [
              TextSpan(
                text: title,
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
              const WidgetSpan(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Icon(
                    AppIcons.heart1,
                    color: Colors.redAccent,
                    size: 36,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
