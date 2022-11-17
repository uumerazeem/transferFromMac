import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white10,
      body: Stack(
        children: [],
      ),

      bottomNavigationBar: Container(
        width: size.width,
        height: 80,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size.width, 80),
              painter: BNBCustomePainter(),
            ),
            Center(
              heightFactor: 0.6,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.orange,
                child: Image.asset(
                  "assets/camera.png",
                  height: 30,
                  width: 30,
                ),
                elevation: 0.1,
              ),
            ),
            Container(
              width: size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/map.png",
                      height: 23,
                      width: 23,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _controller!.forward();
                    },
                    icon: Image.asset(
                      "assets/chat.png",
                      height: 23,
                      width: 23,
                    ),
                  ),
                  Container(
                    width: size.width * .20,
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.bookmark)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
                ],
              ),
            )
          ],
        ),
      ),
      // This railing comma makes auto-formatting nicer for build methods.
    );
  }
}

class BNBCustomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * .20, 0, size.width * .35, 0);
    path.quadraticBezierTo(size.width * .40, 0, size.width * .40, 20);
    path.arcToPoint(Offset(size.width * .60, 20),
        radius: Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(size.width * .60, 0, size.width * .65, 0);
    path.quadraticBezierTo(size.width * .80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black, 5, true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
