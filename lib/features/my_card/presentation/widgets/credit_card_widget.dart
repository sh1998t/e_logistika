import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_coler.dart';
import '../../../../gen/assets.gen.dart';
import 'main_text_fielid.dart';

class CreditCardWidget extends StatelessWidget {
  final String? cardHolderFullName;
  final String? cardNumber;
  final String? validFrom;

  final String? url;
  final String? logoUrl;
  final VoidCallback? onDismiss;

  const CreditCardWidget({
    super.key,
    this.cardHolderFullName,
    this.cardNumber,
    this.validFrom,
    this.onDismiss,
    this.logoUrl,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.33,
        children: [
          SizedBox(width: 5.w),
          CustomSlidableAction(
            padding: const EdgeInsets.all(0),
            onPressed: (context) async {
              final bool? confirmDelete = await showModalBottomSheet<bool>(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                ),
                builder: (BuildContext context) {
                  return Container(
                    height: 375.h,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        CircleAvatar(
                          radius: 45.r,
                          backgroundColor: AppColor.containerColor,
                          child: Center(
                            child: SvgPicture.asset(
                              "Assets.images.svg.edit.path",
                              width: 36.w,
                              height: 36.h,
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                AppColor.checkColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          'Rename the card',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            fontSize: 20.sp,
                            color: AppColor.checkColor,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 20.h),
                        MainTextField(
                          title: 'Card name',
                          height: 48.h,
                          width: 343.w,
                          keyboardType: TextInputType.text,
                          hintText: 'Pay fines',
                        ),
                        SizedBox(height: 15.h),
                        Row(
                          children: [
                            OutlinedButton(
                              onPressed: () => Navigator.pop(context),
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(167.w, 52.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                side: BorderSide.none,
                                backgroundColor: AppColor.cancelColor,
                              ),
                              child: Text(
                                'Cancel',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall!.copyWith(
                                  fontSize: 17.sp,
                                  color: AppColor.checkColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(167.w, 52.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                side: BorderSide.none,
                                backgroundColor:
                                AppColor.containerColorBiometrics,
                              ),
                              child: Text(
                                'Apply',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall!.copyWith(
                                  fontSize: 17.sp,
                                  color: AppColor.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  );
                },
              );
            },
            backgroundColor: AppColor.scaffoldBackground,
            foregroundColor: AppColor.white,
            child: Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: AppColor.containerColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "Assets.images.svg.edit.path",
                  width: 20.w,
                  height: 20.h,
                  colorFilter: ColorFilter.mode(
                    AppColor.checkColor,
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(width: 5.w),
          CustomSlidableAction(
            padding: const EdgeInsets.all(0),
            onPressed: (context) async {
              final bool? confirmDelete = await showModalBottomSheet<bool>(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                ),
                builder: (BuildContext context) {
                  return Container(
                    height: 295.h,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        CircleAvatar(
                          radius: 40.r,
                          backgroundColor: AppColor.containerColor,
                          child: Center(
                            child: SvgPicture.asset(
                              "Assets.images.svg.dalete.path",
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          'Are you sure you want to delete this card?',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            fontSize: 20.sp,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            OutlinedButton(
                              onPressed: () => Navigator.pop(context),
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(167.w, 52.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                side: BorderSide.none,
                                backgroundColor: AppColor.cancelColor,
                              ),
                              child: Text(
                                'Cancel',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall!.copyWith(
                                  fontSize: 17.sp,
                                  color: AppColor.checkColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            OutlinedButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(167.w, 52.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                side: BorderSide.none,
                                backgroundColor:
                                AppColor.containerColorBiometrics,
                              ),
                              child: Text(
                                'Yes, delete',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall!.copyWith(
                                  fontSize: 17.sp,
                                  color: AppColor.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  );
                },
              );

              if (confirmDelete == true) {
                onDismiss?.call();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$cardHolderFullName o‘chirildi')),
                );
              }
            },
            backgroundColor: AppColor.scaffoldBackground,
            foregroundColor: AppColor.white,
            child: Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: AppColor.containerColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "Assets.images.svg.dalete.path",
                  width: 16.w,
                  height: 16.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 343.w,
                height: 190.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Image.asset("$url", fit: BoxFit.fill),
              ),
              Positioned(
                top: 16.h,
                left: 16.w,
                child: Text(
                  "$cardHolderFullName",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColor.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                top: 80.h,
                left: 16.w,
                child: Text(
                  "$cardNumber",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColor.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
              ),
              Positioned(
                bottom: 16.h,
                left: 16.w,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Card Holder Name",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          "HILLERY NEVELIN",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            color: AppColor.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 32.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expired",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          "$validFrom",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            color: AppColor.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 16.h,
                right: 16.w,
                child: SvgPicture.asset("$logoUrl", height: 24.h, width: 24.w),
              ),
              Positioned(
                top: 16.h,
                right: 16.w,
                child: SvgPicture.asset("Assets.images.svg.creditCardLogo.path"),
              ),
            ],
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
