import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:e_logistika/features/home/presentation/widget/button_widget.dart';
import 'package:e_logistika/features/my_card/presentation/widgets/main_text_fielid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../gen/assets.gen.dart';
import '../widget/rich_text_field.dart';

class ChangePricePage extends StatefulWidget {
  static const String name ='change_price_page';
  static const String path ='/change_price_page';
  const ChangePricePage({super.key});

  @override
  State<ChangePricePage> createState() => _ChangePricePageState();
}

class _ChangePricePageState extends State<ChangePricePage> {
  final TextEditingController priceController = TextEditingController();

  bool priceEdit = true;
  bool checkIcon = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Изменить цену',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.greyColor2,
          ),
        ),
      ),
      backgroundColor: AppColor.white,
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            priceEdit ==true
                ? RichTextField(
              labelText: "Цена",
              isRequired: true,
              controller: priceController,
              keyboardType: TextInputType.number,
              suffix: Padding(
                padding:  EdgeInsets.only(right: 10.w, top: 0.h),
                child:
                TextButton(
                  onPressed: (){
                    setState(() {
                      priceEdit= !priceEdit;
                    });
                  },
                  child: Text('| изменить', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF718093)
                ),),)
              ),
            )
                : Row(
                  children: [
                    SizedBox(
                      width: 216.w,
                      child: MainTextField(

                        controller: priceController,
                        keyboardType: TextInputType.number,

                                  ),
                    ),
                    SizedBox(width: 10.w,),
                    SizedBox(
                      width: 113.w,
                      child: ButtonWidget(
                        size: 3.w,
                       height: 46.h,
                       titleStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                         fontSize: 12.sp, fontWeight: FontWeight.w500,
                         color: AppColor.white,

                       ),
                        backgroundColor: Color(0xFF0097E6),
                          title: "Подтверждение",
                          onPressed: (){
                            setState(() {
                              priceEdit = !priceEdit;
                            });
                          }),
                    )
                  ],
                ),
            SizedBox(height: 16.h),
            RichTextField(
              labelText: "Дата",
              isRequired: true,
            ),
            SizedBox(height: 16.h),
           Row(
             children: [
               SizedBox(
                 width: 160.w,
                 child: RichTextField(
                   labelText: "Вес груза (т)",
                   isRequired: true,

                   keyboardType: TextInputType.number,
                 ),
               ),
               SizedBox(width: 17.h),
               SizedBox(
                 width: 160.w,
                 child: RichTextField(
                   labelText: "Объем груза (м³)",
                   isRequired: true,
                   keyboardType: TextInputType.number,
                 ),
               ),
             ],
           ),
             SizedBox(height: 15.h,),
             Container(
               padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 13.5.h),
               width: double.infinity,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8.r),
                 color: AppColor.greyColor,
               ),
               child: Text('500 ящиков яблок', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                 fontSize: 16.sp,
                 fontWeight: FontWeight.w500,
                 color: AppColor.greyColor2.withValues(alpha: 0.6),
               ),),
             ),
            SizedBox(height: 15.h,),
             Container(
               padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 13.5.h),
               width: double.infinity,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8.r),
                 color: AppColor.greyColor,
               ),
               child: Text('Жесткий борт', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                 fontSize: 16.sp,
                 fontWeight: FontWeight.w500,
                 color: AppColor.greyColor2.withValues(alpha: 0.6),
               ),),
             ),
            SizedBox(height: 15.h,),
             Container(
               padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 13.5.h),
               width: double.infinity,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8.r),
                 color: AppColor.greyColor,
               ),
               child: Text('Фрукты', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                 fontSize: 16.sp,
                 fontWeight: FontWeight.w500,
                 color: AppColor.greyColor2.withValues(alpha: 0.6),
               ),),
             ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){
                      setState(() {
                        checkIcon = !checkIcon;
                      });
                    },
                    icon: checkIcon == true
                        ? Icon(
                      Icons.check_box,
                      color: AppColor.blueColor2,
                      size: 21.r,
                      fontWeight: FontWeight.w700,)
                        : Container(
                      height: 16.r,
                      width: 16.r,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.r),
                          color: AppColor.blueColor2
                      ),
                    ),
                  ),
                  Text('С НДС',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.greyColor2,
                  ),)
                ],

              ),
                SvgPicture.asset(Assets.svg.infoIcon.path, width: 20.r,height: 20.r,fit: BoxFit.fill,),

              ],
            ),
    SizedBox(height: 169.h,),
            ButtonWidget(
                color1: Color(0xFF185CAF),
                color2: Color(0xFF104280),
                title: 'Готовый', onPressed: (){

            })
          ],
        ),
      ),
    );
  }
}
