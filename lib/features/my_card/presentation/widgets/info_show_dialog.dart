import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_coler.dart';

class InfoShowDialog extends StatelessWidget {
  const InfoShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ВАЖНО ЗНАТЬ",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              color: AppColor.black,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "Информация о карте",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.black,
            ),
            softWrap: true,
            maxLines: 15,
          ),
          SizedBox(height: 8.h),
          Text(
            "Для корректной работы сервиса:",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.black,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 5.h,
                margin: EdgeInsets.only(top: 5.h),
                width: 5.w,
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.black,
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                'Проверьте баланс и статус вашего\nномера телефона.',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black,
                ),
                softWrap: true,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 5.h,
                margin: EdgeInsets.only(top: 5.h),
                width: 5.w,
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.black,
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                'Убедитесь, что служба SMS-уведомлений\nвключена и активна. Обратитесь в банк для\nэтого.',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black,
                ),
                softWrap: true,
                maxLines: 3,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 5.h,
                margin: EdgeInsets.only(top: 5.h),
                width: 5.w,
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.black,
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                'Номер SMS-уведомлений должен\nсовпадать с номером вашего счета.',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black,
                ),
                softWrap: true,
                maxLines: 3,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 5.h,
                margin: EdgeInsets.only(top: 5.h),
                width: 5.w,
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.black,
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                'Карта не должна быть просрочена или\nзаблокирована.',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black,
                ),
                softWrap: true,
                maxLines: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
