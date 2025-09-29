import 'package:e_logistika/features/profile/presentation/page/my_orders/my_orders_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_coler.dart';
import '../../../../../core/router/routers_name.dart';
import '../../../../main/presentation/widget/card_go_widget.dart';


class MyOrdersWidget extends StatefulWidget {
  const MyOrdersWidget({super.key});

  @override
  State<MyOrdersWidget> createState() => _MyOrdersWidgetState();
}

class _MyOrdersWidgetState extends State<MyOrdersWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10.h,),
          _buildOrderCard(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildOrderCard() {
    return Column(
      spacing: 15.h,
      children: [
        MyOrdersCardWidget(
            onTap: (){
              context.pushNamed(RoutersName.downloadDetailsPageName);
            },
            titleColor: AppColor.textColor,
            backgroundColor: AppColor.buttonColor, time: '12.09.2003',
            id: 'ID: ASF3645', title: 'Новый'),
        MyOrdersCardWidget(
            onTap: (){
              context.pushNamed(RoutersName.downloadDetailsPageName);
            },
            titleColor: AppColor.textColor,
            backgroundColor: AppColor.buttonColor, time: '12.09.2003',
            id: 'ID: ASF3645', title: 'Новый'),
        MyOrdersCardWidget(
            onTap: (){
              context.pushNamed(RoutersName.downloadDetailsPageName);
            },
            titleColor: AppColor.textColor,
            backgroundColor: AppColor.buttonColor, time: '12.09.2003',
            id: 'ID: ASF3645', title: 'Новый'),
        MyOrdersCardWidget(
            onTap: (){
              context.pushNamed(RoutersName.downloadDetailsPageName);

            },
            titleColor: AppColor.textColor,
            backgroundColor: AppColor.buttonColor, time: '12.09.2003',
            id: 'ID: ASF3645', title: 'Новый'),
        MyOrdersCardWidget(
            onTap: (){
              context.pushNamed(RoutersName.downloadDetailsPageName);
            },
            titleColor: AppColor.textColor,
            backgroundColor: AppColor.buttonColor, time: '12.09.2003',
            id: 'ID: ASF3645', title: 'Новый'),
      ],
    );
  }
}