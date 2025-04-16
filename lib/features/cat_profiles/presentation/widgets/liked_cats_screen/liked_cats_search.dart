import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikedCatsSearch extends StatelessWidget {
  const LikedCatsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextSelectionTheme(
      data: TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Colors.red.shade100,
      ),
      child: TextField(
        onChanged:
            (value) =>
                context.read<LikedCatsCubit>().filterCatsByBreedName(value),
        cursorColor: Colors.black,
        cursorWidth: 1,
        decoration: const InputDecoration(
          hintText: 'Search by breed name',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 16.0,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
