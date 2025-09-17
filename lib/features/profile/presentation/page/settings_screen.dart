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
          "settings",
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0.r, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColor.white,
              ),
              child: Column(
                spacing: 8.h,
                children: [
                  RowWidget(
                    title: "changePinCode",
                    url: " Assets.images.svg.home.path, ",
                    onTap: (context) {
                      context.pushNamed(RoutersName.changePinCodeName);
                    },
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(start: 60.w),
                    child: const Divider(color: Colors.black12),
                  ),
                  RowWidget(
                    title: "loginByBiometrics",
                    url: " Assets.images.svg.id.path, ",
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
                    title: "devices",
                    url: " Assets.images.svg.devices.path, ",
                    onTap: (context) {
                      context.pushNamed(RoutersName.devicesName);
                    },
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(start: 60.w),
                    child: const Divider(color: Colors.black12),
                  ),
                  RowWidget(
                    title: "lightMode",
                    url: " Assets.images.svg.lightMode.path, ",
                    icon: SizedBox(
                      width: 40.w,
                      height: 30.h,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Switch.adaptive(
                          applyCupertinoTheme: false,
                          value: light,
                          onChanged: (bool value) {
                            setState(() {
                              light = value;
                            });
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
                    title: "interfaceLanguage",
                    url: " Assets.images.svg.translate.path, ",
                    onTap: (context) {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.r),
                          ),
                        ),
                        builder: (context) {
                          return const SettingDialogWidget();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColor.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "tourist",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Center(
                    child: Icon(Icons.arrow_forward_ios, size: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
