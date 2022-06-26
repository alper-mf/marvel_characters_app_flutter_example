import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:sensors_plus/sensors_plus.dart' as sensors;

class ParallaxBG extends StatefulWidget {
  final Widget? children;
  final Widget? topWidget;
  final String backgroundImage;
  ParallaxBG({Key? key, this.children, this.topWidget, required this.backgroundImage})
      : super(key: key);

  @override
  _ParallaxBGState createState() => _ParallaxBGState();
}

class _ParallaxBGState extends State<ParallaxBG> {
  static const _interval = 0.02;
  static const _backgroundScale = 1.2;
  static const _backgroundMoveOffsetScale = 0.6;
  static const _maxAngle = 120;
  static const _maxForegroundMove = Offset(50, 50);
  static const _inititalForegroundOffset = Offset(400, 30);
  static const _inititalBackgroundOffset = Offset(0, 0);
  double initX = 0.0, initY = 0.0;

  Offset _foregroundOffset = _inititalForegroundOffset;
  Offset _backgroundOffset = _inititalBackgroundOffset;
  late StreamSubscription<sensors.GyroscopeEvent> _streamGyrpscopeEvent;

  @override
  void initState() {
    _streamGyrpscopeEvent = sensors.gyroscopeEvents.listen((_listenGyroscopeEvent));
    super.initState();
  }

  void _listenGyroscopeEvent(sensors.GyroscopeEvent event) {
    final angle = Offset(
      event.x * _interval * 180 / pi,
      event.y * _interval * 180 / pi,
    );

    if (event.y.abs() > 0.0) {
      setState(() {
        initX = initX + (event.y);
      });
    }
    if (event.x.abs() > 0.0) {
      setState(() {
        initY = initY + (event.x);
      });
    }

    if (angle.dx >= _maxAngle || angle.dy >= _maxAngle) {
      return;
    }

    final addForegroundOffset = Offset(
      angle.dx / _maxAngle * _maxForegroundMove.dx,
      angle.dy / _maxAngle * _maxForegroundMove.dy,
    );

    final newForegroundOffse = _foregroundOffset + addForegroundOffset;

    if (newForegroundOffse.dx >= _inititalForegroundOffset.dx + _maxForegroundMove.dx ||
        newForegroundOffse.dx <= _inititalForegroundOffset.dx - _maxForegroundMove.dx ||
        newForegroundOffse.dy >= _inititalForegroundOffset.dy + _maxForegroundMove.dy ||
        newForegroundOffse.dy <= _inititalForegroundOffset.dy - _maxForegroundMove.dy) {
      return;
    }

    setState(() {
      _foregroundOffset = _foregroundOffset + addForegroundOffset;
      _backgroundOffset = _backgroundOffset - addForegroundOffset * _backgroundMoveOffsetScale;
    });
  }

  @override
  void dispose() {
    _streamGyrpscopeEvent.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: _backgroundOffset.dx,
            left: _backgroundOffset.dy,
            child: Transform.scale(
              scale: _backgroundScale,
              child: _buildBackgroundImage(size),
            ),
          ),
          if (widget.children != null) widget.children!,
          if (widget.topWidget != null)
            Positioned(
              top: _foregroundOffset.dx - _inititalForegroundOffset.dx,
              left: _foregroundOffset.dy * -3.6,
              child: widget.topWidget!,
            ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage(Size size) => Container(
        height: size.height - (10),
        width: size.width - (10),
        decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.fitWidth, image: AssetImage(widget.backgroundImage)),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 2,
            sigmaY: 2,
          ),
          child: DecoratedBox(
              decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.01),
          )),
        ),
      );
}
