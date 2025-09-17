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
            "IMPORTANT TO KNOW",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              color: AppColor.black,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "myCardInfoText",
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
            "For the service to work correctly:",
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
                'Check the balance and status of your\nphone \nnumber.',
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
                'Make sure that the SMS notification service is \nenabled and active. Contact your bank to do\n this.',
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
                'The SMS notification number must be the \nsame as your account number.',
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
                'The card must not have expired or been \nblocked.',
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
