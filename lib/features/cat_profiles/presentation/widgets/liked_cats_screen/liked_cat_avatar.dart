// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// class LikedCatAvatar extends StatelessWidget {
//   final double dimension;
//   final String imageUrl;
//   final String placeholderLetter;

//   const LikedCatAvatar({
//     super.key,
//     required this.dimension,
//     required this.imageUrl,
//     required this.placeholderLetter,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ClipOval(
//       child: CachedNetworkImage(
//         width: dimension,
//         height: dimension,
//         imageUrl: imageUrl,
//         fit: BoxFit.cover,
//         placeholder:
//             (context, url) => _LikedCatAvatarPlaceholder(
//               placeholderLetter: placeholderLetter,
//               dimension: dimension,
//             ),
//         errorWidget:
//             (context, url, error) => _LikedCatAvatarPlaceholder(
//               placeholderLetter: placeholderLetter,
//               dimension: dimension,
//             ),
//       ),
//     );
//   }
// }

// class _LikedCatAvatarPlaceholder extends StatelessWidget {
//   final String placeholderLetter;
//   final double dimension;

//   const _LikedCatAvatarPlaceholder({
//     required this.placeholderLetter,
//     required this.dimension,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       foregroundDecoration: BoxDecoration(
//         shape: BoxShape.circle,
//         border: Border.all(color: Colors.grey, width: 0.5),
//       ),
//       alignment: Alignment.center,
//       color: Colors.white,
//       child: Text(
//         placeholderLetter,
//         style: TextStyle(fontSize: dimension / 1.8),
//       ),
//     );
//   }
// }
