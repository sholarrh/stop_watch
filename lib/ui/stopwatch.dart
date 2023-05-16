import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stop_watch/ui/reset_button.dart';
import 'package:stop_watch/ui/start_stop_button.dart';
import 'package:stop_watch/ui/stop_watch_renderer.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> with SingleTickerProviderStateMixin{

  late  Ticker _ticker;
  Duration get _elapsed => _previouslyElapsed + _currentlyElapsed;
  Duration _previouslyElapsed = Duration.zero;
  Duration _currentlyElapsed = Duration.zero;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker ((elapsed) {
      setState(() {
        _currentlyElapsed = elapsed;
      });
    });
    //_ticker.start();
  }

  @override
  void dispose() {
   _ticker.dispose();
    super.dispose();
  }

  void _toggleRunning () {
    setState(() {
      _isRunning = !_isRunning;
      if (_isRunning) {
        _ticker.start();
      }else{
        _ticker.stop();
        _previouslyElapsed += _currentlyElapsed;
        _currentlyElapsed = Duration.zero;
      }
    });
  }

  void _reset() {
    setState(() {
      _ticker.stop();
      _isRunning = false;
      _currentlyElapsed = Duration.zero;
      _previouslyElapsed = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints ) {
        return Stack(
          children: [
            StopWatchRenderer(
              elapsed: _elapsed,
              radius: constraints.maxWidth/2,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 80,
                height: 80,
                child: ResetButton(
                  onPressed: _reset,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 80,
                height: 80,
                child: StartStopButton(
                  onPressed: _toggleRunning,
                  isRunning: _isRunning,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
