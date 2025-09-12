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
    return Expanded(
      child: IconButton(
        onPressed: function,
        icon: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              height: 24.h,
            ),
            Flexible(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: color,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}