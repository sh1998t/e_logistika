import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_coler.dart';
import '../../../main/presentation/widget/card_go_widget.dart';
import 'card_widget.dart';

class ActiveOrdersTab extends StatelessWidget {
  const ActiveOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(  // Butun sahifani scroll qilish uchun
      child: Column(
        children: [
          SizedBox(height: 10.h,),
          _buildOrderCard(),
          SizedBox(height: 20.h),
          _buildRecentOrdersSection(context),  // Expanded ni olib tashladik
        ],
      ),
    );
  }

  Widget _buildOrderCard() {
    return CardWidget(
      titleColor: AppColor.titleColor,
        color: AppColor.buttonColor, time: '12.09.2003',
        id: 'ID: ASF3645', title: 'Новый');
  }

  Widget _buildRecentOrdersSection(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/loading.svg',
              width: 25.r,
              height: 25.r,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 5.w),
            Text(
              'Последние заказы',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        Divider(
          height: 1.h,
          color: AppColor.darkEggplantColor,
        ),
        SizedBox(height: 12.h),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            CargoCard(
              from: "Ташкент",
              to: "Бухара",
              id: "ABC12345",
              product: "пакеты полиэтиленовые",
            ),
            CargoCard(
              from: "Ташкент",
              to: "Москва",
              id: "ABC12345",
              product: "пакеты полиэтиленовые",
            ),
            CargoCard(
              from: "Ташкент",
              to: "Бишкек",
              id: "ABC12345",
              product: "пакеты полиэтиленовые",
            ),
            CargoCard(
              from: "Ташкент",
              to: "Бухара",
              id: "ABC12345",
              product: "пакеты полиэтиленовые",
            ),
          ],
        ),
      ],
    );
  }
}