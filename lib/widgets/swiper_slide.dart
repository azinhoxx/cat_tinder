import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_hw_1/widgets/blinking_paw.dart';

class SwiperSlide extends StatelessWidget {
  final Map<String, dynamic> data;

  const SwiperSlide({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final imageUrl = data['url'] as String;
    final name = data['breeds'][0]['name'] as String;
    final origin = data['breeds'][0]['origin'] as String;

    final borderRadius = const BorderRadius.all(Radius.circular(16.0));

    return GestureDetector(
      onTap: () {},
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 8)],
              ),
              child: ClipRRect(
                borderRadius: borderRadius,
                child: SizedBox(
                  width: 800,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          placeholder: (context, url) => BlinkingPaw(),
                          fadeOutDuration: const Duration(milliseconds: 400),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        top: null,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 2,
                                    sigmaY: 2,
                                  ),
                                  child: Container(color: Colors.black26),
                                ),
                              ),
                            ),

                            Container(
                              alignment: Alignment.bottomCenter,
                              padding: const EdgeInsets.fromLTRB(24, 8, 16, 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    origin,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
