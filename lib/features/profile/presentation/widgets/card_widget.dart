import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_coler.dart';


class CardWidget extends StatelessWidget {
  final String name;
  final String title;
  final VoidCallback? onDismiss;

  const CardWidget({
    super.key,
    required this.name,
    required this.title,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.23,
        children: [
          CustomSlidableAction(
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
                    height: 300.h,
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
                          child: SvgPicture.asset(
                            " Assets.images.svg.dalete.path, ",
                            width: 36.h,
                            height: 28.w,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          "areYouSureWant",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 16.sp,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(160.h, 50.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                side: BorderSide.none,
                                backgroundColor: AppColor.devicesButtonColor,
                              ),
                              child: Text(
                                "cancel",
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  fontSize: 15.sp,
                                  color: AppColor.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(160.h, 50.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                side: BorderSide.none,
                                backgroundColor: AppColor.devicesButtonColor,
                              ),
                              child: Text(
                                "finish",
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  fontSize: 15.sp,
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
                  SnackBar(content: Text('$name o‘chirildi')),
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
                  " Assets.images.svg.dalete.path, ",
                  width: 16.w,
                  height: 16.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
      child: Card(
        color: AppColor.white,
        child: Container(
          padding: EdgeInsets.only(left: 10.w, top: 8.h, right: 10.w),
          height: 81.h,
          width: 343.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
          child: Column(
            spacing: 4.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '21.11.2024 18:01',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.green,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Text(
                "resident: 13.11.2024",
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
