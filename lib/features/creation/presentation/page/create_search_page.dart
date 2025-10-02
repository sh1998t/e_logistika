import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../gen/assets.gen.dart';
import '../bloc/search_address_cubit.dart';
import '../bloc/search_address_state.dart';
class SearchAddressScreen extends StatefulWidget {
  static const name = "create_search_page";
  static const path = "/create_search_page";

  const SearchAddressScreen({super.key});

  @override
  State<SearchAddressScreen> createState() => _SearchAddressScreenState();
}

class _SearchAddressScreenState extends State<SearchAddressScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Создать заказ",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.greyColor2),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 19.w),
        child: Column(
          children: [
            SizedBox(height: 10.h,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Color(0x407F8FA6),        // #7F8FA6 @ 25%
              offset: Offset(0, 2),            // X:0, Y:2
              blurRadius: 7.5,                 // Blur 7.5
              spreadRadius: 0,                 // Spread 0
            ),
          ],
        ),
          child:Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 4.w,),
                  SvgPicture.asset(Assets.svg.group43.path,
                    width: 18.r,height: 18.r,fit: BoxFit.fill,),
                  SizedBox(width: 24.w,),
                  Text('Usmon Nosir street(Tashkent), 6',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColor.greyColor2,
                    fontSize: 16.sp,
                  )
                    ,)
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 40.w, top: 12.h),
                height: 0.3.h,
                color: Color(0xFF7F8FA6),
                width: double.infinity,
              ),
              Row(
                children: [
                  SvgPicture.asset(Assets.svg.searchSvgrepo.path,
                    width: 32.r,height: 32.r,fit: BoxFit.fill,),
                  SizedBox(width: 14.w,),
                 Expanded(
                   child: Row(
                     children: [
                       Expanded(
                         child: TextFormField(
                           controller: controller,
                           decoration: InputDecoration(
                             hint:Text('Куда едем?'),
                             hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                               fontSize: 16.sp,
                               fontWeight: FontWeight.w400,
                               color: AppColor.greyColor2.withValues(alpha: 0.6),
                             ),
                             border: InputBorder.none,          // <— asosiy
                             enabledBorder: InputBorder.none,   // <— underline'ni o'chiradi
                             focusedBorder: InputBorder.none,   // <— fokusta ham yo'q
                             errorBorder: InputBorder.none,
                             disabledBorder: InputBorder.none,
                             contentPadding: EdgeInsets.zero,
                           ),
                           onChanged: (v) =>
                               context.read<SearchAddressCubit>().search(v),
                         ),
                       ),
                       InkWell(
                         onTap: (){},
                         child: Text('|  Карта', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                           fontSize: 12.sp,
                           fontWeight: FontWeight.w400,
                           color: AppColor.greyColor2
                         ),),
                       ),
                     ],
                   ),
                 )
                ],
              ),
            ],
          ) ,
        ),


            Expanded(
              child: BlocBuilder<SearchAddressCubit, SearchAddressState>(
                builder: (context, state) {
                  if (state is SearchAddressLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchAddressFailure) {
                    return Center(child: Text(state.message));
                  } else if (state is SearchAddressSuccess) {
                    final results = state.results;
                    return ListView.builder(
                      itemCount: results.length,
                      itemBuilder: (context, i) {
                        final item = results[i];
                        return CreateSearchCardWidget(
                          title: item.title,
                          subTitle: '${item.subtitle}',

                          onTap: () {
                            // element tanlandi va CreationPage ga qaytish
                            Navigator.pop(context, item.title);
                          },
                        );

                      },
                    );
                  }
                  return const Center(child: Text('Maʼlumot yoʻq'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CreateSearchCardWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  final VoidCallback? onTap;

  const CreateSearchCardWidget({
    super.key,
    required this.title,
    required this.subTitle,

    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
 final  textsStyles = Theme.of(context).textTheme.bodySmall;
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
        child: InkWell(
          onTap: onTap,
          child:Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(Assets.svg.union.path),
                  SizedBox(width: 20.h,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: textsStyles!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.greyColor2,
                        ),
                          maxLines: 1,
                          softWrap: false,                 // uzun so‘zlar ham yig‘ilsin
                          overflow: TextOverflow.ellipsis, // oxiridan ...
                          textWidthBasis: TextWidthBasis.parent,
                        ),
                        Text(subTitle, style: textsStyles.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.greyColor4,
                        ),
                          maxLines: 1,
                          softWrap: false,                 // uzun so‘zlar ham yig‘ilsin
                          overflow: TextOverflow.ellipsis, // oxiridan ...
                          textWidthBasis: TextWidthBasis.parent,
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(Assets.svg.arrowRigth.path,)
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 40.w, top: 12.h),
                height: 0.3.h,
                color: Color(0xFF7F8FA6),
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}



