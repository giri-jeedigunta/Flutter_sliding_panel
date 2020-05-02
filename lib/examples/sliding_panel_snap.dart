import 'package:flutter/material.dart';

class SlidingPanelSnaps extends StatefulWidget {
  @override
  _SlidingPanelSnapsState createState() => _SlidingPanelSnapsState();
}

class _SlidingPanelSnapsState extends State<SlidingPanelSnaps> {
  double initialPosition = 200,
      currentPosition,
      updatedPosition,
      dragTopBound = 50,
      dragBottomBound = 500;

  bool isDragging = false;
  final instructions =
      'In this example the sliding panel snaps to top and bottom positions';

  @override
  void initState() {
    super.initState();
    currentPosition = initialPosition;
    updatedPosition = initialPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliding Panel - Example 2'),
      ),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topCenter,
        children: <Widget>[
          BackgroundWidget(
            initialPosition: initialPosition,
            currentPosition: currentPosition,
            updatedPosition: updatedPosition,
            dragTopBound: dragTopBound,
            dragBottomBound: dragBottomBound,
          ),
          Positioned(
            top: isDragging ? currentPosition : updatedPosition,
            child: GestureDetector(
              onTap: () {
                Future.delayed(const Duration(milliseconds: 0), () {
                  setState(() {
                    isDragging = false;
                    currentPosition = updatedPosition;
                  });
                });
              },
              onVerticalDragEnd: (DragEndDetails details) {
                Future.delayed(const Duration(milliseconds: 10), () {
                  setState(() {
                    isDragging = false;

                    if (currentPosition > initialPosition &&
                        updatedPosition != dragBottomBound) {
                      updatedPosition = dragBottomBound;
                    } else if (updatedPosition == dragBottomBound &&
                        currentPosition > initialPosition &&
                        currentPosition < dragBottomBound) {
                      updatedPosition = initialPosition;
                    } else if (currentPosition < initialPosition &&
                        currentPosition > dragTopBound &&
                        updatedPosition != dragTopBound) {
                      updatedPosition = dragTopBound;
                    } else if (updatedPosition == dragTopBound &&
                        currentPosition > dragTopBound &&
                        currentPosition < initialPosition) {
                      updatedPosition = initialPosition;
                    }
                  });
                });
              },
              onVerticalDragUpdate: (DragUpdateDetails details) {
                Future.delayed(const Duration(milliseconds: 0), () {
                  setState(() {
                    if (details.globalPosition.dy < dragTopBound) {
                      isDragging = false;
                      currentPosition = dragTopBound;
                      updatedPosition = dragTopBound;
                    } else if (details.globalPosition.dy > dragBottomBound) {
                      isDragging = false;
                      currentPosition = dragBottomBound;
                      updatedPosition = dragBottomBound;
                    } else {
                      currentPosition = details.globalPosition.dy;
                      isDragging = true;
                    }
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
                child: Column(
                  children: <Widget>[
                    Align(
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
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'In this example the sliding panel snaps to top, initial and bottom positions',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
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
  BackgroundWidget({
    Key key,
    this.initialPosition,
    this.currentPosition,
    this.updatedPosition,
    this.dragTopBound,
    this.dragBottomBound,
  }) : super(key: key);

  final initialPosition,
      currentPosition,
      updatedPosition,
      dragTopBound,
      dragBottomBound;

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
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(
                top: dragTopBound - 30,
                child: Text(
                  'Top Boundry',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              Positioned(
                top: initialPosition - 30,
                child: Text(
                  'Initial Position',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              Positioned(
                top: dragBottomBound - 30,
                child: Text(
                  'Bottom Boundry',
                  style: TextStyle(
                    color: Colors.red,
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
