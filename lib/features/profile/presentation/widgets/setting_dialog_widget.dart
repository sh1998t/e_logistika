import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/constants/app_coler.dart';

import '../../../../gen/assets.gen.dart';
import 'language_option.dart';

class SettingDialogWidget extends StatefulWidget {
  const SettingDialogWidget({super.key});

  @override
  State<SettingDialogWidget> createState() => _SettingDialogWidgetState();
}

class _SettingDialogWidgetState extends State<SettingDialogWidget> {
  List<bool> isSelectedList = [false, false];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final currentLocale = context.locale;
    if (currentLocale == const Locale('en', 'EN')) {
      isSelectedList = [true, false];
    } else {
      isSelectedList = [false, true];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 16.h,
        bottom: 35.h,
      ),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Язык интерфейса",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColor.black,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 10.h),
          LanguageOption(
            icon: "Assets.svg.flagUz.path",
            kartName: "O`zbekcha",
            isSelected: isSelectedList[0],
            onTap: () async {
              await context.setLocale(const Locale('uz', 'UZ'));
              setState(() {
                isSelectedList = [true, false];
              });
            },
          ),
          LanguageOption(
            icon: Assets.svg.flagRussia.path,
            kartName: 'Русский',
            isSelected: isSelectedList[1],
            onTap: () async {
              await context.setLocale(const Locale('ru', 'RU'));
              setState(() {
                isSelectedList = [false, true];
              });
            },
          ),
          LanguageOption(
            icon: "Assets.svg.flagEn.path",
            kartName: 'English',
            isSelected: isSelectedList[1],
            onTap: () async {
              await context.setLocale(const Locale('en', 'EN'));
              setState(() {
                isSelectedList = [false, true];
              });
            },
          ),
        ],
      ),
    );
  }
}
