import 'package:animated_background/animated_background.dart';
import 'package:animated_fishing/widgets/fish.dart';
import 'package:animated_fishing/widgets/fish2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

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
          left: (MediaQuery.of(context).size.width - 100) / 2,
          bottom: 30,
          child: SizedBox(
            height: 100,
            width: 100,
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
