import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SwiperSlide extends StatelessWidget {
  final Map<String, dynamic> data;

  const SwiperSlide({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final imageUrl = data['url'] as String;
    final name = data['breeds'][0]['name'] as String;
    final origin = data['breeds'][0]['origin'] as String;

    const borderRadius = Radius.circular(20);

    return GestureDetector(
      onTap: () {},
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(borderRadius),
            color: Colors.white, // Добавляем цвет фона, чтобы тень отображалась
            boxShadow: [
              BoxShadow(
                color: Colors.black87,
                offset: Offset(1, 1),
                blurRadius: 10,
              ),
            ],
          ),
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: const BorderRadius.all(borderRadius),
            child: SizedBox(
              width: 600,
              height:
                  (MediaQuery.of(context).size.height - kToolbarHeight) * 0.8,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, progress) => Center(
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                value: progress.progress,
                              ),
                            ),
                          ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(origin),
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
    );
  }
}
