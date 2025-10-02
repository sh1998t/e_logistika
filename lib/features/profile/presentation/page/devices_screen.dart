import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_coler.dart';
import '../../../../gen/assets.gen.dart';

class DevicesScreen extends StatefulWidget {
  static const String name = 'devices_screen';
  static const String path = '/devices_screen';
  const DevicesScreen({super.key});

  @override
  State<DevicesScreen> createState() => _DevicesScreenState();
}

List<Map<String, String>> devices = [
  {'name': "Xiaomi Redmi 7", 'title': "Android"},
  {'name': "iPhone 7", 'title': 'iOS •9.2.4 • '},
  {'name': "Realme RMX2001 RM6785", 'title': "Android"},
];

class _DevicesScreenState extends State<DevicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Устройства",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: AppColor.scaffoldBackground,
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Текущее устройство",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 13.sp,
                color: AppColor.textLightGray,
                fontWeight: FontWeight.bold,
              ),
            ),
            Card(
              color: AppColor.white,
              child: Container(
                height: 172.h,
                padding: EdgeInsets.only(left: 10.w, top: 12.h, right: 10.w),
                width: 372.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  spacing: 2.h,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'iPhone 13',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 15.sp,
                        color: AppColor.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'IOS •1.02 •',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            fontSize: 13.sp,
                            color: AppColor.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          '21.11.2024 18:01',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            fontSize: 13.sp,
                            color: AppColor.green,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Зарегистрировано: 13.11.2024',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 11.sp,
                        color: AppColor.textLightGray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Center(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(319.h, 46.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          side: BorderSide.none,
                          backgroundColor: AppColor.devicesButtonColor,
                        ),
                        child: Text(
                          "Завершить все другие сессии",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            fontSize: 15.sp,
                            color: Color(0xFFFF3B30),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Выйти на всех устройствах, кроме текущего.",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 11.sp,
                        color: AppColor.textLightGray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h),
            (devices.isEmpty)
                ? const Text('')
                : Text(
              " Активные сессии",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 13.sp,
                color: AppColor.textLightGray,
                fontWeight: FontWeight.bold,
              ),
            ),
            devices.isEmpty
                ? Expanded(
              child: Center(
                child: Text(
                  "noOtherDevices",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 16.sp,
                    color: AppColor.textLightGray,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
                : Column(
              children:
              devices.map((device) {
                return CardWidget(
                  name: device['name']!,
                  title: device['title']!,
                  onDismiss: () {
                    setState(() {
                      devices.remove(device);
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String name;
  final String title;
  final VoidCallback? onDismiss;

  const CardWidget({
    super.key,
    required this.name,
    required this.title,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.23,
        children: [
          CustomSlidableAction(
            onPressed: (context) async {
              final bool? confirmDelete = await showModalBottomSheet<bool>(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                ),
                builder: (BuildContext context) {
                  return Container(
                    height: 300.h,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        CircleAvatar(
                          radius: 45.r,
                          backgroundColor: AppColor.containerColor,
                          child: SvgPicture.asset(
                            Assets.svg.delete.path,
                            width: 36.h,
                            height: 28.w,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          "Вы уверены, что хотите завершить эту сессию? ",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            fontSize: 16.sp,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(160.h, 50.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                side: BorderSide.none,
                                backgroundColor: AppColor.devicesButtonColor,
                              ),
                              child: Text(
                                "Отмена",
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall!.copyWith(
                                  fontSize: 15.sp,
                                  color: AppColor.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(160.h, 50.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                side: BorderSide.none,
                                backgroundColor:
                                AppColor.blueColor2,
                              ),
                              child: Text(
                                "Завершить",
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall!.copyWith(
                                  fontSize: 15.sp,
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  );
                },
              );

              if (confirmDelete == true) {
                onDismiss?.call();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('$name delete')));
              }
            },
            backgroundColor: AppColor.scaffoldBackground,
            foregroundColor: AppColor.white,
            child: Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: AppColor.containerColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  Assets.svg.deleteOutline.path,
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
      child: Card(
        color: AppColor.white,
        child: Container(
          padding: EdgeInsets.only(left: 10.w, top: 8.h, right: 10.w),
          height: 81.h,
          width: 343.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
          child: Column(
            spacing: 4.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '21.11.2024 18:01',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColor.green,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Text(
                'Registered: 13.11.2024',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColor.textLightGray,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
