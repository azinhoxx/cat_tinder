import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/icons.dart';

class CatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CatAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const FittedBox(
        fit: BoxFit.scaleDown,
        child: Text.rich(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          TextSpan(
            text: 'CatTinder',
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(
                  AppIcons.heartHandWritten,
                  color: Colors.redAccent,
                  size: 36,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
