import 'package:flutter/material.dart';
import 'package:cat_tinder/core/utils/constants/app/app_icons.dart';
import 'package:go_router/go_router.dart';

class CatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;

  const CatAppBar({super.key, this.automaticallyImplyLeading = false});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final String currentRoute = GoRouterState.of(context).uri.toString();

    final showMenuButton = currentRoute != '/likes';
    final showBackButton = currentRoute != Navigator.defaultRouteName;

    return Hero(
      tag: 'appbar',
      child: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: automaticallyImplyLeading,
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
        leading:
            showBackButton
                ? IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  tooltip: 'Back',
                )
                : const SizedBox.shrink(),
        actions: <Widget>[
          showMenuButton
              ? IconButton(
                onPressed: () => context.push('/likes'),
                icon: const Icon(Icons.menu),
                tooltip: 'Show likes list',
              )
              : SizedBox.square(dimension: 40),
        ],
        actionsPadding: const EdgeInsets.only(right: 8.0).copyWith(left: 6.0),
      ),
    );
  }
}
