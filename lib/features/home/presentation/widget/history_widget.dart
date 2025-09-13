import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_coler.dart';
import 'card_widget.dart';

class HistoryTab extends StatelessWidget {
  final VoidCallback onBackPressed;

  const HistoryTab({
    Key? key,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h,),
        CardWidget(
        titleColor: AppColor.titleColor2,
        color: AppColor.buttonColor2, time: '12.09.2003',
        id: 'ID: ASF3645', title: 'История'),
        Row(
          spacing: 10.w,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SvgPicture.asset('assets/svg/document.svg',
            width: 20.r,height: 20.r,fit: BoxFit.fill,),
          Text('Отмененный заказ  11.09.2025',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.black,
            ),)
        ],),
        CardWidget(
            titleColor: AppColor.titleColor2,
            color: AppColor.buttonColor2, time: '12.09.2003',
            id: 'ID: ASF3645', title: 'История'),
      ],
    );
  }
}