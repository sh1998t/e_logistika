import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:e_logistika/features/chat/presentation/widget/rich_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateTwoPage extends StatefulWidget {
  static const String name = 'create_two_page';
  static const String path = '/create_two_page';
  const CreateTwoPage({super.key});

  @override
  State<CreateTwoPage> createState() => _CreateTwoPageState();
}

class _CreateTwoPageState extends State<CreateTwoPage> {
  bool checkIcon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,

        centerTitle: true,
        title: Text(
          'Создать заказ',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppColor.greyColor2,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 109.w,
                  child: RichTextField(
                    labelText: 'Время',
                    height: 46.h,
                  ),
                ),
                SizedBox(width: 10.w),
                SizedBox(
                  width: 222.w,
                  child: RichTextField(
                    labelText: 'Дата*',
                    height: 46.h,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.h),

            Row(
              children: [
                SizedBox(
                  width: 109.w,
                  child: RichTextField(
                    labelText: 'Время',
                    height: 46.h,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10.w),
                SizedBox(
                  width: 222.w,
                  child: RichTextField(
                    labelText: 'Дата*',
                    height: 46.h,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.h),

            /// Checkbox + text
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      checkIcon = !checkIcon;
                    });
                  },
                  icon: checkIcon
                      ? Icon(
                    Icons.check_box,
                    color: AppColor.blueColor2,
                    size: 21.r,
                  )
                      : Container(
                    height: 16.r,
                    width: 16.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.r),
                      color: AppColor.blueColor2,
                    ),
                  ),
                ),
                Text(
                  'С НДС',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.greyColor2,
                  ),
                )
              ],
            ),

            SizedBox(height: 10.h),

            Row(
              children: [
                SizedBox(
                  width: 109.w,
                  child: RichTextField(
                    labelText: 'Вес груза (т)',
                    height: 46.h,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10.w),
                SizedBox(
                  width: 222.w,
                  child: RichTextField(
                    labelText: 'Объем груза (м³)',
                    height: 46.h,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            Text(
              'Загрузите изображение продукта ',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.greyColor2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
