import 'package:flutter/material.dart';
import 'package:sliding_panel/examples/sliding_panel_snap.dart';
import 'package:sliding_panel/examples/sliding_panel_woSnap.dart';
import 'package:sliding_panel/routes.dart';
import 'package:sliding_panel/sliding_panel_examples.dart';

void main() => runApp(SlidingPanel());

class SlidingPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        initialRoute: Routes.screens['all'],
        routes: {
          Routes.screens['all']: (context) => SlidingPanelExamples(),
          Routes.screens['example1']: (context) => SlidingPanelWithOutSnap(),
          Routes.screens['example2']: (context) => SlidingPanelSnaps()
        },
      );
}
