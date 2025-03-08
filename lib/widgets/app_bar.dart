import 'package:flutter/material.dart';
import 'package:flutter_hw_1/app/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CatTinderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CatTinderAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 1,
      shadowColor: Colors.black,
      surfaceTintColor: Colors.transparent,
      title: Text(
        title,
        style: GoogleFonts.dynaPuff(
          fontSize: 42,
          fontWeight: FontWeight.w400,
          color: Colors.red.shade400,
          letterSpacing: 1,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
