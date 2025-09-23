import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:e_logistika/features/home/presentation/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../gen/assets.gen.dart';

class DonePage extends StatefulWidget {
  static const String name ='done_page';
  static const String path ='/done_page';
  const DonePage({super.key});

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(

         child: Padding(
           padding: EdgeInsets.symmetric(horizontal: 16.w),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),
           Column(
             children: [
               Center(
                 child:Image.asset(Assets.images.done.path, width: 236.r,height: 236.r,fit: BoxFit.fill,),
               ),
               Text('Готово', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                 fontSize: 30.sp,
                 fontWeight: FontWeight.w600,
                 color: AppColor.blueColor
               ),),
             ],
           ),
            SizedBox(height: 32.h,),
            Text('Перевели 1 000 000 сум', style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.greyColor2,
            ),),
            Text('на  карту', style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.greyColor2,
            ),),
            SizedBox(height: 152.h,),
           Center(
             child: Column(
               children: [
                 SvgPicture.asset(Assets.svg.document.path, width: 34.r,height: 34.r,fit: BoxFit.fill,),
                 Text('Документыи детали', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                   fontSize: 10.sp,
                   fontWeight: FontWeight.w500,
                   color: AppColor.greyColor2,
                 ),)
               ],
             ),
           ),
            SizedBox(height: 40.h,),
            ButtonWidget(
                color1: Color(0xFF185CAF),
                color2: Color(0xFF104280),
                title: 'Закрыть',
              onPressed: () {
                int count = 0;
                Navigator.of(context).popUntil((route) {
                  return count++ >= 3;
                });
              },
            )
         ],
           ),
         )),
    );
  }
}
