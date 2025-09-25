import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/app_coler.dart';

class OrdersTabBarWidget extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;
  final List<Map<String, dynamic>> tabs;

  const OrdersTabBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.onTabChanged,
    required this.tabs,
  }) : super(key: key);

  @override
  State<OrdersTabBarWidget> createState() => _OrdersTabBarWidgetState();
}

class _OrdersTabBarWidgetState extends State<OrdersTabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(widget.tabs.length, (index) {
            final isSelected = widget.selectedIndex == index;
            final tab = widget.tabs[index];
            return GestureDetector(
              onTap: () {
                widget.onTabChanged(index);
              },
              child: Container(
                padding: EdgeInsets.all(10.r),
                margin: EdgeInsets.only(right: 10.w),
                decoration: BoxDecoration(
                  color: isSelected ? tab["color"] : AppColor.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      tab["icon"],
                      width: 20.r,
                      height: 20.r,
                      colorFilter: ColorFilter.mode(
                        isSelected ? AppColor.white : tab["color"],
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      tab["title"],
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}