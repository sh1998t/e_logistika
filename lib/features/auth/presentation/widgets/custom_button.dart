import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class AppButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final bool? isLoading;
  final VoidCallback? onLongPress;
  final TextStyle? titleStyle;
  final BorderRadiusGeometry? borderRadius;
  const AppButton({
    super.key,
    required this.title,
    this.titleColor,
    this.backgroundColor,
    required this.onPressed,
    this.height,
    this.width,
    this.isLoading,
    this.onLongPress,
    this.titleStyle,
    this.borderRadius
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.h,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            backgroundColor: backgroundColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(7.r),
            )
        ),
        child:
        (isLoading ?? false)
            ? const CircularProgressIndicator.adaptive(backgroundColor: Colors.white,)
            : Text(
          title,
          style:
          titleStyle ??
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: titleColor ?? AppColor.white,
                fontSize: 17.sp,
              ),
        ),
      ),
    );
  }
}



