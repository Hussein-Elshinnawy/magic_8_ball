import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Center(child: Text('ASk me a question')),
          backgroundColor: Colors.blue[900],
        ),
        body: Magic8Ball(),
      ),
    ),
  );
}

class Magic8Ball extends StatefulWidget {
  const Magic8Ball({Key? key}) : super(key: key);

  @override
  State<Magic8Ball> createState() => _Magic8BallState();
}

class _Magic8BallState extends State<Magic8Ball> {
  int ballNum = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                changeBall();
              },
              child: BallImage(assetName: 'images/ball$ballNum.png'),
            ),
          )
        ],
      ),
    );
  }
  void changeBall(){
    setState(() {
      ballNum = Random().nextInt(5) + 1;
    });
  }
}

class BallImage extends StatelessWidget {
  final String assetName;

  const BallImage({required this.assetName});

  @override
  Widget build(BuildContext context) {
    return Image.asset(assetName);
  }
}