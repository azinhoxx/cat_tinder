// import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:cat_tinder/core/utils/constants/app_decorations.dart';
// import 'package:cat_tinder/features/cat_profiles/data/models/cat_model.dart';
// import 'package:cat_tinder/features/cat_profiles/presentation/widgets/details_screen/card_image_section.dart';
// import 'package:cat_tinder/features/cat_profiles/presentation/widgets/details_screen/card_progress_bar.dart';
// import 'package:cat_tinder/features/cat_profiles/presentation/widgets/details_screen/card_rich_text.dart';
// import 'package:cat_tinder/features/cat_profiles/presentation/widgets/details_screen/card_progress_bar_section.dart';
// import 'package:url_launcher/url_launcher.dart';

// class CatDetailCard extends StatelessWidget {
//   final CatEntity cat;

//   const CatDetailCard({ required this. super.key});

//   @override
//   Widget build(BuildContext context) {
//     final itemsIntegerValues = _buildItems<int>(
//       items: cat.toIntegerValuesList(),
//       builder:
//           (el) => CardProgressBar(
//             key: ValueKey(el),
//             label: el.label,
//             value: el.value!,
//           ),
//     );

//     final itemsStringValues = _buildItems<String>(
//       items: cat.toStringValuesList(),
//       builder: (el) {
//         return CardRichText(
//           key: ValueKey(el),
//           label: el.label,
//           child:
//               el.label.toLowerCase().contains('wikipedia')
//                   ? TextSpan(
//                     text: el.value!,
//                     style: const TextStyle(color: Colors.blueAccent),
//                     recognizer:
//                         TapGestureRecognizer()
//                           ..onTap = () {
//                             final url = Uri.parse(el.value!);
//                             launchUrl(url);
//                           },
//                   )
//                   : TextSpan(text: el.value! + (el.add ?? '')),
//         );
//       },
//     );

//     return Card(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(AppDecorations.defaultBorderRadius),
//         ),
//       ),
//       color: Colors.white,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           const Flexible(child: CardImageSection()),
//           Flexible(
//             child: ListView.separated(
//               separatorBuilder: (context, index) => const Divider(),
//               padding: const EdgeInsets.all(12.0),
//               itemCount:
//                   itemsStringValues.length +
//                   (itemsIntegerValues.isNotEmpty ? 1 : 0),
//               itemBuilder: (context, index) {
//                 if (index < itemsStringValues.length) {
//                   return itemsStringValues[index];
//                 }
//                 return CardProgressBarSection(items: itemsIntegerValues);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   List<Widget> _buildItems<T>({
//     required List<CatModelListItem<T?>> items,
//     required Widget Function(CatModelListItem<T?>) builder,
//   }) {
//     return items.fold<List<Widget>>([], (list, el) {
//       if (el.value != null && el.value.toString().isNotEmpty) {
//         list.add(builder(el));
//       }
//       return list;
//     });
//   }
// }
