import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_tinder/core/utils/constants/app/app_decorations.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_liked_entity.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:vibration/vibration.dart';

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
      direction: DismissDirection.endToStart,
      background: const _DismissableBackground(
        alignment: Alignment.centerRight,
      ),
      onDismissed: (direction) => _onRemove(context),
      onUpdate: (details) {
        if (details.previousReached != details.reached) {
          Vibration.vibrate(duration: 50, amplitude: 1);
        }
      },
      child: ListTile(
        tileColor: Colors.white,
        selectedColor: Colors.white,
        hoverColor: Colors.white,
        mouseCursor: SystemMouseCursors.click,
        onTap: () => context.push('/details', extra: likedEntity.cat),
        visualDensity: const VisualDensity(vertical: 2.0),
        contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
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

class _DismissableBackground extends StatelessWidget {
  final Alignment alignment;

  const _DismissableBackground({required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(
          Radius.circular(AppDecorations.defaultBorderRadius),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: alignment,
      child: const Icon(Icons.delete, color: Colors.white),
    );
  }
}
