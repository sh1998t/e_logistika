import 'package:e_logistika/core/router/routers_name.dart';
import 'package:e_logistika/features/home/presentation/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_coler.dart';
import '../../../../gen/assets.gen.dart';

class ProfilePage extends StatelessWidget {
  static const String name = 'profile_screen';
  static const String path = '/profile_screen';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackground,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Профиль',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
            color: AppColor.black,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                padding:
                EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(16.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 48.h,
                          width: 48.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 25.sp,
                            child: ClipOval(
                              child: Image.asset(
                                Assets.images.person.path,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Eraliyev Sanjar",
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall!.copyWith(
                                fontSize: 17.sp,
                                color: AppColor.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '(+971) 04 555 5555',
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall!.copyWith(
                                fontSize: 13.sp,
                                color: AppColor.textLightGray,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios, size: 16.sp),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0.r, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColor.white,
              ),
              child: Column(
                spacing: 8.h,
                children: [
                  RowWidget(
                    title: "Мои заказы",
                    url: Assets.svg.wysiwyg.path,
                    onTap: (context) {
                      // context.pushNamed(RoutersName.myCardName);
                    },
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(start: 60.w),
                    child: const Divider(color: Colors.black12),
                  ),
                  RowWidget(
                    title: "Мои карты",
                    url: Assets.svg.creditCard.path,
                    onTap: (context) {
                      context.pushNamed(RoutersName.myCardName);
                    },
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(start: 60.w),
                    child: const Divider(color: Colors.black12),
                  ),
                  RowWidget(
                    title: "Безопасность",
                    url: Assets.svg.lock.path,
                    onTap: (context) {
                      context.pushNamed(RoutersName.settingName);
                    },
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(start: 60.w),
                    child: const Divider(color: Colors.black12),
                  ),
                  RowWidget(
                    title: "Язык интерфейса",
                    url: Assets.svg.translate.path,
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(start: 60.w),
                    child: const Divider(color: Colors.black12),
                  ),
                  RowWidget(
                    title: "Информация о приложении",
                    url: Assets.svg.helpOutline.path,
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(start: 60.w),
                    child: const Divider(color: Colors.black12),
                  ),
                  RowWidget(
                    title: "Идеи и предложения",
                    url: Assets.svg.lightbulb.path,
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(start: 60.w),
                    child: const Divider(color: Colors.black12),
                  ),
                  RowWidget(
                    title: "Выход",
                    url: Assets.svg.logout.path,
                    onTap: (p0) {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.r),
                          ),
                        ),
                        builder: (context) {
                          return Container(
                            height: 239.h,
                            width: 375.w,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.r),
                                topLeft: Radius.circular(20.r),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.h),
                                CircleAvatar(
                                  radius: 30.r,
                                  backgroundColor: AppColor.containerColor,
                                  child: SvgPicture.asset(
                                    " Assets.images.svg.logout.path,",
                                    width: 28.h,
                                    height: 20.w,
                                    colorFilter: ColorFilter.mode(
                                      AppColor.logOutColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  "doYouReallyWantToExit",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodySmall!.copyWith(
                                    fontSize: 20.sp,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(height: 25.h),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    OutlinedButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      style: OutlinedButton.styleFrom(
                                        minimumSize: Size(160.h, 50.h),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(12.r),
                                        ),
                                        side: BorderSide.none,
                                        backgroundColor:
                                        AppColor.devicesButtonColor,
                                      ),
                                      child: Text(
                                        "cancel",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall!.copyWith(
                                          fontSize: 15.sp,
                                          color: AppColor.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    OutlinedButton(
                                      onPressed: () async {
                                        // await inject<AppPreference>()
                                        //     .deleteToken();

                                        context.goNamed(RoutersName.loginName);
                                      },
                                      style: OutlinedButton.styleFrom(
                                        minimumSize: Size(160.h, 50.h),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(12.r),
                                        ),
                                        side: BorderSide.none,
                                        backgroundColor:
                                        AppColor.secondaryColor,
                                      ),
                                      child: Text(
                                        "yesGoOut",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall!.copyWith(
                                          fontSize: 15.sp,
                                          color: AppColor.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),

                ],
              ),
            ),
            SizedBox(height: 10.h),
            ButtonWidget(
              leadingSvg: SvgPicture.asset(
                Assets.svg.eLogo.path, width: 23.r,height: 24.r,fit: BoxFit.fill,),
              trailingSvg:SvgPicture.asset(
                  Assets.svg.arrowForward.path,
                width: 16.r,height: 16.r,
                fit: BoxFit.fill,
                colorFilter: const ColorFilter.mode(
                  AppColor.white, // istalgan rang
                  BlendMode.srcIn, // rangni qo‘llash usuli
                ),
              ) ,
              color1: Color(0xFF185CAF),
              color2: Color(0xFF104280),
              title: 'Зарабатывайте как водитель',
              titleStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.white
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  final String? url;
  final String? title;

  final void Function(BuildContext)? onTap;
  final Widget? icon;
  const RowWidget({super.key, this.url, this.title, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: InkWell(
        onTap: () => onTap?.call(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 36.h,
                  width: 36.w,
                  decoration: BoxDecoration(
                    color: AppColor.containerColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: SvgPicture.asset("$url",
                        width: 15.w, height: 15.h),
                  ),
                ),
                SizedBox(width: 15.w),
                Text(
                  '$title',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            (icon == null)
                ?  Center(
                child: SvgPicture.asset(
                  Assets.svg.arrowForward.path, width: 16.r,height: 16.r,fit: BoxFit.fill,))
                : Center(child: icon),
          ],
        ),
      ),
    );
  }
}
