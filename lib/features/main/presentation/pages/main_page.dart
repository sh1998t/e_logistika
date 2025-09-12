import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:e_logistika/core/router/routers_name.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../widget/card_go_widget.dart';

class MainPage extends StatefulWidget {
  static const String mainPage = 'main_page';
  static const String mainPath = '/main_page';
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
        title: SvgPicture.asset('assets/svg/logo_e.svg', fit: BoxFit.fill,),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        child: SafeArea(

            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Stack(
                         alignment: Alignment.bottomCenter,
                         children: [
                           Container(
                             height: 98.h,
                             width: 168.w,
                             decoration: BoxDecoration(
                               color: AppColor.darkEggplant,
                               borderRadius: BorderRadius.circular(20.r),
                             ),

                           ),
                         Image.asset('assets/images/drive.png',
                           fit: BoxFit.fill,width:146.w ,height: 114.h,)
                         ],
                       ),
                       SizedBox(height:4.h,),
                       SizedBox(width:168.w ,
                       child: Text('Международные грузоперевозки',
                         style: Theme.of(context).textTheme.bodySmall!.copyWith(
                         fontWeight: FontWeight.w500,
                         color: AppColor.darkGray,
                         fontSize: 12.sp,

                       ),
                       textAlign: TextAlign.center,
                       ),
                       )
                     ],
                   ),
                   GestureDetector(
                     child:   Column(
                       children: [
                         Stack(
                           alignment: Alignment.bottomCenter,
                           children: [
                             Container(
                               height: 98.h,
                               width: 168.w,
                               decoration: BoxDecoration(
                                 color: AppColor.darkEggplant,
                                 borderRadius: BorderRadius.circular(20.r),
                               ),
                             ),
                             Image.asset('assets/images/drive2.png',
                               fit: BoxFit.fill,width:146.w ,height: 114.h,),
                           ],
                         ),
                         SizedBox(width:140.w ,
                           child: Text('Местные грузоперевозки', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                             fontWeight: FontWeight.w500,
                             color: AppColor.darkGray,
                             fontSize: 12.sp,
                           ),
                             textAlign: TextAlign.center,
                           ),
                         )
                       ],
                     ),
                       onTap: () {
                     context.pushNamed(RoutersName.navigationName);
                       }

                     //   onTap: () {
                     //   Navigator.push(context,
                     //       MaterialPageRoute(builder: (context)=>NavigationPage()));
                     // }

                   )


              ],
            ),
            SizedBox(height: 41.h,),
            Row(
              spacing: 5.w,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/svg/loading.svg',width: 25.r,height: 25.r,fit: BoxFit.fill,),
                Text('Последние заказы', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.black,
                ),)
              ],
            ),
            SizedBox(height: 5.h,),
            Divider(
              height: 1.h,
              color: AppColor.darkEggplantColor,
            ),
           SizedBox(height: 12.h,),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: const [
                  CargoCard(
                    from: "Ташкент",
                    to: "Бухара",
                    id: "ABC12345",
                    product: "пакеты полиэтиленовые",
                  ),
                  CargoCard(
                    from: "Ташкент",
                    to: "Москва",
                    id: "ABC12345",
                    product: "пакеты полиэтиленовые",
                  ),
                  CargoCard(
                    from: "Ташкент",
                    to: "Бишкек",
                    id: "ABC12345",
                    product: "пакеты полиэтиленовые",
                  ),
                  CargoCard(
                    from: "Ташкент",
                    to: "Бухара",
                    id: "ABC12345",
                    product: "пакеты полиэтиленовые",
                  ),
                ],
              ),
            )

          ],
        )),
      ),
    );
  }
}
