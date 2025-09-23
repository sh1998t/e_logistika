import 'package:e_logistika/core/router/routers_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_coler.dart';
import '../../../../gen/assets.gen.dart';
import '../widget/app_bar_widget.dart';
import '../widget/button_widget.dart';
import '../widget/cancel_widget.dart';
import '../widget/history_widget.dart';
import '../widget/order_widget.dart';
import '../widget/tab_bar_widget.dart';


class HomePage extends StatefulWidget {
  static const String name ='home_page';
  static const String path ='/home_page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  bool _showActiveOrders = false;
  int _selectedTabIndex = 0;

  final List<Map<String, dynamic>> _tabs = [
    {
      "title": "Активный заказ",
      "icon": 'assets/svg/check.svg',
      "color": Colors.green,
    },
    {
      "title": "История",
      "icon": 'assets/svg/symbols_history.svg',
      "color": Colors.orange,
    },
    {
      "title": "Отмене",
      "icon": 'assets/svg/cancel.svg',
      "color": Colors.red,
    },

  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 70.h,
        automaticallyImplyLeading: false,
        title: ButtonWidget(
          width: 337.w,
            height: 46.h,
            color1: Color(0xFF185CAF),
            color2: Color(0xFF104280),
            leadingSvg: SvgPicture.asset(Assets.svg.singin.path),

            title: 'Вход в Е-логистика', onPressed: (){}),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: _showActiveOrders ? _buildActiveOrdersView() : _buildCreateOrderView(),
      ),
    );
  }

  Widget _buildCreateOrderView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/order.png',
            width: 298.w,
            height: 301.h,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 80.h),
          ButtonWidget(
            backgroundColor: Color(0xFF0D6EFD),
            title: '+ Создать новый заказ',
            onPressed: () {
              // setState(() {
              //   _showActiveOrders = true;
              // });
              context.pushNamed(RoutersName.creationName, pathParameters: {'pageIndex': '1'});


            },
          )
        ],
      ),
    );
  }

  Widget _buildActiveOrdersView() {
    return Column(
      children: [
        CustomTabBar(
          selectedIndex: _selectedTabIndex,
          onTabChanged: (index) {
            setState(() {
              _selectedTabIndex = index;
            });
          },
          tabs: _tabs,
        ),
        Expanded(
          child: IndexedStack(
            index: _selectedTabIndex,
            children: [
              const ActiveOrdersTab(),
              HistoryTab(
                onBackPressed: () {
                  setState(() {
                    _showActiveOrders = false;
                  });
                },
              ),
              CanceledTab(
                onBackPressed: () {
                  setState(() {
                    _showActiveOrders = false;
                  });
                },
              ),
              const Center(child: Text("Yangi tab qo'shildi")),
            ],
          ),
        ),
      ],
    );
  }
}