import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../gen/assets.gen.dart';

class OrderPage extends StatefulWidget {
  static const String name ='order_page';
  static const String path ='/order_page';
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    final textStyles =Theme.of(context).textTheme.bodySmall;
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,

        title: Text('Заказ: #9874', style: textStyles!.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.greyColor3,

        ),),
      ),
      body: SingleChildScrollView(
        padding:EdgeInsets.all(20.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Text('12 июля, 2025', style: textStyles.copyWith(
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.greyColor3,
            ),),
          ),
          Center(
            child: Text('Расчетное время прибытия', style: textStyles.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.greyColor3,
            ),),
          ),
          SizedBox(height: 13.h,),
        SizedBox(
          height: 100.h,
          child:   Center(
            child: EasyStepper(
              activeStep: activeStep,
              textDirection: TextDirection.rtl,
              lineStyle: LineStyle(

                lineType: LineType.normal,
                defaultLineColor: Colors.grey.shade300,
                activeLineColor: Colors.blue,
              ),
              stepRadius: 20,
              finishedStepBackgroundColor: AppColor.blueColor3,
              finishedStepTextColor: AppColor.blueColor3,
              activeStepBackgroundColor: AppColor.blueColor3,
              unreachedStepBackgroundColor: Color(0xFFEEEEEE),
              unreachedStepTextColor: Colors.grey,
              activeStepTextColor:  AppColor.blueColor3,
              steps: const [
                EasyStep(
                  topTitle: true,
                  title: 'Принял',
                  icon: Icon(Icons.check, color: Colors.white),

                ),
                EasyStep(
                  topTitle: true,
                  title: 'Погрузка',
                  icon: Icon(Icons.local_shipping, color: Colors.white),

                ),
                EasyStep(
                  topTitle: true,
                  title: 'Доставка',
                  icon: Icon(Icons.local_mall, color: Colors.white),

                ),
                EasyStep(
                  topTitle: true,
                  title: 'Готово',
                  icon: Icon(Icons.receipt_long, color: Colors.grey),

                ),
              ],
              onStepReached: (index) => setState(() => activeStep = index),
            ),
          ),
        ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Color(0xFFF6F6F6),
                ),
                child: Center(child: SvgPicture.asset(Assets.svg.locations21.path, width: 24.w,height: 33.h,),),
              ),
              SizedBox(width: 10.w,),
              SizedBox(width: 234.w,
              child: Text('Ташкент г, Чиланзар р, Зарбдор у, 21-дом', style: textStyles.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: AppColor.greyColor2,
              ),
              maxLines: 2,
              ),
              ),
              SizedBox(width: 8.w,),
              SvgPicture.asset(Assets.svg.arrowRigth.path,
                width: 17.w,height: 31.h,fit:BoxFit.cover,
                colorFilter: ColorFilter.mode(Color(0xFFA3A5A4), BlendMode.srcIn),
              )            ],
          ),
          SizedBox(height: 13.h,),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Color(0xFFF6F6F6),
                ),
                child: Center(child: SvgPicture.asset(Assets.svg.locations33.path, width: 24.w,height: 33.h,),),
              ),
              SizedBox(width: 10.w,),
              SizedBox(width: 234.w,
              child: Text('Ташкент г, Чиланзар р, Зарбдор у, 21-дом', style: textStyles.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: AppColor.greyColor2,
              ),
              maxLines: 2,
              ),
              ),
              SizedBox(width: 8.w,),
              SvgPicture.asset(Assets.svg.arrowRigth.path,
                width: 17.w,height: 31.h,fit:BoxFit.cover,
              colorFilter: ColorFilter.mode(Color(0xFFA3A5A4), BlendMode.srcIn),
              )
            ],
          ),
          SizedBox(height: 13.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Общая сумма:', style: textStyles.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.greyColor2,

              ),),
              Text('18.000.000 сум ', style: textStyles.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.greyColor2,

              ),)
            ],
          ),
          SizedBox(height: 25.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
           Column(
             children: [
               Image.asset(Assets.images.profileTab.path,
                 height: 50.r,
                 width: 50.r,
               ),
               SizedBox(height: 10.h,),
               Text('Sanjar', style: textStyles.copyWith(
                 fontSize: 14.sp,
                 fontWeight: FontWeight.w500,
                 color: Color(0xFF353535),
               ),)
             ],
           ),
              Column(
                children: [
                  CircleAvatar(
                  radius: 25.r,
                    backgroundColor: AppColor.greyColor2.withValues(alpha: 0.07),
                    child: SvgPicture.asset(Assets.svg.phoneFill.path,
                      height: 22.r,
                      width: 22.r,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text('Вызов', style: textStyles.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF353535),
                  ),)
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColor.greyColor2.withValues(alpha: 0.07),
                    radius: 25.r,
                    child: SvgPicture.asset(Assets.svg.chatIconSvg.path,
                      height: 22.r,
                      width: 22.r,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text('Чат', style: textStyles.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF353535),
                  ),)
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                  radius: 25.r,
                    backgroundColor: AppColor.greyColor2.withValues(alpha: 0.07),

                    child: SvgPicture.asset(Assets.svg.mdiShare.path,
                      height: 22.r,
                      width: 22.r,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text('поделился', style: textStyles.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF353535),
                  ),)
                ],
              ),

            ],
          ),
          SizedBox(height: 60.h,),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              Assets.images.mapImage.path,
              width: double.infinity,
              height: 237.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.h,),
        ],
      ),

      ),
    );
  }
}
