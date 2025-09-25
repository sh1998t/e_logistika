import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:e_logistika/features/auth/presentation/widgets/custom_button.dart';
import 'package:e_logistika/features/my_card/presentation/widgets/main_text_fielid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../gen/assets.gen.dart';

class ProfileEditPage extends StatefulWidget {
  static const String  name ='profile_edit_page';
  static const String  path ='/profile_edit_page';
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackground,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.scaffoldBackground,
        title: Text('Профиль', style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color: AppColor.greyColor2,
        ),),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.r),
        child: Column(
           children: [
             Container(
               padding:  EdgeInsets.all(16.r),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(16.r),
                 color: AppColor.white
               ),
               child: Row(
                 children: [
                   CircleAvatar(
                     radius: 24.r,
                     backgroundColor: Color(0xFFEFEFF4),
                     child: SvgPicture.asset(Assets.svg.person.path, width: 24.r,height: 24.r,),
                   ),
                   SizedBox(width: 10.w,),
                   Container(
                     padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30.r),
                       color: Color(0xFFEFEFF4),
                     ),
                     child: Text('Выбрать фото', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                       fontSize: 14.sp,
                       fontWeight: FontWeight.w600,
                       color: AppColor.greyColor2
                     ),),
                   )
                 ],
               ),
             ),
             SizedBox(height: 16.h,),
             Container(
               padding: EdgeInsets.all( 16.r),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(16.r),
                   color: AppColor.white,
               ),
               child: Column(
                 children: [
                   MainTextField(
                     title: 'Имя',
                     hintText: 'Введите имя',
                   ),
                   MainTextField(
                     title: 'Фамилия',
                     hintText: 'Введите фамилию',
                   ),
                 ],
               ),
             ),
             SizedBox(height: 16.h,),
             Container(
               padding:  EdgeInsets.all(16.r),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(16.r),
                   color: AppColor.white
               ),
               child: Row(
                 children: [
                   CircleAvatar(
                     radius: 24.r,
                     backgroundColor: Color(0xFFEFEFF4),
                     child: SvgPicture.asset(Assets.svg.call.path, width: 24.r,height: 24.r,),
                   ),
                   SizedBox(width: 10.w,),
                   SizedBox(
                     width: MediaQuery.of(context).size.width-122.w,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Column(
                           children: [
                             Text('Сменить номер', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                               fontSize: 15.sp,
                               fontWeight: FontWeight.w600,
                               color: AppColor.black,
                             ),),
                             Text('+998 90 123 23 45', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                               fontSize: 13.sp,
                               fontWeight: FontWeight.w400,
                               color: Color(0xFF5B6871),
                             ),),
                           ],
                         ),
                         SvgPicture.asset(Assets.svg.arrowForward.path, width: 16.r,height: 16.r,)
                       ],
                     ),
                   )
                 ],
               ),
             ),
             SizedBox(height: 16.h,),
             AppButton(
               titleColor: Color(0xFFFF3B30),
               backgroundColor: Color(0xFF747480).withValues(alpha: 0.12),
                 title: 'Удалить аккаунт', onPressed: (){
               
             })
           ],
        ),
      ),
    );
  }
}
