import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_coler.dart';

class LanguageOption extends StatelessWidget {
  final String? kartName;
  final String? icon;
  final bool? isSelected;
  final VoidCallback? onTap;

  const LanguageOption({
    super.key,
    this.kartName,
    this.icon,
    this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColor.payContainerColor,
        ),
        child: Center(
          child: SvgPicture.asset(
            icon ?? "",
            width: 28.w,
            height: 24.h,
          ),
        ),
      ),
      title: Text(
        kartName ?? "",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.black,
        ),
      ),
      trailing: isSelected == true
          ? SvgPicture.asset(
        "Assets.images.svg.selectedRadioButton.path",
      )
          : SvgPicture.asset(
        "Assets.images.svg.selectRadioButton.path",
      ),
      onTap: onTap,
    );
  }
}
