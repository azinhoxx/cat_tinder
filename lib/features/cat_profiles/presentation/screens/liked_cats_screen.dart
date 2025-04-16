import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_state.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/base/cat_scaffold.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/liked_cats_screen/liked_cats_search.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/liked_cats_screen/liked_cat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikedCatsScreen extends StatefulWidget {
  const LikedCatsScreen({super.key});

  @override
  State<LikedCatsScreen> createState() => _LikedCatsScreenState();
}

class _LikedCatsScreenState extends State<LikedCatsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LikedCatsCubit>().initFilterList();
  }

  @override
  Widget build(BuildContext context) {
    return CatScaffold(
      body: BlocBuilder<LikedCatsCubit, LikedCatsState>(
        builder: (context, state) {
          if (state.likedCats.isEmpty) {
            return const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'No liked cats yet 😸',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            );
          }

          return Column(
            children: [
              const Card(child: LikedCatsSearch()),
              state.filteredCats.isEmpty
                  ? const Expanded(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'No liked cats with this breed yet 😼',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                  : Expanded(
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(12.0),
                        itemCount: state.filteredCats.length,
                        itemBuilder: (context, index) {
                          final likedEntity = state.filteredCats[index];
                          return LikedCatItem(
                            key: ValueKey(likedEntity.cat.id!),
                            likedEntity: likedEntity,
                          );
                        },
                      ),
                    ),
                  ),
            ],
          );
        },
      ),
    );
  }
}
