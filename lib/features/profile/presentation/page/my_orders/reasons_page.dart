import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:e_logistika/core/router/routers_name.dart';
import 'package:e_logistika/features/home/presentation/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../creation/presentation/widgets/labeled_dashed_container.dart';
import 'descriptionInput.dart';

class ReasonsPage extends StatefulWidget {
  static const String name = 'reasons_page';
  static const String path = '/reasons_page';
  const ReasonsPage({super.key});

  @override
  State<ReasonsPage> createState() => _ReasonsPageState();
}

class _ReasonsPageState extends State<ReasonsPage> {

  @override
  Widget build(BuildContext context) {
    final textStyles =Theme.of(context).textTheme.bodySmall;
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
      title: Text('Причины', style: textStyles!.copyWith(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: AppColor.greyColor2
      ),

      ),),
     body: SingleChildScrollView(
       child: Column(
         children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w,),
          child:  Row(
            spacing: 10.w,
            children: [
              SvgPicture.asset(Assets.svg.alertTriangle.path, width: 37.r,height: 32.r,),
              SizedBox(
                width: 298.w,
                child: Text(
                  "Пожалуйста, объясните причину отмены заказа, в противном случае вам может быть начислен штраф в размере 10% от суммы заказа",
                  style: textStyles.copyWith(
                    fontSize: 14.sp,
                    color: AppColor.greyColor2,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 4,
                ),
              ),
            ],
          ),
          ),
           SizedBox(height: 21.h,),
           Container(
             width: double.infinity,
             color:AppColor.dividerColor,
             height: 0.3.h,
           ),
           SizedBox(height: 17.h,),
           Padding(
             padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 0.h),
             child: InkWell(
               onTap: (){

               },
               child: CustomPaint(
                 painter: DashedBorderPainter(color: Color(0xFF1849D6), strokeWidth: 2),
                 child: Container(
                   height: 122.h,
                   width: 337.w,
                   alignment: Alignment.center,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       SvgPicture.asset(Assets.svg.upload.path, width: 42.r,height: 42.r,),
                       SizedBox(height: 12.h,),
                       Text('Нажмите, чтобы загрузить фото',
                         style: Theme.of(context).textTheme.bodySmall!.copyWith(
                           fontSize: 12.sp,
                           fontWeight: FontWeight.w400,
                           color: AppColor.greyColor2,
                         ),)
                     ],
                   ),
                 ),
               ),
             ),
           ),
           SizedBox(height: 20.h,),
           Padding(
             padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 0.h),
             child:  DescriptionInput(
               hint: 'Pisat…',
               maxLength: 500,
               onChanged: (v) {
               },
             ),
           ),
           SizedBox(height: 60.h,),
           Padding(padding: EdgeInsets.symmetric(horizontal: 15.w),
           child: ButtonWidget(
             leadingSvg: SvgPicture.asset(Assets.svg.homeCom.path),
             backgroundColor: Color(0xFF00A8FF).withValues(alpha: 0.2),
               titleStyle: textStyles.copyWith(
                 fontSize: 14.sp,
                 fontWeight: FontWeight.w600,
                 color: Color(0xFF00A8FF),
               ),
               title:
           'Вернуться на главную страницу',
               onPressed: (){
                 int count = 0;
                 Navigator.of(context).popUntil((_) => count++ >= 4);
           }),
           ),
         SizedBox(height: 20.h,),
         Padding(
           padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 0.h),
         child:   ButtonWidget(
             color1: Color(0xFF185CAF),
             color2: Color(0xFF104280),
             title: 'Отправить',
             onPressed: (){
             context.pushNamed(RoutersName.orderPageName);
             }),
         )

         ],
       ),
     ),
    );
  }
}
