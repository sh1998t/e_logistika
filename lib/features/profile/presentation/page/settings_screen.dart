import 'package:e_logistika/core/router/routers_name.dart';
import 'package:e_logistika/features/profile/presentation/page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_coler.dart';
import '../../../../gen/assets.gen.dart';
import '../widgets/setting_dialog_widget.dart';

class SettingsScreen extends StatefulWidget {
  static const String name = 'settings_screen';
  static const String path = '/settings_screen';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool light = true;
  bool dark = false;
  List<bool> isSelectedList = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackground,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Безопасность",
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
        child: Column(
          spacing: 8.h,
          children: [
            RowWidget(
              title: "Изменить PIN-код",
              url: Assets.svg.password.path,
              onTap: (context) {
                context.pushNamed(RoutersName.changePinCodeName);
              },
            ),
            Container(
              padding: EdgeInsetsDirectional.only(start: 60.w),
              child: const Divider(color: Colors.black12),
            ),
            RowWidget(
              title: "Face ID (Touch ID)",
              url: Assets.svg.faceId2.path,
              icon: SizedBox(
                width: 40.w,
                height: 30.h,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Switch.adaptive(
                    applyCupertinoTheme: false,
                    value: dark,
                    onChanged: (bool value) {
                      setState(() {
                        dark = value;
                      });
                      if (value) {
                        context.pushNamed(
                          RoutersName.biometricsName,
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.only(start: 60.w),
              child: const Divider(color: Colors.black12),
            ),
            RowWidget(
              title: "Устройства",
              url: Assets.svg.devices.path,
              onTap: (context) {
                context.pushNamed(RoutersName.devicesName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
