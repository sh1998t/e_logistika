import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:e_logistika/core/router/routers_name.dart';
import 'package:e_logistika/features/home/presentation/widget/button_widget.dart';
import 'package:e_logistika/features/my_card/presentation/widgets/main_text_fielid.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../gen/assets.gen.dart';

class UpYourWalletPage extends StatefulWidget {
  static const String name ='up_your_wallet';
  static const String path ='/up_your_wallet';
  const UpYourWalletPage({super.key});

  @override
  State<UpYourWalletPage> createState() => _UpYourWalletPageState();
}

class _UpYourWalletPageState extends State<UpYourWalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Пополнить кошелек',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColor.greyColor2
        ),),
      ),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 16.h,vertical: 10.h),
      child: Column(
        children: [
          Container(
            height: 94.h,
            width: 343.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                image: AssetImage(Assets.images.cashCard.path),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Баланс',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '18 590 000 сум ',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(0, -9.h),
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColor.white,
              child: Icon(Icons.arrow_downward, color: Colors.black, size: 22.sp),
            ),
          ),

          Transform.translate(
            offset: Offset(0,-20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 6.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: const Color(0xFF323232).withValues(alpha: 0.1),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColor.white,
                    ),
                    child: Image.asset(
                      Assets.svg.uzcard.path,
                      width: 32.w,
                      height: 38.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '8763 **** 0329',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.greyColor2,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Sayfiyev Fayozjon',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.greyColor2,
                            ),
                          ),
                          SizedBox(width: 140.w),
                          SvgPicture.asset(
                            Assets.svg.logo1.path,
                            width: 24.r,
                            height: 24.r,
                            fit: BoxFit.fill,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          MainTextField(

            height: 40.h,
            width: 343.w,
            labelText: 'Введите сумму',
          ),
          SizedBox(height: 10.h,),

          ButtonWidget(
            color1: Color(0xFF185CAF),
              color2: Color(0xFF104280),
              title: 'Перевести ', onPressed: (){
              context.pushNamed(RoutersName.donePageName);
          })

        ],
      )

      ),
    )
    ;
  }
}
