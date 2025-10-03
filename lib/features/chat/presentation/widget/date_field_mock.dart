import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateFieldMock extends StatelessWidget {
  final String label;
  final String value;

  const DateFieldMock({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        label:  RichText(
          text: TextSpan(
            text:  label,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.textLightGray,
            ),
            children: [

              TextSpan(
                text: '*',
                style: TextStyle(
                  color: AppColor.red,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        labelStyle: const TextStyle(
          color: Color(0xFF97A3AF),
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide:  BorderSide(color: AppColor.greyColor2.withValues(alpha: 0.6)),
        ),
      ),
      child: Text(
        value,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
    );
  }
}
