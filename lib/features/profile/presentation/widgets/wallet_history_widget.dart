import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:e_logistika/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletHistoryWidget extends StatefulWidget {
  const WalletHistoryWidget({super.key});

  @override
  State<WalletHistoryWidget> createState() => _WalletHistoryWidgetState();
}

class _WalletHistoryWidgetState extends State<WalletHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
          SvgPicture.asset(Assets.svg.strelka.path, width: 35.r,height: 35.r,),
        SizedBox(width: 10.w,),
        Column(
          spacing: 4.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 80.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('TOSHKENT SH, AT KH...',
                    style:Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.greyColor2,
                    )),
                Text('-1 130 000 UZS',
                    style:Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.greyColor2,
                    )),
              ],),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 80.w,

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Карты ....9081',
                    style:Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.greyColor2,
                    )),
                Text('09:19',
                    style:Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.greyColor2,
                    )),
              ],),
            ),
          ],
        )
      ],
    );
  }
}
