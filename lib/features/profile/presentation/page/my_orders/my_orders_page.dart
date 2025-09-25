import 'package:e_logistika/features/profile/presentation/page/my_orders/my_orders_cancel_page.dart';
import 'package:e_logistika/features/profile/presentation/page/my_orders/my_orders_history_page.dart';
import 'package:e_logistika/features/profile/presentation/page/my_orders/orders_tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../core/constants/app_coler.dart';
import '../../../../../gen/assets.gen.dart';
import 'my_orders_widget.dart';




class MyOrdersPage extends StatefulWidget {
  static const String name ='my_orders_page';
  static const String path ='/my_orders_page';
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> with TickerProviderStateMixin {
  late TabController _tabController;
  bool _showActiveOrders = true;
  int _selectedTabIndex = 0;

  final List<Map<String, dynamic>> _tabs = [
    {
      "title": "Новый",
      "icon": Assets.svg.new1.path,
      "color": Colors.green,
    },
    {
      "title": "История",
      "icon": Assets.svg.symbolsHistory.path,
      "color": Colors.orange,
    },
    {
      "title": "Отменено",
      "icon": Assets.svg.cancel2.path,
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
        backgroundColor: AppColor.backgroundColor,

        centerTitle: true,
        automaticallyImplyLeading: true,
        title:Text('Мои заказы', style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: AppColor.greyColor2
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child:  _buildActiveOrdersView() ,
      ),
    );
  }



  Widget _buildActiveOrdersView() {
    return Column(
      children: [
        OrdersTabBarWidget(
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
              MyOrdersWidget(

              ),

              MyOrdersHistoryPage(
                onBackPressed: () {
                  setState(() {
                    _showActiveOrders = false;
                  });
                },
              ),

              // 3-tab
              MyOrdersCancelPage(
                onBackPressed: () {
                  setState(() {
                    _showActiveOrders = false;
                  });
                },
              ),

              // 4-tab
              const Center(child: Text("Yangi tab qo'shildi")),
            ],
          )

        ),
      ],
    );
  }
}
