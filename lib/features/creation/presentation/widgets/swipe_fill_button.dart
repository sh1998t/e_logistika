import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SwipeFillButton extends StatefulWidget {
  final String title;
  final TextStyle? titleStyle;
  final SvgPicture? leadingSvg;

  final Color color1;
  final Color color2;


  final Color fillStart;
  final Color fillEnd;

  final double height;
  final double borderRadius;
  final Duration animateDuration;
  final VoidCallback onCompleted;

   SwipeFillButton({
    super.key,
    required this.title,
    required this.onCompleted,
    this.titleStyle,
    this.leadingSvg,
    this.color1 = const Color(0xFF285CAF),
    this.color2 = const Color(0xFF104280),
    this.fillStart = const Color(0xFF55A2F5),
    this.fillEnd   = const Color(0xFF2B64B0),
    this.height =56,
    this.borderRadius = 16,
    this.animateDuration = const Duration(milliseconds: 420),
  });

  @override
  State<SwipeFillButton> createState() => _SwipeFillButtonState();
}

class _SwipeFillButtonState extends State<SwipeFillButton>
    with SingleTickerProviderStateMixin {
  double _progress = 0.0; // 0..1
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: widget.animateDuration)
      ..addListener(() => setState(() {
        _progress = _ctrl.value;
      }));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _animateTo(double target,
      {VoidCallback? andThen, Duration? duration}) {
    _ctrl.duration = duration ?? widget.animateDuration;
    _ctrl.animateTo(
      target.clamp(0.0, 1.0),
      curve: Curves.easeInOutCubic,
    ).whenComplete(() => andThen?.call());
  }

  void _complete() {
    _animateTo(1.0, andThen: widget.onCompleted);
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(widget.borderRadius);

    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;

      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          // автозаливка по тапу
          if (_progress < 1) _complete();
        },
        onHorizontalDragUpdate: (d) {
          final delta = d.localPosition.dx;
          final next = (delta / width).clamp(0.0, 1.0);
          setState(() => _progress = next);
        },
        onHorizontalDragEnd: (_) {
          if (_progress >= 0.9) {
            _complete();
          } else {
            // откат назад
            _animateTo(0.0);
          }
        },
        child: ClipRRect(
          borderRadius: radius,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              // БАЗОВЫЙ ГРАДИЕНТ (тёмный)
              Container(
                height: widget.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [widget.color1, widget.color2],
                  ),
                ),
              ),

              // СВЕТЛАЯ ЗАЛИВКА (растёт слева направо)
              FractionallySizedBox(
                heightFactor: 1,
                widthFactor: _progress,
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        widget.fillStart,
                        widget.fillEnd.withOpacity(0.85),
                      ],
                    ),
                  ),
                ),
              ),

              // КОНТЕНТ: стрелки + текст
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // легкая анимация «дрожи» стрелок при прогрессе
                    Transform.translate(
                      offset: Offset(6 * _progress, 0),
                      child: Opacity(
                        opacity: math.max(0.6, 1.0 - 0.15 * _progress),
                        child: widget.leadingSvg ??
                            const SizedBox.shrink(),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: (widget.titleStyle ??
                            Theme.of(context).textTheme.titleMedium)
                            ?.copyWith(
                          color: Colors.white.withOpacity(
                              0.85 + 0.15 * _progress), // чуть ярче к концу
                          fontWeight: FontWeight.w700,
                        ) ??
                            const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                        child: Text(
                          widget.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
