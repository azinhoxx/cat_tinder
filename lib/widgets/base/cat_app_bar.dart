import 'package:flutter/material.dart';
import 'package:cat_tinder/constants/icons.dart';

class CatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;

  const CatAppBar({super.key, this.automaticallyImplyLeading = true});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
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
