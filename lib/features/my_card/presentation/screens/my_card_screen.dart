import 'package:e_logistika/features/home/presentation/widget/button_widget.dart';
import 'package:e_logistika/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_coler.dart';
import '../../data/bloc/add_card_cubit.dart';
import '../../data/bloc/add_card_state.dart';
import '../widgets/credit_card_widget.dart';
import '../widgets/info_show_dialog.dart';
import 'add_card_screen.dart';

class MyCardScreen extends StatefulWidget {
  static const String name='my_card_page';
  static const String path ='/my_card_page';
  const MyCardScreen({super.key});

  @override
  State<MyCardScreen> createState() => _MyCardScreenState();
}

class _MyCardScreenState extends State<MyCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Stack(
                      children: [
                        Positioned(
                          top: 50.h,
                          left: 16.w,
                          right: 16.w,
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              height: 405.h,
                              width: 343.w,
                              child: const InfoShowDialog(),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: SvgPicture.asset(
                Assets.svg.info.path,
                width: 20.w,
                height: 20.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
        title: Text(
          "Мои карты",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
            color: AppColor.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Column(
            spacing: 10,
            children: [
              BlocBuilder<CardCubit, CardState>(
                builder: (context, state) {
                  if (state.cards.isEmpty) {
                    return Card(
                      color: AppColor.white,
                      child: Container(
                        height: 188.h,
                        width: 343.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 20.h),
                            SvgPicture.asset(
                              Assets.svg.bankCards1.path,
                              width: 80.w,
                              height: 80.h,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 15.h),
                            Text(
                              "Карта не добавлена",
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall!.copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColor.black,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              "Вы еще не добавили ни одной банковской карты.",
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall!.copyWith(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColor.textLightGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Column(
                      children: state.cards.map((creditCard) {
                        return CreditCardWidget(
                          cardHolderFullName: creditCard.cardHolderFullName,
                          cardNumber: creditCard.cardNumber,
                          validFrom: creditCard.validFrom,
                          url: creditCard.url,
                          logoUrl: creditCard.logoUrl,
                          onDismiss: () {
                            context.read<CardCubit>().removeCard(
                              creditCard,
                            );
                          },
                        );
                      }).toList(),
                    );
                  }
                },
              ),

              SizedBox(height: 10.h),
            ButtonWidget(
                color1: Color(0xFF185CAF),
                color2: Color(0xFF104280),
                title: 'Добавить карту', onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddCardScreen()),
              );
            }),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
