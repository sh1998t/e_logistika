import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomItem extends StatelessWidget {
  const BottomItem({
    super.key,
    required this.icon,
    required this.title,
    required this.function,
    required this.color,
  });

  final String icon;
  final String title;
  final VoidCallback function;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: function,
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: 22.r,
            width: 22.r,
          ),
          Flexible(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}