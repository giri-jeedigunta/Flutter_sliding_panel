import 'package:flutter/material.dart';
import 'package:sliding_panel/routes.dart';

class SlidingPanelExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliding Panel Examples'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) => Container(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context, Routes.screens['example${index + 1}']);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Example ${index + 1}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              color: Colors.redAccent,
              thickness: 1,
            ),
          ))
        ],
      ),
    );
  }
}
