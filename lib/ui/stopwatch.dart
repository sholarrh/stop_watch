import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stop_watch/ui/stop_watch_renderer.dart';

import 'elapsed_time_text.dart';



class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> with SingleTickerProviderStateMixin{

  late  Ticker _ticker;
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker ((elapsed) {
      setState(() {
        _elapsed = elapsed;
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
   _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints ) {
        return StopWatchRenderer(
          elapsed: _elapsed,
          radius: constraints.maxWidth/2,
        );
      },
    );
  }
}
