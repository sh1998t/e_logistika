import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_coler.dart';
import 'card_go_widget.dart';
class OrderHistoryWidget extends StatelessWidget {
  const OrderHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 5.w,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/svg/loading.svg',width: 25.r,height: 25.r,fit: BoxFit.fill,),
            Text('Последние заказы', style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.black,
            ),)
          ],
        ),
        SizedBox(height: 5.h,),
        Divider(
          height: 1.h,
          color: AppColor.darkEggplantColor,
        ),
        SizedBox(height: 12.h,),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
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
        )
      ],
    );
  }
}
