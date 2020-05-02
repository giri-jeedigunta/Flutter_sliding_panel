import 'package:flutter/material.dart';

class SlidingPanelWithOutSnap extends StatefulWidget {
  @override
  _SlidingPanelWithOutSnapState createState() =>
      _SlidingPanelWithOutSnapState();
}

class _SlidingPanelWithOutSnapState extends State<SlidingPanelWithOutSnap> {
  double initialPosition = 150, currentPosition;

  @override
  void initState() {
    super.initState();
    currentPosition = initialPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliding Panel - Example 1'),
      ),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topCenter,
        children: <Widget>[
          BackgroundWidget(
            instructions:
                'In this example the sliding panel moves as the user drags it and do not snap.',
          ),
          Positioned(
            top: currentPosition,
            child: GestureDetector(
              onVerticalDragUpdate: (DragUpdateDetails details) {
                Future.delayed(const Duration(milliseconds: 100), () {
                  setState(() {
                    currentPosition = details.globalPosition.dy;
                  });
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: 45,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key key,
    this.instructions,
  }) : super(key: key);

  final instructions;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.black12,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            instructions,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
