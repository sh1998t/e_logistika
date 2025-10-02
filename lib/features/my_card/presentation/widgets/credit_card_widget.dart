import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:injectable/injectable.dart';

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
  final VoidCallback? onDelete;

  const CreditCardWidget({
    super.key,
    this.cardHolderFullName,
    this.cardNumber,
    this.validFrom,
    this.onDismiss,
    this.onDelete,
    this.logoUrl,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.25,
        children: [
          // Delete button
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
                    height: 292.h,
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
                          backgroundColor: Color(0xFFF8F8F8),
                          child: Center(
                            child: Icon(
                              Icons.delete_outline,
                              size: 36.r,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),

                        Text(
                          'Вы уверены, что хотите удалить эту карту?',
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 20.sp,
                            color: AppColor.greyColor2,
                            fontWeight: FontWeight.w700,
                          ),
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
                                'Отмена',
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
                              onPressed: () {
                                Navigator.pop(context, true);
                                onDelete?.call();
                              },
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(167.w, 52.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                side: BorderSide.none,
                                backgroundColor: Colors.red,
                              ),
                              child: Text(
                                'Удалить',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall!.copyWith(
                                  fontSize: 17.sp,
                                  color: AppColor.white,
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
            backgroundColor: Colors.transparent,
            foregroundColor: AppColor.white,
            child: Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  Assets.svg.delete.path,
                  width: 20.w,
                  height: 20.h,

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
          Container(
            width: 343.w,
            height: 111.h,
            padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 19.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Color(0xFF1B324C),

            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      "$cardHolderFullName",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColor.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "**** **${cardNumber?.substring(cardNumber!.length - 4) ?? '****'}",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColor.white,
                              fontSize: 21.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 2,
                            ),

                          ),




                        ],
                      ),
                    ),
                    // SvgPicture.asset(Assets.svg.logo2.path)
                  ],
                ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ".......... UZS",
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(
                      color: AppColor.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                    ),
                  ),
                   Container(
                     padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(4.r),
                       color: AppColor.white
                     ),
                     child: SvgPicture.asset(Assets.svg.uzcardss.path, width: 20.w, height: 28.h,fit: BoxFit.cover,
                     ),
                     ),

                ],
              )
              ],
            )
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
