import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';

class DefaultCursor extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          border: Border.all(
              width: 4,
              color: Colors.black,
              style: BorderStyle.solid)),
    );
  }

}

class HomeScreenCursor extends StatefulWidget {
  @override
  _HomeScreenCursorState createState() => _HomeScreenCursorState();
}

class _HomeScreenCursorState extends State<HomeScreenCursor>
    with SingleTickerProviderStateMixin {
  AnimationController rotationController;

  @override
  void initState() {
    super.initState();
    rotationController =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    rotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        rotationController.repeat();
      }
    });
    rotationController.forward();
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
        child: SizedBox(
          width: 400,
          height: 400,
          child: Stack(
            children: [
              CircularText(
                children: [
                  TextItem(
                    text: Text(
                      "Sahdeep Singh".toUpperCase(),
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    space: 7,
                    startAngle: 0,
                  ),
                  TextItem(
                    text: Text(
                      "Android Engineer".toUpperCase(),
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    space: 5,
                    startAngle: 100,
                  ),
                  TextItem(
                    text: Text(
                      "Flutter Developer".toUpperCase(),
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    space: 5,
                    startAngle: 190,
                  ),
                  TextItem(
                    text: Text(
                      "Based in Delhi".toUpperCase(),
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    space: 5,
                    startAngle: -80,
                  ),
                ],
                radius: 200,
                position: CircularTextPosition.inside,
                backgroundPaint: Paint()..color = Colors.transparent,
              ),
            ],
          ),
        ));
  }
}
