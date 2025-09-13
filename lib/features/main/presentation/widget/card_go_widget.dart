import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CargoCard extends StatelessWidget {
  final String from;
  final String to;
  final String id;
  final String product;

  const CargoCard({
    super.key,
    required this.from,
    required this.to,
    required this.id,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 16.h),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
            color: AppColor.white
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline
          Column(
            children: [
              // Start point
              SizedBox(height: 5.h,),
              Container(
                width: 10.r,
                height: 10.r,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              ),
    
              // Vertical line
              Container(
                width: 2.w,
                height: 20.h,
                color: AppColor.black.withValues(alpha: 0.3),
              ),
    
              // End point
              Container(
                width: 10.r,
                height: 10.r,
                decoration:  BoxDecoration(
                  color: AppColor.black.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
    
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // From → To
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                   height: 20.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            from,
                            style:  TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.black,
                            ),
                          ),
                          SizedBox(width: 32.w,),
                          Text(
                            "ID: $id",
                            style:  TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
    
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          to,
                          style:  TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 32.w,),
                        Expanded(
                          child: Text(
                            product,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
