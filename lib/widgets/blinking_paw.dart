import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlinkingPaw extends StatefulWidget {
  const BlinkingPaw({super.key});

  @override
  State<BlinkingPaw> createState() => _BlinkingPawState();
}

class _BlinkingPawState extends State<BlinkingPaw>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _controller.repeat(reverse: true);
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
      child: FadeTransition(
        opacity: _controller,
        child: SizedBox.square(
          dimension: 80,
          child: SvgPicture.asset('assets/icons/paw_loading_icon.svg'),
        ),
      ),
    );
  }
}
