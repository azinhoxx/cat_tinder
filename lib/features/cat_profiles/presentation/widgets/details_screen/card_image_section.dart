// import 'package:flutter/material.dart';
// import 'package:cat_tinder/core/utils/constants/app_decorations.dart';
// import 'package:cat_tinder/features/cat_profiles/data/models/cat_model.dart';
// import 'package:cat_tinder/features/cat_profiles/presentation/widgets/base/image_container.dart';

// class CardImageSection extends StatelessWidget {
//   const CardImageSection({super.key});

//   void _navigateFullScreen({
//     required BuildContext context,
//     required CatModel cat,
//   }) {
//     Navigator.pushNamed(context, '/fullscreen', arguments: {'cat': cat});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: const BorderRadius.vertical(
//         top: Radius.circular(AppDecorations.defaultBorderRadius),
//       ),
//       onTap: () => _navigateFullScreen(context: context, cat: cat),
//       child: Stack(
//         children: [
//           Positioned.fill(
//             child: ImageContainer(
//               fit: BoxFit.cover,
//               imageUrl: cat.imageUrl,
//               borderRadius: const BorderRadius.vertical(
//                 top: Radius.circular(AppDecorations.defaultBorderRadius),
//               ),
//             ),
//           ),

//           const Positioned(
//             top: 16,
//             right: 16,
//             child: Icon(
//               Icons.open_in_full_sharp,
//               color: Colors.redAccent,
//               size: 24,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
