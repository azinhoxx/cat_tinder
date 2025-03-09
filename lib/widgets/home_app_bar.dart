import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const HomeAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      // elevation: 1,
      // shadowColor: Colors.black,
      // surfaceTintColor: Colors.transparent,
      title: Text(
        title,
        style: GoogleFonts.berkshireSwash(
          fontSize: 42,
          fontWeight: FontWeight.w400,
          color: Colors.redAccent,
          letterSpacing: 1,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
