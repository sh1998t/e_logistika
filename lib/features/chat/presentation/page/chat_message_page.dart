import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:e_logistika/features/chat/presentation/widget/chat_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../gen/assets.gen.dart';

class ChatMessagePage extends StatefulWidget {
  static const String name ='chat_message_page';
  static const String path ='/chat_message_page';
  const ChatMessagePage({super.key});

  @override
  State<ChatMessagePage> createState() => _ChatMessagePageState();
}

class _ChatMessagePageState extends State<ChatMessagePage> {
  bool active =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF1F5),
      appBar: PreferredSize(
        preferredSize: active==true?Size.fromHeight(184.h):Size.fromHeight(100.h),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.white,
          leading:   Padding(
            padding:  EdgeInsets.only(bottom: 20.h),
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: SvgPicture.asset(Assets.svg.symbolsArrow.path, width: 24.r,height: 24.r,fit: BoxFit.cover,)),
          ),

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
                  ChatAppbarWidget(active: active, onTap: (){
                    setState(() {
                      active = !active;
                    });
                  })
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