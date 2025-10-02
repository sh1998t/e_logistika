import 'package:e_logistika/core/router/routers_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_coler.dart';
import '../../../main/presentation/widget/card_go_widget.dart';
import 'card_widget.dart';

class ActiveOrdersTab extends StatefulWidget {
  const ActiveOrdersTab({super.key});

  @override
  State<ActiveOrdersTab> createState() => _ActiveOrdersTabState();
}

class _ActiveOrdersTabState extends State<ActiveOrdersTab> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _orderCards = [
    {
      'title': 'Новый',
      'id': 'ID: ASF3645',
      'time': '12.09.2003',
    },
    {
      'title': 'Новый',
      'id': 'ID: BSF3646',
      'time': '13.09.2003',
    },
    {
      'title': 'Новый',
      'id': 'ID: CSF3647',
      'time': '14.09.2003',
    },
    {
      'title': 'Новый',
      'id': 'ID: DSF3648',
      'time': '15.09.2003',
    },
    {
      'title': 'Новый',
      'id': 'ID: ESF3649',
      'time': '16.09.2003',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10.h,),
          _buildOrderCardSlider(),
          SizedBox(height: 20.h),
          _buildRecentOrdersSection(context),
        ],
      ),
    );
  }

  Widget _buildOrderCardSlider() {
    return Column(
      children: [
        SizedBox(
          height: 333.h,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _orderCards.length,
            itemBuilder: (context, index) {
              final card = _orderCards[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: InkWell(
                  onTap: (){
                  context.pushNamed(RoutersName.downloadDetailsPageName);
                  },
                  child: HomeCardWidget(
                    titleColor: AppColor.titleColor,
                    color: AppColor.buttonColor,
                    time: card['time'],
                    id: card['id'],
                    title: card['title'],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 12.h),
        _buildPageIndicator(),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _orderCards.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          height: _currentPage == index ? 8.h : 8.h,
          width: _currentPage == index ? 24.w : 8.w,
          decoration: BoxDecoration(
            color: _currentPage == index 
                ? AppColor.sliderColor1
                : AppColor.sliderColor2,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ),
    );
  }

  Widget _buildRecentOrdersSection(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/loading.svg',
              width: 25.r,
              height: 25.r,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 5.w),
            Text(
              'Последние заказы',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        Divider(
          height: 1.h,
          color: AppColor.darkEggplantColor,
        ),
        SizedBox(height: 12.h),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
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
      ],
    );
  }
}