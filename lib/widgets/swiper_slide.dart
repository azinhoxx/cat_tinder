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

    const borderRadius = Radius.circular(16);

    return GestureDetector(
      onTap: () {},
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(borderRadius),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 8)],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(borderRadius),
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
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Text(
                                name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                origin,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black87),
                              ),
                            ],
                          ),
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
