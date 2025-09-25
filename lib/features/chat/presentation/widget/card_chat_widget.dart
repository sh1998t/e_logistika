import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:e_logistika/features/chat/presentation/widget/chat_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/routers_name.dart';
import '../../../../gen/assets.gen.dart';

class CardChatExpansion extends StatefulWidget {
  final String from;
  final String to;
  final String id;
  final String product;

  const CardChatExpansion({
    super.key,
    required this.from,
    required this.to,
    required this.id,
    required this.product,
  });

  @override
  State<CardChatExpansion> createState() => _CardChatExpansionState();
}

class _CardChatExpansionState extends State<CardChatExpansion> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.pushNamed(RoutersName.chatMessagePageName);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0x407F8FA6),
              offset: const Offset(0, 1),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: ExpansionPanelList(
          elevation: 0,
          expandedHeaderPadding: EdgeInsets.zero,
          expansionCallback: (index, isExpanded) {
            setState(() {
              _expanded = !_expanded;
            });
          },
          children: [
            ExpansionPanel(
              canTapOnHeader: true,
              isExpanded: _expanded,
              headerBuilder: (context, isExpanded) {
                return CardChatWidget(
                  from: widget.from,
                  to: widget.to,
                  id: widget.id,
                  product: widget.product,
                );
              },
              body: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        ChatProfileWidget(url: Assets.images.group1.path, name: 'Vali'),
                        SizedBox(height: 12.h,),
                        ChatProfileWidget(url: Assets.images.group2.path, name: 'Ali', count: 1,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}

class CardChatWidget extends StatelessWidget {
  final String from;
  final String to;
  final String id;
  final String product;

  const CardChatWidget({
    super.key,
    required this.from,
    required this.to,
    required this.id,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(height: 5.h),
              Container(
                width: 10.r,
                height: 10.r,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 2.w,
                height: 20.h,
                color: AppColor.black.withValues(alpha: 0.3),
              ),
              Container(
                width: 10.r,
                height: 10.r,
                decoration: BoxDecoration(
                  color: AppColor.black.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      from,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black,
                      ),
                    ),
                    Text(
                      "ID: $id",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      to,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        product,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
