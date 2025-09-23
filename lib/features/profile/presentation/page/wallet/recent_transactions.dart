import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/wallet_history_widget.dart';

class RecentTransactions extends StatefulWidget {
  static const String name ='recent_transactions';
  static const String path ='/recent_transactions';
  const RecentTransactions({super.key});

  @override
  State<RecentTransactions> createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
        title: Text('Недавние транзакции',
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColor.greyColor2,
        ),
        ),
      ),
      body: SafeArea(child: Column(
        children: [
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
      )),
    );
  }
}
