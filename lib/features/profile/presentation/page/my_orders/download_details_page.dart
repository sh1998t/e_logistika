import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:e_logistika/core/router/routers_name.dart';
import 'package:e_logistika/features/home/presentation/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../gen/assets.gen.dart';

/// Refactor focuses on the lower part of the page (sections with details)
/// - Extracted reusable widgets: SectionCard, KeyValueList, KeyValueRow, AddressTimeline
/// - Consistent paddings, dividers and typography
/// - Long values wrap gracefully; keys stay fixed width for clean alignment
/// - Optional trailing widgets (e.g. copy button for ID)
/// - Reduced magic numbers, improved readability
class DownloadDetailsPage extends StatelessWidget {
  static const String name = 'download_details_page';
  static const String path = '/download_details_page';

  const DownloadDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Детали загрузки',
          style: Theme
              .of(context)
              .textTheme
              .bodySmall!
              .copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.greyColor2,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(Assets.svg.symbolsArrow.path),
        ),
        actions: [
          IconButton(
            onPressed: () { /* TODO */ },
            icon: SvgPicture.asset(Assets.svg.chatSvgrepo.path),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              Assets.images.mapImage.path,
              width: double.infinity,
              height: 237.h,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 24.h),

            // Price
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                '14 000 000 сум',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blueColor2,
                ),
              ),
            ),
            SizedBox(height: 12.h),

            // Address / timeline block
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 19.w),

                AddressTimeline(
                  topBadge: _badge(
                      Assets.svg.package.path, const Color(0xFFFF9401)),
                  bottomBadge: _badge(
                      Assets.svg.locations.path, const Color(0xFF2CA6FF)),
                  head: Text(
                    '12 км',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: const Color(0xFF747474),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'холостой пробег',
                            style: TextStyle(fontSize: 14,
                                color: Color(0xFF8C8C8C)),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Divider(height: 1,
                                thickness: 1,
                                color: Color(0xFFE0E0E0)),
                          ),
                        ],
                      ),
                      SizedBox(height: 21),

                      // !!! БЕЗ Expanded здесь
                      _addressItem(
                        title: 'Загрузка',
                        date: 'Пн Сентябрь 11, 8:30',
                        address: 'Ташкент ш., Заргарлик 37',
                        distance: '592 км',
                        color: Color(0xFFFF9401),
                      ),
                      SizedBox(height: 6.h),
                      _addressItem(
                        title: 'Доставка',
                        date: 'Пн Сентябрь 11, 10:00',
                        address: 'Бухара, Ибн Сино, 96',
                        distance: null,
                        color: Color(0xFF2CA6FF),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 12.h),
            Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFFE0E0E0),
            ),
            SizedBox(height: 12.h),
            Padding(padding: EdgeInsets.symmetric(horizontal: 19.w),
           child:  Text('Товар', style: Theme.of(context).textTheme.bodySmall!.copyWith(
               fontSize: 20.sp,
               fontWeight: FontWeight.w500,
               color: AppColor.greyColor2
           ),),
           ),
            SizedBox(height: 12.h),
            Padding(padding: EdgeInsets.symmetric(horizontal: 19.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.h,
              children: [
                RowWidget(
                  title: 'Тип транспорта',
                  title2: 'Характер груза',
                  titleColor: AppColor.greyColor2.withValues(alpha: 0.6),
                ),
                RowWidget(
                  title: 'Жесткий борт',
                  title2: 'Фрукты',
                  titleColor: AppColor.greyColor2,
                ),
                SizedBox(),
                RowWidget(
                  title: 'О продукте',
                  title2: 'Вес груза (т)',
                  titleColor: AppColor.greyColor2.withValues(alpha: 0.6),
                ),
                RowWidget(
                  title: '500 коробок сушеных яблок',
                  title2: '20 тонна',
                  titleColor: AppColor.greyColor2,
                ),SizedBox(height: 2.h,),
                Text('Объем груза (м³)', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.greyColor2.withValues(alpha: 0.6),
                ),),
                Text('50 м³', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.greyColor2,
                ),),
              ],
            ),
            ),
            SizedBox(height: 12.h,),
            Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFFE0E0E0),
            ),
            SizedBox(height: 12.h),
            Padding(padding: EdgeInsets.symmetric(horizontal: 19.w),
              child:  Text('Товар', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.greyColor2
              ),),
            ),
            SizedBox(height: 12.h),
            Padding(padding: EdgeInsets.symmetric(horizontal: 19.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.h,
                children: [
                  RowWidget(
                    title: 'Расстояние',
                    title2: 'Холостой пробег',
                    titleColor: AppColor.greyColor2.withValues(alpha: 0.6),
                  ),
                  RowWidget(
                    title: '592 км',
                    title2: '12 км',
                    titleColor: AppColor.greyColor2,
                  ),
                  SizedBox(),
                  RowWidget(
                    title: 'Ставка за км',
                    title2: 'груз ИД  ',
                    titleColor: AppColor.greyColor2.withValues(alpha: 0.6),
                  ),
                  RowWidget(
                    title: '23 648 сум',
                    title2: '#AB123456789',
                    titleColor: AppColor.greyColor2,
                  ),
                  SizedBox(height: 2.h,),

                ],
              ),
            ),

            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ButtonWidget(
                backgroundColor: Color(0xFFE84118).withValues(alpha: 0.2),
                titleColor: Color(0xFFE84118),
                title: 'Отменить Заказ', onPressed: (){
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
                      height: 384.h,
                      width: double.infinity,
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
                            radius: 44.r,
                            backgroundColor: AppColor.greyColor2.withValues(alpha: 0.1),
                            child: SvgPicture.asset(
                              Assets.svg.cancelSvgrepo.path,
                              width: 48.h,
                              height: 48.w,

                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Вы уверены, что хотите отменить заказ?",
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall!.copyWith(
                              fontSize: 20.sp,
                              color: AppColor.greyColor2,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: 2,
                          ),
                          Row(
                            spacing: 10.w,
                            children: [
                              SvgPicture.asset(Assets.svg.alertTriangle.path, width: 37.r,height: 32.r,),
                              SizedBox(
                                width: 298.w,
                                child: Text(
                                  "Так как водитель ещё не выехал, мы предупреждаем вас: если статус водителя изменится, будет применён штраф",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodySmall!.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColor.greyColor2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            spacing: 22.w,
                            children: [
                              SvgPicture.asset(Assets.svg.radioButton.path, width: 20.r,height: 20.r,),
                              SizedBox(
                                width: 298.w,
                                child: Text(
                                  'Я ознакомился с уведомлением и соглашаюсь',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodySmall!.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColor.greyColor2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25.h),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Opacity(
                                opacity: 0.5,
                                child: OutlinedButton(
                                  onPressed: (){
                                    context.pushNamed(RoutersName.reasonsPageName);
                                  },
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: Size(160.h, 50.h),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(12.r),
                                    ),
                                    side: BorderSide.none,
                                    backgroundColor: Color(0x80E84118).withValues(alpha: 0.2),
                                  ),
                                  child: Text(
                                    "Да, Отмена",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall!.copyWith(
                                      fontSize: 15.sp,
                                      color: Color(0xFFE84118),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () async {

                                },
                                style: OutlinedButton.styleFrom(
                                  minimumSize: Size(160.h, 50.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(12.r),
                                  ),
                                  side: BorderSide.none,
                                  backgroundColor:
                                  AppColor.greyColor2.withValues(alpha: 0.1),
                                ),
                                child: Text(
                                  "Нет",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodySmall!.copyWith(
                                    fontSize: 15.sp,
                                    color: AppColor.greyColor2,
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
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  static Widget _badge(String asset, Color color) =>
      CircleAvatar(
        radius: 16.r,
        backgroundColor: color,
        child: SvgPicture.asset(asset, width: 18.r, height: 18.r),
      );

  Widget _addressItem({
    required String title,
    required String date,
    required String address,
    required String? distance,
    required Color color,
  }) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: color,
                      )),
                  SizedBox(height: 4.h),
                  Text(date,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF747474),
                      )),
                  SizedBox(height: 4.h),
                  Text(address,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.greyColor2,
                      )),

                  if (distance != null) ...[
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        Text(
                          distance,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.blueColor2,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        // Divider теперь тянется до правого края экрана
                        const Expanded(
                          child: Divider(
                            height: 1,
                            thickness: 1,
                            color: Color(0xFFE0E0E0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),

            // Резервируем под стрелку место, чтобы текст под неё не залезал (по желанию)
            SizedBox(width: 20 + 19.0),
            // ширина иконки + правый паддинг
          ],
        ),

        Positioned(
          right: 19.w,
          top: 0,
          child: SvgPicture.asset(
            Assets.svg.arrowRigth.path,
            width: 20.r,
            height: 20.r,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

class  RowWidget extends StatelessWidget {
  final String title;
  final String? title2;
  final Color titleColor;
  const  RowWidget({super.key,
  required this.title,
    required this.titleColor,
    this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      SizedBox(width: 109.w,
      child:   Text(title, style: Theme.of(context).textTheme.bodySmall!.copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color:  titleColor,

      ),
        maxLines: 2,
      ),
      ),
      Text(title2!, style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color:  titleColor,
        ),)
      ],
    );
  }
}


  class AddressTimeline extends StatelessWidget {
  final Widget head; // e.g., "12 км"
  final Widget topBadge;
  final Widget bottomBadge;

  const AddressTimeline({
    super.key,
    required this.head,
    required this.topBadge,
    required this.bottomBadge,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        head,
        SizedBox(height: 4.h),
        _line(16.h),
        SizedBox(height: 4.h),
        topBadge,
        SizedBox(height: 4.h),
        _line(70.h),
        SizedBox(height: 4.h),
        bottomBadge,
      ],
    );
  }

  Widget _line(double height) => Container(
    width: 1.w,
    height: height,
    color: const Color(0xFF97A3AF),
  );
}

