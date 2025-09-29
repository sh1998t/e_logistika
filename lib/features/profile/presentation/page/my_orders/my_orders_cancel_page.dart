import 'package:e_logistika/core/router/routers_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_coler.dart';
import 'my_orders_card_widget.dart';

class MyOrdersCancelPage extends StatelessWidget {
  final VoidCallback onBackPressed;

  const MyOrdersCancelPage({
    Key? key,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        spacing: 15.h,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyOrdersCardWidget(
              onTap: (){
                context.pushNamed(RoutersName.downloadDetailsPageName);
              },
              titleColor: AppColor.textColor3,
              backgroundColor: AppColor.buttonColor3, time: '12.09.2003',
              id: 'ID: ASF3645', title: 'История'),
          MyOrdersCardWidget(
              onTap: (){
                context.pushNamed(RoutersName.downloadDetailsPageName);
              },
              titleColor: AppColor.textColor3,
              backgroundColor: AppColor.buttonColor3, time: '12.09.2003',
              id: 'ID: ASF3645', title: 'История'),
          MyOrdersCardWidget(
            onTap: (){
              context.pushNamed(RoutersName.downloadDetailsPageName);
            },
              titleColor: AppColor.textColor3,
              backgroundColor: AppColor.buttonColor3, time: '12.09.2003',
              id: 'ID: ASF3645', title: 'История',
           ),
        ],
      ),
    );
  }
}