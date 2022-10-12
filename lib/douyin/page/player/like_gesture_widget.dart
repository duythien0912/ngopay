import 'dart:math';

import 'package:flutter/material.dart';

/// 视频手势封装
/// 单击：暂停
/// 连击：点赞
class LikeGestureWidget extends StatefulWidget {
  const LikeGestureWidget({
    Key? key,
    required this.child,
    this.onAddFavorite,
    this.onSingleTap,
  }) : super(key: key);

  final Function? onAddFavorite;
  final Function? onSingleTap;
  final Widget child;

  @override
  _LikeGestureWidgetState createState() => _LikeGestureWidgetState();
}

class _LikeGestureWidgetState extends State<LikeGestureWidget> {
  final GlobalKey _key = GlobalKey();
  List<Offset> icons = [];
  int lastMilliSeconds = -1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _key,
      behavior: HitTestBehavior.deferToChild,
      onDoubleTapDown: (detail) {
        _addIcon(_convertPosition(detail.globalPosition));
        widget.onAddFavorite?.call();
      },
      onDoubleTap: () {},
      onTap: () {
        widget.onSingleTap?.call();
      },
      // onTapDown: (detail) {
      //   setState(() {
      //     int currentMilliSeconds = DateTime.now().millisecondsSinceEpoch;
      //     int diff = currentMilliSeconds - lastMilliSeconds;
      //     if (diff < 500) {
      //       icons.add(_convertPosition(detail.globalPosition));
      //       widget.onAddFavorite?.call();
      //     } else if (lastMilliSeconds != -1) {
      //       widget.onSingleTap?.call();
      //     }
      //   });
      // },
      // onTapUp: (detail) {
      //   lastMilliSeconds = DateTime.now().millisecondsSinceEpoch;
      //   Future.delayed(const Duration(milliseconds: 500), () {
      //     lastMilliSeconds = -1;
      //   });
      // },
      child: widget.child,
    );
  }

  // 内部转换坐标点
  Offset _convertPosition(Offset p) {
    final getBox = _key.currentContext?.findRenderObject() as RenderBox?;
    return getBox?.globalToLocal(p) ?? Offset.zero;
  }

  void _addIcon(Offset position) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) {
        return TikTokFavoriteAnimationIcon(
          key: Key(position.toString()),
          position: position,
          onAnimationComplete: () {
            overlayEntry?.remove();
          },
        );
      },
    );
    Overlay.of(context)?.insert(overlayEntry);
  }

  Widget _getIconStack() {
    return Stack(
      children: icons
          .map<Widget>(
            (position) => TikTokFavoriteAnimationIcon(
              key: Key(position.toString()),
              position: position,
              onAnimationComplete: () {
                icons.remove(position);
              },
            ),
          )
          .toList(),
    );
  }
}

class TikTokFavoriteAnimationIcon extends StatefulWidget {
  const TikTokFavoriteAnimationIcon({
    Key? key,
    this.onAnimationComplete,
    this.position,
    this.size = 200,
  }) : super(key: key);
  final Offset? position;
  final double size;
  final Function? onAnimationComplete;

  @override
  _TikTokFavoriteAnimationIconState createState() =>
      _TikTokFavoriteAnimationIconState();
}

class _TikTokFavoriteAnimationIconState
    extends State<TikTokFavoriteAnimationIcon> with TickerProviderStateMixin {
  late AnimationController _animationController;

  double rotate = pi / 10.0 * (2 * Random().nextDouble() - 1);

  double appearDuration = 0.1;

  double dismissDuration = 0.8;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animationController.addListener(() {
      setState(() {});
    });
    startAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //开始动画
  Future<void> startAnimation() async {
    await _animationController.forward();
    widget.onAnimationComplete?.call();
  }

  @override
  Widget build(BuildContext context) {
    return widget.position == null
        ? Container()
        : Positioned(
            left: widget.position!.dx - widget.size / 2,
            top: widget.position!.dy - widget.size,
            child: _getBody(),
          );
  }

  //获取动画的值
  double get value => _animationController.value;

  double get opacity {
    if (value < appearDuration) {
      return 0.9 / appearDuration * value;
    }
    if (value < dismissDuration) {
      return 0.9;
    }
    final res = 0.9 - (value - dismissDuration) / (1 - dismissDuration);
    return res < 0 ? 0 : res;
  }

  double get scale {
    if (value <= 0.5) {
      return 0.6 + value / 0.5 * 0.5;
    } else if (value <= 0.8) {
      return 1.1 * (1 / 1.1 + (1.1 - 1) / 1.1 * (value - 0.8) / 0.25);
    } else {
      return 1 + (value - 0.8) / 0.2 * 0.5;
    }
  }

  Transform _getBody() {
    return Transform.rotate(
      angle: rotate,
      child: Opacity(
        opacity: opacity,
        child: Transform.scale(
          alignment: Alignment.bottomCenter,
          scale: scale,
          child: _getContent(),
        ),
      ),
    );
  }

  ShaderMask _getContent() {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect bounds) => RadialGradient(
        center: Alignment.topLeft.add(const Alignment(0.5, 0.5)),
        colors: const [
          Color(0xffEF6F6F),
          Color(0xffF03E3E),
        ],
      ).createShader(bounds),
      child: _getChild(),
    );
  }

  Icon _getChild() {
    return Icon(
      Icons.favorite_rounded,
      size: widget.size,
    );
  }
}
