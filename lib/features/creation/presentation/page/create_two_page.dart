import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:e_logistika/features/chat/presentation/widget/rich_text_field.dart';
import 'package:e_logistika/features/home/presentation/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../gen/assets.gen.dart';
import '../widgets/animated_widget.dart';
import '../widgets/date_time_widget.dart';
import '../widgets/labeled_dashed_container.dart';
import 'package:intl/intl.dart';

import '../widgets/searchable_dropdown_field.dart';

class CreateTwoPage extends StatefulWidget {
  static const String name = 'create_two_page';
  static const String path = '/create_two_page';
  const CreateTwoPage({super.key});

  @override
  State<CreateTwoPage> createState() => _CreateTwoPageState();
}

class _CreateTwoPageState extends State<CreateTwoPage> {
  bool checkIcon = true;
  DateTime? picked;
  String get dateStr =>
      picked == null ? '' : DateFormat('dd.MM.yyyy', 'ru').format(picked!);
  String get timeStr =>
      picked == null ? '' : DateFormat('HH:mm', 'ru').format(picked!);
  final transportTypes = [
    'Автобетоносмеситель',
    'Самосвал',
    'Топливозаправщик',
    'Грузовик',
    'Контейнеровоз',
    'Рефрижератор',
    'Продуктовоз',
    'Мусоровоз',
    'Малотоннажный грузовик',
  ];
  String? selected;
  final transportTypes2 = [
    'Автобетоносмеситель',
    'Самосвал',
    'Топливозаправщик',
    'Грузовик',
    'Контейнеровоз',
    'Рефрижератор',
    'Продуктовоз',
    'Мусоровоз',
    'Малотоннажный грузовик',
  ];
  String? selected2;
  late final isEmpty = selected?.isEmpty ?? true;
  bool loading =false;

  @override
  Widget build(BuildContext context) {
    print(isEmpty);
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
        padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h,),
              Row(
                children: [
                  SizedBox(
                    width: 109.w,
                    child: OutlinedValueField(
                      label: 'Время',
                      value: picked == null ? '—' : DateFormat('HH:mm', 'ru').format(picked!),
                      requiredMark: true,
                      focused: true,
                      onTap: () async {
                        final res = await showDateTimePickerDialog(
                          context,
                          initialDateTime: picked ?? DateTime.now(),
                        );
                        if (res != null) setState(() => picked = res);
                      },
                    ),
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    width: 217.w,
                    child: OutlinedValueField(
                      label: 'Дата',
                      value: picked == null ? '—' : DateFormat('dd.MM.yyyy', 'ru').format(picked!),
                      requiredMark: true,
                      focused: true,
                      onTap: () async {
                        final res = await showDateTimePickerDialog(
                          context,
                          initialDateTime: picked ?? DateTime.now(),
                        );
                        if (res != null) setState(() => picked = res);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),

              Row(
                children: [
                  SizedBox(
                    width: 109.w,
                    child: OutlinedValueField(
                      label: 'Время',
                      value: picked == null ? '—' : DateFormat('HH:mm', 'ru').format(picked!),
                      requiredMark: true,
                      focused: true,
                      onTap: () async {
                        final res = await showDateTimePickerDialog(
                          context,
                          initialDateTime: picked ?? DateTime.now(),
                        );
                        if (res != null) setState(() => picked = res);
                      },
                    ),
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    width: 217.w,
                    child: OutlinedValueField(
                      label: 'Дата',
                      value: picked == null ? '—' : DateFormat('dd.MM.yyyy', 'ru').format(picked!),
                      requiredMark: true,
                      focused: true,
                      onTap: () async {
                        final res = await showDateTimePickerDialog(
                          context,
                          initialDateTime: picked ?? DateTime.now(),
                        );
                        if (res != null) setState(() => picked = res);
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),

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
                    width: 160.w,
                    child: RichTextField(
                      isRequired: true,
                      labelText: 'Вес груза (т)',
                      height: 46.h,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    width: 160.w,
                    child: RichTextField(
                      isRequired: true,
                      labelText: 'Объем груза (м³)',

                      height: 46.h,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              RichText(
                text: TextSpan(
                  text:  'Загрузите изображение продукта',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.greyColor2,
                  ),
                  children: [

                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: AppColor.red,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 5.h,),
              InkWell(
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
              SizedBox(height: 16.h,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 13.5.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColor.greyColor,
                ),
                child: Text('О грузе ', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.greyColor2.withValues(alpha: 0.6),
                ),),
              ),
              SizedBox(height: 16.h,),

              TransportDropdownField(
                items: transportTypes,
                initialValue: selected,
                onChanged: (v) => setState(() => selected = v),
              ),
              SizedBox(height: 16.h,),

              TransportDropdownField(
                items: transportTypes2,
                initialValue: selected2,
                onChanged: (v) => setState(() => selected = v),
              ),
              SizedBox(height: 16.h,),
              RichText(
                text: TextSpan(
                  text:  'Способ оплаты',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.greyColor2,
                  ),
                  children: [

                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        color: AppColor.red,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h,),
              Divider(color: Color(0XFF97A3AF), thickness: 1, height: 0.5.h),
              (isEmpty== false)?SizedBox(height: 15.h,)
                  :Container(
                margin: EdgeInsets.symmetric(vertical: 15.h),
                padding: EdgeInsets.symmetric(horizontal: 24),
                height: 94.h,
                width: double.infinity,
                decoration: BoxDecoration(
                 image: DecorationImage(image: AssetImage(Assets.images.bacroundImages.path,))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Баланс', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.white
                    ),),

                    Text('18 590 000 сум ', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.white
                    ),)
                  ],
                ),
              ),
              Divider(color: Color(0XFF97A3AF), thickness: 1, height: 0.5.h),
              SizedBox(height: 5.h,),
              Row(
                children: [
                  Text('Детали оплаты', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.greyColor2
                  ),)
                ],
              ),
              SizedBox(height: 15.h,),
              Divider(color: Color(0XFF97A3AF), thickness: 1, height: 0.5.h),
              SizedBox(height: 15.h,),
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
              SizedBox(height:(loading == false)? 119.h:30.h,),
              (loading == false)
                  ?ButtonWidget(
                color1: Color(0xFF185CAF),
                  color2: Color(0xFF104280),
                  title: 'Продолжить',
                  onPressed: (){
                   setState(() {
                     loading = !loading;
                   });
              })
                  :AnimatedWidgets(),
              SizedBox(height:(loading == false)? 15.h:30.h,),
            ],
          ),
        ),
      ),
    );
  }
}


Widget build(BuildContext context) {
  return CustomPaint(
    painter: DashedBorderPainter(color: Colors.blue),
    child: Container(height: 100, width: 200),
  );
}
