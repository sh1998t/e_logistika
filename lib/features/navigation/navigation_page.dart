import 'package:e_logistika/features/home/presentation/page/home_page.dart';
import 'package:e_logistika/features/navigation/widget/bottom_item.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_coler.dart';
import '../../core/utils/app_preference.dart';
import '../profile/presentation/pages/profile_page.dart';

class NavigationPage extends StatefulWidget {
  static const String name = 'navigation';
  static const String path = '/navigation';
  final String? pageIndex;

  const NavigationPage({super.key, this.pageIndex});

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

  List pages = [HomePage(), HomePage(), HomePage(), ProfilePage()];

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              BottomItem(
                icon:'assets/svg/home.svg',
                color:
                index == 0
                    ? AppColor.controllerActiveColor
                    : AppColor.controllerUnActiveColor,
                function: () {
                  index = 0;

                  setState(() {});
                },
                title:'Home',
              ),
              BottomItem(
                icon: 'assets/svg/creation.svg',
                color:
                index == 1
                    ? AppColor.controllerActiveColor
                    : AppColor.controllerUnActiveColor,
                function: () {
                  index = 1;

                  setState(() {});
                },
                title: 'Creation',
              ),
              BottomItem(
                icon: 'assets/svg/chat.svg',
                color:
                index == 2
                    ? AppColor.controllerActiveColor
                    : AppColor.controllerUnActiveColor,
                function: () {
                  index = 2;

                  setState(() {});
                },
                title: 'Chat',
              ),
              BottomItem(
                icon: 'Assets.images.svg.profileCircle.path',
                color:
                index == 3
                    ? AppColor.controllerActiveColor
                    : AppColor.controllerUnActiveColor,
                function: () {
                  index = 3;

                  setState(() {});
                },
                title: 'Strings.profile',
              ),

              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}