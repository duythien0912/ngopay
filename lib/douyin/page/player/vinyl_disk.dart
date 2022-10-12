import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:ngopay/douyin/utils/screen_utils.dart';

/// @author jd

/// Rotating vinyl disk with notes go out from its bottom
class VinylDisk extends StatefulWidget {
  VinylDisk(this.imgUrl);
  String imgUrl;

  @override
  _VinylDiskState createState() => _VinylDiskState();
}

class _VinylDiskState extends State<VinylDisk> with TickerProviderStateMixin {
  late AnimationController _noteOpacityController;
  late Animation<double> _noteOpacityAnimation;
  late AnimationController _noteAndDiskController;
  late Animation<double> _noteAndDiskAnimation;
  late AnimationController _noteRotationController;
  late Animation<double> _noteRotationAnimation;
  late Tween<double> _noteRotationTween;
  final Random _random = Random();
  Path? _path;

  int _pathIndex = 0;
  final int _pathsQuantity = 4;

  final _vinylGradient = LinearGradient(
    colors: [
      Colors.blue[200]!,
      Colors.blue[300]!,
      Colors.blue[400]!,
      Colors.blue[100]!,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topLeft,
    stops: const [0.2, 0.6, 0.8, 1.0],
  );

  Path _drawPath({int quantity = 0, int divider = 0}) {
    final xOffset = get_Width(15);
    final yOffset = get_Height(15);
    final size = Size(
      get_Width(110),
      get_Height(90),
    );
    final path = Path();
    for (var i = 0; i <= quantity; i++) {
      final subPath = Path();
      subPath.moveTo(
        size.width - get_Width(70) / 2,
        size.height - (size.height - get_Height(70)) / 2,
      );
      subPath.cubicTo(
        size.width / 4,
        size.height,
        size.width / 5,
        size.height / 2,
        i <= divider ? i * xOffset : 0,
        i <= divider ? 0 : (i - divider) * yOffset,
      );
      path.addPath(subPath, Offset.zero);
    }
    return path;
  }

  /// Calculates position on a sub path got at [_pathIndex]
  /// [value] should come from [Animation] or [AnimationController]
  /// instance.
  Offset _calculatePosition(double value) {
    final pathMetrics = _path?.computeMetrics();
    final pathMetric = pathMetrics?.elementAt(_pathIndex);
    value = (pathMetric?.length ?? 0) * value;
    final pos = pathMetric?.getTangentForOffset(value);
    return pos?.position ?? Offset.zero;
  }

  @override
  void initState() {
    super.initState();
    _noteOpacityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );
    _noteOpacityAnimation = CurvedAnimation(
      parent: _noteOpacityController,
      curve: Curves.decelerate,
    );

    _noteRotationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _noteRotationTween = Tween(begin: -.05, end: .05);
    _noteRotationAnimation =
        _noteRotationTween.animate(_noteRotationController);

    _noteAndDiskController = AnimationController(
      duration: const Duration(milliseconds: 1000 * 2),
      vsync: this,
    );
    _noteAndDiskAnimation = Tween(
      begin: double.parse('0'),
      end: double.parse('1'),
    ).animate(_noteAndDiskController)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _pathIndex = _random.nextInt(_pathsQuantity);
            _noteRotationTween.begin = -_random.nextInt(_pathsQuantity) / 100;
            _noteRotationTween.end = _random.nextInt(_pathsQuantity) / 100;
            _noteAndDiskController.reset();
            _noteAndDiskController.forward();

            _noteOpacityController.reset();
            _noteOpacityController.reverse(from: 1);
          }
        },
      );
    _noteAndDiskController.forward();
    _noteOpacityController.reverse(from: 1);
    _noteRotationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _noteAndDiskController.dispose();
    _noteRotationController.dispose();
    _noteOpacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _path = _drawPath(quantity: _pathsQuantity, divider: 1);
    return SizedBox(
      width: get_Width(110),
      height: get_Height(90),
      child: Stack(
        children: [
          /// Uncomment to see trajectories
          // Positioned(
          //   child: CustomPaint(
          //     painter: PathPainter(path: _path),
          //   ),
          // ),
          AnimatedBuilder(
            animation: _noteAndDiskAnimation,
            builder: (_, child) => Positioned(
              top: _calculatePosition(_noteAndDiskAnimation.value).dy - 70 / 3,
              left: _calculatePosition(_noteAndDiskAnimation.value).dx,
              child: RotationTransition(
                turns: _noteRotationAnimation,
                child: FadeTransition(
                  opacity: _noteOpacityAnimation,
                  child: Icon(
                    Icons.music_note,
                    color: Colors.grey[200],
                    size: _noteAndDiskAnimation.value * 25,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: get_Height(90 / 2 - 70 / 2),
            right: 0,
            child: RotationTransition(
              turns: _noteAndDiskAnimation,
              child: Container(
                padding: const EdgeInsets.all(12),
                width: get_Width(70),
                height: get_Height(70),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: _vinylGradient,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(image: AssetImage(widget.imgUrl)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //网络图片
  CachedNetworkImage _getImage() {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          image: DecorationImage(image: imageProvider),
        ),
      ),
      fit: BoxFit.fitWidth,
      imageUrl: 'assets/images/header_holder.jpg',
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, dynamic error) => const Icon(Icons.error),
    );
  }
}

/// Simple custom painter
class PathPainter extends CustomPainter {
  /// Takes path created in [_VinylDiskState]
  PathPainter({required this.path});

  /// Path to draw on the canvas
  Path path;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke
      ..color = Colors.red;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
