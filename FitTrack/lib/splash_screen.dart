import 'dart:async';
import 'dart:math';

import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: Duration(milliseconds: 1500), // Total duration for the animation
      vsync: this,
    );

    // Define the sequence for tick-tick motion
    _animation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0 * pi / 180, end: 40 * pi / 180), // Move from 0° to 40°
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 40 * pi / 180, end: 80 * pi / 180), // Move from 40° to 80°
        weight: 1.0,
      ),
    ]).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    // Start the animation
    _controller.forward();

    // Transition to the next screen after the animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(), // Navigate to home page
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 230, 205, 123),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/BMI_dial.png',
                  width:300,
                  height:400
                  ),

                  // Needle animation
                  Positioned(
                  bottom: 125,
                  child:AnimatedBuilder(
                    animation: _animation, // Links the animation to the builder.
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _animation.value, // Apply the tick-tick angle
                        child: Image.asset(
                          'assets/images/needle.png', 
                          width: 200, 
                          height: 80,
                        ),
                      );
                    },
                  ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Text(
                'FitTrack',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 85, 36, 13),
                  fontFamily: 'PlaywriteDEGrund',
                ),
              ),
              SizedBox(height: 10),
              Text(
                'BMI Calculator',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 85, 36, 13),
                  fontFamily: 'PlaywriteDEGrund',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

