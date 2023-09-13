import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Fish2 extends StatefulWidget {
  final double x;
  final double y;

  const Fish2(this.x, this.y, {Key? key}) : super(key: key);

  @override
  State<Fish2> createState() => _Fish2State();
}

class _Fish2State extends State<Fish2> {
  late Timer timer;
  int _index = 0;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() => _index++);
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.x,
      top: widget.y,
      child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: _index % 2 == 0
              ? Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: Image.asset(
                    'assets/images/angry_fish.png',
                    width: 100,
                    height: 100,
                  ),
                )
              : Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: Image.asset(
                    'assets/images/angry_fish2.png',
                    width: 100,
                    height: 100,
                  ),
                )),
    );
  }
}
