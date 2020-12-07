import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  static double width;
  static double height;
  List list = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      button(index: 0),
                      button(index: 1),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      button(index: 2),
                      button(index: 3),
                    ],
                  ),
                ],
              ),
              Center(
                child: Align(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: RaisedButton(
                      color: Colors.red, //the main button
                      shape: CircleBorder(),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget button(
    {VoidCallback onPressed,
    double buttonWidth,
    String buttonText,
    int index}) {
  return Center(
    child: ClipPath(
      clipper: MyCustomClipper(index: index),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          width: 100,
          height: 100,
        ),
      ),
    ),
  );
}

class MyCustomClipper extends CustomClipper<Path> {
  int index = 0;

  MyCustomClipper({this.index});

  @override
  Path getClip(Size size) {
    var controlPoint = Offset(size.width / 2, size.height / 2);
    var endPoint = Offset(size.width / 2, size.height);

    var endPoint1 = Offset(0, size.height / 2);

    var endPoint2 = Offset(size.width, size.height / 2);

    var endPoint3 = Offset(size.width / 2, 0);

    List listOfPaths = [
      Path()
        ..lineTo(size.width, 0)
        ..lineTo(size.width, size.height / 2)
        // ..lineTo(0, size.height)
        ..quadraticBezierTo(
            controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
        ..lineTo(0, size.height)
        ..close(),
      Path()
        ..lineTo(size.width, 0)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width / 2, size.height)
        // ..lineTo(0, size.height)
        ..quadraticBezierTo(
            controlPoint.dx, controlPoint.dy, endPoint1.dx, endPoint1.dy)
        ..lineTo(0, size.height)
        ..lineTo(0, size.height / 2)
        ..close(),
      Path()
        ..lineTo(size.width / 2, 0)
        // ..lineTo(size.width, size.wid/2)
        // ..lineTo(0, size.height)
        ..quadraticBezierTo(
            controlPoint.dx, controlPoint.dy, endPoint2.dx, endPoint2.dy)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..close(),
      Path()
        ..moveTo(size.width, 0)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..lineTo(0, size.height / 2)
        ..quadraticBezierTo(
            controlPoint.dx, controlPoint.dy, endPoint3.dx, endPoint3.dy)
        // ..lineTo(0, 0)
        ..close(),
    ];

    return listOfPaths[index];
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
