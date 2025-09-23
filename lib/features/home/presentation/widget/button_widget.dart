import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_coler.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final Color? color1;
  final Color? color2;
  final Color? backgroundColor;
  final Gradient? gradient;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final bool? isLoading;
  final VoidCallback? onLongPress;
  final TextStyle? titleStyle;
  final BorderRadiusGeometry? borderRadius;

  /// Yangi qo‘shilgan parametrlari:
  final Widget? leadingSvg;
  final Widget? trailingSvg;

  const ButtonWidget({
    super.key,
    required this.title,
    this.titleColor,
    this.color1,
    this.color2,
    this.backgroundColor,
    this.gradient,
    required this.onPressed,
    this.height,
    this.width,
    this.isLoading,
    this.onLongPress,
    this.titleStyle,
    this.borderRadius,
    this.leadingSvg,
    this.trailingSvg,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadiusGeometry radius =
        borderRadius ?? BorderRadius.circular(7.r);

    return SizedBox(
      height: height ?? 50.h,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor:
          (gradient != null || (color1 != null && color2 != null))
              ? Colors.transparent
              : (backgroundColor ?? Theme.of(context).primaryColor),
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: radius),
        ),
        child: Ink(
          decoration: (gradient != null || (color1 != null && color2 != null))
              ? BoxDecoration(
            gradient: gradient ??
                LinearGradient(
                  colors: [color1!, color2!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
            borderRadius: radius,
          )
              : null,
          child: Container(
            alignment: Alignment.center,
            child: (isLoading ?? false)
                ? const CircularProgressIndicator.adaptive(
              backgroundColor: Colors.white,
            )
                : Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: leadingSvg == null && trailingSvg == null
                        ? MainAxisAlignment.center
                        : leadingSvg == null
                        ? MainAxisAlignment.start
                        : trailingSvg == null
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceBetween,

                    children: [
                  if (leadingSvg != null) ...[
                    leadingSvg!,
                    SizedBox(width: 8.w),
                  ],
                  Text(
                    title,
                    style: titleStyle ??
                        Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                          color: titleColor ?? AppColor.white,
                          fontSize: 17.sp,
                        ),
                  ),
                  if (trailingSvg != null) ...[
                    SizedBox(width: 24.w),
                    trailingSvg!,
                  ],
                                ],
                              ),
                ),
          ),
        ),
      ),
    );
  }
}
