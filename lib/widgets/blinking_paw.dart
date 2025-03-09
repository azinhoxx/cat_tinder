import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';

class BlinkingPaw extends StatefulWidget {
  const BlinkingPaw({super.key});

  @override
  State<BlinkingPaw> createState() => _BlinkingPawState();
}

class _BlinkingPawState extends State<BlinkingPaw> {
  double _opacity = 1.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        _opacity = _opacity == 1.0 ? 0.6 : 1.0;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: _opacity,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 300),
        child: SizedBox(
          width: 80,
          height: 80,
          child: SvgPicture.asset('assets/icons/paw_loading_icon.svg'),
        ),
      ),
    );
  }
}
