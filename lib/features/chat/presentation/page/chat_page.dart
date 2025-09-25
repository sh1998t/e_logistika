import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:e_logistika/features/chat/presentation/widget/card_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../gen/assets.gen.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
     appBar: AppBar(
       automaticallyImplyLeading: false,
       centerTitle: true,
       title: Text('Чаты ', style: Theme.of(context).textTheme.bodySmall!.copyWith(
         fontSize: 20.sp,
         fontWeight: FontWeight.w700,
         color: AppColor.greyColor2,
       ),),
     ),
      body: Padding(
        padding:  EdgeInsets.all(16.r),
        child: Column(
          spacing: 10.h,
          children: [
            CardChatExpansion(from: 'Ташкент', to: 'Астана', id: 'ABC12345', product: 'пакеты полиэтиленовые'),
            CardChatExpansion(from: 'Ташкент', to: 'Астана', id: 'ABC12345', product: 'пакеты полиэтиленовые'),
            CardChatExpansion(from: 'Ташкент', to: 'Астана', id: 'ABC12345', product: 'пакеты полиэтиленовые'),
          ],
        ),
      ),
    );
  }

}
