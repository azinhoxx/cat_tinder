import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_state.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/base/cat_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikedCatsScreen extends StatelessWidget {
  const LikedCatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CatScaffold(
      body: BlocBuilder<LikedCatsCubit, LikedCatsState>(
        builder: (context, state) {
          context.read<LikedCatsCubit>().loadCats();

          if (state.likedCats.isEmpty) {
            return const Center(child: Text("No liked cats yet."));
          }

          return ListView.builder(
            itemCount: state.likedCats.length,
            itemBuilder: (context, index) {
              final cat = state.likedCats[index];
              return ListTile(
                title: Text(cat.cat.breeds![0]!.name ?? "Unnamed Cat"),
                subtitle: Text("Liked at: ${cat.likedAt}"),
              );
            },
          );
        },
      ),
    );
  }
}
