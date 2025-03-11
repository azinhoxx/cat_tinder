import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CatAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: GoogleFonts.modak(
          fontSize: 42,
          fontWeight: FontWeight.w400,
          color: Colors.redAccent,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
