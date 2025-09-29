import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_coler.dart';

class AnimatedGradientButton extends StatefulWidget {
  final String title;
  final Color? titleColor;
  final Color? color1;
  final Color? color2;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final bool? isLoading;
  final double? size;
  final TextStyle? titleStyle;
  final BorderRadiusGeometry? borderRadius;

  final Widget? leadingSvg;
  final Widget? trailingSvg;

  const AnimatedGradientButton({
    super.key,
    required this.title,
    this.titleColor,
    this.color1,
    this.color2,
    required this.onPressed,
    this.height,
    this.width,
    this.size,
    this.isLoading,
    this.titleStyle,
    this.borderRadius,
    this.leadingSvg,
    this.trailingSvg,
  });

  @override
  State<AnimatedGradientButton> createState() => _AnimatedGradientButtonState();
}

class _AnimatedGradientButtonState extends State<AnimatedGradientButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadiusGeometry radius =
        widget.borderRadius ?? BorderRadius.circular(7.r);

    return GestureDetector(
      onTap: widget.onPressed,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            height: widget.height ?? 50.h,
            width: widget.width ?? double.infinity,
            decoration: BoxDecoration(
              borderRadius: radius,
              gradient: LinearGradient(
                colors: [
                  widget.color1 ?? Theme.of(context).primaryColor,
                  widget.color2 ?? Colors.blue,
                ],
                begin: Alignment(-1.0 + 2.0 * _controller.value, 0), // chapdan → o‘ngga
                end: Alignment(1.0 + 2.0 * _controller.value, 0),
              ),
            ),
            child: Center(
              child: (widget.isLoading ?? false)
                  ? const CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              )
                  : Row(
                mainAxisAlignment: widget.leadingSvg == null &&
                    widget.trailingSvg == null
                    ? MainAxisAlignment.center
                    : widget.leadingSvg == null
                    ? MainAxisAlignment.start
                    : widget.trailingSvg == null
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.leadingSvg != null) ...[
                    widget.leadingSvg!,
                    SizedBox(width: 8.w),
                  ],
                  Text(
                    widget.title,
                    style: widget.titleStyle ??
                        Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: widget.titleColor ?? AppColor.white,
                          fontSize: 17.sp,
                        ),
                  ),
                  if (widget.trailingSvg != null) ...[
                    SizedBox(width: 24.w),
                    widget.trailingSvg!,
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
