import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

class CustomLoader extends StatefulWidget {
  const CustomLoader({super.key, this.size = 60});

  final double size;

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _a1;
  late final Animation<double> _a2;
  late final Animation<double> _a3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))..repeat();
    _a1 = CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.7, curve: Curves.easeInOut));
    _a2 = CurvedAnimation(parent: _controller, curve: const Interval(0.15, 0.85, curve: Curves.easeInOut));
    _a3 = CurvedAnimation(parent: _controller, curve: const Interval(0.3, 1.0, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _dot(Animation<double> anim) {
    final double dotSize = (widget.size * 0.22).w;
    return ScaleTransition(
      scale: Tween<double>(begin: 0.6, end: 1.0).animate(anim),
      child: Container(
        width: dotSize,
        height: dotSize,
        decoration: BoxDecoration(
          color: FB_DARK_PRIMARY,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.h,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _dot(_a1),
            SizedBox(width: 8.w),
            _dot(_a2),
            SizedBox(width: 8.w),
            _dot(_a3),
          ],
        ),
      ),
    );
  }
}
