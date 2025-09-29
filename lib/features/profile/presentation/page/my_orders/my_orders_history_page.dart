import 'package:e_logistika/features/my_card/presentation/screens/my_card_screen.dart';
import 'package:e_logistika/features/profile/presentation/page/my_orders/my_orders_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_coler.dart';
import '../../../../../core/router/routers_name.dart';


class MyOrdersHistoryPage extends StatelessWidget {
  final VoidCallback onBackPressed;

  const MyOrdersHistoryPage({
    Key? key,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 15.h,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyOrdersCardWidget(
              onTap: (){
                context.pushNamed(RoutersName.downloadDetailsPageName);
              },
              titleColor: AppColor.textColor2,
              backgroundColor: AppColor.buttonColor2, time: '12.09.2003',
              id: 'ID: ASF3645', title: 'История'),

          MyOrdersCardWidget(
              onTap: (){
                context.pushNamed(RoutersName.downloadDetailsPageName);
              },
              titleColor: AppColor.textColor2,
              backgroundColor: AppColor.buttonColor2, time: '12.09.2003',
              id: 'ID: ASF3645', title: 'История'),
          MyOrdersCardWidget(
              onTap: (){
                context.pushNamed(RoutersName.downloadDetailsPageName);
              },
              titleColor: AppColor.textColor2,
              backgroundColor: AppColor.buttonColor2, time: '12.09.2003',
              id: 'ID: ASF3645', title: 'История'),
        ],
      ),
    );
  }
}