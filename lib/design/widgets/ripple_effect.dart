import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import './circle_painter.dart';
import './curve_wave.dart';


class RipplesAnimation extends StatefulWidget {
  const RipplesAnimation({super.key, this.size = 80.0, this.color = Colors.red,
    required this.onPressed, required this.child,});
  final double size;
  final Color color;
  final Widget child;
  final VoidCallback onPressed;
  @override
  _RipplesAnimationState createState() => _RipplesAnimationState();
}

class _RipplesAnimationState extends State<RipplesAnimation> with TickerProviderStateMixin {
  AnimationController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }
  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
  Widget _button() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.size),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[
                widget.color,
                Color.lerp(widget.color, Colors.black, .05)!
              ],
            ),
          ),
          child: ScaleTransition(
              scale: Tween(begin: 0.95, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller!,
                  curve: const CurveWave(),
                ),
              ),
              child: IconButton( icon: Icon(Icons.east), iconSize: 25, onPressed: widget.onPressed,)
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Center(
        child: CustomPaint(
          painter: CirclePainter(
            _controller!,
            color: widget.color,
          ),
          child: SizedBox(
            width: widget.size * 4.125,
            height: widget.size * 4.125,
            child: _button(),
          ),
        ),
      ),
    );
  }
}