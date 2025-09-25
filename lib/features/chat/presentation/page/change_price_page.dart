import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/rich_text_field.dart';

class ChangePricePage extends StatelessWidget {
  static const String name ='change_price_page';
  static const String path ='/change_price_page';
  const ChangePricePage({super.key});

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
            RichTextField(
              labelText: "Цена",
              isRequired: true,
              keyboardType: TextInputType.number,
              suffix: Padding(
                padding:  EdgeInsets.only(right: 10.w, top: 0.h),
                child:
                TextButton(
                  onPressed: (){},
                  child: Text('| изменить', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF718093)
                ),),)
              ),
            ),
            SizedBox(height: 16.h),
            RichTextField(
              labelText: "Дата",
              isRequired: true,
            ),
            SizedBox(height: 16.h),
            RichTextField(
              labelText: "Вес груза (т)",
              isRequired: true,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.h),
            RichTextField(
              labelText: "Объем груза (м³)",
              isRequired: true,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
