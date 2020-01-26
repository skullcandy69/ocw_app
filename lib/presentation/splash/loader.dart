import 'dart:math';

import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animationRotation;
  Animation<double> animationRadiusIn;
  Animation<double> animationRadiusOut;
  final double initialRadius = 120;
  double radius = 0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 5,
        ));
    animationRotation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0, 1, curve: Curves.bounceIn)));

    animationRadiusIn = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(.75, 1, curve: Curves.easeInOutExpo)));
    animationRadiusOut = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0, .25, curve: Curves.fastOutSlowIn)));
    controller.addListener(() {
      if (mounted) {
        setState(() {
          if (controller.value >= .75 && controller.value <= 1) {
            radius = animationRadiusIn.value * initialRadius;
          } else if (controller.value >= 0 && controller.value <= .25) {
            radius = animationRadiusOut.value * initialRadius;
          }
        });
      }
    });
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Center(
        child: RotationTransition(
          turns: animationRotation,
          child: Stack(
            children: <Widget>[
              Dot(
                radius: 50,
                color: Colors.amber,
              ),
              Transform.translate(
                offset: Offset(radius * cos(pi), radius * sin(pi)),
                child: Dot(
                  radius: 5,
                  color: Colors.brown,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(3 * pi / 4), radius * sin(3 * pi / 4)),
                child: Dot(
                  radius: 5,
                  color: Colors.purple,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(pi / 4), radius * sin(pi / 4)),
                child: Dot(
                  radius: 5,
                  color: Colors.lime,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(5 * pi / 4), radius * sin(5 * pi / 4)),
                child: Dot(
                  radius: 5,
                  color: Colors.red,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(6 * pi / 4), radius * sin(6 * pi / 4)),
                child: Dot(
                  radius: 5,
                  color: Colors.pink,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(7 * pi / 4), radius * sin(7 * pi / 4)),
                child: Dot(
                  radius: 5,
                  color: Colors.green,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(8 * pi / 4), radius * sin(8 * pi / 4)),
                child: Dot(
                  radius: 5,
                  color: Colors.indigoAccent,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(2 * pi / 4), radius * sin(2 * pi / 4)),
                child: Dot(
                  radius: 5,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
      ),
    );
  }
}
