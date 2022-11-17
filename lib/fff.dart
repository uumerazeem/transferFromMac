import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math' as math; // im

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Stack(
        children: [
          SizedBox(
            height: 500,
            width: 500,
            child: Lottie.asset("assets/vid.mp4.json",
                fit: BoxFit.fill, controller: animationController),
          ),
          Positioned(
            top: -40,
            right: 0,
            child: Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 500,
                child: Lottie.asset("assets/purple-top.json", fit: BoxFit.fill),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child:
                  Lottie.asset("assets/yellow-bottom.json", fit: BoxFit.fill),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              height: 250,
              width: 500,
              child: Lottie.asset("assets/Green-bottom-left.json",
                  fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }
}
