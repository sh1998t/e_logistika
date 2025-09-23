import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:e_logistika/core/router/routers_name.dart';
import 'package:e_logistika/features/profile/presentation/widgets/wallet_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../gen/assets.gen.dart';

class WalletPage extends StatefulWidget {
  static const String name ='wallet_page';
  static const String path ='/wallet_page';
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Мой кошелек', style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xFF232323)
        ),),
      ),
      body: SafeArea(
          child:SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h,),
                      Container(
                        height: 120.h,
                        width: 343.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            image:DecorationImage(image: AssetImage(Assets.images.cashCard1.path,), fit: BoxFit.fill)

                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(left: 24.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Баланс', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColor.white,
                              ),),
                              SizedBox(height: 8.h,),
                              Text('18 590 000 сум ', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColor.white,
                              ),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          InkWell(
                            onTap:(){
                              context.pushNamed(RoutersName.upYourWalletName);
                            },
                            child: Card(
                                elevation: 4,
                                color: AppColor.white,
                                child:Padding(padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
                                  child:  Column(
                                    children: [
                                      SvgPicture.asset(Assets.svg.moneySend1.path,
                                        colorFilter: ColorFilter.mode(AppColor.black, BlendMode.srcIn,),
                                        width: 24.r,height: 24.r,fit: BoxFit.fill,),
                                      SizedBox(height: 10.h,),
                                      Text('Пополнить кошелек',
                                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.black
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ),
                          ),

                          InkWell(
                            onTap: (){
                             context.pushNamed(RoutersName.transferWalletPageName);
                            },
                            child: Card(
                                elevation: 4,
                                color: AppColor.white,
                                child:Padding(padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 8.h),
                                  child:  Column(
                                    children: [
                                      SvgPicture.asset(Assets.svg.moneySend.path,
                                        width: 24.r,height: 24.r,fit: BoxFit.fill,),
                                      SizedBox(height: 10.h,),
                                      Text('Перевести с кошелька',
                                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.black
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: (){
                            context.pushNamed(RoutersName.recentTransactionsName);
                          }, child: Text('Недавние транзакции', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.greyColor2

                          ),),),
                          Text('посмотреть все',
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.dodgerBlueColor

                              )
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h,),

                    ],
                  ),
                ),
                Divider(
                  color: Color(0xFFD5D5D5),
                  thickness: 1,
                  height: 0.h,

                ),
                SizedBox(height: 15.h,),
                Container(padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                width: MediaQuery.of(context).size.width,
                  color: Color(0xFFEEF2F2),
                  child: Text('16 сентябрь, вторник', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.greyColor2,

                  ),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h,),
                child: Column(
                  spacing: 14.h,
                  children: [
                    SizedBox(height: 5.h,),
                    WalletHistoryWidget(),
                    WalletHistoryWidget(),
                    WalletHistoryWidget(),
                    SizedBox(height: 5.h,),
                  ],
                ),
                ),
                Container(padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFFEEF2F2),
                  child: Text('17 сентябрь, Среда', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.greyColor2,

                  ),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h,),
                  child: Column(
                    spacing: 14.h,
                    children: [
                      SizedBox(height: 5.h,),
                      WalletHistoryWidget(),
                      WalletHistoryWidget(),
                      WalletHistoryWidget(),
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
