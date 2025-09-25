import 'package:e_logistika/core/router/routers_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_coler.dart';
import '../../../../gen/assets.gen.dart';

class ChatAppbarWidget extends StatefulWidget {
  final bool active;
  final GestureTapCallback onTap;
  const ChatAppbarWidget({super.key , required this.active, required this.onTap});

  @override
  State<ChatAppbarWidget> createState() => _ChatAppbarWidgetState();
}

class _ChatAppbarWidgetState extends State<ChatAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return  (widget.active == false)
        ? Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22.r,
            backgroundImage: const NetworkImage(
                "https://randomuser.me/api/portraits/men/32.jpg"),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Валижон",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.black,
                        )),
                    SizedBox(width: 11.w,),
                    Padding(
                      padding:  EdgeInsets.only(top: 3.h),
                      child: Icon(Icons.circle,
                          size: 6.r, color: AppColor.greenColor),
                    ),
                    SizedBox(width: 4.w),
                    Text("online",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 12.sp, color: AppColor.greenColor, fontWeight: FontWeight.w400)),
                  ],
                ),
                SizedBox(height: 5.h,),
                Row(
                  children: List.generate(
                      5,
                          (index) => const Icon(Icons.star,
                          color: Colors.orange, size: 18)),
                ),
              ],
            ),
          ),

          Row(
            children: [
              Container(
                width: 48.r,
                height: 48.r,
                decoration: BoxDecoration(
                  color: AppColor.greenColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Assets.svg.checkSquare2.path,
                    width: 24.r,
                    height: 24.r,
                    colorFilter: ColorFilter.mode(AppColor.white, BlendMode.srcIn),
                  ),
                ),
              ),
              SizedBox(width: 12.w,),
              InkWell(
                onTap: widget.onTap,
                child: Container(
                  width: 48.r,
                  height: 48.r,
                  decoration: BoxDecoration(
                    color: AppColor.greyColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.svg.moreHorizontal.path,
                      width: 24.r,
                      height: 24.r,
                    ),
                  ),
                ),
              ),
            ],
          ),

        ]
    )
        : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Row(
           children: [
             CircleAvatar(
               radius: 22.r,
               backgroundImage: const NetworkImage(
                   "https://randomuser.me/api/portraits/men/32.jpg"),
             ),
             SizedBox(width: 12.w),
             Expanded(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       Text("Валижон",
                           style: Theme.of(context).textTheme.bodySmall!.copyWith(
                             fontSize: 16.sp,
                             fontWeight: FontWeight.w400,
                             color: AppColor.black,
                           )),
                       SizedBox(width: 11.w,),
                       Padding(
                         padding:  EdgeInsets.only(top: 3.h),
                         child: Icon(Icons.circle,
                             size: 6.r, color: AppColor.greenColor),
                       ),
                       SizedBox(width: 4.w),
                       Text("online",
                           style: Theme.of(context).textTheme.bodySmall!.copyWith(
                               fontSize: 12.sp, color: AppColor.greenColor, fontWeight: FontWeight.w400)),
                     ],
                   ),
                   SizedBox(height: 5.h,),
                   Row(
                     children: List.generate(
                         5,
                             (index) => const Icon(Icons.star,
                             color: Colors.orange, size: 18)),
                   ),
                 ],
               ),
             ),
           ],
         ),
           SizedBox(height: 15.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 1-button
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 7.h),
                  decoration: BoxDecoration(
                    color: AppColor.greenBase30,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.svg.checkSquare2.path,
                        width: 20.r,
                        height: 20.r,
                        colorFilter: ColorFilter.mode(AppColor.greenBase, BlendMode.srcIn),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Выбрать этого водителя",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.greyColor2,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: InkWell(
                  //
                  onTap: (){
                    context.pushNamed(RoutersName.changePricePageName);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 51.w, vertical: 7.h),

                    decoration: BoxDecoration(
                      color: AppColor.greyBlue30,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.svg.editSvgrepo.path,
                          width: 20.r,
                          height: 20.r,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Изменить цену",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.blueColor,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

        ]
    );
  }
}
