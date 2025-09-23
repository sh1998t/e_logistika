import 'package:e_logistika/core/constants/app_coler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SwitchWidget extends StatefulWidget {
  final List<String> labels;
  final int initialIndex;
  final ValueChanged<int> onToggle;

  const SwitchWidget({
    Key? key,
    required this.labels,
    this.initialIndex = 0,
    required this.onToggle,
  }) : super(key: key);

  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  void toggle(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onToggle(index);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 45.h,
      width: MediaQuery.of(context).size.width - 80.w,
      decoration: BoxDecoration(
        color: AppColor.grey600,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: List.generate(widget.labels.length, (index) {
          bool isSelected = index == selectedIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => toggle(index),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(

                      colors: isSelected?[Color(0xFF185CAF),Color(0xFF104280)]:[Color(0xFF7D7D7D),Color(0xFF7D7D7D)]
                  ),
                  color: isSelected
                      ? Color(0xFF572DA6)
                      : Color(0xCCF2F8F8),
                  borderRadius: BorderRadius.horizontal(
                    left: index == 0 ? Radius.circular(10.r) : Radius.zero,
                    right: index == widget.labels.length - 1
                        ? Radius.circular(10.r)
                        : Radius.zero,
                  ),
                ),
                child: Text(
                  widget.labels[index],
                  style: TextStyle(
                    color: isSelected ? AppColor.black : AppColor.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
