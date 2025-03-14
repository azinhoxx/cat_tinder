import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PawLoadingIndicator extends StatefulWidget {
  const PawLoadingIndicator({super.key});

  @override
  State<PawLoadingIndicator> createState() => _BlinkingPawState();
}

class _BlinkingPawState extends State<PawLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    debugPrint('PawLoadingIndicator created');
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.9,
      upperBound: 1.1,
      duration: Duration(milliseconds: 500),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _controller,
        child: SizedBox.square(
          dimension: 80,
          child: SvgPicture.asset('assets/icons/paw_loading_icon.svg'),
        ),
      ),
    );
  }
}
