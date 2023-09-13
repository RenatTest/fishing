import 'dart:async';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'dart:math' as math;

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with TickerProviderStateMixin {
  final JoystickMode _joystickMode = JoystickMode.all;
  double _x = 100;
  double _y = 100;
  var step = 10.0;

  bool mirror = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        mirror ? Fish(_x, _y) : Fish2(_x, _y),
        Positioned(
          left: 20,
          bottom: 20,
          child: Joystick(
            mode: _joystickMode,
            listener: (details) {
              setState(() {
                details.x < 0 ? mirror = true : mirror = false;
                _x = _x + step * details.x;
                _y = _y + step * details.y;
              });
            },
          ),
        ),
        AnimatedBackground(
          behaviour: RandomParticleBehaviour(
              options: const ParticleOptions(
            spawnMaxRadius: 35,
            spawnMinSpeed: 7.0,
            particleCount: 55,
            spawnMaxSpeed: 65,
            minOpacity: 0.2,
            spawnOpacity: 0.4,
            baseColor: Colors.lightBlue,
          )),
          vsync: this,
          child: const Text(''),
        ),
      ],
    )));
  }
}

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
