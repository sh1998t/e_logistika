import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:e_logistika/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWidget extends StatefulWidget {
  final String title;
  final Color color;
  final Color titleColor;
  final String time;
  final String id;
  const CardWidget({
    super.key,
    required this.color,
    required this.titleColor,
    required this.time,
    required this.id,
    required this.title,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 18.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColor.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 30.h,
                    child: IntrinsicWidth(
                      child: AppButton(
                        titleStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: widget.titleColor

                        ),
                        backgroundColor: widget.color,
                        borderRadius: BorderRadius.circular(42.r),
                        title: widget.title,
                        onPressed: () {

                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    widget.time,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ),
                ],
              ),
              // O'ng qism
              Text(
                widget.id,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black,
                ),
              ),
            ],
          ),
          Divider(
            height: 1.h,
            color: AppColor.darkEggplantColor,
          ),          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 4.w,
            children: [
            ContainerWidget(url: 'assets/svg/calendar.svg', title: '19.06-21.06'),
            ContainerWidget(url: 'assets/svg/transporter.svg', title: 'Тент (3)'),
            ContainerWidget(url: 'assets/svg/weight.svg', title: '22 t'),
            ContainerWidget(url: 'assets/svg/full_screen.svg', title: '86 м3'),
          ],),
          SizedBox(height: 5.h,),
          Text('18 000 000 сум  ', style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Color(0xFF185DB2),
          ),),
          SizedBox(height: 5.h,),
          Row(
            spacing: 5.w,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Оплата после выгрузки ', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.black,
              ),),
              Text('|    Есть торг', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black,
              ),),
              Text('|    Без НДС', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black,
              ),),
            ],
          ),
          SizedBox(height: 5.h,),
         Row(
           children: [
             Text('Чиланзар (Таш)', style: Theme.of(context).textTheme.bodySmall!.copyWith(
               fontSize: 12.sp,
               fontWeight: FontWeight.w700,
               color: AppColor.black,
             ),),
             SizedBox(
               width: 200.w,
               child: Row(
                 mainAxisSize: MainAxisSize.max,
                 children: [
                   SizedBox(width: 6.w),
                   Icon(Icons.circle, size: 6.r, color: AppColor.black),
                   Expanded(
                     child: Divider(
                       thickness: 1.h,
                       color: AppColor.black,
                     ),
                   ),
                   Icon(Icons.circle, size: 6.r, color: AppColor.black),
                   SizedBox(width: 6.w),
                   Text('Гиждуван (Бу))', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                     fontSize: 12.sp,
                     fontWeight: FontWeight.w700,
                     color: AppColor.black,
                   ),),
                 ],
               ),
             ),

           ],
         ),
          SizedBox(height: 5.h,),
          Row(
            spacing: 5.w,
            children: [
              Text('Note:', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.black,
              )),
              Text('Пакеты полиэтиленовые',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.black,
              ))
            ],
          ),
          SizedBox(height: 5.h,),
          Row(
            spacing: 5.w,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('CMR  ', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.black,
              ),),
              Text('|    Yon tomoni', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.black,
              ),),
              Text('|    Tushurish sanasi: 28.10.2024', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.black,
              ),),
            ],
          ),
        ],
      ),
    );
  }
}
class ContainerWidget extends StatelessWidget {
  final String url;
  final String title;
  const ContainerWidget({super.key, required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.r ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.r),
      color: Color(0xFFEEF1F5),
      ),
      child:Row(
        children: [
        SvgPicture.asset(url),
        SizedBox(width: 3.w,),
        Text(title, style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.black
        ),)
      ],) ,
    );
  }
}
