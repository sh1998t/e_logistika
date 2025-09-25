import 'package:e_logistika/features/home/presentation/page/home_page.dart';
import 'package:e_logistika/features/navigation/widget/bottom_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_coler.dart';
import '../../gen/assets.gen.dart';
import '../chat/presentation/page/chat_page.dart';
import '../creation/presentation/page/creation_page.dart';
import '../profile/presentation/page/profile_page.dart';

class NavigationPage extends StatefulWidget {
  static const String name = 'navigation';
  static const String path = '/navigation';
  final String? pageIndex;

  const NavigationPage({super.key, this.pageIndex, });

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int index = 0;
  // final AppPreference _preference = inject();

  @override
  void initState() {
    index = int.parse(widget.pageIndex ?? "0");
    super.initState();
  }

  List pages = [HomePage(), CreationPage(), ChatPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: pages[index],
      bottomNavigationBar: Container(
        decoration:  BoxDecoration(
          border: Border(top: BorderSide(color: AppColor.white)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF323232).withValues(alpha: 0.15), // #323232 15%
              offset: const Offset(0, -2),
              blurRadius: 4.7,
              spreadRadius: 0,
            ),
          ],
        ),
        child: BottomAppBar(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomItem(
                icon:Assets.svg.homeTab.path,
                iconColor:  index == 0
                    ? AppColor.controllerActiveColor
                    : AppColor.controllerUnActiveColor,

                color:
                index == 0
                    ? AppColor.controllerActiveColor
                    : AppColor.controllerUnActiveColor,
                function: () {
                  index = 0;

                  setState(() {});
                },
                title:'Главная',
              ),
              BottomItem(
                icon: Assets.svg.createTab.path,
                iconColor:
                index == 1
                    ? AppColor.controllerActiveColor
                    : AppColor.controllerUnActiveColor,
                color:
                index == 1
                    ? AppColor.controllerActiveColor
                    : AppColor.controllerUnActiveColor,
                function: () {
                  index = 1;

                  setState(() {});
                },
                title: 'Создать',
              ),
              BottomItem(
                icon: Assets.svg.chatTab.path,
                iconColor:
                index == 2
                    ? AppColor.controllerActiveColor
                    : AppColor.controllerUnActiveColor,
                color:
                index == 2
                    ? AppColor.controllerActiveColor
                    : AppColor.controllerUnActiveColor,
                function: () {
                  index = 2;

                  setState(() {});
                },
                title: 'Чат',
              ),
              InkWell(
                onTap: (){
                  index = 3;

                  setState(() {});
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.images.profileTab.path,
                      height: 22.r,
                      width: 22.r,
                    ),
                    Flexible(
                      child: Text(
                        "Профиль",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color:  index == 3
                              ? AppColor.controllerActiveColor
                              : AppColor.controllerUnActiveColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}