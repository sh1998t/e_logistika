import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_coler.dart';
import '../../../../gen/assets.gen.dart';

class BiometricsScreen extends StatelessWidget {
  static const String name = 'biometrics_screen';
  static const String path = '/biometrics_screen';
  const BiometricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackground,
      body: Padding(
        padding: EdgeInsets.only(
          top: 50.h,
          left: 16.w,
          right: 16.w,
          bottom: 20.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              color: AppColor.white,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                height: 206.h,
                width: 343.w,
                child: Center(
                  child: Column(
                    spacing: 3.h,
                    children: [
                      SizedBox(height: 9.h),
                      SvgPicture.asset(
                        "Assets.images.svg.id.path",
                        width: 80.w,
                        height: 80.h,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "enableBiometricLogin",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 17.sp,
                          color: AppColor.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "turnOnFaceId",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 13.sp,
                          color: AppColor.textLightGray,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "enableBiometricLogin",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 13.sp,
                          color: AppColor.textLightGray,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(343.w, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    side: BorderSide.none,
                    backgroundColor: AppColor.containerColorBiometrics,
                  ),
                  child: Text(
                    "turnOn",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 15.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(343.h, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    side: BorderSide.none,
                    backgroundColor: AppColor.buttonColorBiometrics,
                  ),
                  child: Text(
                    "later",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 15.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
