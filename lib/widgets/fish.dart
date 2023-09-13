import 'dart:async';

import 'package:flutter/material.dart';

class Fish extends StatefulWidget {
  final double x;
  final double y;

  const Fish(this.x, this.y, {Key? key}) : super(key: key);

  @override
  State<Fish> createState() => _FishState();
}

class _FishState extends State<Fish> {
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
              ? Image.asset(
                  'assets/images/angry_fish.png',
                  width: 100,
                  height: 100,
                )
              : Image.asset(
                  'assets/images/angry_fish2.png',
                  width: 100,
                  height: 100,
                )),
    );
  }
}
