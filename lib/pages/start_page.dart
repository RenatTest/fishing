import 'package:animated_background/animated_background.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Fish(_x, _y),
        Positioned(
          left: 20,
          bottom: 20,
          child: Joystick(
            mode: _joystickMode,
            listener: (details) {
              setState(() {
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

class Fish extends StatelessWidget {
  final double x;
  final double y;

  const Fish(this.x, this.y, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: SizedBox(
        child: Image.asset(
          'assets/images/angry_fish.png',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
