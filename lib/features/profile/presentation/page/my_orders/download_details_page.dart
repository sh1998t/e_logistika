import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../gen/assets.gen.dart';

class DownloadDetailsPage extends StatelessWidget {
  static const String name = 'download_details_page';
  static const String path = '/download_details_page';
  const DownloadDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle:  true,
        title: Text('Мои заказы', style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: AppColor.greyColor2
        ),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, 
            icon: SvgPicture.asset(Assets.svg.symbolsArrow.path)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Assets.images.mapImage.path,
              width: double.infinity, height: 237.h,),
            SizedBox(
              height: 29.h,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 19.w),
            child: Text('14 000 000 сум',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.blueColor2,
            ),
            ),),
            Padding(
              padding:  EdgeInsets.only(left: 19.w),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text('12 км', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Color(0xFF747474),
                      ),),
                      SizedBox(height: 4.h,),
                      Container(
                        width: 1.w,
                         height: 10.h,
                         color: Color(0xFF97A3AF),
                      ),
                      SizedBox(height: 4.h,),
                      CircleAvatar(
                        radius: 13.r,
                         backgroundColor: Color(0xFFFF9401),
                        child: SvgPicture.asset(Assets.svg.package.path,
                          width: 16.r,height: 16.r,),
                      ),
                      SizedBox(height: 4.h,),
                      Container(
                        width: 1.w,
                        height: 64.h,
                        color: Color(0xFF97A3AF),
                      ),
                      SizedBox(height: 4.h,),
                      CircleAvatar(
                        radius: 13.r,
                        backgroundColor: Color(0xFF2CA6FF),
                        child: SvgPicture.asset(Assets.svg.locations.path,
                          width: 16.r,height: 16.r,),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Холостой пробег ',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF747474),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color(0xFFD5D5D5),
                        ),
                      ),
                    ],
                  )



                ],
              ),
            )
          ],

      ),
    );
  }
}




