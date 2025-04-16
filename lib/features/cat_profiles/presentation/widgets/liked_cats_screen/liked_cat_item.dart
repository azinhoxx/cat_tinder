import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_tinder/core/utils/constants/app/app_decorations.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_liked_entity.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LikedCatItem extends StatelessWidget {
  final CatLikedEntity likedEntity;

  const LikedCatItem({required super.key, required this.likedEntity});

  void _onRemove(BuildContext context) {
    context.read<LikedCatsCubit>().removeCat(likedEntity.cat);
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key!,
      background: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(AppDecorations.defaultBorderRadius),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerLeft,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      secondaryBackground: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(AppDecorations.defaultBorderRadius),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) => _onRemove(context),
      child: ListTile(
        visualDensity: const VisualDensity(vertical: 2.0),
        contentPadding: const EdgeInsets.all(0.0),
        leading: ClipOval(
          child: CachedNetworkImage(
            height: 64.0,
            width: 64.0,
            fit: BoxFit.cover,
            imageUrl: likedEntity.cat.url!,
            fadeInDuration: Duration.zero,
            placeholderFadeInDuration: Duration.zero,
            errorWidget:
                (context, url, error) =>
                    Image.asset('assets/icons/cat_avatar_placeholder.png'),
          ),
        ),
        title: Text(
          likedEntity.cat.breeds![0]!.name!,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        subtitle: Text(
          'Liked At: ${DateFormat.yMMMMEEEEd().format(likedEntity.likedAt)}',
          style: const TextStyle(fontSize: 14),
        ),
        trailing: IconButton(
          color: Colors.red,
          onPressed: () => _onRemove(context),
          icon: const Icon(Icons.remove, size: 20),
        ),
      ),
    );
  }
}
