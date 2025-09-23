import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../gen/assets.gen.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF1F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.white,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w,),
              child: Column(
                children: [
                  Text('Чаты ',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.black,
                  ),),
                  SizedBox(height: 12.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 22.r,
                        backgroundImage: const NetworkImage(
                            "https://randomuser.me/api/portraits/men/32.jpg"),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Валижон",
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                    color: AppColor.black,
                                    )),
                                SizedBox(width: 11.w,),
                                 Padding(
                                   padding:  EdgeInsets.only(top: 3.h),
                                   child: Icon(Icons.circle,
                                      size: 6.r, color: AppColor.greenColor),
                                 ),
                                SizedBox(width: 4.w),
                                Text("online",
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                        fontSize: 12.sp, color: AppColor.greenColor, fontWeight: FontWeight.w400)),
                              ],
                            ),
                           SizedBox(height: 5.h,),
                            Row(
                              children: List.generate(
                                  5,
                                      (index) => const Icon(Icons.star,
                                      color: Colors.orange, size: 18)),
                            ),
                          ],
                        ),
                      ),
                      // const Icon(Icons.check_circle,
                      //     color: Colors.green, size: 32),
                Row(
                  children: [
                    Container(
                      width: 48.r,
                      height: 48.r,
                      decoration: BoxDecoration(
                        color: AppColor.greenColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          Assets.svg.checkSquare.path,
                          width: 24.r,
                          height: 24.r,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w,),
                    Container(
                      width: 48.r,
                      height: 48.r,
                      decoration: BoxDecoration(
                        color: AppColor.greyColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          Assets.svg.moreHorizontal.path,
                          width: 24.r,
                          height: 24.r,
                        ),
                      ),
                    ),
                  ],
                ),

  ]
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12.w),
              children: [
                _message(
                  text:
                  "Здравствуйте у меня есть груз! Из Андижана в Ригу! 20 июня нужно отгрузить 😊",
                  time: "10:10",
                  isMe: false,
                ),
                _message(
                    text: "Привет", time: "10:10", isMe: true, isSeen: true),
                _message(
                    text: "Отлично Я как раз свободен в эти даты",
                    time: "10:11",
                    isMe: true,
                    isSeen: true),
                _message(
                    text: "Во сколько вы приедете?",
                    time: "10:11",
                    isMe: false),
                _message(
                    text: "Я ждал тебя долгое время.",
                    time: "10:11",
                    isMe: false),
                _message(
                    text: "Через 15 минут 😊",
                    time: "10:12",
                    isMe: true,
                    isSeen: true),
              ],
            ),
          ),
          _inputField(),
        ],
      ),
    );
  }

  Widget _message({
    required String text,
    required String time,
    required bool isMe,
    bool isSeen = false,
  }) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        constraints: BoxConstraints(maxWidth: 280.w),
        decoration: BoxDecoration(
          color: isMe ? AppColor.blueColor : AppColor.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
            bottomLeft: Radius.circular(isMe ? 16.r : 0),
            bottomRight: Radius.circular(isMe ? 0 : 16.r),
          ),
        ),
        child: Column(
          crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 15.sp,
                color: isMe ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: isMe ? Colors.white70 : Colors.black54,
                  ),
                ),
                if (isMe) ...[
                  SizedBox(width: 4.w),
                  Icon(Icons.done_all,
                      size: 16, color: isSeen ? Colors.white : Colors.grey),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, -2))
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Введите сообщение...",
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.svg.camera.path, width: 22.r,height: 22.r,)),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.svg.paperclip.path, width: 24.r,height: 24.r,)),
            CircleAvatar(
              radius: 22.r,
              backgroundColor: Colors.blue,
              child: SvgPicture.asset(Assets.svg.microphone.path, width: 26.r,height: 26.r,),
            ),
          ],
        ),
      ),
    );
  }
}
